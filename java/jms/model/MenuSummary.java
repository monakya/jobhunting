package jms.model;

/**
 * メインメニュー（画面16）のサマリーバナー＆カード用の集計値。
 * U-14 に合わせ、年度表記を外した「募集中／受験中／内定あり／連携終了」を持つ。
 * 内定・母数は offer / student から算出（キャッシュ列に依存しない）。
 */
public class MenuSummary {

    private int recruitingCompanies; // 募集中の企業数
    private int applyingCompanies;   // 受験中（進行中の応募がある企業数）
    private int offeredStudents;     // 内定あり（offer を持つ学生数）
    private int endedCompanies;      // 連携終了の企業数

    private int enrolledStudents;    // 在籍中の学生数（学生カードのチップ用）
    private int activeApplications;  // 活動中の応募件数（就活カードのチップ用）

    private int denom;               // 内定率の母数（在籍中かつあっせん辞退でない）
    private int offeredInDenom;      // 母数のうち内定ありの学生数

    public int getRecruitingCompanies()       { return recruitingCompanies; }
    public void setRecruitingCompanies(int v) { this.recruitingCompanies = v; }
    public int getApplyingCompanies()         { return applyingCompanies; }
    public void setApplyingCompanies(int v)   { this.applyingCompanies = v; }
    public int getOfferedStudents()           { return offeredStudents; }
    public void setOfferedStudents(int v)     { this.offeredStudents = v; }
    public int getEndedCompanies()            { return endedCompanies; }
    public void setEndedCompanies(int v)      { this.endedCompanies = v; }

    public int getEnrolledStudents()          { return enrolledStudents; }
    public void setEnrolledStudents(int v)    { this.enrolledStudents = v; }
    public int getActiveApplications()        { return activeApplications; }
    public void setActiveApplications(int v)  { this.activeApplications = v; }

    public int getDenom()           { return denom; }
    public void setDenom(int v)     { this.denom = v; }
    public int getOfferedInDenom()          { return offeredInDenom; }
    public void setOfferedInDenom(int v)    { this.offeredInDenom = v; }

    /** 内定率（％、小数1桁）。母数0のときは「—」 */
    public String getRatePercent() {
        if (denom == 0) return "—";
        return String.format("%.1f", offeredInDenom * 100.0 / denom);
    }
}
