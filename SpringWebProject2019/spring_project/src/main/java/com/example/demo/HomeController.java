package com.example.demo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.*;
import dto.*;

@Controller
public class HomeController {
	@Autowired
	private AssignmentDao assignmentDao;
	@Autowired
	private LectureDao lectureDao;
	@Autowired
	private NoteDao noteDao;
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private RegisterDao registerDao;
	
	
	/* 고강련 */
	// 메뉴바를 선택하면 각각(Home|Note|Assignment|Mypage) 해당하는 페이지를 보여줌.
	@RequestMapping(value="/selectMenu")
	public String selectMenu(Model model, HttpServletRequest request, HttpSession session) {
		String menu_name = request.getParameter("menu");
		String userid = (String)session.getAttribute("userid");
		Student stu_list = studentDao.SelectByID(userid);
			
		if(userid == null) {
			return "login";
		}
		if(menu_name.equals("Home")) {
			List<Lecture> list = lectureDao.selectByStudent(stu_list.getStu_number());
			model.addAttribute("lectures", list);
			return "home";
		}
		else if(menu_name.equals("Note")) {
			List<Note> list = noteDao.selectByStudentOrderByDate(stu_list.getStu_number());
			List<Lecture> list2 = lectureDao.selectByStudent(stu_list.getStu_number());
			model.addAttribute("notes", list);
			model.addAttribute("lectures", list2);
			return "note";
		}
		else if(menu_name.equals("Assignment")) {
			List<Assignment> list = assignmentDao.selectByStudentOrderByEnd(stu_list.getStu_number());	
			List<Lecture> list2 = lectureDao.selectByStudent(stu_list.getStu_number());
			model.addAttribute("assignments", list);
			model.addAttribute("lectures", list2);
			return "assignment";
		}
		else if(menu_name.equals("Mypage")) {
			model.addAttribute("student", stu_list);
			return "profile";
		}
		
		return "home";
	}
		
	// "/home"이라는 요청을 보내면 session에 저장된 id 값에 따라 그 학생의 과목 시간표인 home.jsp를 보여줌.
	@RequestMapping(value="/home")
	public String home(Model model, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		Student stu_list = studentDao.SelectByID(userid);
		List<Lecture> list = lectureDao.selectByStudent(stu_list.getStu_number());
		model.addAttribute("lectures", list);
		
		return "home";
	}
	
	// home.jsp에서 [과목 찾기] 버튼을 누르면 과목 이름에 따라 찾은 과목을 보내서 home.jsp 하단에 보여줌.
	@RequestMapping(value="/findLecture")
	public String selectLecture(Model model, HttpServletRequest request, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		Student stu_list = studentDao.SelectByID(userid);
		List<Lecture> list = lectureDao.selectByStudent(stu_list.getStu_number());
		model.addAttribute("lectures", list);
		
		String lecture_name = request.getParameter("findLecture");
		
		List<Lecture> find_list = lectureDao.selectByLectureName(lecture_name);
		model.addAttribute("findLectures", find_list);
		
		return "home";
	}
	
	// home.jsp에서 과목을 찾고 [과목 추가] 버튼을 누르면 로그인한 학생에게 검색한 과목을 추가, home.jsp에서 시간표에 추가한 것도 보여줌.
	@RequestMapping(value="/addLecture")
	public String addLecture(Model model, HttpServletRequest request, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		Student stu_list = studentDao.SelectByID(userid);
		String dept_id1;                                   // 과목이 화, 목 두번일 경우를 위해 두번까지 체크
		String dept_id2;
		dept_id1 = request.getParameter("dept_id0");
		dept_id2 = request.getParameter("dept_id1");
		System.out.println("[HomeController] : id1 = " + dept_id1 + ", id2 = " + dept_id2);

		int result1 = 0;
		int result2 = 0;
		
		if(dept_id1 != null)
			result1 = lectureDao.addLectureByStudentNDeptId(stu_list.getStu_number(), dept_id1);
		if(dept_id2 != null)
			result2 = lectureDao.addLectureByStudentNDeptId(stu_list.getStu_number(), dept_id2);
		
		if(result1 == 0)
				System.out.println("update 되지 않음");
		else
			System.out.println("update 잘 됨");
		
		List<Lecture> list = lectureDao.selectByStudent(stu_list.getStu_number());
		model.addAttribute("lectures", list);
		
		return "home";
	}
	
	// "/assignment" 요청을 보내면 자신이 입력했던 과제물을 보여주는 게시판인 "assignment.jsp"를 보여줌.
	@RequestMapping(value="/assignment")
	public String assignment(Model model, HttpServletRequest request, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		Student stu_list = studentDao.SelectByID(userid);
		List<Assignment> list = assignmentDao.selectByStudentOrderByEnd(stu_list.getStu_number());
		List<Lecture> list2 = lectureDao.selectByStudent(stu_list.getStu_number());
		model.addAttribute("assignments", list);
		model.addAttribute("lectures", list2);
		
		return "assignment";
	}
	
	// assignment.jsp에서 [과제물 추가] 버튼을 누르면 과제물 추가하는 Form을 보여줌.
	@RequestMapping(value="/assignmentForm")
	public String assignmentForm(Model model, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		Student stu_list = studentDao.SelectByID(userid);
		List<Lecture> list = lectureDao.selectByStudent(stu_list.getStu_number());
		model.addAttribute("lectures", list);
		
		return "assignmentForm";
	}
	
	// assignmentForm.jsp에서 [Add Assignment] 버튼을 누르면 과제물DB에 과제물을 추가해줌.
	@RequestMapping(value="/addAssignment")
	public String addAssignment(Model model, HttpServletRequest request, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		Student stu_list = studentDao.SelectByID(userid);
		String dept_name = request.getParameter("dept_name");
		String assg_name = request.getParameter("assg_name");
		String assg_start = request.getParameter("assg_start");
		String assg_end = request.getParameter("assg_end");
		String assg_content = request.getParameter("assg_content");
		
		int result = 0;
		result = assignmentDao.addAssignment(stu_list.getStu_number(), dept_name, assg_name, assg_start, assg_end, assg_content.replace("\r\n", "<br/>"));

		if(result == 0)
			System.out.println("[HomeControlelr] : assignment 추가 실패");
		else
			System.out.println("[HomeControlelr] : assignment 추가 성공");
		
		List<Assignment> list = assignmentDao.selectByStudent(stu_list.getStu_number());
		List<Lecture> list2 = lectureDao.selectByStudent(stu_list.getStu_number());
		model.addAttribute("assignments", list);
		model.addAttribute("lectures", list2);
		
		return "assignment";
	}
	
	// "/note" 요청을 보내면 note 게시판을 보여줌.
	@RequestMapping(value="/note")
	public String note(Model model, HttpServletRequest request, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		Student stu_list = studentDao.SelectByID(userid);
		List<Note> list = noteDao.selectByStudentOrderByDate(stu_list.getStu_number());
		model.addAttribute("notes", list);
		
		List<Lecture> list2 = lectureDao.selectByStudent(stu_list.getStu_number());
		model.addAttribute("lectures", list2);
		return "note";
	}
	
	// note.jsp에서 [노트 추가] 버튼을 누르면 노트 추가하는 Form을 보여줌.
	@RequestMapping(value="/noteForm")
	public String noteForm(Model model, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		Student stu_list = studentDao.SelectByID(userid);
		List<Lecture> list = lectureDao.selectByStudent(stu_list.getStu_number());
		model.addAttribute("lectures", list);
		
		return "noteForm";
	}
	
	// noteForm.jsp에서 [Add Note] 버튼을 누르면 노트를 노트DB에 추가함.
	@RequestMapping(value="/addNote")
	public String addNote(Model model, HttpServletRequest request, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		Student stu_list = studentDao.SelectByID(userid);
		String dept_name = request.getParameter("dept_name");
		String title = request.getParameter("title");
		String note_date = request.getParameter("note_date");
		String note_content = request.getParameter("note_content");
		System.out.println("[HomeController] : 노트 추가를 누르면 dept_name=" + dept_name
				+ ", title=" + title + ", note_date=" + note_date
				+ ", note_content=" + note_content);
		
		int result = 0;
		result = noteDao.addNote(stu_list.getStu_number(), dept_name, title, note_date, note_content.replace("\r\n", "<br/>"));
		if(result == 0)
			System.out.println("[HomeControlelr] : note 추가 실패");
		else
			System.out.println("[HomeControlelr] : note 추가 성공");
		List<Note> list = noteDao.selectByStudentOrderByDate(stu_list.getStu_number());
		model.addAttribute("notes", list);
		
		List<Lecture> list2 = lectureDao.selectByStudent(stu_list.getStu_number());
		model.addAttribute("lectures", list2);
		return "note";
	}
	/* 고강련 끝 */
	
	
	
	
	
	/* 김예일 */
	// "/login" 요청이 들어오면 로그인 화면을 보여줌.
	@RequestMapping(value="/login")
	public String l0gin(Model model) {
		
		return "login";
	}
	
	// 값을 입력 후 [login] 버튼을 누르면 입력한 아이디, 비밀번호를 확인 후 session에 "userid"로 등록하고 해당학생의 시간표를 보여줌
	// 틀리면 로그인 화면에서 넘어가지 않음.
	@RequestMapping(value="/loginCheck")
	public String loginCheck(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		model.addAttribute("id",id);
		Student s = studentDao.SelectByID(id);
		
		if(s==null) {
			return "login";
		}
		
		String dbPwd = s.getPw();
		if(id != null) { System.out.println("받아온 id = " + id + ", pwd = " + pwd);
			if(dbPwd.equals(pwd)) {
				session.setAttribute("userid",id);
				String userid = (String)session.getAttribute("userid");
				Student list = studentDao.SelectByID(userid);
				model.addAttribute("student", list);
				System.out.println("받아온 student = "+list.getStu_name());
				
				List<Lecture> list2 = lectureDao.selectByStudent(list.getStu_number());
				model.addAttribute("lectures", list2);
				
				return "home";
			}
		}
		
		return "login";
	}
	
	// login.jsp에서 [Register] 버튼을 누르면 회원가입 Form을 보여줌.
	@RequestMapping(value="/Register")
	public String Register(Model model) {
		
		return "Register";
	}
	
	// 회원가입 정보 입력 후 [Register] 버튼을 누르면 회원가입 체크 후 login화면으로 돌아감.
	@RequestMapping(value="/RegisterCheck")
	public String Register(Model model, HttpServletRequest request) {
		String stu_number = request.getParameter("stu_number");
		String stu_name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("password");
		String nname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String school = request.getParameter("school");
		String major = request.getParameter("major");
		
		System.out.println("[HomeController] : "+stu_number+", "+stu_name+", "+id+", "+pwd);
		int result = 0;
		result = registerDao.Register(stu_number, stu_name, id, pwd, nname, email, phone, school, major);
		if(result == 0) {
			System.out.println("update 잘 안됨----------------------");
			return "Register";
		}
		else {
			System.out.println("update 잘 됨----------------------");
			return "login";
		}
	}

	// [MyPage]메뉴 눌렀을 때 해당 학생의 정보를 보여줌.
	@RequestMapping(value="/profile")
	public String profile(Model model, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		Student list = studentDao.SelectByID(userid);
		model.addAttribute("student", list);
		System.out.println("받아온 student = "+list.getStu_name());
		
		return "profile";
	}	
	
	// profile.jsp에서 [Update profile] 버튼을 누르면 해당하는 항목 가져와 DB를 Update 해줌.
	@RequestMapping(value="/profileCheck")
	public String profile(Model model, HttpServletRequest request, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		Student list = studentDao.SelectByID(userid);
		System.out.println("[HomeController2] : "+list.getStu_number()+"\", \""+list.getStu_name()+"\"");
		
		String stu_number = request.getParameter("stu_number");
		String stu_name = null;
		String id = null;
		String pwd = null;
		String nname = null;
		String email = null;
		String phone = null;
		String school = null;
		String major = null;
		
		stu_name = request.getParameter("name");
		id = request.getParameter("id");
		pwd = request.getParameter("password");
		nname = request.getParameter("nickname");
		email = request.getParameter("email");
		phone = request.getParameter("phone");
		school = request.getParameter("school");
		major = request.getParameter("major");
		
		if(stu_number=="") { stu_number= list.getStu_number(); }
		if(stu_name=="") { stu_name= list.getStu_name(); }
		if(id=="") { id= list.getId(); }
		if(pwd=="") { pwd= list.getPw(); }
		if(nname=="") { nname= list.getNickname(); }
		if(email=="") { email= list.getEmail(); }
		if(phone=="") { phone= list.getPhone(); }
		if(school=="") { school= list.getSchool(); }
		if(major=="") { major= list.getMajor(); }
		
		int result = 0;
		result = studentDao.Update(stu_number, stu_name, id, pwd, nname, email, phone, school, major);
		
		Student list2 = studentDao.SelectByID(userid);
		model.addAttribute("student", list2);
		

		if(result == 0) {
			System.out.println("update 잘 안됨");
	    }
		else {
			System.out.println("update 잘 됨");
	    }
	    session.setAttribute("userid",id);
	    userid = (String)session.getAttribute("userid");
	    list = studentDao.SelectByID(userid);
	    model.addAttribute("student", list);
	    return "profile";
	}
	
	// logout을 하게 되면 session에서 id를 없앰.
	@RequestMapping(value="/logout")
	public String logout(Model model, HttpSession session) {
		session.invalidate();
		
		return "login";
	}
}
