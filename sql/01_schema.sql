-- ============================================================
--  JMS 就職活動管理システム  スキーマ定義  rev.2.1（フェーズ0）
--  MySQL 8.x / InnoDB / utf8mb4
--
--  rev.1 からの変更点
--   - 年度（fiscal_year）の概念を全面的に削除
--   - role / department / academic_department / enrollment_status
--     / company_status / prefecture マスタを追加
--   - job_type に industry_id を追加（業種 → 職種の階層）
--   - recruitment を「1募集 = 1職種 + 募集人数」に変更
--   - recruitment_region を存置（1募集に複数勤務地）
--   - recruitment_job_type / recruitment_industry を削除
--   - company に industry_id / company_status_id / region_id / remarks を追加
--   - student に birth_date / admission_ym / remarks / enrollment_status_id を追加
--   - job_application に job_type_id を追加
--   - application_history に interviewer_count を追加、
--     created_at / updated_at / created_by は持たない
--   - selection_result は 参加 / 合格 / 不合格 / 辞退 / 未判明 の5値、NOT NULL
--   - ログイン履歴・ロール権限・年度別採用実績のテーブルは作らない
-- ============================================================

CREATE DATABASE IF NOT EXISTS jms
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_0900_ai_ci;
USE jms;

-- 再実行用（依存の逆順で削除）
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS
  offer, application_history, job_application,
  preferred_job_type, preferred_region,
  recruitment_region, recruitment,
  company, student, teacher, school_class, account,
  offer_acceptance, selection_result, selection_stage, referral_type,
  job_type, industry, region, prefecture,
  company_status, enrollment_status, academic_department,
  department, role, gender;
SET FOREIGN_KEY_CHECKS = 1;


-- ============================================================
--  1. 汎用マスタ
-- ============================================================

-- 性別
CREATE TABLE gender (
  gender_id    INT          NOT NULL AUTO_INCREMENT,
  sort_order   INT          NOT NULL,
  gender_name  VARCHAR(20)  NOT NULL,
  PRIMARY KEY (gender_id),
  UNIQUE KEY uq_gender_name (gender_name)
) ENGINE=InnoDB COMMENT='性別';

-- ロール（AuthFilter の分岐に使用。権限そのものはアプリ側で保持）
CREATE TABLE role (
  role_id     INT          NOT NULL AUTO_INCREMENT,
  sort_order  INT          NOT NULL,
  role_name   VARCHAR(50)  NOT NULL,
  PRIMARY KEY (role_id),
  UNIQUE KEY uq_role_name (role_name)
) ENGINE=InnoDB COMMENT='ロール';

-- 部門（就職指導部・教務部・事務局 など）
CREATE TABLE department (
  department_id    INT          NOT NULL AUTO_INCREMENT,
  sort_order       INT          NOT NULL,
  department_name  VARCHAR(50)  NOT NULL,
  PRIMARY KEY (department_id),
  UNIQUE KEY uq_department_name (department_name)
) ENGINE=InnoDB COMMENT='部門';

-- 学科
CREATE TABLE academic_department (
  academic_department_id    INT          NOT NULL AUTO_INCREMENT,
  sort_order                INT          NOT NULL,
  academic_department_name  VARCHAR(50)  NOT NULL,
  PRIMARY KEY (academic_department_id),
  UNIQUE KEY uq_academic_department_name (academic_department_name)
) ENGINE=InnoDB COMMENT='学科';

-- 在籍状況（在籍中 / 休学 / 退学 / 卒業 / 進学）
CREATE TABLE enrollment_status (
  enrollment_status_id    INT          NOT NULL AUTO_INCREMENT,
  sort_order              INT          NOT NULL,
  enrollment_status_name  VARCHAR(20)  NOT NULL,
  PRIMARY KEY (enrollment_status_id),
  UNIQUE KEY uq_enrollment_status_name (enrollment_status_name)
) ENGINE=InnoDB COMMENT='在籍状況';

-- 企業の状態（募集中 / 募集なし / 連携終了）
CREATE TABLE company_status (
  company_status_id    INT          NOT NULL AUTO_INCREMENT,
  sort_order           INT          NOT NULL,
  company_status_name  VARCHAR(20)  NOT NULL,
  PRIMARY KEY (company_status_id),
  UNIQUE KEY uq_company_status_name (company_status_name)
) ENGINE=InnoDB COMMENT='企業状態';


-- ============================================================
--  2. 地域マスタ（都道府県 → 市区町村の階層）
-- ============================================================

CREATE TABLE prefecture (
  prefecture_id    INT          NOT NULL AUTO_INCREMENT,
  sort_order       INT          NOT NULL,
  prefecture_name  VARCHAR(10)  NOT NULL,
  PRIMARY KEY (prefecture_id),
  UNIQUE KEY uq_prefecture_name (prefecture_name)
) ENGINE=InnoDB COMMENT='都道府県';

-- city が NULL の行は「県全域」を表す
CREATE TABLE region (
  region_id      INT          NOT NULL AUTO_INCREMENT,
  prefecture_id  INT          NOT NULL,
  sort_order     INT          NOT NULL,
  city           VARCHAR(50)  NULL COMMENT 'NULL は県全域',
  -- MySQL の UNIQUE は複数の NULL を許すため、県全域行の重複防止に生成列を使う
  city_key       VARCHAR(50)  GENERATED ALWAYS AS (IFNULL(city, '')) STORED,
  PRIMARY KEY (region_id),
  UNIQUE KEY uq_region (prefecture_id, city_key),
  CONSTRAINT fk_region_prefecture FOREIGN KEY (prefecture_id)
    REFERENCES prefecture (prefecture_id) ON UPDATE CASCADE
) ENGINE=InnoDB COMMENT='地域（企業所在地・募集勤務地・志望勤務地の共通マスタ）';


-- ============================================================
--  3. 業種・職種（業種 → 職種の階層）
-- ============================================================

CREATE TABLE industry (
  industry_id    INT          NOT NULL AUTO_INCREMENT,
  sort_order     INT          NOT NULL,
  industry_name  VARCHAR(50)  NOT NULL,
  PRIMARY KEY (industry_id),
  UNIQUE KEY uq_industry_name (industry_name)
) ENGINE=InnoDB COMMENT='業種（日本標準産業分類 大分類）';

CREATE TABLE job_type (
  job_type_id    INT          NOT NULL AUTO_INCREMENT,
  industry_id    INT          NOT NULL COMMENT '分類・絞り込み用。企業の業種との一致は強制しない',
  sort_order     INT          NOT NULL,
  job_type_name  VARCHAR(50)  NOT NULL,
  PRIMARY KEY (job_type_id),
  UNIQUE KEY uq_job_type_name (job_type_name),
  KEY idx_job_type_industry (industry_id),
  CONSTRAINT fk_job_type_industry FOREIGN KEY (industry_id)
    REFERENCES industry (industry_id) ON UPDATE CASCADE
) ENGINE=InnoDB COMMENT='職種（募集職種・志望職種の共通マスタ）';


-- ============================================================
--  4. 就活関連マスタ
-- ============================================================

CREATE TABLE referral_type (
  referral_type_id    INT          NOT NULL AUTO_INCREMENT,
  sort_order          INT          NOT NULL,
  referral_type_name  VARCHAR(50)  NOT NULL,
  PRIMARY KEY (referral_type_id),
  UNIQUE KEY uq_referral_type_name (referral_type_name)
) ENGINE=InnoDB COMMENT='紹介区分';

-- 「最終面接」は持たない。最終は application_history.is_final_selection で表す
CREATE TABLE selection_stage (
  selection_stage_id      INT          NOT NULL AUTO_INCREMENT,
  sort_order              INT          NOT NULL,
  selection_stage_name    VARCHAR(50)  NOT NULL,
  allows_attendance       BOOLEAN      NOT NULL DEFAULT FALSE
                          COMMENT '結果に「参加」を選択できる段階か（説明会のみ TRUE）',
  PRIMARY KEY (selection_stage_id),
  UNIQUE KEY uq_selection_stage_name (selection_stage_name)
) ENGINE=InnoDB COMMENT='選考状況';

-- 「内定」は結果として持たない。is_final_selection = TRUE かつ 合格 をもって内定とする
CREATE TABLE selection_result (
  selection_result_id    INT          NOT NULL AUTO_INCREMENT,
  sort_order             INT          NOT NULL,
  selection_result_name  VARCHAR(50)  NOT NULL,
  PRIMARY KEY (selection_result_id),
  UNIQUE KEY uq_selection_result_name (selection_result_name)
) ENGINE=InnoDB COMMENT='選考結果';

CREATE TABLE offer_acceptance (
  offer_acceptance_id    INT          NOT NULL AUTO_INCREMENT,
  sort_order             INT          NOT NULL,
  offer_acceptance_name  VARCHAR(50)  NOT NULL,
  PRIMARY KEY (offer_acceptance_id),
  UNIQUE KEY uq_offer_acceptance_name (offer_acceptance_name)
) ENGINE=InnoDB COMMENT='内定承諾';


-- ============================================================
--  5. 認証・所属
-- ============================================================

CREATE TABLE account (
  account_id     VARCHAR(20)   NOT NULL COMMENT 'ログインID',
  password       VARCHAR(255)  NOT NULL COMMENT '開発中は平文可。運用時は BCrypt 等でハッシュ化を推奨',
  role_id        INT           NOT NULL,
  department_id  INT           NULL COMMENT '学生・担任は NULL 可',
  email          VARCHAR(255)  NULL,
  PRIMARY KEY (account_id),
  KEY idx_account_role (role_id),
  KEY idx_account_department (department_id),
  CONSTRAINT fk_account_role FOREIGN KEY (role_id)
    REFERENCES role (role_id) ON UPDATE CASCADE,
  CONSTRAINT fk_account_department FOREIGN KEY (department_id)
    REFERENCES department (department_id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB COMMENT='アカウント';

CREATE TABLE school_class (
  class_id                INT          NOT NULL AUTO_INCREMENT,
  academic_department_id  INT          NOT NULL,
  grade                   TINYINT      NOT NULL,
  class_name              VARCHAR(10)  NOT NULL COMMENT '例: S2A1',
  sort_order              INT          NOT NULL,
  PRIMARY KEY (class_id),
  UNIQUE KEY uq_class_name (class_name),
  UNIQUE KEY uq_class (academic_department_id, grade, class_name),
  CONSTRAINT fk_class_academic_department FOREIGN KEY (academic_department_id)
    REFERENCES academic_department (academic_department_id) ON UPDATE CASCADE
) ENGINE=InnoDB COMMENT='クラス';


-- ============================================================
--  6. 人
-- ============================================================

CREATE TABLE teacher (
  teacher_no  VARCHAR(20)   NOT NULL,
  account_id  VARCHAR(20)   NOT NULL,
  class_id    INT           NULL COMMENT '担当クラス。未割当は NULL',
  name        VARCHAR(50)   NOT NULL,
  name_kana   VARCHAR(100)  NOT NULL COMMENT 'カタカナ',
  gender_id   INT           NOT NULL,
  is_active   BOOLEAN       NOT NULL DEFAULT TRUE COMMENT '在籍',
  PRIMARY KEY (teacher_no),
  UNIQUE KEY uq_teacher_account (account_id),
  KEY idx_teacher_class (class_id),
  KEY idx_teacher_gender (gender_id),
  KEY idx_teacher_kana (name_kana),
  CONSTRAINT fk_teacher_account FOREIGN KEY (account_id)
    REFERENCES account (account_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_teacher_class FOREIGN KEY (class_id)
    REFERENCES school_class (class_id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT fk_teacher_gender FOREIGN KEY (gender_id)
    REFERENCES gender (gender_id) ON UPDATE CASCADE
) ENGINE=InnoDB COMMENT='教職員';

CREATE TABLE student (
  student_no            VARCHAR(20)   NOT NULL COMMENT '学籍番号',
  account_id            VARCHAR(20)   NOT NULL,
  class_id              INT           NOT NULL,
  attendance_no         TINYINT       NOT NULL COMMENT '出席番号',
  name                  VARCHAR(50)   NOT NULL,
  name_kana             VARCHAR(100)  NOT NULL COMMENT 'カタカナ',
  gender_id             INT           NOT NULL,
  birth_date            DATE          NULL COMMENT '生年月日',
  admission_ym          CHAR(7)       NULL COMMENT '入学年月 YYYY-MM',
  enrollment_status_id  INT           NOT NULL COMMENT '在籍中/休学/退学/卒業/進学',
  email                 VARCHAR(255)  NULL,
  phone                 VARCHAR(20)   NULL,
  address               VARCHAR(255)  NULL,
  refuses_placement     BOOLEAN       NOT NULL DEFAULT FALSE COMMENT 'あっせん辞退',
  has_offer             BOOLEAN       NOT NULL DEFAULT FALSE COMMENT '内定有無（キャッシュ列）',
  has_accepted_offer    BOOLEAN       NOT NULL DEFAULT FALSE COMMENT '内定承諾（キャッシュ列）',
  remarks               TEXT          NULL COMMENT '担任メモ',
  PRIMARY KEY (student_no),
  UNIQUE KEY uq_student_account (account_id),
  UNIQUE KEY uq_student_attendance (class_id, attendance_no),
  KEY idx_student_kana (name_kana),
  KEY idx_student_gender (gender_id),
  KEY idx_student_status (enrollment_status_id),
  KEY idx_student_offer (has_offer, has_accepted_offer),
  CONSTRAINT fk_student_account FOREIGN KEY (account_id)
    REFERENCES account (account_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_student_class FOREIGN KEY (class_id)
    REFERENCES school_class (class_id) ON UPDATE CASCADE,
  CONSTRAINT fk_student_gender FOREIGN KEY (gender_id)
    REFERENCES gender (gender_id) ON UPDATE CASCADE,
  CONSTRAINT fk_student_enrollment_status FOREIGN KEY (enrollment_status_id)
    REFERENCES enrollment_status (enrollment_status_id) ON UPDATE CASCADE
) ENGINE=InnoDB COMMENT='学生';


-- ============================================================
--  7. 企業・募集
-- ============================================================

CREATE TABLE company (
  company_id           INT           NOT NULL AUTO_INCREMENT,
  sort_order           INT           NOT NULL,
  company_name         VARCHAR(100)  NOT NULL COMMENT '企業名',
  company_name_kana    VARCHAR(200)  NOT NULL COMMENT 'カタカナ',
  corporate_name       VARCHAR(100)  NULL COMMENT '法人格を含む正式名',
  corporate_name_kana  VARCHAR(200)  NULL COMMENT 'カタカナ',
  industry_id          INT           NOT NULL COMMENT '業種',
  company_status_id    INT           NOT NULL COMMENT '募集中/募集なし/連携終了',
  region_id            INT           NOT NULL COMMENT '所在地',
  capital              BIGINT        NULL COMMENT '資本金（円）',
  employee_count       INT           NULL,
  established_year     SMALLINT      NULL,
  website_url          VARCHAR(255)  NULL,
  postal_code          CHAR(8)       NULL COMMENT '123-4567',
  address              VARCHAR(255)  NULL COMMENT '番地まで含む住所',
  tel                  VARCHAR(20)   NULL,
  email                VARCHAR(255)  NULL COMMENT '担当者メール',
  contact_person       VARCHAR(50)   NULL COMMENT '担当者名',
  has_hiring_record    BOOLEAN       NOT NULL DEFAULT FALSE COMMENT '採用実績の有無',
  remarks              TEXT          NULL,
  PRIMARY KEY (company_id),
  KEY idx_company_kana (company_name_kana),
  KEY idx_company_industry (industry_id),
  KEY idx_company_status (company_status_id),
  KEY idx_company_region (region_id),
  CONSTRAINT fk_company_industry FOREIGN KEY (industry_id)
    REFERENCES industry (industry_id) ON UPDATE CASCADE,
  CONSTRAINT fk_company_status FOREIGN KEY (company_status_id)
    REFERENCES company_status (company_status_id) ON UPDATE CASCADE,
  CONSTRAINT fk_company_region FOREIGN KEY (region_id)
    REFERENCES region (region_id) ON UPDATE CASCADE
) ENGINE=InnoDB COMMENT='企業情報';

-- 1募集 = 1職種 + 募集人数。勤務地は recruitment_region で複数持つ
CREATE TABLE recruitment (
  recruitment_id  INT  NOT NULL AUTO_INCREMENT,
  company_id      INT  NOT NULL,
  job_type_id     INT  NOT NULL,
  headcount       INT  NOT NULL COMMENT '募集人数',
  PRIMARY KEY (recruitment_id),
  -- job_application からの複合外部キー用
  UNIQUE KEY uq_recruitment_company (recruitment_id, company_id),
  -- 同一企業で同じ職種の募集を重複登録させない
  UNIQUE KEY uq_recruitment_company_job (company_id, job_type_id),
  KEY idx_recruitment_job_type (job_type_id),
  CONSTRAINT fk_recruitment_company FOREIGN KEY (company_id)
    REFERENCES company (company_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_recruitment_job_type FOREIGN KEY (job_type_id)
    REFERENCES job_type (job_type_id) ON UPDATE CASCADE,
  CONSTRAINT chk_recruitment_headcount CHECK (headcount > 0)
) ENGINE=InnoDB COMMENT='募集';

CREATE TABLE recruitment_region (
  recruitment_id  INT  NOT NULL,
  region_id       INT  NOT NULL,
  PRIMARY KEY (recruitment_id, region_id),
  KEY idx_rr_region (region_id),
  CONSTRAINT fk_rr_recruitment FOREIGN KEY (recruitment_id)
    REFERENCES recruitment (recruitment_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_rr_region FOREIGN KEY (region_id)
    REFERENCES region (region_id) ON UPDATE CASCADE
) ENGINE=InnoDB COMMENT='募集勤務地';


-- ============================================================
--  8. 学生の志望
-- ============================================================

CREATE TABLE preferred_region (
  student_no  VARCHAR(20)  NOT NULL,
  priority    TINYINT      NOT NULL COMMENT '志望度（1が第一志望）',
  region_id   INT          NOT NULL,
  PRIMARY KEY (student_no, priority),
  UNIQUE KEY uq_pr_student_region (student_no, region_id),
  KEY idx_pr_region (region_id),
  CONSTRAINT fk_pr_student FOREIGN KEY (student_no)
    REFERENCES student (student_no) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_pr_region FOREIGN KEY (region_id)
    REFERENCES region (region_id) ON UPDATE CASCADE
) ENGINE=InnoDB COMMENT='志望勤務地';

CREATE TABLE preferred_job_type (
  student_no   VARCHAR(20)  NOT NULL,
  priority     TINYINT      NOT NULL COMMENT '志望度（1が第一志望）',
  job_type_id  INT          NOT NULL,
  PRIMARY KEY (student_no, priority),
  UNIQUE KEY uq_pj_student_job_type (student_no, job_type_id),
  KEY idx_pj_job_type (job_type_id),
  CONSTRAINT fk_pj_student FOREIGN KEY (student_no)
    REFERENCES student (student_no) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_pj_job_type FOREIGN KEY (job_type_id)
    REFERENCES job_type (job_type_id) ON UPDATE CASCADE
) ENGINE=InnoDB COMMENT='志望職種';


-- ============================================================
--  9. 就活（ヘッダ＋履歴）
-- ============================================================

CREATE TABLE job_application (
  application_id    BIGINT       NOT NULL AUTO_INCREMENT,
  student_no        VARCHAR(20)  NOT NULL,
  company_id        INT          NOT NULL,
  recruitment_id    INT          NULL COMMENT '募集情報なしの直接応募は NULL',
  job_type_id       INT          NOT NULL COMMENT '応募職種。一覧の職種列に使用',
  referral_type_id  INT          NOT NULL,
  entry_date        DATE         NOT NULL,
  is_closed         BOOLEAN      NOT NULL DEFAULT FALSE COMMENT '終了フラグ',
  PRIMARY KEY (application_id),
  KEY idx_ja_student_company (student_no, company_id),
  KEY idx_ja_company (company_id),
  KEY idx_ja_job_type (job_type_id),
  KEY idx_ja_referral (referral_type_id),
  -- 複合FK用（recruitment_id が先頭）
  KEY idx_ja_recruitment_company (recruitment_id, company_id),
  CONSTRAINT fk_ja_student FOREIGN KEY (student_no)
    REFERENCES student (student_no) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_ja_company FOREIGN KEY (company_id)
    REFERENCES company (company_id) ON UPDATE CASCADE,
  -- 募集の所属企業と応募先企業の食い違いを防ぐ。
  -- recruitment_id が NULL の行はこのFKの検査対象外（MATCH SIMPLE）。
  CONSTRAINT fk_ja_recruitment FOREIGN KEY (recruitment_id, company_id)
    REFERENCES recruitment (recruitment_id, company_id) ON UPDATE CASCADE,
  CONSTRAINT fk_ja_job_type FOREIGN KEY (job_type_id)
    REFERENCES job_type (job_type_id) ON UPDATE CASCADE,
  CONSTRAINT fk_ja_referral FOREIGN KEY (referral_type_id)
    REFERENCES referral_type (referral_type_id) ON UPDATE CASCADE
) ENGINE=InnoDB COMMENT='就活（応募ヘッダ）';

-- 選考イベント1件 = 1行。既存行は書き換えず追記する。
-- UPDATE を許すのは selection_result_id / result_date / remarks / is_deleted のみ。
CREATE TABLE application_history (
  history_id           BIGINT        NOT NULL AUTO_INCREMENT,
  application_id       BIGINT        NOT NULL,
  selection_stage_id   INT           NOT NULL,
  selection_result_id  INT           NOT NULL COMMENT '未確定は「未判明」',
  is_final_selection   BOOLEAN       NOT NULL DEFAULT FALSE COMMENT '最終選考フラグ',
  event_at             DATETIME      NOT NULL COMMENT '選考実施日時',
  place                VARCHAR(255)  NULL,
  interviewer_count    INT           NULL COMMENT '面接官人数。担当者名は remarks へ',
  result_date          DATE          NULL COMMENT '結果判明日',
  remarks              TEXT          NULL,
  is_deleted           BOOLEAN       NOT NULL DEFAULT FALSE COMMENT '誤登録の論理削除',
  PRIMARY KEY (history_id),
  -- 最新行の取得用。同時刻の同着は history_id の降順で解決する
  KEY idx_ah_latest (application_id, is_deleted, event_at, history_id),
  KEY idx_ah_stage (selection_stage_id),
  KEY idx_ah_result (selection_result_id),
  KEY idx_ah_final (is_final_selection, selection_result_id),
  CONSTRAINT fk_ah_application FOREIGN KEY (application_id)
    REFERENCES job_application (application_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_ah_stage FOREIGN KEY (selection_stage_id)
    REFERENCES selection_stage (selection_stage_id) ON UPDATE CASCADE,
  CONSTRAINT fk_ah_result FOREIGN KEY (selection_result_id)
    REFERENCES selection_result (selection_result_id) ON UPDATE CASCADE,
  CONSTRAINT chk_ah_interviewer_count CHECK (interviewer_count IS NULL OR interviewer_count > 0)
) ENGINE=InnoDB COMMENT='就活状況履歴（INSERT中心）';

-- 「最終選考フラグ = TRUE かつ 結果 = 合格」の選考が発生したときに 1 件生成する。
-- 同一学生が同一企業へ複数回応募することは想定しない。
CREATE TABLE offer (
  offer_id             BIGINT       NOT NULL AUTO_INCREMENT,
  student_no           VARCHAR(20)  NOT NULL,
  company_id           INT          NOT NULL,
  offer_date           DATE         NOT NULL COMMENT '内定日',
  offer_acceptance_id  INT          NULL COMMENT '未回答は NULL',
  accepted_date        DATE         NULL COMMENT '内定承諾日',
  accept_deadline      DATE         NULL COMMENT '内定承諾期限',
  PRIMARY KEY (offer_id),
  KEY idx_offer_student (student_no),
  KEY idx_offer_company (company_id),
  KEY idx_offer_acceptance (offer_acceptance_id),
  CONSTRAINT fk_offer_student FOREIGN KEY (student_no)
    REFERENCES student (student_no) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_offer_company FOREIGN KEY (company_id)
    REFERENCES company (company_id) ON UPDATE CASCADE,
  CONSTRAINT fk_offer_acceptance FOREIGN KEY (offer_acceptance_id)
    REFERENCES offer_acceptance (offer_acceptance_id) ON UPDATE CASCADE
) ENGINE=InnoDB COMMENT='内定情報';

-- 同一企業への重複応募を許さない方針を DB で担保する場合、以下を有効化する
-- ALTER TABLE job_application ADD UNIQUE KEY uq_ja_student_company (student_no, company_id);
-- ALTER TABLE offer           ADD UNIQUE KEY uq_offer_student_company (student_no, company_id);


-- ============================================================
--  10. マスタ初期データ
-- ============================================================

INSERT INTO gender (sort_order, gender_name) VALUES
  (1,'男性'), (2,'女性'), (3,'その他'), (4,'回答しない');

INSERT INTO role (sort_order, role_name) VALUES
  (1,'学生'), (2,'担任'), (3,'就職指導部'), (4,'就職指導部長'),
  (5,'教務部長'), (6,'校長'), (7,'システム管理者');

INSERT INTO department (sort_order, department_name) VALUES
  (1,'就職指導部'), (2,'教務部'), (3,'事務局 / 情報システム');

INSERT INTO academic_department (sort_order, academic_department_name) VALUES
  (1,'情報システム科'), (2,'情報処理科'), (3,'ビジネス科');

INSERT INTO enrollment_status (sort_order, enrollment_status_name) VALUES
  (1,'在籍中'), (2,'休学'), (3,'退学'), (4,'卒業'), (5,'進学');

INSERT INTO company_status (sort_order, company_status_name) VALUES
  (1,'募集中'), (2,'募集なし'), (3,'連携終了');

INSERT INTO referral_type (sort_order, referral_type_name) VALUES
  (1,'学校紹介'), (2,'自己開拓'), (3,'縁故');

-- 「最終面接」は含めない。最終は is_final_selection で表す
INSERT INTO selection_stage (sort_order, selection_stage_name, allows_attendance) VALUES
  (1,'説明会',    TRUE),
  (2,'書類選考',  FALSE),
  (3,'適性検査',  FALSE),
  (4,'1次面接',   FALSE),
  (5,'2次面接',   FALSE),
  (6,'3次面接',   FALSE),
  (7,'その他',    FALSE);

-- 「内定」は含めない。is_final_selection = TRUE かつ「合格」をもって内定とする
INSERT INTO selection_result (sort_order, selection_result_name) VALUES
  (1,'未判明'), (2,'参加'), (3,'合格'), (4,'不合格'), (5,'辞退');

INSERT INTO offer_acceptance (sort_order, offer_acceptance_name) VALUES
  (1,'承諾'), (2,'辞退'), (3,'保留');

-- 業種：日本標準産業分類 大分類 A〜S（記号は保持しない）
INSERT INTO industry (sort_order, industry_name) VALUES
  ( 1,'農業、林業'),
  ( 2,'漁業'),
  ( 3,'鉱業、採石業、砂利採取業'),
  ( 4,'建設業'),
  ( 5,'製造業'),
  ( 6,'電気・ガス・熱供給・水道業'),
  ( 7,'情報通信業'),
  ( 8,'運輸業、郵便業'),
  ( 9,'卸売業、小売業'),
  (10,'金融業、保険業'),
  (11,'不動産業、物品賃貸業'),
  (12,'学術研究、専門・技術サービス業'),
  (13,'宿泊業、飲食サービス業'),
  (14,'生活関連サービス業、娯楽業'),
  (15,'教育、学習支援業'),
  (16,'医療、福祉'),
  (17,'複合サービス事業'),
  (18,'サービス業（他に分類されないもの）'),
  (19,'公務（他に分類されるものを除く）');

-- 職種（画面のサンプル値。業種に紐づける）
INSERT INTO job_type (industry_id, sort_order, job_type_name)
SELECT i.industry_id, v.sort_order, v.job_type_name
FROM (
  SELECT '情報通信業' AS industry_name, 1 AS sort_order, 'SE / プログラマ'        AS job_type_name UNION ALL
  SELECT '情報通信業', 2, 'Web 開発'                UNION ALL
  SELECT '情報通信業', 3, 'インフラエンジニア'       UNION ALL
  SELECT '製造業',     4, '組込エンジニア'          UNION ALL
  SELECT '情報通信業', 5, 'QA / テストエンジニア'    UNION ALL
  SELECT '情報通信業', 6, 'インフラ / サーバー運用'  UNION ALL
  SELECT '情報通信業', 7, 'Web デザイン'            UNION ALL
  SELECT '製造業',     8, '品質保証'
) AS v
JOIN industry i ON i.industry_name = v.industry_name;

-- 都道府県（九州7県のみ。必要に応じて47件へ拡張）
INSERT INTO prefecture (sort_order, prefecture_name) VALUES
  (40,'福岡県'), (41,'佐賀県'), (42,'長崎県'), (43,'熊本県'),
  (44,'大分県'), (45,'宮崎県'), (46,'鹿児島県');

-- 地域（福岡県のサンプル。city = NULL は「県全域」）
INSERT INTO region (prefecture_id, sort_order, city)
SELECT p.prefecture_id, v.sort_order, v.city
FROM (
  SELECT '福岡県' AS prefecture_name, 0 AS sort_order, NULL AS city UNION ALL
  SELECT '福岡県', 1, '福岡市中央区'      UNION ALL
  SELECT '福岡県', 2, '福岡市博多区'      UNION ALL
  SELECT '福岡県', 3, '福岡市東区'        UNION ALL
  SELECT '福岡県', 4, '福岡市南区'        UNION ALL
  SELECT '福岡県', 5, '福岡市早良区'      UNION ALL
  SELECT '福岡県', 6, '北九州市小倉北区'  UNION ALL
  SELECT '福岡県', 7, '北九州市八幡西区'  UNION ALL
  SELECT '福岡県', 8, '久留米市'
) AS v
JOIN prefecture p ON p.prefecture_name = v.prefecture_name;
