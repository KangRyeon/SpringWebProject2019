<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.Note"%>
<%@ page import="dto.Lecture"%>
<%@ page import="java.util.function.Function" %>
<html>
	<head>
		<title>Note page</title>
		<style type="text/css">
			<!-- menu.jsp 로 이동 -->
		</style>
	</head>
	<body>
		<jsp:include page="menu.jsp" flush="false" />
		<center style="padding:20 0 0 0">
			<h1>
				Note</br> </br>
			</h1>
		</center>
	
		<%
			System.out.println("=======================페이지 변동===========================");
		
			// dept 카테고리중에 누른거 받아옴 (all, 데이터베이스, 웹프로그래밍, 네트워크) 
			String depts[] = null;
			depts = request.getParameterValues("depts");
	
			if (depts != null) {
				System.out.println("상탱 : " + depts[0]);
			}
			
			// 게시글 page 누른 것 받아옴 (Previous, 0, 1, ..., Next)
			String pages[] = null;
			pages = request.getParameterValues("pages");
			int nowpage = 1;
			
			// 이전의 페이지가 몇번이였는지 받아옴 (0, 1, ...)
			String prepages[] = null;
			prepages = request.getParameterValues("prepage");
			int prepage = 1;
			
			// 이전의 페이지 상태를 받아옴 (all, 데이터베이스, 웹프로그래밍, 네트워크);
			String predepts[] = null;
			predepts = request.getParameterValues("predepts"); 
			if(predepts != null && pages != null){
				depts = predepts; // 게시글의 각 버튼이 눌릴때는 depts가 이전 페이지와 변동이 없어야함.
			}
			
			System.out.println("-------------------------------페이지 변동 처리------------------------");
			
			List<Note> notes = (List<Note>)request.getAttribute("notes");
			int list_num = notes.size();
			
			String dept_name[] = new String[list_num];
			String title[] = new String[list_num];
			Date note_date[] = new Date[list_num];
			String note_content[] = new String[list_num];
			
			
			for(int i=0; i<list_num; i++) {
				dept_name[i] = notes.get(i).getDept_name(); // "데이터베이스", "컴퓨터네트워크", ...
				title[i] = notes.get(i).getTitle();         // "오늘의 DB", "20190422 네트워크", ...
				note_date[i] = notes.get(i).getNote_date(); // 2019-03-07, 2019-04-22
				note_content[i] = notes.get(i).getNote_content(); // "DB는 재미있어", "네트워크는 재미있어"
			}
			
			// 데이터 수 측정(카테고리따른)
			int datanum = 0;
			for (int i = 0; i < dept_name.length; i++)
				if(depts == null || depts[0].equals("all") || dept_name[i].equals(depts[0]))
					datanum += 1;
			
			// page 개수 처리
			int maxnum = 5;
			int pagenum = 1;
				//datanum = 37;		
			if(datanum > maxnum){    // data == 10, 12 -> 10 : i=2, f=0, 11 : i=2, f=2
				int i = 0;
				int f = 0;
				i = datanum/maxnum;
				f = datanum%maxnum;
				if(f > 0){
					pagenum = i+1;
				}
				else
					pagenum = i;     // 10/5 = 2, 12/5 = 2.4	
			}
			System.out.println("처리 후 게시글 보여질 수 : " + maxnum + ", page개수 : " + pagenum + ", 게시글 수 : " + datanum);
	
			// 페이지가 눌려졌을때 처리 : 각 누른 버튼 (Previous, 1, 2, ..., Next) 마다 현재 페이지 계산한 값 nowpage에 저장
			if (pages != null) {
				prepage = Integer.parseInt(prepages[0]); // prepage = 버튼이 눌리기 이전 페이지
				if(pages[0].equals("Previous"))
					nowpage = prepage-1;
				else if(pages[0].equals("Next"))
					nowpage = prepage+1;					
				else
					nowpage = Integer.parseInt(pages[0]);    // nowpage = 버튼이 눌린 페이지
			}
			 
			 
			// 각 page 이름 저장해다가 out.println으로 처리하기 위함.
			String pagename[] = new String[100];
			String pagedepts[] = new String[100]; // "disabled" or "" or "active"
				
			pagename[0] = "Previous";
			pagedepts[0] = "";
				
			// pagenmae, pagedepts 초기화, 어느 페이지 active할건지 정함.
			for(int i=1; i<=pagenum; i++) {
				pagename[i] = Integer.toString(i);
				pagedepts[i] = "";
				if(i == nowpage)
					pagedepts[i] = " active";
			}
			pagename[pagenum+1] = "Next";
			pagedepts[pagenum+1] = "";
				
			// nowpage가 1(가장 첫페이지), pagenum(가장 마지막페이지) 일때 처리
			if(nowpage == 1) {   // nowpage == 1 -> Previous 못누르게, 1번에 눌린표시
				pagedepts[0] = " disabled";
			}
			if(nowpage == pagenum) { // nowpage == pagenum 마지막페이지면 -> Next 못누르게
				pagedepts[pagenum+1] = " disabled";
			}
				
			if(predepts != null){
				System.out.println("이전 페이지 dept : " + predepts[0] + ", 이전 페이지 num : " + prepage);
			}
			if(depts != null)
				System.out.println("현재 페이지 dept : " + depts[0] + ", 현재 페이지 num : " + nowpage);
		%>
		
		<%
			// 자신의 과목에 따라 버튼 생성
			List<Lecture> lectures = (List<Lecture>)request.getAttribute("lectures");
			String my_lectures[] = new String[lectures.size()];
			for(int i=0; i<lectures.size(); i++){
				my_lectures[i] = lectures.get(i).getDept_name();
			}
			
			Set<String> lecture_set = new HashSet<String>();
			for (int i=0; i<lectures.size(); i++){
				lecture_set.add(my_lectures[i]); 
			}
			
			String lecture_array[] = lecture_set.toArray(new String[0]);
			
		%>
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-md-4" style="width:270px;">
						<h2>
							Note <b>List</b>
						</h2>
					</div>
					<div class="col-md-8" style="padding:0;">
						<form action="/note" method="post" class="btn-group" style="width:600px;">
							<input type="submit" name="depts" value="all" class="btn btn-lg btn-info<% if(depts == null || predepts[0].equals("all")) out.println(" active");%> " style="border-radius: 5px 0 0 5px;">
							<% for(int i=0; i<lecture_array.length; i++) {
									if(i == lecture_array.length-1) {
							%>
										<input type="submit" name="depts" value="<%= lecture_array[i] %>" class="btn btn-lg btn-info<% if(depts != null && depts[0].equals(lecture_array[i])) out.println(" active");%> " style="border-radius: 0 5px 5px 0;">
							<%  	}
									else {
							%>
										<input type="submit" name="depts" value="<%= lecture_array[i] %>" class="btn btn-lg btn-info<% if(depts != null && depts[0].equals(lecture_array[i])) out.println(" active");%> ">
							<% 		}
								} 
							%>	
							
							<%
							// 페이지 내에 하나의 hidden input type을 만들어 현재 페이지 정보를 보냄.
							if(depts == null)
								out.println("<input type=\"hidden\" name=\"predepts\" value=\"all\">");
							else
								out.println("<input type=\"hidden\" name=\"predepts\" value=\""+depts[0]+"\">");
							%>
						</form>
					</div>
				</div>
			</div>
	
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>과목명</th>
						<th>제목</th>
						<th>날짜</th>
						<!-- <th>내용</th>  -->
					</tr>
				</thead>
				<tbody>
					<%
						int count = 0;
						for (int i = 0; i < dept_name.length; i++) {  // 0 ~ 끝까지 검색 -> 현재페이지*5 = 5, i*5 = 0,5,10
							if(depts == null || depts[0].equals("all") || dept_name[i].equals(depts[0])) { // depts[0] = 내가누른 all or 데이터베이스, 웹프로그래밍, 네트워크 버튼 중 하나	
								if(maxnum*(nowpage-1) <= i) { // i= 5*(2-1) 보다 클때부터 검색
								out.println("<tr>");
								out.println("<td>" + i + "</td>");
								out.println("<td>" + dept_name[i] + "</td>");
								out.println("<td><a href='note?select="+title[i]+"'>" + title[i] + "</a></td>");
								out.println("<td>" + note_date[i] + "</td>");
								//out.println("<td>" + assg_content[i] + "</td>");
								out.println("<tr>");
								
								if(count == maxnum-1)
									break;
								count++;
								}
							}
						}
	
					%>
				</tbody>
			</table>
			
			<div class="clearfix row">
				<div class="col-md-1" style="width:100px;">
				<form action="/noteForm" method="post">
					<input type="submit" class="btn btn-default" value="노트추가" style="border:0;">
				</form>
				</div>
				<form method="post" >
					<ul class="pagination">
						<% 
							for(int i=0; i<=pagenum+1; i++) {  // 0(previous), 1, 2, 3(next)
								out.println("<li class=\"page-item"+ pagedepts[i] +"\">");
								out.println("<input type=\"submit\" name=\"pages\" value=\""+pagename[i]+"\""+ pagedepts[i] +">");
								out.println("</li>");
							}
							// 페이지 내에 하나의 hidden input type을 만들어 현재 페이지가 몇번인지 정보를 보냄.
							out.println("<input type=\"hidden\" name=\"prepage\" value="+nowpage+">");
							
							// 현재 페이지가 무슨 dept를 가졌는지 정보를 보냄
							if(depts == null)
								out.println("<input type=\"hidden\" name=\"predepts\" value=\"all\">");
							else
								out.println("<input type=\"hidden\" name=\"predepts\" value=\""+depts[0]+"\">");
						%>
					</ul>
				</form>
			</div>
		</div>
	
		<!-- 디테일부분 -->
		<%
			String select = request.getParameter("select");
		
		%>
		<div class="table-wrapper">
			<table class="table table-striped">
				<thead style="background:rgb(31, 164, 181); color:white;">
					<tr>
						<th>#</th>
						<th>과목명</th>
						<th>제목</th>
						<th>날짜</th>
						<!-- <th>내용</th>  -->
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < list_num; i++) {  // 0 ~ 끝까지 검색 -> 현재페이지*5 = 5, i*5 = 0,5,10
							if(title[i].equals(select)) { // 제목에 따라서 디테일 보여줌.	
								out.println("<tr>");
								out.println("<td>" + i + "</td>");
								out.println("<td>" + dept_name[i] + "</td>");
								out.println("<td>"+ title[i] + "</td>");
								out.println("<td>" + note_date[i] + "</td>");
								//out.println("<td>" + assg_content[i] + "</td>");
								out.println("</tr>");
								out.println("<tr>");
								out.println("<td>내용</td>");
								out.println("<td colspan='5'>" + note_content[i] + "</td>");
								out.println("</tr>");
							}
						}
					%>
				</tbody>
			</table>
		</div>
	</body>
</html>