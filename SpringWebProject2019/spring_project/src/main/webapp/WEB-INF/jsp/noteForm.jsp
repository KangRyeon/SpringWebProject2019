<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.*" %>
<%@ page import="java.util.function.Function"%>
<html>
	<head>
		<title>Note Form Page</title>
		<style type="text/css">
			<!-- menu.jsp로 이동 -->
		</style>
	</head>
	<body>
		<jsp:include page="menu.jsp" flush="false" />
		<center style="padding: 20 0 0 0">
			<h1>
				Note</br> </br>
			</h1>
		</center>
	
		<%
			List<Lecture> lectures = (List<Lecture>)request.getAttribute("lectures");
		
			Set<String> lecture_set = new HashSet<String>();
			for (int i=0; i<lectures.size(); i++){
				lecture_set.add(lectures.get(i).getDept_name()); 
			}
			
			String lecture_array[] = lecture_set.toArray(new String[0]);
		%>
		<div class="container" style="background:white; border-radius:10px; width:600px;">
			<center><h1>ADD Note</h1></center>
			<form action="/addNote" method="post">
				<div class="form-group">
					<label for="dept_name">과목명</label> 
					<select class="form-control" name="dept_name">
						<% 
							for(int i=0; i<lecture_array.length; i++) {
								out.println("<option>"+lecture_array[i]+"</option>");
							}
						%>
					</select>
				</div>
				<div class="form-group">
					<label for="title">제목</label>
					<input type="text" name="title" class="form-control" placeholder="제목">
				</div>
				<div class="form-group">
					<label for="note_date">날짜</label> 
					<input type="text" name="note_date" class="form-control" placeholder="2019-03-14">
				</div>
				<div class="form-group">
					<label for="note_content">내용</label>
					<textarea class="form-control" name="note_content" rows="5"></textarea>
				</div>
				
	
				<button type="submit" class="btn btn-info">Add Note</button>
			</form>
		</div>
	</body>
</html>