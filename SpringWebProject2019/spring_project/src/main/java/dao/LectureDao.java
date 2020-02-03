package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import dto.Lecture;

public class LectureDao {
	private JdbcTemplate jdbcTemplate;

	public LectureDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// 과목 전체 검색
	public List<Lecture> selectAll() {
		List<Lecture> results = jdbcTemplate.query("select * from lecture", new RowMapper<Lecture>() {
			@Override
			public Lecture mapRow(ResultSet rs, int rowNum) throws SQLException {
				Lecture assignment = new Lecture(rs.getInt("dept_id")
														, rs.getString("dept_number")
														, rs.getString("dept_name")
														, rs.getString("prof_name")
														, rs.getString("date")
														, rs.getTime("start_time")
														, rs.getTime("end_time")
														, rs.getDate("start_date")
														, rs.getDate("end_date"));
				return assignment;
			}
		});
		return results;
	}

	// student number 따라 검색
	public List<Lecture> selectByStudent(String stuNum) {
		List<Lecture> results = jdbcTemplate.query("select * from lecture where dept_id in (select dept_id from attend_lecture where stu_number=\""+stuNum+"\")", new RowMapper<Lecture>() {
			@Override
			public Lecture mapRow(ResultSet rs, int rowNum) throws SQLException {
				Lecture lecture = new Lecture(rs.getInt("dept_id")
														, rs.getString("dept_number")
														, rs.getString("dept_name")
														, rs.getString("prof_name")
														, rs.getString("date")
														, rs.getTime("start_time")
														, rs.getTime("end_time")
														, rs.getDate("start_date")
														, rs.getDate("end_date"));
				return lecture;
			}
		});
		return results;
	}
	
	// student number, 과목 id에 따라 해당 학생이 수강하는 과목 추가(attend_lecture = {"2016301001", "1"} 식으로 되어있음.)
	public int addLectureByStudentNDeptId(String stuNum, String dept_id) {
		//insert into attend_lecture values("2016301001", "1");
		int result = 0;
		try {
			result = jdbcTemplate.update("insert into attend_lecture values(\""+stuNum+"\", \""+dept_id+"\")");
		} catch(Exception e) {
			
		}
		System.out.println("[LectureDao] : result="+result);
		return result;
	}
	
	// 과목 이름에 따라 강좌 선택해 반환(하나만 반환하나 List로 넘겨줌)
	public List<Lecture> selectByLectureName(String lecture_name) {
		List<Lecture> results = jdbcTemplate.query("select * from lecture where dept_name=\""+lecture_name+"\"", new RowMapper<Lecture>() {
			@Override
			public Lecture mapRow(ResultSet rs, int rowNum) throws SQLException {
				Lecture lecture = new Lecture(rs.getInt("dept_id")
														, rs.getString("dept_number")
														, rs.getString("dept_name")
														, rs.getString("prof_name")
														, rs.getString("date")
														, rs.getTime("start_time")
														, rs.getTime("end_time")
														, rs.getDate("start_date")
														, rs.getDate("end_date"));
				return lecture;
			}
		});
		return results;
	}
	
}
