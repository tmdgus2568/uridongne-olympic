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
.nav>li>a:hover {
	background: #ff7f50;
	color: #fff;
}

.main-container {
	width: 1080px;
	display: grid;
	grid-template-columns: 150px 920px;
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

th, td {
	vertical-align: middle;
}

td {
	width: 400px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">

</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="main-container">
		<div class="box1">
			<ul class="nav nav-pills flex-column">
				<li class="nav-item"><a class="nav-link" href="mypage">마이페이지</a></li>
				<li class="nav-item"><a class="nav-link active" href="reserveinfo">경기장예약</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">매칭</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="matchingcreateinfo">매칭개설</a> <a
							class="dropdown-item" href="matchingapplyinfo">매칭참여</a>
					</div></li>
				<li class="nav-item"><a class="nav-link"
					href="reviewinfo">리뷰</a></li>
			</ul>
		</div>
		<div class="box2" style="float: right; text-align: center;">
			<table class="table table-hover" id="reserve_list">
				<thead>
					<tr style="text-align: left;">
						<th colspan="2">경기장예약정보</th>
					</tr>
				</thead>
				<tr class="table-primary">
					<td>예약번호</td>
					<td class="stadium_name">경기장</td>
					<td>종류</td>
					<td>이용일</td>
					<td>이용시간</td>
					<td>이용 요금</td>
					<td>예약현황</td>
					<td>취소</td>
				</tr>
				<c:choose>
					<c:when test="${empty resList}">
						<tr class="table-secondary" height="10">
							<td colspan="9">
								<p align="center">
									<b><span style="font-style: italic; font-size: 12pt;">예약
											내역이 없습니다.</span></b>
								</p>
							</td>
						</tr>
					</c:when>
					<c:when test="${!empty resList}">
						<c:forEach var="res" items="${resList }">
							<tr align="center" class="table-secondary">
								<td>${res.res_number}</td>
								<td>${res.stadium_name}</td>
								<td>${res.sports_name}</td>
								<td>${res.play_date}</td>
								<td>${res.play_start}-${res.play_end}</td>
								<td>${res.stadium_price }</td>
								<td>${res.res_status }</td>
								<td><button type="button" class="btn btn-primary">예약취소</button></td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</table>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>