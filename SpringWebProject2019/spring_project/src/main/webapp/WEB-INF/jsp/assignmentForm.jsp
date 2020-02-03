<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.*" %>
<%@ page import="java.util.function.Function"%>
<html>
	<head>
		<title>Assignment Form Page</title>
		<style type="text/css">
			<!-- menu.jsp로 이동 -->
		</style>
	</head>
	<body>
		<jsp:include page="menu.jsp" flush="false" />
		<center style="padding: 20 0 0 0">
			<h1>
				Assignment</br> </br>
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
			<center><h1>ADD Assignment</h1></center>
			<form action="/addAssignment" method="post">
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
					<label for="assg_name">과제명</label>
					<input type="text" name="assg_name" class="form-control" placeholder="과제명">
				</div>
				<div class="form-group">
					<label for="assg_start">출제일</label> 
					<input type="text" name="assg_start" class="form-control" placeholder="2019-03-14">
				</div>
				<div class="form-group">
					<label for="assg_end">마감일</label> 
					<input type="text" name="assg_end" class="form-control" placeholder="2019-03-21">
				</div>
				<div class="form-group">
					<label for="assg_content">내용</label>
					<textarea class="form-control" name="assg_content" rows="5"></textarea>
				</div>
				
	
				<button type="submit" class="btn btn-info">Add Assignment</button>
			</form>
		</div>
	</body>
</html>