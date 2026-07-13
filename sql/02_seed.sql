-- =====================================================================
--  JMS — 動作確認用データ（rev.2.1 スキーマ用）
--  デザイン画面（dist/screens/）に登場する名前に合わせてあります。
--  マスタの初期データは 01_schema.sql 側で投入済み。
--  実行: mysql -u root -p jms < 02_seed.sql
-- =====================================================================
USE jms;

-- ---------- クラス ----------
INSERT INTO school_class (academic_department_id, grade, class_name, sort_order)
SELECT ad.academic_department_id, v.grade, v.class_name, v.sort_order
FROM (
  SELECT '情報システム科' AS dep, 2 AS grade, 'S2A1' AS class_name, 1 AS sort_order UNION ALL
  SELECT '情報システム科', 2, 'S2A2', 2 UNION ALL
  SELECT '情報処理科',     1, 'S1A1', 3 UNION ALL
  SELECT '情報処理科',     1, 'S1A2', 4 UNION ALL
  SELECT 'ビジネス科',     2, 'B2A1', 5 UNION ALL
  SELECT 'ビジネス科',     2, 'B2A2', 6
) v
JOIN academic_department ad ON ad.academic_department_name = v.dep;

-- ---------- アカウント ----------
-- パスワードは開発用の平文。運用ではハッシュ化すること。
INSERT INTO account (account_id, password, role_id, department_id, email)
SELECT v.account_id, v.password, r.role_id, d.department_id, v.email
FROM (
  SELECT 'admin'      AS account_id, 'admin'    AS password, 'システム管理者' AS role_name, '事務局 / 情報システム' AS dep, 'okamoto@example.ac.jp'  AS email UNION ALL
  SELECT 't.nakano',   'password', '担任',        NULL,        'nakano.t@example.ac.jp'  UNION ALL
  SELECT 'k.sato',     'password', '担任',        NULL,        'sato.k@example.ac.jp'    UNION ALL
  SELECT 'y.yamada',   'password', '就職指導部長', '就職指導部', 'yamada.y@example.ac.jp' UNION ALL
  SELECT 'm.hayashi',  'password', '就職指導部',   '就職指導部', 'hayashi.m@example.ac.jp' UNION ALL
  SELECT 'k.tanaka',   'password', '教務部長',     '教務部',     'tanaka.k@example.ac.jp'  UNION ALL
  SELECT 'principal',  'password', '校長',        NULL,        'kocho@example.ac.jp'
) v
JOIN role r ON r.role_name = v.role_name
LEFT JOIN department d ON d.department_name = v.dep;

-- 学生用アカウント（学籍番号と同じ ID）
INSERT INTO account (account_id, password, role_id)
SELECT v.id, 'password', r.role_id
FROM (
  SELECT '240001' AS id UNION ALL SELECT '240003' UNION ALL SELECT '240005' UNION ALL
  SELECT '240011' UNION ALL SELECT '240021'
) v
JOIN role r ON r.role_name = '学生';

-- ---------- 教職員 ----------
INSERT INTO teacher (teacher_no, account_id, class_id, name, name_kana, gender_id, is_active)
SELECT v.teacher_no, v.account_id, c.class_id, v.name, v.kana, g.gender_id, v.active
FROM (
  SELECT 'T-001' AS teacher_no, 't.nakano'  AS account_id, 'S2A1' AS class_name, '中野 友彦'   AS name, 'ナカノ トモヒコ' AS kana, '男性' AS gname, TRUE AS active UNION ALL
  SELECT 'T-002', 'k.sato',    'S2A2', '佐藤 久代子', 'サトウ クヨコ',   '女性', TRUE UNION ALL
  SELECT 'T-003', 'y.yamada',  NULL,   '山田 隆',     'ヤマダ タカシ',   '男性', TRUE UNION ALL
  SELECT 'T-004', 'm.hayashi', NULL,   '林 未結',     'ハヤシ ミユウ',   '女性', TRUE UNION ALL
  SELECT 'T-005', 'k.tanaka',  NULL,   '田中 警三',   'タナカ ケイゾウ', '男性', TRUE UNION ALL
  SELECT 'T-006', 'principal', NULL,   '校長 太郎',   'コウチョウ タロウ','男性', TRUE UNION ALL
  SELECT 'T-007', 'admin',     NULL,   '岡本 豊',     'オカモト ユタカ', '男性', TRUE
) v
LEFT JOIN school_class c ON c.class_name = v.class_name
JOIN gender g ON g.gender_name = v.gname;

-- ---------- 学生 ----------
INSERT INTO student (student_no, account_id, class_id, attendance_no, name, name_kana,
                     gender_id, birth_date, admission_ym, enrollment_status_id,
                     email, phone, address, refuses_placement, has_offer, has_accepted_offer, remarks)
SELECT v.no, v.no, c.class_id, v.att, v.name, v.kana, g.gender_id,
       v.birth, '2024-04', es.enrollment_status_id,
       v.email, v.phone, v.addr, FALSE, v.has_offer, v.has_accept, v.remarks
FROM (
  SELECT '240001' AS no, 'S2A1' AS cls,  1 AS att, '青木 真央'   AS name, 'アオキ マオ'     AS kana, '女性' AS gname, DATE '2005-06-12' AS birth,
         'aoki@example.com'     AS email, '090-1111-0001' AS phone, '福岡市早良区1-1'   AS addr, FALSE AS has_offer, FALSE AS has_accept, NULL AS remarks UNION ALL
  SELECT '240003', 'S2A1',  3, '石橋 蓮',   'イシバシ レン',   '男性', DATE '2005-01-30',
         'ishibashi@example.com','090-1111-0003', '北九州市小倉北区2-2', FALSE, FALSE, '最終選考が近い。面接練習を実施済' UNION ALL
  SELECT '240005', 'S2A1',  5, '大野 葵',   'オオノ アオイ',   '女性', DATE '2004-11-08',
         'ohno@example.com',     '090-1111-0005', '福岡市博多区3-3',   TRUE,  TRUE,  '内定承諾済み' UNION ALL
  SELECT '240011', 'S2A1', 11, '佐藤 美海', 'サトウ ミウ',     '女性', DATE '2005-03-21',
         'sato.m@example.com',   '090-1111-0011', '福岡市東区4-4',     FALSE, FALSE, NULL UNION ALL
  SELECT '240021', 'S2A1', 21, '古川 拓実', 'フルカワ タクミ', '男性', DATE '2005-08-02',
         'furukawa@example.com', '090-1111-0021', '久留米市5-5',       TRUE,  FALSE, '志望動機の深掘りを継続指導中'
) v
JOIN school_class c ON c.class_name = v.cls
JOIN gender g ON g.gender_name = v.gname
JOIN enrollment_status es ON es.enrollment_status_name = '在籍中';

-- ---------- 志望勤務地 / 志望職種 ----------
INSERT INTO preferred_region (student_no, priority, region_id)
SELECT v.no, v.pri, r.region_id
FROM (
  SELECT '240021' AS no, 1 AS pri, '福岡市中央区' AS city UNION ALL
  SELECT '240021', 2, '福岡市博多区' UNION ALL
  SELECT '240003', 1, '北九州市小倉北区'
) v
JOIN region r ON r.city = v.city;

INSERT INTO preferred_job_type (student_no, priority, job_type_id)
SELECT v.no, v.pri, j.job_type_id
FROM (
  SELECT '240021' AS no, 1 AS pri, 'SE / プログラマ' AS jt UNION ALL
  SELECT '240021', 2, 'Web 開発' UNION ALL
  SELECT '240003', 1, '組込エンジニア'
) v
JOIN job_type j ON j.job_type_name = v.jt;

-- ---------- 企業 ----------
INSERT INTO company (sort_order, company_name, company_name_kana, corporate_name, corporate_name_kana,
                     industry_id, company_status_id, region_id,
                     capital, employee_count, established_year, website_url,
                     postal_code, address, tel, email, contact_person, has_hiring_record, remarks)
SELECT v.so, v.cname, v.ckana, v.corp, v.corpkana,
       i.industry_id, cs.company_status_id, r.region_id,
       v.capital, v.emp, v.est, v.url,
       v.zip, v.addr, v.tel, v.mail, v.person, v.rec, v.remarks
FROM (
  SELECT 1 AS so, 'サンライズシステムズ' AS cname, 'サンライズシステムズ' AS ckana,
         '株式会社サンライズシステムズ' AS corp, 'カブシキガイシャサンライズシステムズ' AS corpkana,
         '情報通信業' AS ind, '募集中' AS status, '福岡市中央区' AS city,
         80000000 AS capital, 132 AS emp, 2008 AS est, 'https://sunrise-sys.example.jp' AS url,
         '810-0001' AS zip, '福岡市中央区天神 2-1-1' AS addr, '092-000-1234' AS tel,
         'nakano@sunrise-sys.example.jp' AS mail, '人事部 中野 様' AS person, TRUE AS rec,
         '校内説明会参加予定。当校からの採用実績あり。' AS remarks UNION ALL
  SELECT 2, '福岡電子工業', 'フクオカデンシコウギョウ',
         '福岡電子工業株式会社', 'フクオカデンシコウギョウカブシキガイシャ',
         '製造業', '募集中', '北九州市小倉北区',
         300000000, 480, 1974, 'https://f-denshi.example.jp',
         '802-0001', '北九州市小倉北区浅野 1-1-1', '093-000-5678',
         'jinji@f-denshi.example.jp', '人事部 大村 様', TRUE, NULL UNION ALL
  SELECT 3, 'ミライウェイ', 'ミライウェイ',
         '株式会社ミライウェイ', 'カブシキガイシャミライウェイ',
         '情報通信業', '募集中', '福岡市博多区',
         50000000, 85, 2012, 'https://miraiway.example.jp',
         '812-0011', '福岡市博多区博多駅前 3-3-3', '092-000-2222',
         'saiyo@miraiway.example.jp', '採用担当 高橋 様', TRUE, NULL UNION ALL
  SELECT 4, 'スカイブリッジ', 'スカイブリッジ',
         '株式会社スカイブリッジ', 'カブシキガイシャスカイブリッジ',
         '情報通信業', '募集中', '福岡市中央区',
         30000000, 42, 2016, 'https://skybridge.example.jp',
         '810-0004', '福岡市中央区渡辺通 5-5-5', '092-000-3333',
         'hr@skybridge.example.jp', '管理部 井上 様', FALSE, NULL UNION ALL
  SELECT 5, '九州デジタルサービス', 'キュウシュウデジタルサービス',
         '九州デジタルサービス株式会社', 'キュウシュウデジタルサービスカブシキガイシャ',
         '情報通信業', '募集中', '福岡市東区',
         100000000, 210, 2001, 'https://kds.example.jp',
         '813-0001', '福岡市東区香椎 1-2-3', '092-000-4444',
         'recruit@kds.example.jp', '人事課 松本 様', TRUE, NULL UNION ALL
  SELECT 6, 'テクノス博多', 'テクノスハカタ',
         '株式会社テクノス博多', 'カブシキガイシャテクノスハカタ',
         '情報通信業', '募集なし', '福岡市博多区',
         20000000, 28, 2019, 'https://technos-hakata.example.jp',
         '812-0013', '福岡市博多区博多駅東 2-2-2', '092-000-5555',
         'info@technos-hakata.example.jp', '代表 石田 様', FALSE, NULL UNION ALL
  SELECT 7, 'さくらテック', 'サクラテック',
         '株式会社さくらテック', 'カブシキガイシャサクラテック',
         '情報通信業', '募集中', '福岡市南区',
         50000000, 85, 2012, 'https://sakuratech.example.jp',
         '815-0001', '福岡市南区大橋 1-1-1', '092-000-7777',
         'kobayashi@sakuratech.example.jp', '人事部 小林 様', FALSE,
         '校内説明会参加予定。' 
) v
JOIN industry i ON i.industry_name = v.ind
JOIN company_status cs ON cs.company_status_name = v.status
JOIN region r ON r.city = v.city;

-- ---------- 募集（1募集 = 1職種 + 人数） ----------
INSERT INTO recruitment (company_id, job_type_id, headcount)
SELECT c.company_id, j.job_type_id, v.hc
FROM (
  SELECT 'サンライズシステムズ' AS cname, 'SE / プログラマ'      AS jt, 5 AS hc UNION ALL
  SELECT 'サンライズシステムズ', 'インフラエンジニア', 2 UNION ALL
  SELECT '福岡電子工業',        '組込エンジニア',     3 UNION ALL
  SELECT '福岡電子工業',        '品質保証',           2 UNION ALL
  SELECT 'ミライウェイ',        'Web 開発',           3 UNION ALL
  SELECT 'スカイブリッジ',      'Web 開発',           2 UNION ALL
  SELECT '九州デジタルサービス', 'SE / プログラマ',    4 UNION ALL
  SELECT 'さくらテック',        'SE / プログラマ',    3 UNION ALL
  SELECT 'さくらテック',        'QA / テストエンジニア', 1
) v
JOIN company c ON c.company_name = v.cname
JOIN job_type j ON j.job_type_name = v.jt;

-- ---------- 募集勤務地 ----------
INSERT INTO recruitment_region (recruitment_id, region_id)
SELECT rec.recruitment_id, r.region_id
FROM (
  SELECT 'サンライズシステムズ' AS cname, 'SE / プログラマ' AS jt, '福岡市博多区' AS city UNION ALL
  SELECT 'サンライズシステムズ', 'SE / プログラマ',      '福岡市中央区' UNION ALL
  SELECT 'サンライズシステムズ', 'インフラエンジニア',   '福岡市博多区' UNION ALL
  SELECT '福岡電子工業',        '組込エンジニア',       '北九州市小倉北区' UNION ALL
  SELECT '福岡電子工業',        '品質保証',             '北九州市小倉北区' UNION ALL
  SELECT 'ミライウェイ',        'Web 開発',             '福岡市博多区' UNION ALL
  SELECT 'スカイブリッジ',      'Web 開発',             '福岡市中央区' UNION ALL
  SELECT '九州デジタルサービス', 'SE / プログラマ',      '福岡市東区' UNION ALL
  SELECT 'さくらテック',        'SE / プログラマ',      '福岡市南区' UNION ALL
  SELECT 'さくらテック',        'QA / テストエンジニア', '福岡市南区'
) v
JOIN company c   ON c.company_name = v.cname
JOIN job_type j  ON j.job_type_name = v.jt
JOIN recruitment rec ON rec.company_id = c.company_id AND rec.job_type_id = j.job_type_id
JOIN region r    ON r.city = v.city;

-- ---------- 就活（古川 拓実：閲覧画面 07 のタイムラインを再現） ----------
-- 1) 古川 × ミライウェイ … 最終合格 → 内定 → 承諾待ち
INSERT INTO job_application (student_no, company_id, recruitment_id, job_type_id, referral_type_id, entry_date, is_closed)
SELECT '240021', c.company_id, rec.recruitment_id, rec.job_type_id, rt.referral_type_id, DATE '2026-05-01', FALSE
FROM company c
JOIN recruitment rec ON rec.company_id = c.company_id
JOIN referral_type rt ON rt.referral_type_name = '学校紹介'
WHERE c.company_name = 'ミライウェイ' LIMIT 1;

SET @app_mirai = LAST_INSERT_ID();

INSERT INTO application_history
 (application_id, selection_stage_id, selection_result_id, is_final_selection,
  event_at, place, interviewer_count, result_date, remarks, is_deleted)
SELECT @app_mirai, st.selection_stage_id, re.selection_result_id, v.fin,
       v.at, v.place, v.ic, v.rdate, v.rem, FALSE
FROM (
  SELECT '説明会'   AS stage, '参加'   AS result, FALSE AS fin, TIMESTAMP '2026-05-12 14:00:00' AS at, '本社・オンライン併用' AS place, NULL AS ic, DATE '2026-05-12' AS rdate, NULL AS rem UNION ALL
  SELECT '書類選考', '合格', FALSE, TIMESTAMP '2026-05-20 00:00:00', NULL,        NULL, DATE '2026-05-27', '履歴書・成績証明書 提出済' UNION ALL
  SELECT '1次面接',  '合格', FALSE, TIMESTAMP '2026-06-02 10:00:00', '本社・対面', 2,   DATE '2026-06-06', NULL UNION ALL
  SELECT '2次面接',  '合格', TRUE,  TIMESTAMP '2026-06-14 13:00:00', '本社・対面', 3,   DATE '2026-06-19', '面接官：人事部 大村部長 ほか2名。役員面接。'
) v
JOIN selection_stage st ON st.selection_stage_name = v.stage
JOIN selection_result re ON re.selection_result_name = v.result;

-- 最終合格 → 内定（承諾期限 07/03、未回答）
INSERT INTO offer (student_no, company_id, offer_date, offer_acceptance_id, accepted_date, accept_deadline)
SELECT '240021', c.company_id, DATE '2026-06-19', NULL, NULL, DATE '2026-07-03'
FROM company c WHERE c.company_name = 'ミライウェイ';

-- 2) 古川 × スカイブリッジ … 2次面接の予定あり（進行中）
INSERT INTO job_application (student_no, company_id, recruitment_id, job_type_id, referral_type_id, entry_date, is_closed)
SELECT '240021', c.company_id, rec.recruitment_id, rec.job_type_id, rt.referral_type_id, DATE '2026-05-10', FALSE
FROM company c
JOIN recruitment rec ON rec.company_id = c.company_id
JOIN referral_type rt ON rt.referral_type_name = '自己開拓'
WHERE c.company_name = 'スカイブリッジ' LIMIT 1;

SET @app_sky = LAST_INSERT_ID();

INSERT INTO application_history
 (application_id, selection_stage_id, selection_result_id, is_final_selection,
  event_at, place, interviewer_count, result_date, remarks, is_deleted)
SELECT @app_sky, st.selection_stage_id, re.selection_result_id, v.fin,
       v.at, v.place, v.ic, v.rdate, v.rem, FALSE
FROM (
  SELECT '書類選考' AS stage, '合格'   AS result, FALSE AS fin, TIMESTAMP '2026-05-18 00:00:00' AS at, NULL AS place, NULL AS ic, DATE '2026-05-25' AS rdate, NULL AS rem UNION ALL
  SELECT '1次面接',  '合格',   FALSE, TIMESTAMP '2026-06-10 11:00:00', 'オンライン (Zoom)', 2, DATE '2026-06-15', NULL UNION ALL
  SELECT '2次面接',  '未判明', FALSE, TIMESTAMP '2026-07-05 13:00:00', '本社・対面', NULL, NULL, '技術試問（SQL・Java）の対策を実施'
) v
JOIN selection_stage st ON st.selection_stage_name = v.stage
JOIN selection_result re ON re.selection_result_name = v.result;

-- 3) 古川 × 九州デジタルサービス … 1次不合格（終了）
INSERT INTO job_application (student_no, company_id, recruitment_id, job_type_id, referral_type_id, entry_date, is_closed)
SELECT '240021', c.company_id, rec.recruitment_id, rec.job_type_id, rt.referral_type_id, DATE '2026-05-05', TRUE
FROM company c
JOIN recruitment rec ON rec.company_id = c.company_id
JOIN referral_type rt ON rt.referral_type_name = '学校紹介'
WHERE c.company_name = '九州デジタルサービス' LIMIT 1;

SET @app_kds = LAST_INSERT_ID();

INSERT INTO application_history
 (application_id, selection_stage_id, selection_result_id, is_final_selection,
  event_at, place, interviewer_count, result_date, remarks, is_deleted)
SELECT @app_kds, st.selection_stage_id, re.selection_result_id, v.fin,
       v.at, v.place, v.ic, v.rdate, v.rem, FALSE
FROM (
  SELECT '書類選考' AS stage, '合格'   AS result, FALSE AS fin, TIMESTAMP '2026-05-12 00:00:00' AS at, NULL AS place, NULL AS ic, DATE '2026-05-18' AS rdate, NULL AS rem UNION ALL
  SELECT '1次面接',  '不合格', FALSE, TIMESTAMP '2026-05-26 10:00:00', '本社・対面', 2, DATE '2026-05-30', NULL
) v
JOIN selection_stage st ON st.selection_stage_name = v.stage
JOIN selection_result re ON re.selection_result_name = v.result;

-- 4) 石橋 蓮 × 福岡電子工業 … 最終選考（2次面接・最終フラグ）の予定
INSERT INTO job_application (student_no, company_id, recruitment_id, job_type_id, referral_type_id, entry_date, is_closed)
SELECT '240003', c.company_id, rec.recruitment_id, rec.job_type_id, rt.referral_type_id, DATE '2026-05-15', FALSE
FROM company c
JOIN recruitment rec ON rec.company_id = c.company_id AND rec.job_type_id =
  (SELECT job_type_id FROM job_type WHERE job_type_name = '組込エンジニア')
JOIN referral_type rt ON rt.referral_type_name = '自己開拓'
WHERE c.company_name = '福岡電子工業' LIMIT 1;

SET @app_fden = LAST_INSERT_ID();

INSERT INTO application_history
 (application_id, selection_stage_id, selection_result_id, is_final_selection,
  event_at, place, interviewer_count, result_date, remarks, is_deleted)
SELECT @app_fden, st.selection_stage_id, re.selection_result_id, v.fin,
       v.at, v.place, v.ic, v.rdate, v.rem, FALSE
FROM (
  SELECT '説明会'   AS stage, '参加' AS result, FALSE AS fin, TIMESTAMP '2026-05-20 15:00:00' AS at, '北九州本社' AS place, NULL AS ic, DATE '2026-05-20' AS rdate, NULL AS rem UNION ALL
  SELECT '書類選考', '合格', FALSE, TIMESTAMP '2026-06-01 00:00:00', NULL, NULL, DATE '2026-06-05', NULL UNION ALL
  SELECT '1次面接',  '合格', FALSE, TIMESTAMP '2026-06-16 10:00:00', '北九州本社', 2, DATE '2026-06-20', '技術試問は得意分野だった。希望勤務地について再確認された。' UNION ALL
  SELECT '2次面接',  '未判明', TRUE, TIMESTAMP '2026-07-02 10:00:00', '北九州本社', 3, NULL, '最終選考。役員面接。'
) v
JOIN selection_stage st ON st.selection_stage_name = v.stage
JOIN selection_result re ON re.selection_result_name = v.result;

-- 5) 大野 葵 × サンライズシステムズ … 内定承諾済み（終了）
INSERT INTO job_application (student_no, company_id, recruitment_id, job_type_id, referral_type_id, entry_date, is_closed)
SELECT '240005', c.company_id, rec.recruitment_id, rec.job_type_id, rt.referral_type_id, DATE '2026-04-20', TRUE
FROM company c
JOIN recruitment rec ON rec.company_id = c.company_id AND rec.job_type_id =
  (SELECT job_type_id FROM job_type WHERE job_type_name = 'SE / プログラマ')
JOIN referral_type rt ON rt.referral_type_name = '学校紹介'
WHERE c.company_name = 'サンライズシステムズ' LIMIT 1;

SET @app_sun = LAST_INSERT_ID();

INSERT INTO application_history
 (application_id, selection_stage_id, selection_result_id, is_final_selection,
  event_at, place, interviewer_count, result_date, remarks, is_deleted)
SELECT @app_sun, st.selection_stage_id, re.selection_result_id, v.fin,
       v.at, v.place, v.ic, v.rdate, v.rem, FALSE
FROM (
  SELECT '書類選考' AS stage, '合格' AS result, FALSE AS fin, TIMESTAMP '2026-05-01 00:00:00' AS at, NULL AS place, NULL AS ic, DATE '2026-05-08' AS rdate, NULL AS rem UNION ALL
  SELECT '1次面接',  '合格', FALSE, TIMESTAMP '2026-05-15 10:00:00', '本社・対面', 2, DATE '2026-05-19', NULL UNION ALL
  SELECT '2次面接',  '合格', TRUE,  TIMESTAMP '2026-05-28 13:00:00', '本社・対面', 3, DATE '2026-06-02', '最終選考。'
) v
JOIN selection_stage st ON st.selection_stage_name = v.stage
JOIN selection_result re ON re.selection_result_name = v.result;

INSERT INTO offer (student_no, company_id, offer_date, offer_acceptance_id, accepted_date, accept_deadline)
SELECT '240005', c.company_id, DATE '2026-06-02', oa.offer_acceptance_id, DATE '2026-06-10', DATE '2026-06-16'
FROM company c
JOIN offer_acceptance oa ON oa.offer_acceptance_name = '承諾'
WHERE c.company_name = 'サンライズシステムズ';
