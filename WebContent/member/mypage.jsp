<%@page import="member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link href="../css/tableStyle.css" rel="stylesheet" type="text/css">
<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">
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
					<li><a class="home" href="mypage">마이페이지</a></li>
					<li><a href="reserveinfo">경기장예약</a></li>
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

				<h2>회원정보</h2>

				<table border="1" class="table_style" align="center"
					id="review_list">
					<c:choose>
						<c:when test="${member.login_platform == '일반'}">
							<tr>
								<td>아이디</td>
								<td>${member.user_id}</td>
							</tr>

						</c:when>
					</c:choose>
					<tr>
						<td>이름</td>
						<td>${member.getUser_name() }</td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td>${member.getUser_birth() }</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>${member.getUser_email() }</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>${member.getUser_phone() }</td>
					</tr>
					<tr>
						<td>도시</td>
						<td>${member.user_city }</td>
					</tr>
					<tr>
						<td>구</td>
						<td>${member.user_state }</td>
					</tr>
					<tr>
						<td>관심 종목</td>
						<td>${member.getUser_interest() }</td>
					</tr>
				</table>

				<br> <a href="mypageUpdate.jsp">수정하기</a> <a>탈퇴하기</a>
			</div>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>