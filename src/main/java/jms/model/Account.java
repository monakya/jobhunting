package jms.model;

/**
 * ログインアカウント（セッション保持用）。
 * ロール名は role マスタの値（学生 / 担任 / 就職指導部 / 就職指導部長 /
 * 教務部長 / 校長 / システム管理者）。
 */
public class Account {

    private final String accountId;
    private final int roleId;
    private final String roleName;
    private final String displayName;
    /** 担任のときのみ設定。それ以外は null */
    private final Integer homeroomClassId;

    public Account(String accountId, int roleId, String roleName,
                   String displayName, Integer homeroomClassId) {
        this.accountId = accountId;
        this.roleId = roleId;
        this.roleName = roleName;
        this.displayName = displayName;
        this.homeroomClassId = homeroomClassId;
    }

    public String getAccountId()        { return accountId; }
    public int getRoleId()              { return roleId; }
    public String getRoleName()         { return roleName; }
    public String getDisplayName()      { return displayName; }
    public Integer getHomeroomClassId() { return homeroomClassId; }

    // ---- ロール判定（Filter とヘッダ JSP から使用） ----

    public boolean isStudent()   { return "学生".equals(roleName); }
    public boolean isTeacher()   { return "担任".equals(roleName); }
    public boolean isGuidance()  { return "就職指導部".equals(roleName) || "就職指導部長".equals(roleName); }
    public boolean isReadOnlyExecutive() { return "教務部長".equals(roleName) || "校長".equals(roleName); }
    public boolean isAdmin()     { return "システム管理者".equals(roleName); }

    // ---- 機能スコープ（ロール権限マトリクスをコードで表現） ----
    // ★方針変更：担任を就職指導部と同等に引き上げ。
    // 担任 → 全クラスの学生・就活・企業を閲覧／登録／変更／削除
    // 就職指導部 → 全体閲覧と企業管理
    // 校長・教務部長 → 報告閲覧のみ / システム管理者 → すべて

    public boolean getCanViewStudents()   { return isTeacher() || isGuidance() || isAdmin(); }
    public boolean getCanViewCompanies()  { return isTeacher() || isGuidance() || isAdmin(); }
    public boolean getCanEditCompanies()  { return isTeacher() || isGuidance() || isAdmin(); }
    public boolean getCanViewActivities() { return isTeacher() || isGuidance() || isAdmin(); }
    public boolean getCanViewReport()     { return isTeacher() || isGuidance() || isReadOnlyExecutive() || isAdmin(); }

    /**
     * 行スコープ（DAO の WHERE 句に渡す担当クラスID）。
     * ★方針変更：担任も全クラスを扱えるようにしたため、常に null（＝クラス絞り込みなし）を返す。
     *   これにより一覧・閲覧・登録・変更・削除の各サーブレットにあった
     *   「scope != class_id なら 403」の行スコープ判定は、全ロールで発動しなくなる。
     *   homeroomClassId フィールドはヘッダの「担任（S2A1）」表示用に保持する。
     */
    public Integer scopeClassId() {
        return null;
    }
}
