package jms.model;

import java.util.ArrayList;
import java.util.List;

/** 募集1件（1募集 = 1職種 + 人数 + 勤務地複数） */
public class Recruitment {
    private int recruitmentId;
    private int jobTypeId;
    private String jobTypeName;
    private int headcount;
    private List<Integer> regionIds = new ArrayList<>();
    private List<String> regionLabels = new ArrayList<>();
    private long applicationCount;   // この募集への応募数（削除ガード用）

    public int getRecruitmentId() { return recruitmentId; }
    public void setRecruitmentId(int v) { this.recruitmentId = v; }
    public int getJobTypeId() { return jobTypeId; }
    public void setJobTypeId(int v) { this.jobTypeId = v; }
    public String getJobTypeName() { return jobTypeName; }
    public void setJobTypeName(String v) { this.jobTypeName = v; }
    public int getHeadcount() { return headcount; }
    public void setHeadcount(int v) { this.headcount = v; }
    public List<Integer> getRegionIds() { return regionIds; }
    public void setRegionIds(List<Integer> v) { this.regionIds = v; }
    public List<String> getRegionLabels() { return regionLabels; }
    public void setRegionLabels(List<String> v) { this.regionLabels = v; }
    public long getApplicationCount() { return applicationCount; }
    public void setApplicationCount(long v) { this.applicationCount = v; }

    /** 勤務地チップ表示用: "福岡県 福岡市博多区, 福岡県 福岡市中央区" */
    public String getRegionJoined() { return String.join("、 ", regionLabels); }
}
