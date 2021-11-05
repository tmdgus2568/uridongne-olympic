<%@page import="member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#left_main ul {
	list-style-type: none;
	padding: 0px;
	margin: 0px;
	width: 100px;
	background: white;
	height: 100%;
	overflow: auto;
	position: fixed;
}

#left_main li a {
	text-decoration: none;
	padding: 10px;
	display: block;
	color: #000;
	font-weight: bold;
}

#left_main li a:hover {
	background: #333;
	color: #fff;
}

#left_main li a.home {
	background: #333;
	color: #fff;
}

.cd1 {
	margin-left: 120px;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #f1f1f1
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>

	<%@ include file="../header.jsp"%>
	<div class="content">
		<div id="main" style="margin-top: 10px;">
			<div id="left_main"
				style="height: 300px; width: 100px; margin-right: 10px; float: left;">

				<ul>
					<li><a href="mypage">마이페이지</a></li>
					<li><a  class="home" href="reserveinfo">경기장예약</a></li>
					<li class="dropdown">
						<div class="dropdown-menu">
							<a>매칭</a>
						</div>
						<div class="dropdown-content">
							<a href="matchingcreateinfo">매칭생성</a> <a href="matchingapplyinfo">매칭참여</a>
						</div>


						<li><a href="reviewinfo">리뷰</a></li>
				</ul>
			</div>
		<div id="right_main"
							style="height: 300px; width: 490px; float: left;">
							${member.user_id}</div>
	
					</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>