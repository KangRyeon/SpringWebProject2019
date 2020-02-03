package dto;

public class Student {
	private String stu_number;
	private String stu_name;
	private String id;
	private String pw;
	private String nickname;
	private String email;
	private String phone;
	private String school;
	private String major;
	
	public Student(String stu_number, String stu_name, String id, String pw, String nickname, String email, String phone, String school, String major) {
		this.stu_number = stu_number;
		this.stu_name = stu_name;
		this.id = id;
		this.pw = pw;
		this.nickname = nickname;
		this.email = email;
		this.phone = phone;
		this.school = school;
		this.major = major;
	}
	
	public String getStu_number() { return stu_number; }
	public void setStu_number(String stu_number) { this.stu_number = stu_number; }
	public String getStu_name() { return stu_name; }
	public void setStu_name(String stu_name) { this.stu_name = stu_name; }
	public String getId() { return id; }
	public void setId(String id) { this.id = id; }
	public String getPw() { return pw; }
	public void setPw(String pw) { this.pw = pw; }
	public String getNickname() { return nickname; }
	public void setNickname(String nickname) { this.nickname = nickname; }
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
	public String getPhone() { return phone; }
	public void setPhone(String phone) { this.phone = phone; }
	public String getSchool() { return school; }
	public void setSchool(String school) { this.school = school; }
	public String getMajor() { return major; }
	public void setMajor(String major) { this.major = major; }
}
