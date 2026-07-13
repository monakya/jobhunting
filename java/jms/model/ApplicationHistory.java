package jms.model;

/**
 * 選考履歴（application_history）1行 = 1つの選考イベント。
 * 設計の肝：この行は基本 INSERT で積む。UPDATE してよいのは
 * selectionResultId / resultDate / remarks / isDeleted のみ（規約 §3-1）。
 */
public class ApplicationHistory {

    private long historyId;
    private long applicationId;
    private int selectionStageId;
    private int selectionResultId;
    private boolean finalSelection;   // is_final_selection
    private String eventAt;           // YYYY-MM-DDTHH:mm（datetime-local 形式）
    private String place;
    private Integer interviewerCount; // NULL可（>0 の CHECK 制約あり）
    private String resultDate;        // YYYY-MM-DD / NULL可
    private String remarks;
    private boolean deleted;          // is_deleted

    // ---- 表示用 ----
    private String stageName;
    private String resultName;

    public long getHistoryId()          { return historyId; }
    public void setHistoryId(long v)     { this.historyId = v; }
    public long getApplicationId()       { return applicationId; }
    public void setApplicationId(long v) { this.applicationId = v; }
    public int getSelectionStageId()        { return selectionStageId; }
    public void setSelectionStageId(int v)  { this.selectionStageId = v; }
    public int getSelectionResultId()       { return selectionResultId; }
    public void setSelectionResultId(int v) { this.selectionResultId = v; }
    public boolean isFinalSelection()       { return finalSelection; }
    public void setFinalSelection(boolean v){ this.finalSelection = v; }
    public String getEventAt()          { return eventAt; }
    public void setEventAt(String v)    { this.eventAt = v; }
    public String getPlace()            { return place; }
    public void setPlace(String v)      { this.place = v; }
    public Integer getInterviewerCount()      { return interviewerCount; }
    public void setInterviewerCount(Integer v){ this.interviewerCount = v; }
    public String getResultDate()       { return resultDate; }
    public void setResultDate(String v) { this.resultDate = v; }
    public String getRemarks()          { return remarks; }
    public void setRemarks(String v)    { this.remarks = v; }
    public boolean isDeleted()          { return deleted; }
    public void setDeleted(boolean v)   { this.deleted = v; }

    public String getStageName()        { return stageName; }
    public void setStageName(String v)  { this.stageName = v; }
    public String getResultName()       { return resultName; }
    public void setResultName(String v) { this.resultName = v; }
}
