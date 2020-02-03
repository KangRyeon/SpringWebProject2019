<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			.modal-login{
			width:350px;
			border-radius: 5%;
			background:rgba(255,255,255,0.5);
			margin-top: 100px;
			}
			.modal-login .modal-content {
				padding: 20px;
				border-radius: 1px;
				border: none
			}
			.modal-login .modal-header {
				border-bottom: none;
		        position: relative;
				justify-content: center;
			}
			.modal-login h4 {
				text-align: center;
				font-size: 26px;
			}
		    .modal-login .form-group {
		        margin-bottom: 20px;
		    }
			.modal-login .form-control, .modal-login .btn {
				min-height: 40px;
				border-radius: 30px; 
		        font-size: 15px;
		        transition: all 0.5s;
			}
		    .modal-login .form-control {
		        font-size: 20px;
		    }
		    .modal-login .form-control:focus {
		        border-color: #a177ff;
		    }
			.modal-login .hint-text {
				text-align: center;
				padding-top: 10px;
			}
			.modal-login .btn {
				background: transparent;
				border: none;
				line-height: normal;
				font-weight: bold;
			}
			.modal-login .btn:hover, .modal-login .btn:focus {
				background: #21aab9;
			}
			
		</style>
		<script src="./jquery-3.2.1.js"></script>
	</head>
	<body>
		<center>
			<div class = "logo">
				<img src="/resources/logo.png" style = "width:332px; height:164px;">	
			</div>
			<div class="container">
				<div id="myModal" class="modal fade">
					<div class="modal-dialog modal-login">
						<div class="modal-content">
							<div class="modal-header">			
								<h4 class="modal-title">Login</h4>
							</div>
							<div class="modal-body">
								<form class="log-in" action="/loginCheck" method="post">
									<div class="form-group">
										<input name="id" type="text" class="form-control" placeholder="ID" required="required">
									</div>
									<div class="form-group">
										<input name="pwd" type="password" class="form-control" placeholder="Password" required="required">
									</div>
									<div class="form-group">
										<input type="submit" class="btn btn-primary btn-block btn-lg" value="login">
									</div>
								</form>	
								<p class="message small"><a href="Register">Register</a></p>
							</div>
						</div>
					</div>
				</div> 
			</div>
		</center>
	</body>
</html>