package dao;

import java.sql.*;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.*;

import dto.Student;

public class StudentDao {
	private JdbcTemplate jdbcTemplate;
	
	public StudentDao(DataSource dataSource) {
		this.jdbcTemplate= new JdbcTemplate(dataSource);
	}
	
	// student id("nara97") 로 검색해 학생 하나 반환
	public Student SelectByID(String id) {
		List<Student> results=jdbcTemplate.query("select * from student where id=?",
				new RowMapper<Student>() {
			@Override
			public Student mapRow(ResultSet rs, int rowNum) throws SQLException{
				Student student = new Student(rs.getString("stu_number"),
												rs.getString("stu_name"),
												rs.getString("id"),
												rs.getString("pw"),
												rs.getString("nickname"),
												rs.getString("email"),
												rs.getString("phone"),
												rs.getString("school"),
												rs.getString("major"));
				
				return student;
			}
		},id);
	
		return results.isEmpty() ? null: results.get(0);
	}
	
	// student update하기
	public int Update(String stu_number, String stu_name, String id, String pwd, String nname, String email, String phone, String school, String major) {
		int result =0;
		try {
			result=jdbcTemplate.update("update student set stu_name='"+stu_name+"',id='"+id+"',pw='"+pwd+"',nickname='"+nname
									+"',email='"+email+"',phone='"+phone+"',school='"+school+"', major='"+major+"' where stu_number='"+stu_number+"'");
		}catch(Exception e) { }
		
		return result;
	}
}
