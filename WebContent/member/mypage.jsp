<%@page import="member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style type="text/css">

@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.nav>li>a:hover {
	background: #ff7f50;
	color: #fff;
}

.box1 {
	width: 130px;
	height: 100px;
	float: left;
}

table {
	width: 100%;
	max-width: 400px;
	margin: auto;
	display: block;
	overflow-x: auto;
	border-spacing: 0;
	text-align: center;
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
}

.table-secondary {
	text-align: center;
}

.table-secondary td {
	width: 300px;
}
</style>

<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>

	<%@ include file="../header.jsp"%>
	<div class="content" style="display: table;">
		<div class="box1">
			<ul class="nav nav-pills flex-column"  style="font-family: NanumSquareRound;">
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
		<table class="table table-hover" id="mypage">
			<thead>
				<tr>
					<th colspan="2" height="80px;" style="padding-bottom: 14px;"><div
							style="color: gray; font: bold 2.0em/1.0em NanumSquareRound;" align="left">😀회원
							정보</div></th>
				</tr>
			</thead>
			<c:choose>
				<c:when test="${member.login_platform == '일반'}">
					<tr class="table-secondary">
						<th>아이디</th>
						<td style="background-color: white">${member.user_id}</td>
					</tr>

				</c:when>
			</c:choose>
			<tr class="table-secondary" style="font-family: NanumSquareRound;">
				<th>이름</th>
				<td style="background-color: white">${member.getUser_name() }</td>
			</tr>
			<tr class="table-secondary" style="font-family: NanumSquareRound;">
				<th>생년월일</th>
				<td style="background-color: white">${member.getUser_birth() }</td>
			</tr>
			<tr class="table-secondary" style="font-family: NanumSquareRound;">
				<th>이메일</th>
				<td style="background-color: white">${member.getUser_email() }</td>
			</tr>
			<tr class="table-secondary" style="font-family: NanumSquareRound;">
				<th>전화번호</th>
				<td style="background-color: white">${member.getUser_phone() }</td>
			</tr>
			<tr class="table-secondary" style="font-family: NanumSquareRound;">
				<th>도시</th>
				<td style="background-color: white">${member.user_city }</td>
			</tr>
			<tr class="table-secondary" style="font-family: NanumSquareRound;">
				<th>구</th>
				<td style="background-color: white">${member.user_state }</td>
			</tr>
			<tr class="table-secondary" style="font-family: NanumSquareRound;">
				<th>관심 종목</th>
				<td style="background-color: white">${member.getUser_interest() }</td>
			</tr>
			<tfoot>
			<tr>
				<th colspan="2" style="border-bottom: none; text-align: right; padding-top: 14px; font-family: NanumSquareRound;"><button type="button" class="btn btn-primary" onclick="location.href='update'">회원정보 수정</button></th>
			</tr>
			</tfoot>
		</table>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>