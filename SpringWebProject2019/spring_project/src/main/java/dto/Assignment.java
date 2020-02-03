package dto;

import java.util.Date;

public class Assignment {
	private String dept_name;
	private String assg_name;
	private Date assg_start;
	private Date assg_end;
	private String assg_content;
	
	public Assignment(String dept_name, String assg_name, Date assg_start, Date assg_end, String assg_content) {
		this.dept_name = dept_name;
		this.assg_name = assg_name;
		this.assg_start = assg_start;
		this.assg_end = assg_end;
		this.assg_content = assg_content;
	}
	
	public String getDept_name() { return dept_name; }
	public void setDept_name(String dept_name) { this.dept_name = dept_name; }
	public String getAssg_name() { return assg_name; }
	public void setAssg_name(String assg_name) { this.assg_name = assg_name; }
	public Date getAssg_start() { return assg_start; }
	public void setAssg_start(Date assg_start) { this.assg_start = assg_start; }
	public Date getAssg_end() { return assg_end; }
	public void setAssg_end(Date assg_end) { this.assg_end = assg_end; }
	public String getAssg_content() { return assg_content; }
	public void setAssg_content(String assg_content) { this.assg_content = assg_content; }
	
	public String toString() {
		return "Assignment [" + dept_name + ", " + assg_name + ", " + assg_start + "," + assg_end + ", " + assg_content;
	}
}
