package dto;

import java.sql.Time;
import java.util.Date;

public class Lecture {
	private int dept_id;
	private String dept_number;
	private String dept_name;
	private String prof_name;
	private String date;
	private Time start_time;
	private Time end_time;
	private Date start_date;
	private Date end_date;
	
	public Lecture(int dept_id, String dept_number, String dept_name, String prof_name
					, String date, Time start_time, Time end_time, Date start_date, Date end_date) {
		this.dept_id = dept_id;
		this.dept_number = dept_number;
		this.dept_name = dept_name;
		this.prof_name = prof_name;
		this.date = date;
		this.start_time = start_time;
		this.end_time = end_time;
		this.start_date = start_date;
		this.end_date = end_date;
	}
	
	public int getDept_id() { return dept_id; }
	public void setDept_id(int dept_id) { this.dept_id = dept_id; }
	public String getDept_number() { return dept_number; }
	public void setDept_number(String dept_number) { this.dept_number = dept_number; }
	public String getDept_name() { return dept_name; }
	public void setDept_name(String dept_name) { this.dept_name = dept_name; }
	public String getProf_name() { return prof_name; }
	public void setProf_name(String prof_name) { this.prof_name = prof_name; }
	public String getDate() { return date; }
	public void setDate(String date) { this.date = date; }
	public Time getStart_time() { return start_time; }
	public void setStart_time(Time start_time) { this.start_time = start_time; }
	public Time getEnd_time() { return end_time; }
	public void setEnd_time(Time end_time) { this.end_time = end_time; }
	public Date getStart_date() { return start_date; }
	public void setStart_date(Date start_date) { this.start_date = start_date; }
	public Date getEnd_date() { return end_date; }
	public void setEnd_date(Date end_date) { this.end_date = end_date; }
	
	public String tostring() {
		return "Lecture [dept_id=" + dept_id + ", dept_number=" + dept_number
				+ ", dept_name=" + dept_name + ", prof_name=" + prof_name
				+ ", date=" + date + ", start_time=" + start_time
				+ ", end_time=" + end_time + ", start_date=" + start_date
				+ ", end_date=" + end_date;
	}
}
