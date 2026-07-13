package jms.model;

/**
 * 内定情報（offer）。student×company に紐づく（応募＝job_application とは別テーブル）。
 * 「is_final_selection=TRUE の履歴が『合格』になった」ことを起点に自動生成される（規約 §3-4）。
 */
public class Offer {

    private long offerId;
    private String studentNo;
    private int companyId;
    private String offerDate;            // 内定日
    private Integer offerAcceptanceId;   // 承諾/辞退/保留。未回答は NULL
    private String acceptedDate;         // 承諾日
    private String acceptDeadline;       // 承諾期限

    // 表示用
    private String companyName;
    private String offerAcceptanceName;

    public long getOfferId()            { return offerId; }
    public void setOfferId(long v)      { this.offerId = v; }
    public String getStudentNo()        { return studentNo; }
    public void setStudentNo(String v)  { this.studentNo = v; }
    public int getCompanyId()           { return companyId; }
    public void setCompanyId(int v)     { this.companyId = v; }
    public String getOfferDate()        { return offerDate; }
    public void setOfferDate(String v)  { this.offerDate = v; }
    public Integer getOfferAcceptanceId()      { return offerAcceptanceId; }
    public void setOfferAcceptanceId(Integer v){ this.offerAcceptanceId = v; }
    public String getAcceptedDate()       { return acceptedDate; }
    public void setAcceptedDate(String v) { this.acceptedDate = v; }
    public String getAcceptDeadline()       { return acceptDeadline; }
    public void setAcceptDeadline(String v) { this.acceptDeadline = v; }

    public String getCompanyName()        { return companyName; }
    public void setCompanyName(String v)  { this.companyName = v; }
    public String getOfferAcceptanceName()      { return offerAcceptanceName; }
    public void setOfferAcceptanceName(String v){ this.offerAcceptanceName = v; }
}
