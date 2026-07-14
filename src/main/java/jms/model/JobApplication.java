package jms.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 就活（応募ヘッダ）＝ job_application 1件。
 * 画面表示に必要な結合先の名称や、最新履歴から導出した「現在の選考状況」も持たせる。
 * DB に保存する列は id/studentNo/companyId/recruitmentId/jobTypeId/referralTypeId/entryDate/closed のみ。
 * 残りは一覧・閲覧のための導出値（read-only）。
 */
public class JobApplication {

    // ---- 永続化される列 ----
    private long applicationId;
    private String studentNo;
    private int companyId;
    private Integer recruitmentId;      // NULL=募集なしの直接応募
    private int jobTypeId;
    private int referralTypeId;
    private String entryDate;           // YYYY-MM-DD
    private boolean closed;             // is_closed

    // ---- 表示用（結合で取得） ----
    private String studentName;
    private String studentNameKana;
    private int classId;          // 行スコープ（担任の自クラス制限）判定用
    private String className;
    private int attendanceNo;     // 出席番号（一覧の「クラス-出席番号」表示用）
    private String companyName;
    private String industryName;
    private String companyCity;   // 企業所在地（市区町村。県全域の場合は null）
    private String jobTypeName;
    private String referralTypeName;

    // ---- 現在の選考状況（最新の application_history から導出） ----
    private String currentStageName;
    private String currentResultName;
    private boolean currentFinal;       // 最新履歴の is_final_selection
    private String currentResultDate;
    private String currentEventAt;      // 最新履歴の日時（YYYY-MM-DDTHH:mm）。一覧「次回日時」列に使用
    private String currentPlace;        // 最新履歴の場所
    private boolean hasHistory;         // 履歴が1件でもあるか

    // ---- 内定情報（offer があれば） ----
    private boolean hasOffer;
    private String acceptDeadline;      // 内定承諾期限（一覧の警告色に使用）
    private String offerAcceptanceName; // 承諾/辞退/保留（未回答は null）

    // ---- 閲覧画面用 ----
    private final List<ApplicationHistory> histories = new ArrayList<>();
    private Offer offer;                // 内定情報の詳細（無ければ null）

    public long getApplicationId()       { return applicationId; }
    public void setApplicationId(long v) { this.applicationId = v; }
    public String getStudentNo()         { return studentNo; }
    public void setStudentNo(String v)   { this.studentNo = v; }
    public int getCompanyId()            { return companyId; }
    public void setCompanyId(int v)      { this.companyId = v; }
    public Integer getRecruitmentId()        { return recruitmentId; }
    public void setRecruitmentId(Integer v)  { this.recruitmentId = v; }
    public int getJobTypeId()            { return jobTypeId; }
    public void setJobTypeId(int v)      { this.jobTypeId = v; }
    public int getReferralTypeId()       { return referralTypeId; }
    public void setReferralTypeId(int v) { this.referralTypeId = v; }
    public String getEntryDate()         { return entryDate; }
    public void setEntryDate(String v)   { this.entryDate = v; }
    public boolean isClosed()            { return closed; }
    public void setClosed(boolean v)     { this.closed = v; }

    public String getStudentName()       { return studentName; }
    public void setStudentName(String v) { this.studentName = v; }
    public String getStudentNameKana()       { return studentNameKana; }
    public void setStudentNameKana(String v) { this.studentNameKana = v; }
    public int getClassId()              { return classId; }
    public void setClassId(int v)        { this.classId = v; }
    public String getClassName()         { return className; }
    public void setClassName(String v)   { this.className = v; }
    public int getAttendanceNo()         { return attendanceNo; }
    public void setAttendanceNo(int v)   { this.attendanceNo = v; }
    public String getCompanyName()       { return companyName; }
    public void setCompanyName(String v) { this.companyName = v; }
    public String getIndustryName()      { return industryName; }
    public void setIndustryName(String v){ this.industryName = v; }
    public String getCompanyCity()       { return companyCity; }
    public void setCompanyCity(String v) { this.companyCity = v; }
    public String getJobTypeName()       { return jobTypeName; }
    public void setJobTypeName(String v) { this.jobTypeName = v; }
    public String getReferralTypeName()      { return referralTypeName; }
    public void setReferralTypeName(String v){ this.referralTypeName = v; }

    public String getCurrentStageName()      { return currentStageName; }
    public void setCurrentStageName(String v){ this.currentStageName = v; }
    public String getCurrentResultName()      { return currentResultName; }
    public void setCurrentResultName(String v){ this.currentResultName = v; }
    public boolean isCurrentFinal()      { return currentFinal; }
    public void setCurrentFinal(boolean v){ this.currentFinal = v; }
    public String getCurrentResultDate()      { return currentResultDate; }
    public void setCurrentResultDate(String v){ this.currentResultDate = v; }
    public String getCurrentEventAt()      { return currentEventAt; }
    public void setCurrentEventAt(String v){ this.currentEventAt = v; }
    public String getCurrentPlace()      { return currentPlace; }
    public void setCurrentPlace(String v){ this.currentPlace = v; }
    public boolean isHasHistory()        { return hasHistory; }
    public void setHasHistory(boolean v) { this.hasHistory = v; }

    public boolean isHasOffer()          { return hasOffer; }
    public void setHasOffer(boolean v)   { this.hasOffer = v; }
    public String getAcceptDeadline()        { return acceptDeadline; }
    public void setAcceptDeadline(String v)  { this.acceptDeadline = v; }
    public String getOfferAcceptanceName()      { return offerAcceptanceName; }
    public void setOfferAcceptanceName(String v){ this.offerAcceptanceName = v; }

    public List<ApplicationHistory> getHistories() { return histories; }

    /** 選考タイムライン表示用：古い順（説明会→…→最終）に並べ替えたコピー。getHistories() 自体は新しい順のまま */
    public List<ApplicationHistory> getHistoriesChronological() {
        List<ApplicationHistory> copy = new ArrayList<>(histories);
        Collections.reverse(copy);
        return copy;
    }
    public Offer getOffer()          { return offer; }
    public void setOffer(Offer v)    { this.offer = v; }
}
