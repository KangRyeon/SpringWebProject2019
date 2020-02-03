package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import dto.Note;

public class NoteDao {
	private JdbcTemplate jdbcTemplate;

	public NoteDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	// student number 따라 note 검색
	public List<Note> selectByStudent(String stuNum) {
		List<Note> results = jdbcTemplate.query("select * from note where stu_number=\""+stuNum+"\"", new RowMapper<Note>() {
			@Override
			public Note mapRow(ResultSet rs, int rowNum) throws SQLException {
				Note note = new Note(rs.getString("stu_number")
														, rs.getString("dept_name")
														, rs.getString("title")
														, rs.getDate("note_date")
														, rs.getString("note_content"));
				return note;
			}
		});
		
		return results;
	}
	
	// note 추가
	public int addNote(String stuNum, String dept_name, String title, String note_date, String note_content) {
		//insert into assignment values("2016301001", "컴퓨터네트워크", "네트워크의 이해", "2019-03-24", "2019-03-29", "네트워크는 참 재밌어요 어떻게해야 잘 할수 있을까요");
		int result = 0;
		try {
			result = jdbcTemplate.update("insert into note values(\""+stuNum+"\", \""+dept_name+"\", \""+title+"\", \""+note_date+"\", \""+note_content+"\")");
		} catch(Exception e) { }
		
		return result;
	}
	
	// 학생에 따른 노트 검색하는데 최근에 적은 것이 가장 위로 오도록
	public List<Note> selectByStudentOrderByDate(String stuNum) {
		List<Note> results = jdbcTemplate.query("select * from note where stu_number=\""+stuNum+"\" order by note_date desc", new RowMapper<Note>() {
			@Override
			public Note mapRow(ResultSet rs, int rowNum) throws SQLException {
				Note note = new Note(rs.getString("stu_number")
														, rs.getString("dept_name")
														, rs.getString("title")
														, rs.getDate("note_date")
														, rs.getString("note_content"));
				
				return note;
			}
		});
		
		return results;
	}
}
