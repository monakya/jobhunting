package jms.model;

import java.util.ArrayList;
import java.util.List;

/**
 * メインメニュー（画面16）のサマリー集計結果。
 * フェーズ7D で KPI バナーを「本日の予定／明日の予定／承諾期限7日以内／内定率」に刷新した。
 *
 * ・KPI（today〜rate 系）は、担任ログイン時は自クラスに絞った値が入る（スコープ付き集計）
 * ・カードのチップ用（enrolledStudents 以降）は常に全体の値（グローバル集計）
 *   → 同じ「内定率」でも、バナー（クラス）とカードチップ（全体）で値が違うのは仕様
 */
public class MenuSummary {

    // ---- KPI: 本日の予定 ----
    private int todayTotal;                                  // 予定がある学生数（重複なし）
    private List<String> todayBreakdown = new ArrayList<>(); // 例: ["説明会 1", "面接 2"]（件数）

    // ---- KPI: 明日の予定 ----
    private int tomorrowTotal;
    private List<String> tomorrowBreakdown = new ArrayList<>();

    // ---- KPI: 承諾期限 7日以内 ----
    private int deadlineCount;        // 未回答の内定で期限が7日以内の学生数（期限超過も含む）
    private String deadlineNote = ""; // 例: "最短 7/16（あと2日）"

    // ---- KPI: 内定率（スコープ付き） ----
    private int denom;          // 母数: 在籍中 かつ あっせん辞退でない学生
    private int offered;        // 母数のうち offer を持つ学生
    private int accepted;       // 母数のうち承諾済みの学生

    // ---- カードチップ用（常に全体） ----
    private int enrolledStudents;
    private int classCount;
    private int companyCount;
    private int recruitingCompanies;
    private int activeApplications;
    private int followUpCount;      // 要フォロー: 応募ゼロ or 全応募終了で内定なし
    private int denomAll;           // 全体の内定率（報告カードのチップ用）
    private int offeredAll;

    // ---- 導出値（JSP から EL で参照） ----

    /** スコープ付き内定率（小数1桁の文字列。母数0なら "0.0"） */
    public String getRatePercent() {
        return denom == 0 ? "0.0" : String.format("%.1f", 100.0 * offered / denom);
    }

    /** 全体内定率（活動状況報告カードのチップ用） */
    public String getRatePercentAll() {
        return denomAll == 0 ? "0.0" : String.format("%.1f", 100.0 * offeredAll / denomAll);
    }

    /** 内定はあるが未承諾（承諾待ち・保留・辞退含む）の学生数 */
    public int getNotAccepted() { return offered - accepted; }

    // ---- getter / setter ----

    public int getTodayTotal() { return todayTotal; }
    public void setTodayTotal(int v) { todayTotal = v; }
    public List<String> getTodayBreakdown() { return todayBreakdown; }
    public void setTodayBreakdown(List<String> v) { todayBreakdown = v; }

    public int getTomorrowTotal() { return tomorrowTotal; }
    public void setTomorrowTotal(int v) { tomorrowTotal = v; }
    public List<String> getTomorrowBreakdown() { return tomorrowBreakdown; }
    public void setTomorrowBreakdown(List<String> v) { tomorrowBreakdown = v; }

    public int getDeadlineCount() { return deadlineCount; }
    public void setDeadlineCount(int v) { deadlineCount = v; }
    public String getDeadlineNote() { return deadlineNote; }
    public void setDeadlineNote(String v) { deadlineNote = v; }

    public int getDenom() { return denom; }
    public void setDenom(int v) { denom = v; }
    public int getOffered() { return offered; }
    public void setOffered(int v) { offered = v; }
    public int getAccepted() { return accepted; }
    public void setAccepted(int v) { accepted = v; }

    public int getEnrolledStudents() { return enrolledStudents; }
    public void setEnrolledStudents(int v) { enrolledStudents = v; }
    public int getClassCount() { return classCount; }
    public void setClassCount(int v) { classCount = v; }
    public int getCompanyCount() { return companyCount; }
    public void setCompanyCount(int v) { companyCount = v; }
    public int getRecruitingCompanies() { return recruitingCompanies; }
    public void setRecruitingCompanies(int v) { recruitingCompanies = v; }
    public int getActiveApplications() { return activeApplications; }
    public void setActiveApplications(int v) { activeApplications = v; }
    public int getFollowUpCount() { return followUpCount; }
    public void setFollowUpCount(int v) { followUpCount = v; }
    public int getDenomAll() { return denomAll; }
    public void setDenomAll(int v) { denomAll = v; }
    public int getOfferedAll() { return offeredAll; }
    public void setOfferedAll(int v) { offeredAll = v; }
}
