package jms.model;

/**
 * マスタ1行の表示用モデル（業種・職種・地域で共用）。
 * usage 系は一覧の「使用件数」表示と削除可否判定に使う。
 */
public class MasterItem {
    private int id;
    private String name;
    private String subName;   // 職種なら所属業種名、地域なら都道府県名
    private int sortOrder;
    private long usage1;      // 用途はテーブルごとに異なる（JSP 側でラベル付け）
    private long usage2;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getSubName() { return subName; }
    public void setSubName(String subName) { this.subName = subName; }
    public int getSortOrder() { return sortOrder; }
    public void setSortOrder(int sortOrder) { this.sortOrder = sortOrder; }
    public long getUsage1() { return usage1; }
    public void setUsage1(long usage1) { this.usage1 = usage1; }
    public long getUsage2() { return usage2; }
    public void setUsage2(long usage2) { this.usage2 = usage2; }

    /** 使用中なら削除不可 */
    public boolean isInUse() { return usage1 > 0 || usage2 > 0; }
}
