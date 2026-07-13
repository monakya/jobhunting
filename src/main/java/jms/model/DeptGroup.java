package jms.model;

import java.util.ArrayList;
import java.util.List;

/**
 * 学科ごとのまとまり（ドリルダウンの1段）。
 * 小計（subtotal）＋その学科に属するクラス行（classes）を持つ。
 */
public class DeptGroup {

    private String deptName;
    private final ReportRow subtotal = new ReportRow();
    private final List<ReportRow> classes = new ArrayList<>();

    public DeptGroup(String deptName) {
        this.deptName = deptName;
        this.subtotal.setLabel(deptName);
    }

    public String getDeptName()      { return deptName; }
    public ReportRow getSubtotal()   { return subtotal; }
    public List<ReportRow> getClasses() { return classes; }

    /** クラス行を追加し、同時に小計へ加算する */
    public void add(ReportRow row) {
        classes.add(row);
        subtotal.accumulate(row);
    }
}
