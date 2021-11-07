<%@page import="member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
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

.box2 {
	display: center;
	flex-direction: column; /* 세로 정렬 */
	float: none;
}

table {
	width: 100%;
	max-width: 1000px;
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

.table-secondary th {
	width: 300px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="main-container" style="display: table; height: 500px">
		<div class="box1">
			<ul class="nav nav-pills flex-column"  style="font-family: NanumSquareRound;">
				<li class="nav-item"><a class="nav-link" href="mypage">마이페이지</a></li>
				<li class="nav-item"><a class="nav-link" href="reserveinfo">경기장예약</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
					href="#" role="button" aria-haspopup="true" aria-expanded="false">매칭</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="matchingcreateinfo">매칭개설</a> <a
							class="dropdown-item" href="matchingapplyinfo">매칭참여</a>
					</div></li>
				<li class="nav-item"><a class="nav-link active" href="reviewinfo">리뷰</a></li>
			</ul>
		</div>

			<table class="table table-hover" id="review_list">
				<thead>
					<tr style="text-align: left;">
											<th colspan="4" height="80px;" style="padding-bottom: 14px;"><div
							style="color: gray; font: bold 2.0em/1.0em NanumSquareRound;" align="left">⛹️리뷰</div></th>
				</tr>
				</thead>
				<tr class="table-secondary" style="font-family: NanumSquareRound;">
					<th>경기장</th>
					<th>경기일</th>
					<th>후기</th>
					<th>평점</th>
				</tr>
				<c:choose>
					<c:when test="${empty reviewList}">
						<tr class="table-secondary" height="10" style="font-family: NanumSquareRound;">
							<td colspan="5" style="background-color: white">
							<p align="center" >
									<span style="font-style: italic; font-size: 12pt;">작성한
											후기가 없습니다.</span>
								</p>
							</td>
						</tr>
					</c:when>
					<c:when test="${!empty reviewList}">
						<c:forEach var="review" items="${reviewList }">
							<tr align="center" style="font-family: NanumSquareRound;">
								<td>${review.stadium_name}</td>
								<td>${review.play_date }</td>
								<td>${review.review_content }</td>
								<td>${review.review_star }</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</table>
		</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>