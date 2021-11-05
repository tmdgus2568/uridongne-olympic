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
					<li><a href="reserveinfo">경기장예약</a></li>
					<li class="dropdown">
						<div class="dropdown-menu">
							<a>매칭</a>
						</div>
						<div class="dropdown-content">
							<a href="matchingcreateinfo">매칭생성</a> <a href="matchingapplyinfo">매칭참여</a>
						</div>
					<li><a class="home" href="reviewinfo">리뷰</a></li>
				</ul>
			</div>

			<div id="right_main"
				style="height: 300px; width: 490px; float: left;">
				<h2>리뷰 정보</h2>
				<table border="1" class="table_style" align="center"
					id="review_list">
					<tr class="table_title">
						<td>예약번호</td>
						<td>경기장 이름</td>
						<td>경기장 종류</td>
						<td>경기장 이용일</td>
						<td>경기장 이용시간</td>
						<td>경기장 이용 요금</td>
						<td>예약현황</td>
						<td>매칭여부</td>
						<td>취소</td>
					</tr>
					<c:choose>
						<c:when test="${empty resList}">
							<tr height="10">
								<td colspan="5">
									<p align="center">
										<b><span style="font-style: italic; font-size: 12pt;">예약
												내역이 없습니다.</span></b>
									</p>
								</td>
							</tr>
						</c:when>
						<c:when test="${!empty resList}">
							<c:forEach var="res" items="${resList }">
								<tr align="center" class="table_content">
									<td>${res.res_number}</td>
									<td>${res.stadium_name}</td>
									<td>${res.sports_name}</td>
									<td>${res.play_date}</td>
									<td>${res.play_start}-${res.play_end}</td>
									<td>${res.stadium_price }</td>
									<td>${res.res_status }</td>
									<td>${res.matching}</td>
									<td><button>취소</button></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>