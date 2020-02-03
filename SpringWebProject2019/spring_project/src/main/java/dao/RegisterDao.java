package dao;

import java.sql.*;

import javax.sql.DataSource;

import org.springframework.jdbc.core.*;

public class RegisterDao {
	private JdbcTemplate jdbcTemplate;
	
	public RegisterDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	    
	public int Register(String stu_number, String stu_name, String id, String pwd, String nname, String email, String phone, String school, String major) {
		// insert into student values("2016301002", "김명훈", ...);
		int result =0;
		try {
			result=jdbcTemplate.update("insert into student values(\""+stu_number+"\", \""+stu_name+"\", \""+id+"\", \""+pwd+"\",\""
										+nname+"\",\""+email+"\",\""+phone+"\",\""+school+"\",\""+major+"\")");
		}catch(Exception e) { System.out.println("[RegisterDao] : 쿼리문 잘못됨."); }
		
		return result;
	}
}
