<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="dto.Student"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<style>
			body {
				background: url("background.jpg") no-repeat;
				background-poistion: center;
				background-size: cover;
				font-family: 'Varela Round', sans-serif;
				font-size: 100%;
			}
			
			.profile {
				width: 400px;
				background: #fff;
				padding: 25px;
				margin-bottom: 30px;
				margin: auto;
			}
			
			.modal-header .modal-title {
				text-align: center;
			}
			
			.profile-form .form-group {
				overflow: hidden;
			}
			
			.profile-form .form-control {
				background-color: rgba(0, 0, 0, 0);
				background-position: center bottom, center calc(99%);
				background-repeat: no-repeat;
				background-size: 0 2px, 100% 1px;
				padding: 10px;
				margin-bottom: 10px;
				transition: background 0s ease-out 0s;
				width: 400px;
			}
			
			.profile-form .form-control, .profile-form .form-control.focus,
				.profile-form .form-control:focus {
				background-image: linear-gradient(#707cd2, #707cd2),
					linear-gradient(rgba(120, 130, 140, .60), rgba(120, 130, 140, .13));
				border: 0;
				border-radius: 0;
				box-shadow: none;
				float: none;
			}
			
			.profile-form .form-control.focus, .profile-form .form-control:focus {
				background-size: 100% 2px, 100% 1px;
				outline: 0;
				transition-duration: .3s;
			}
			
			.form-group .profile_b .btn {
				float: right;
				background: whitesmoke;
				line-height: normal;
				min-height: 40px;
				border: none;
				border-radius: 30px;
				font-size: 15px;
				transition: all 0.5s;
			}
			
			.form-group .profile_b .btn:hover, .btn:focus {
				background: #ffcc00;
			}
		</style>
	</head>
	<body>
		<%
			Student student = (Student) request.getAttribute("student");
		%>
		<jsp:include page="menu.jsp" flush="false" />
		<div class="modal-header">
			<h1 class="modal-title">My page</h1>
		</div>
		<div class="profile">
			<form class="form-horizontal profile-form" action="/profileCheck" method="post">
				<div class="form-group">
					<label class="item">Name</label>
					<div class="item">
						<input name="name" class="form-control form-control-line"
							type="text" placeholder="<%=student.getStu_name()%>">
					</div>
				</div>
				<div class="form-group">
					<label class="item">ID</label>
					<div class="item">
						<input name="id" class="form-control form-control-line" type="text"
							placeholder="<%=student.getId()%>">
					</div>
				</div>
				<div class="form-group">
					<label class="item">Student Number</label>
					<div class="item">
						<input name="stu_number" class="form-control form-control-line"
							type="text" placeholder="<%=student.getStu_number()%>" readonly>
					</div>
				</div>
				<div class="form-group">
					<label class="item">Password</label>
					<div class="item">
						<input name="password" class="form-control form-control-line"
							type="password" placeholder="<%=student.getPw()%>">
					</div>
				</div>
				<div class="form-group">
					<label class="item" for="example-email">Email</label>
					<div class="item">
						<input name="email" class="form-control form-control-line"
							type="email" placeholder="<%=student.getEmail()%>">
					</div>
				</div>
				<div class="form-group">
					<label class="item">NickName</label>
					<div class="item">
						<input name="nickname" class="form-control form-control-line"
							type="text" placeholder="<%=student.getNickname()%>">
					</div>
				</div>
				<div class="form-group">
					<label class="item">Phone</label>
					<div class="item">
						<input name="phone" class="form-control form-control-line"
							type="text" placeholder="<%=student.getPhone()%>">
					</div>
				</div>
				<div class="form-group">
					<label class="item">School</label>
					<div class="item">
						<input name="school" class="form-control form-control-line"
							type="text" placeholder="<%=student.getSchool()%>">
					</div>
				</div>
				<div class="form-group">
					<label class="item">Major</label>
					<div class="item">
						<input name="major" class="form-control form-control-line"
							type="text" placeholder="<%=student.getMajor()%>">
					</div>
				</div>
				<div class="form-group">
					<div class="profile_b">
						<input type="submit" class="btn btn-success" value="Update Profile">
					</div>
				</div>
			</form>
		</div>
	</body>
</html>