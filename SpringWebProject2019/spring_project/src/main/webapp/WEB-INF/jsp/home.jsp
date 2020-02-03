<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.*"%>
<%@ page import="java.sql.Time" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
	<head>
		<title>Home page</title>
		<link rel="stylesheet" href="/resources/fullcalendar/dist/fullcalendar.min.css">
		<link rel="stylesheet" href="/resources/fullcalendar/dist/fullcalendar.print.min.css" media="print">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
		<!-- <script src="/resources/js/bootstrap.min.js"></script>  -->
		<style type="text/css">
			<!--menu.jsp 로 이동 -->
			table {
				width: 780px;
				height: 700px; 
				margin: 10px 0 0 0;
			}
		</style>
	</head>
	<body>
		<jsp:include page="menu.jsp" flush="false" />
		<center style="padding: 20 0 0 0">
			<h1>
				시간표</br> </br>
			</h1>
		</center>
		<%
			List<Lecture> lectures = (List<Lecture>)request.getAttribute("lectures");
			int list_num = lectures.size();
			
			int lecture_num[] = new int[list_num];
			String lecture_name[] = new String[list_num];
			String lecture_color[] = {"#FFDDDD", "#AAB9FF", "#AAEBAA", "#AAEBAA", "#FDCD8C", "#FF8C8C", "#FF8C8C", "#B4E5FF", "#B4E5FF"};
			String week[] = {"월", "화", "수", "목", "금"};
			String lecture_time[][] = new String[list_num][4];
			SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");  // 09:00:00 -> 09:00 변경
			SimpleDateFormat formatter2 = new SimpleDateFormat("HH");
			for(int i=0; i<list_num; i++) {
				lecture_num[i] = lectures.get(i).getDept_id();
				lecture_name[i] = lectures.get(i).getDept_name();
				for(int j=0; j<5; j++) {
					if(lectures.get(i).getDate().equals(week[j])){  // 요일을 숫자로 변환 월:0, 화:1, 수:2, 목:3, 금:4
						lecture_time[i][0] = Integer.toString(j);
					}
				}
				lecture_time[i][1] = formatter.format(lectures.get(i).getStart_time());
				lecture_time[i][2] = formatter.format(lectures.get(i).getEnd_time());
				
				//시간표에 넣기위한 숫자 계산 -> 3시간짜리 = 6, 1.5시간짜리 = 3
				Time start = lectures.get(i).getStart_time();
				Time end = lectures.get(i).getEnd_time();
				long start_time = Integer.parseInt(formatter2.format(start));
				long end_time = Integer.parseInt(formatter2.format(end));
				//Time time_format = new Time(formatter.parse(""+start).getTime());
				if((end_time - start_time) == 2)
					lecture_time[i][3] = ""+6;
				else
					lecture_time[i][3] = ""+3;
			}
			
		%>
		<%
			String time[] = {"09:00", "09:30", "10:00", "10:30", "11:00", "11:30"
							, "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30"
							, "16:00", "16:30", "17:00", "17:30", "18:00"};
		%>
		<div class="container" style="background: white; width: 810px; height: 630px;">
			<table class="calendar table-bordered" style="height:600px;">
				<thead>
					<tr>
						<th>&nbsp;</th>
						<th width="20%">Monday</th>
						<th width="20%">Tuesday</th>
						<th width="20%">Wednesday</th>
						<th width="20%">Thursday</th>
						<th width="20%">Friday</th>
					</tr>
				</thead>
				<tbody>
					<%
						for(int i=0; i<time.length; i++) {     // time table 개수 (08:00~18:00) 만큼 행<tr> 만들어져야
							out.println("<tr>");
							out.println("<td>"+time[i]+"</td>");
							for(int j=0; j<5; j++) { // 5번 확인(각 요일마다 해당하는 과목이 있는지 확인), 각 요일별로 9시인것은 하나겠죠
								int k=0;
								for(k=0; k<lecture_name.length; k++){
									// 그 과목 시작하는 요일이 해당하는 요일(j)에 해당하는 시간이면
									if(lecture_time[k][0].equals(Integer.toString(j)) && lecture_time[k][1].equals(time[i])){ // 해당하는 과목 시작시간이 9시면 표시해줌.
										System.out.println("그 과목 시작하는 시간 : " + lecture_time[k][1] + ", 그 과목 시작 요일" + lecture_time[k][0]);
										out.println("<td class=\"has-events\" rowspan=\""+lecture_time[k][3]+"\">");
										out.println("<div class=\"row-fluid lecture\" style=\"width: 99%; height: 100%; background:"+lecture_color[k]+" \">");
										out.println("<span class=\"title\" style=\"color:dimgray;\">"+lecture_name[k]+"</span>");
										out.println("<span class=\"lecturer\"><h5 style=\"color:dimgray;\">"+lectures.get(k).getProf_name()+"</h5></span>");
										out.println("<span class=\"lecturer\"><h5 style=\"color:dimgray;\">"+lecture_time[k][1]+"~"+lecture_time[k][2]+"</h5></span>");
										out.println("</div></td>");
										break;
									}
								}
								if(k==lecture_name.length)
									out.println("<td class=\"no-events\"></td>");
							}
							
							out.println("</tr");
							
						}
					%>
				</tbody>
			</table>
		</div>
		
		</br>
		
		<div class="container" style="width: 810px; height: 650px;">
			<div class="row">
				<div class="col-md-1" style="background:white; padding:10px 30px; width:400px; height:620px; margin:0 10px 0 0;">
					<div class="profile table-scroll">
						<h3> 내 수강과목 </h3>
						<% for(int i=0; i<list_num; i++) { %>
						<table style="width:340px; height:120px;">
							<tbody>
								<tr>
									<td> 과목번호 </td>
									<td><%= lectures.get(i).getDept_number() %></td>
								</tr>
								<tr>
									<td> 과목명 </td>
									<td><%= lectures.get(i).getDept_name() %></td>
								</tr>
								<tr>
									<td> 교수명 </td>
									<td><%= lectures.get(i).getProf_name() %></td>
								</tr>
								<tr>
									<td> 요일 </td>
									<td><%= lectures.get(i).getDate() %></td>
								</tr>
								<tr>
									<td> 시작시간 </td>
									<td><%= lectures.get(i).getStart_time() %></td>
								</tr>
								<tr>
									<td> 끝시간 </td>
									<td><%= lectures.get(i).getEnd_time() %></td>
								</tr>
							</tbody>
						</table>
						------------------------------------------------------------</br>
						<%} %>
					</div>
				</div>
				<div class="col-md-1" style="background:white; padding:10px 30px; width:400px; height:620px;">
					<h3> 과목 찾기 </h3>
					<form action="/findLecture" method="pose" style="margin: 0 0 30px 0;">
						<div class="col-md-1" style="width:280px; padding:0">
						<input name="findLecture" type="text" class="form-control" >
						</div>
						<div class="col-md-1">
						<input type="submit" class="btn btn-default" value="입력">
						</div>
					</form>
					<div style="height:450px;">
					<%
						List<Lecture> find_lectures = null;
						find_lectures = (List<Lecture>)request.getAttribute("findLectures");
						if(find_lectures != null){
							out.println("</br>");
							for(int i=0; i<find_lectures.size(); i++) {
					%>
								<table style="width:340px; height:120px;">
									<tbody>
										<tr>
											<td> 과목번호 </td>
											<td><%= find_lectures.get(i).getDept_number() %></td>
										</tr>
										<tr>
											<td> 과목명 </td>
											<td><%= find_lectures.get(i).getDept_name() %></td>
										</tr>
										<tr>
											<td> 교수명 </td>
											<td><%= find_lectures.get(i).getProf_name() %></td>
										</tr>
										<tr>
											<td> 요일 </td>
											<td><%= find_lectures.get(i).getDate() %></td>
										</tr>
										<tr>
											<td> 시작시간 </td>
											<td><%= find_lectures.get(i).getStart_time() %></td>
										</tr>
										<tr>
											<td> 끝시간 </td>
											<td><%= find_lectures.get(i).getEnd_time() %></td>
										</tr>
									</tbody>
								</table>
								-----------------------------------------------------------</br>
						<%	
							}
						%>
							</div>
							<form action="/addLecture" method="pose" style="padding: 0 0 0 120px;">
							<%
								for(int i=0; i<find_lectures.size(); i++) {
							%>
									<input type="hidden" name="dept_id<%= i%>" value="<%=find_lectures.get(i).getDept_id() %>">
							<%
								}
							%>
								<input type="submit" class="btn btn-default" value="과목추가">
							</form>
					<%
						}
					%>
				</div>
	
				
		</div>
	</body>
</html>