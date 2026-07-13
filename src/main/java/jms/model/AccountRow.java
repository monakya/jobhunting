package jms.model;

/** アカウント一覧（画面19）の1行 */
public class AccountRow {
    private String accountId;
    private String name;       // 教職員 or 学生の氏名（無ければ null）
    private String nameKana;
    private String departmentName;
    private String roleName;
    private String className;  // 担任の担当クラス（あれば）

    public String getAccountId() { return accountId; }
    public void setAccountId(String accountId) { this.accountId = accountId; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getNameKana() { return nameKana; }
    public void setNameKana(String nameKana) { this.nameKana = nameKana; }
    public String getDepartmentName() { return departmentName; }
    public void setDepartmentName(String departmentName) { this.departmentName = departmentName; }
    public String getRoleName() { return roleName; }
    public void setRoleName(String roleName) { this.roleName = roleName; }
    public String getClassName() { return className; }
    public void setClassName(String className) { this.className = className; }
}
