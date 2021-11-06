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
.nav>li>a:hover {
	background: #ff7f50;
	color: #fff;
}

.main-container {
	width: 1080px;
	display: grid;
	grid-template-columns: 150px 930px;
	gap: 10px; /* 구역간의 간격 */
}

.box1 {
	width: 100%;
	height: 100%;
	text-align: left;
	height: 100%;
}

.box2 {
	width: 100%;
	height: 100%;
	display: center;
	flex-direction: column; /* 세로 정렬 */
	background-color: yelow;
}

table {
	width: 100%;
	max-width: 400px;
	display: block;
	overflow-x: auto;
	border-spacing: 0;
	text-align: center;
}

.table-active {
	font-size: 18px;
	text-align: center;
}

.table-active td {
	width: 300px;
	height: 50px;
}

.table-secondary {
	font-size: 18px;
	text-align: center;
}

.table-secondary td {
	width: 300px;
	height: 50px;
}
</style>

<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>

	<%@ include file="../header.jsp"%>
	<div class="main-container">
		<div class="box1">
			<ul class="nav nav-pills flex-column">
				<li class="nav-item"><a class="nav-link active">마이페이지</a></li>
				<li class="nav-item"><a class="nav-link" href="reserveinfo">경기장예약</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">매칭</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="matchingcreateinfo">매칭개설</a> <a
							class="dropdown-item" href="matchingapplyinfo">매칭참여</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="reviewinfo">리뷰</a></li>
			</ul>
		</div>

		<div class="box2" style="float: right;">
			<table class="table table-hover" id="mypage">
				<thead>
					<tr>
						<th>회원정보</th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${member.login_platform == '일반'}">
						<tr class="table-active">
							<th>아이디</th>
							<td>${member.user_id}</td>
						</tr>

					</c:when>
				</c:choose>
				<tr class="table-secondary">
					<th>이름</th>
					<td>${member.getUser_name() }</td>
				</tr>
				<tr class="table-active">
					<th>생년월일</th>
					<td>${member.getUser_birth() }</td>
				</tr>
				<tr class="table-secondary">
					<th>이메일</th>
					<td>${member.getUser_email() }</td>
				</tr>
				<tr class="table-active">
					<th>전화번호</th>
					<td>${member.getUser_phone() }</td>
				</tr>
				<tr class="table-secondary">
					<th>도시</th>
					<td>${member.user_city }</td>
				</tr>
				<tr class="table-active">
					<th>구</th>
					<td>${member.user_state }</td>
				</tr>
				<tr class="table-secondary">
					<th>관심 종목</th>
					<td>${member.getUser_interest() }</td>
				</tr>
			</table>
			<button type="button" class="btn btn-primary" onclick="location.href='update'">회원정보 수정</button>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>