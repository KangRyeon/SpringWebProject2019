package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import dto.Assignment;
public class AssignmentDao {
	private JdbcTemplate jdbcTemplate;

	public AssignmentDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// student 번호("2016301001")에 따라 과제물 검색, 반환
	public List<Assignment> selectByStudent(String stuNum) {
		List<Assignment> results = jdbcTemplate.query("select * from assignment where stu_number=\""+stuNum+"\"", new RowMapper<Assignment>() {
			@Override
			public Assignment mapRow(ResultSet rs, int rowNum) throws SQLException {
				Assignment assignment = new Assignment(rs.getString("dept_name")
														, rs.getString("assg_name")
														, rs.getTimestamp("assg_start")
														, rs.getTimestamp("assg_end")
														, rs.getString("assg_content"));
				return assignment;
			}
		});
		return results;
	}
	
	// 과제물 추가
	public int addAssignment(String stuNum, String dept_name, String assg_name, String assg_start, String assg_end, String assg_content) {
		//insert into assignment values("2016301001", "컴퓨터네트워크", "네트워크의 이해", "2019-03-24", "2019-03-29", "네트워크는 참 재밌어요 어떻게해야 잘 할수 있을까요");
		int result = 0;
		try {
			result = jdbcTemplate.update("insert into assignment values(\""+stuNum+"\", \""+dept_name+"\", \""+assg_name+"\", \""+assg_start+"\", \""+assg_end+"\", \""+assg_content+"\")");
		} catch(Exception e) {
			
		}
		return result;
	}
	
	// student 번호("2016301001")에 따라 과제물 검색하는데 제출일이 빠른순으로 정렬
	public List<Assignment> selectByStudentOrderByEnd(String stuNum) {
		List<Assignment> results = jdbcTemplate.query("select * from assignment where stu_number=\""+stuNum+"\"order by assg_end asc", new RowMapper<Assignment>() {
			@Override
			public Assignment mapRow(ResultSet rs, int rowNum) throws SQLException {
				Assignment assignment = new Assignment(rs.getString("dept_name")
														, rs.getString("assg_name")
														, rs.getTimestamp("assg_start")
														, rs.getTimestamp("assg_end")
														, rs.getString("assg_content"));
				return assignment;
			}
		});
		return results;
	}
	
}
