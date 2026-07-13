package jms.model;

import java.util.ArrayList;
import java.util.List;

/** 企業1件 + 一覧・閲覧用の表示名 */
public class Company {
    private int companyId;
    private String companyName;
    private String companyNameKana;
    private String corporateName;
    private String corporateNameKana;
    private int industryId;
    private String industryName;
    private int companyStatusId;
    private String companyStatusName;
    private int regionId;
    private String regionLabel;      // 県 + 市区町村
    private Long capital;
    private Integer employeeCount;
    private Integer establishedYear;
    private String websiteUrl;
    private String postalCode;
    private String address;
    private String tel;
    private String email;
    private String contactPerson;
    private boolean hasHiringRecord;
    private String remarks;
    private List<Recruitment> recruitments = new ArrayList<>();

    public int getCompanyId() { return companyId; }
    public void setCompanyId(int v) { this.companyId = v; }
    public String getCompanyName() { return companyName; }
    public void setCompanyName(String v) { this.companyName = v; }
    public String getCompanyNameKana() { return companyNameKana; }
    public void setCompanyNameKana(String v) { this.companyNameKana = v; }
    public String getCorporateName() { return corporateName; }
    public void setCorporateName(String v) { this.corporateName = v; }
    public String getCorporateNameKana() { return corporateNameKana; }
    public void setCorporateNameKana(String v) { this.corporateNameKana = v; }
    public int getIndustryId() { return industryId; }
    public void setIndustryId(int v) { this.industryId = v; }
    public String getIndustryName() { return industryName; }
    public void setIndustryName(String v) { this.industryName = v; }
    public int getCompanyStatusId() { return companyStatusId; }
    public void setCompanyStatusId(int v) { this.companyStatusId = v; }
    public String getCompanyStatusName() { return companyStatusName; }
    public void setCompanyStatusName(String v) { this.companyStatusName = v; }
    public int getRegionId() { return regionId; }
    public void setRegionId(int v) { this.regionId = v; }
    public String getRegionLabel() { return regionLabel; }
    public void setRegionLabel(String v) { this.regionLabel = v; }
    public Long getCapital() { return capital; }
    public void setCapital(Long v) { this.capital = v; }
    public Integer getEmployeeCount() { return employeeCount; }
    public void setEmployeeCount(Integer v) { this.employeeCount = v; }
    public Integer getEstablishedYear() { return establishedYear; }
    public void setEstablishedYear(Integer v) { this.establishedYear = v; }
    public String getWebsiteUrl() { return websiteUrl; }
    public void setWebsiteUrl(String v) { this.websiteUrl = v; }
    public String getPostalCode() { return postalCode; }
    public void setPostalCode(String v) { this.postalCode = v; }
    public String getAddress() { return address; }
    public void setAddress(String v) { this.address = v; }
    public String getTel() { return tel; }
    public void setTel(String v) { this.tel = v; }
    public String getEmail() { return email; }
    public void setEmail(String v) { this.email = v; }
    public String getContactPerson() { return contactPerson; }
    public void setContactPerson(String v) { this.contactPerson = v; }
    public boolean isHasHiringRecord() { return hasHiringRecord; }
    public void setHasHiringRecord(boolean v) { this.hasHiringRecord = v; }
    public String getRemarks() { return remarks; }
    public void setRemarks(String v) { this.remarks = v; }
    public List<Recruitment> getRecruitments() { return recruitments; }
    public void setRecruitments(List<Recruitment> v) { this.recruitments = v; }
}
