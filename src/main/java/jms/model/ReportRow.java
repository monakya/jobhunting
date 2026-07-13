package jms.model;

/**
 * 活動状況報告（画面14）の集計1行分。
 * クラス行・学科小計・全体合計で同じ入れ物を使い回す。
 * 数値の「正」は offer テーブル側なので、内定・承諾は has_offer 等のキャッシュ列ではなく
 * ReportDao の集計（offer からの EXISTS）で埋める。
 */
public class ReportRow {

    private String deptName;   // 学科名（クラス行のグルーピング用）
    private Integer grade;     // 学年（クラス行のみ）
    private String label;      // クラス名 / 学科名 / 「全体」

    private int total;         // 在籍総数（参考）
    private int denom;         // 母数（在籍中 かつ あっせん辞退でない）
    private int offered;       // 内定者数
    private int accepted;      // 承諾済
    private int needFollow;    // 要フォロー（応募ゼロ or 全応募終了で内定なし）
    private int active;        // 活動中の応募件数（is_closed=FALSE）

    public String getDeptName()        { return deptName; }
    public void setDeptName(String v)  { this.deptName = v; }
    public Integer getGrade()          { return grade; }
    public void setGrade(Integer v)    { this.grade = v; }
    public String getLabel()           { return label; }
    public void setLabel(String v)     { this.label = v; }

    public int getTotal()          { return total; }
    public void setTotal(int v)    { this.total = v; }
    public int getDenom()          { return denom; }
    public void setDenom(int v)    { this.denom = v; }
    public int getOffered()        { return offered; }
    public void setOffered(int v)  { this.offered = v; }
    public int getAccepted()       { return accepted; }
    public void setAccepted(int v) { this.accepted = v; }
    public int getNeedFollow()         { return needFollow; }
    public void setNeedFollow(int v)   { this.needFollow = v; }
    public int getActive()         { return active; }
    public void setActive(int v)   { this.active = v; }

    /** 未承諾（内定はあるが承諾していない） */
    public int getUnaccepted() { return offered - accepted; }

    /** 内定率（％、小数1桁）。母数0のときは「—」 */
    public String getRatePercent() {
        if (denom == 0) return "—";
        return String.format("%.1f", offered * 100.0 / denom);
    }

    /** 内定率の数値（バーの幅などに使用）。母数0のときは0 */
    public double getRateValue() {
        return denom == 0 ? 0.0 : offered * 100.0 / denom;
    }

    /** 小計・合計を作るための加算 */
    public void accumulate(ReportRow r) {
        total      += r.total;
        denom      += r.denom;
        offered    += r.offered;
        accepted   += r.accepted;
        needFollow += r.needFollow;
        active     += r.active;
    }
}
