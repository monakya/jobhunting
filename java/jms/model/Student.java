package jms.model;

/** 学生1件。DB の student 行 + 表示用の名称（クラス名など）を持つ */
public class Student {
    private String studentNo;
    private String accountId;
    private int classId;
    private String className;
    private int attendanceNo;
    private String name;
    private String nameKana;
    private int genderId;
    private String genderName;
    private String birthDate;      // yyyy-MM-dd（画面入出力用に文字列で保持）
    private String admissionYm;    // yyyy-MM
    private int enrollmentStatusId;
    private String enrollmentStatusName;
    private String email;
    private String phone;
    private String address;
    private boolean refusesPlacement;
    private boolean hasOffer;
    private boolean hasAcceptedOffer;
    private String remarks;

    public String getStudentNo() { return studentNo; }
    public void setStudentNo(String v) { this.studentNo = v; }
    public String getAccountId() { return accountId; }
    public void setAccountId(String v) { this.accountId = v; }
    public int getClassId() { return classId; }
    public void setClassId(int v) { this.classId = v; }
    public String getClassName() { return className; }
    public void setClassName(String v) { this.className = v; }
    public int getAttendanceNo() { return attendanceNo; }
    public void setAttendanceNo(int v) { this.attendanceNo = v; }
    public String getName() { return name; }
    public void setName(String v) { this.name = v; }
    public String getNameKana() { return nameKana; }
    public void setNameKana(String v) { this.nameKana = v; }
    public int getGenderId() { return genderId; }
    public void setGenderId(int v) { this.genderId = v; }
    public String getGenderName() { return genderName; }
    public void setGenderName(String v) { this.genderName = v; }
    public String getBirthDate() { return birthDate; }
    public void setBirthDate(String v) { this.birthDate = v; }
    public String getAdmissionYm() { return admissionYm; }
    public void setAdmissionYm(String v) { this.admissionYm = v; }
    public int getEnrollmentStatusId() { return enrollmentStatusId; }
    public void setEnrollmentStatusId(int v) { this.enrollmentStatusId = v; }
    public String getEnrollmentStatusName() { return enrollmentStatusName; }
    public void setEnrollmentStatusName(String v) { this.enrollmentStatusName = v; }
    public String getEmail() { return email; }
    public void setEmail(String v) { this.email = v; }
    public String getPhone() { return phone; }
    public void setPhone(String v) { this.phone = v; }
    public String getAddress() { return address; }
    public void setAddress(String v) { this.address = v; }
    public boolean isRefusesPlacement() { return refusesPlacement; }
    public void setRefusesPlacement(boolean v) { this.refusesPlacement = v; }
    public boolean isHasOffer() { return hasOffer; }
    public void setHasOffer(boolean v) { this.hasOffer = v; }
    public boolean isHasAcceptedOffer() { return hasAcceptedOffer; }
    public void setHasAcceptedOffer(boolean v) { this.hasAcceptedOffer = v; }
    public String getRemarks() { return remarks; }
    public void setRemarks(String v) { this.remarks = v; }
}
