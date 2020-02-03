<%@ page language="java" contentType="text/html;charset=euc-kr"%>

<html>
	<head>
		<title>Menu page</title>
		<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
		<link rel="stylesheet" href="/resources/css/site.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="/resources/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
		<style type="text/css">
			body {
				padding-bottom: 30px;
				color: #566787;
				background-image: url("/resources/water.jpg");
				background-repeat: no-repeat;
				background-size:cover;
				font-family: 'Roboto', sans-serif;
			}
			
			table.calendar {
				margin-bottom: 0;
				height: 500px;
			}
			
			table.calendar>thead>tr>th {
				text-align: center;
				height: 5px;
			}
			
			table.calendar>tbody>tr>td {
				height: 10px;
			}
			
			table.calendar>tbody>tr>td>div { //
				padding: 8px;
				height: 10px;
				overflow: hidden;
				display: inline-block;
				vertical-align: middle;
				float: left;
			}
			
			table.calendar>tbody>tr>td.has-events {
				color: white;
				cursor: pointer;
				padding: 0;
			}
			
			table.calendar>tbody>tr>td.has-events>div {
				background-color: rgb(31, 164, 181);
				border-left: 1px solid white;
				border-radius: 10px;
			}
			
			table.calendar>tbody>tr>td.has-events>div:first-child {
				border-left: 0;
				margin-left: 1px;
			}
			
			table.calendar>tbody>tr>td.has-events>div.practice {
				background-color: red;
				opacity: 0.7;
			}
			
			table.calendar>tbody>tr>td.conflicts>div>span.title {
				color: red;
			}
			
			
			table.calendar>tbody>tr>td.has-events>div>span {
				display: block;
				text-align: center;
			}
			
			table.calendar>tbody>tr>td.has-events>div>span a {
				color: white;
			}
			
			table.calendar>tbody>tr>td.has-events>div>span.title {
				font-weight: bold;
			}
			
			table.table-borderless>thead>tr>th, table.table-borderless>tbody>tr>td {
				border: 0;
			}
			
			.table tbody tr.hover td, .table tbody tr.hover th {
				background-color: whiteSmoke;
			}
			
			div {
				border-radius: 10px;
			}

			
			
			<!-- 프로필 -->
			.profile {
				width: 200px;
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
			
			.well {
			    background: none;
			    height: 320px;
			}
			
			.table-scroll {
			    position: absolute;
			    overflow-y: scroll;
			    height: 550px;
			    width: 400px;
			}
			
			.table-scroll tr {
			    width: 100%;
			    table-layout: fixed;
			    display: inline-table;
			}
			
			.table-wrapper {
				width: 850px;
				background: #fff;
				padding: 20px 30px 5px;
				margin: 20px auto;
				box-shadow: 0 0 1px 0 rgba(0, 0, 0, .25);
				border-radius: 10px;
			}
			
			.table-title .btn-group {
				float: right;
				margin: 0px;
			}
			
			.table-title .btn {
				min-width: 50px;
				border: none;
				padding: 6px 12px;
				font-size: 95%;
				outline: none !important;
				height: 30px;
			}
			
			.table-title {
				border-bottom: 1px solid #e9e9e9;
				padding-bottom: 15px;
				margin-bottom: 5px;
				background: rgb(31, 164, 181);
				margin: -20px -31px 10px;
				padding: 15px 30px;
				color: #fff;
				
				border-radius: 10px 10px 0 0;
			}
			
			.table-title h2 {
				margin: 2px 0 0;
				font-size: 24px;
			}
			
			table.table tr th, table.table tr td {
				border-color: #e9e9e9;
				padding: 12px 15px;
				vertical-align: middle;
			}
			
			table.table tr th:first-child {
				width: 40px;
				
			}
			
			table.table tr th:last-child {
				width: 100px;
			}
			
			table.table-striped tbody tr:nth-of-type(odd) {
				background-color: #fcfcfc;
			}
			
			table.table-striped.table-hover tbody tr:hover {
				background: #f5f5f5;
			}
			
			table.table td a {
				color: #2196f3;
			}
			
			table.table td .btn.manage {
				padding: 2px 10px;
				background: #37BC9B;
				color: #fff;
				border-radius: 2px;
			}
			
			table.table td .btn.manage:hover {
				background: #2e9c81;
			}
			.pagination {
				float: right;
				margin: 0 0 5px;
			}
			
			.pagination li a {
				border: none;
				font-size: 13px;
				min-width: 30px;
				min-height: 30px;
				color: #999;
				margin: 0 2px;
				line-height: 30px;
				border-radius: 2px !important;
				text-align: center;
				padding: 0 6px;
			}
			.pagination input {
				border: none;
				font-size: 13px;
				min-width: 30px;
				min-height: 30px;
				color: #999;
				background: none;
				margin: 0 2px;
				line-height: 30px;
				border-radius: 2px !important;
				text-align: center;
				padding: 0 6px;
			}
			.pagination li a:hover {
				color: #666;
			}
			.pagination li input:hover {
				color: #666;
				background: #EEEEEE;
			}
			.pagination li.active a, .pagination li.active a.page-link {
				background: #03A9F4;
			}
			.pagination li.active input, .pagination li.active input.page-link {
				background: #03A9F4;
				color: white;
			}
			.pagination li.active a:hover {
				background: #0397d6;
			}
			.pagination li.active input:hover {
				background: #0397d6;
			}
			.pagination li.disabled{
				color: #ccc;
				
			}
			.pagination li.disabled i {
				color: #ccc;
			
			}
			.pagination li.disabled input {
				color: #ccc;
				background: none;
			}
			.pagination li i {
				font-size: 16px;
				padding-top: 6px
			}
		</style>
	</head>
	<body>
		<nav class="navbar navbar-default">
			<div class="container">
			
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<div style="padding:5 20 0 0">
						<a href="#">
							<img src="/resources/logo.png" height="35"/>
						</a>
					</div>
				</div>
				
				<div class="navbar-collapse collapse row">
					<div class="col-md-1"  style="width:500px;">
						<form action="/selectMenu" method="post">
							<ul class="nav navbar-nav"">
								<li class="active"><input type="submit" name="menu" value="Home" class="btn btn-default" style="border:0; height:50px; "></li>
								<li><input type="submit" name="menu" value="Note" class="btn btn-default" style="border:0; height:50px; "></li>
								<li><input type="submit" name="menu" value="Assignment" class="btn btn-default" style="border:0; height:50px;"></li>
								<li><input type="submit" name="menu" value="Mypage" class="btn btn-default" style="border:0; height:50px;"></li>
							</ul>
						</form>
					</div>
					<div class="col-md-1 row"  style="width:100px; padding:0 0 0 0;">
						<h4 style="width:100px;"> ${userid} </h4>
					</div>
					<div class="col-md-1 row"  style="width:200px; height:50px; padding:8px 0 0 0;">
						<form action="/logout" method="post">
		               		<input class="btn btn-default" type="submit" value="로그아웃하기">
		               	</form>
					</div>
				</div>
				
			</div>
		</nav>
	</body>
</html>