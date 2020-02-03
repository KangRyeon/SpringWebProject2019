package dto;

import java.util.Date;

public class Note {
	private String stu_number;
	private String dept_name;
	private String title;
	private Date note_date;
	private String note_content;
	
	public Note(String stu_number, String dept_name, String title, Date note_date, String note_content) {
		this.stu_number = stu_number;
		this.dept_name = dept_name;
		this.title = title;
		this.note_date = note_date;
		this.note_content = note_content;
	}
	
	public String getStu_number() { return stu_number; }
	public void setStu_number(String stu_number) { this.stu_number = stu_number; }
	public String getDept_name() { return dept_name; }
	public void setDept_name(String dept_name) { this.dept_name = dept_name; }
	public String getTitle() { return title; }
	public void setTitle(String title) { this.title = title; }
	public Date getNote_date() { return note_date; }
	public void setNote_date(Date note_date) { this.note_date = note_date; }
	public String getNote_content() { return note_content; }
	public void setNote_content(String note_content) { this.note_content = note_content; }
}
