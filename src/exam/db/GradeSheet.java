package exam.db;

public class GradeSheet 
{
	private String name;
	private String sgpa;
	private String regdno;
	private String sem;
	private String subcode;
	private String subname;
	private String credit;
	private String grade;
	public String getRegdno() {
		return regdno;
	}
	public void setRegdno(String regdno) {
		this.regdno = regdno;
	}
	public String getSem() {
		return sem;
	}
	public void setSem(String sem) {
		this.sem = sem;
	}
	public String getSubcode() {
		return subcode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSgpa() {
		return sgpa;
	}
	public void setSgpa(String sgpa) {
		this.sgpa = sgpa;
	}
	public void setSubcode(String subcode) {
		this.subcode = subcode;
	}
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
}
