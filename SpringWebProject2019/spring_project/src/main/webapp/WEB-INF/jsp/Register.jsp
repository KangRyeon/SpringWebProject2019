<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<style type="text/css">
			body {
			padding-bottom: 30px;
			color: #566787;
			background-image: url("/resources/water.jpg");
			background-repeat: repeat;
			background-size:cover;
			font-family: 'Roboto', sans-serif;
			}
			.logo{
			margin-top: 30px;
			}
			.modal-register{
			width:350px;
			border-radius: 5%;
			background:rgba(255,255,255,0.5);
			margin-top: 100px;
			}
			.modal-register .modal-content {
				padding: 20px;
				border-radius: 1px;
				border: none
			}
			.modal-register .modal-header {
				border-bottom: none;
		        position: relative;
				justify-content: center;
			}
			.modal-register h4 {
				text-align: center;
				font-size: 26px;
			}
			.modal-register .item{
			margin-bottom: none;
			font-size: 15px;
			}
		    .modal-register .form-group {
		        margin-bottom: 20px;
		    }
			.modal-register .form-control, .modal-register .btn {
				min-height: 40px;
				border-radius: 30px; 
		        font-size: 15px;
		        transition: all 0.5s;
			}
		    .modal-register .form-control {
		        font-size: 20px;
		        width:300px;
		    }
		    .modal-register .form-control:focus {
		        border-color: #a177ff;
		    }
			.modal-register .btn {
				background: transparent;
				border: none;
				line-height: normal;
				font-weight:bold;
			}
			.modal-register .btn:hover, .modal-register .btn:focus {
				background: #21aab9;
			}
		</style>
	</head>
	<body>
		<center>
			<div class = "logo">
				<img src="/resources/logo.png" style = "width:332px; height:164px;">	
			</div>
			<div class="container">
				<div id="myModal" class="modal fade">
					<div class="modal-dialog modal-register">
						<div class="modal-content">
							<div class="modal-header">			
								<h4 class="modal-title">Register</h4>
							</div>
							<div class="modal-body">
								<form class="register" action="/RegisterCheck" method="post">
									<div class="form-group">
										<div class="item" style align="left">
											<p>*Name</p>
										</div>
										<input name="name" type="text" class="form-control" required="required">
									</div>
									
									<div class="form-group">
										<div class="item" style align="left">
											<p>*ID</p>
										</div>
										<input name="id" type="text" class="form-control" required="required">
									</div>
									
									<div class="form-group">
										<div class="item" style align="left">
											<p>*Password</p>
										</div>
										<input name="password" type="password" class="form-control" required="required">
									</div>
									
									<div class="form-group">
										<div class="item" style align="left">
											<p>*Student Number</p>
										</div>
										<input name="stu_number" type="text" class="form-control" required="required">
									</div>
									
									<div class="form-group">
										<div class="item" style align="left">
											<p>Nickname</p>
										</div>
										<input name="nickname" type="text" class="form-control">
									</div>
									
									<div class="form-group">
										<div class="item" style align="left">
											<p>E-Mail</p>
										</div>
										<input name="email" type="text" class="form-control">
									</div>
									
									<div class="form-group">
										<div class="item" style align="left">
											<p>Phone</p>
										</div>
										<input name="phone" type="text" class="form-control">
									</div>
									
									<div class="form-group">
										<div class="item" style align="left">
											<p>School</p>
										</div>
										<input name="school" type="text" class="form-control">
									</div>
									
									<div class="form-group">
										<div class="item" style align="left">
											<p>Major</p>
										</div>
										<input name="major" type="text" class="form-control">
									</div>
									
									<div class="form-group">
										<input type="submit" class="btn btn-primary btn-block btn-lg" value="Register!" onclick="href='login2.html'">
									</div>
								</form>	
							</div>
						</div>
					</div>
				</div> 
			</div>
		</center>
	</body>
</html>