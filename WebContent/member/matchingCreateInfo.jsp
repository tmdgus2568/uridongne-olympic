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
		<div id="left_main"
			style="height: 300px; width: 100px; margin-right: 10px; float: left;">
			<ul>
				<li><a href="mypage">마이페이지</a></li>
				<li><a href="reserveinfo">경기장예약</a></li>
				<li class="dropdown">
					<div class="dropdown-menu">
						<a class="home">매칭</a>
					</div>
					<div class="dropdown-content">
						<a class="home" href="matchingcreateinfo">매칭생성</a> <a
							href="matchingapplyinfo">매칭참여</a>
					</div>
				<li><a href="reviewinfo">리뷰</a></li>
			</ul>
		</div>
		<h2>매칭 개설 정보</h2>
		<table border="1" class="table_style" align="center"
			id="matching_list">
			<tr class="table_title">
				<td hidden=true>id</td>
				<td>순서</td>
				<td>방이름</td>
				<td>인원</td>
				<td>종목</td>
				<td>지역명</td>
				<td>경기날짜</td>
				<td>경기현황</td>
				<td>취소하기</td>
			</tr>
			<c:forEach var="item" items="${matList}" varStatus="list">
				<tr align="center" class="table_content">
					<td hidden=true>${item.mat_id}</td>
					<td>${list.count}</td>
					<td>${item.mat_title}</td>
					<td>${item.nowjoin_people}/${item.mat_people}</td>
					<td>${item.sports_name}</td>
					<td>${item.location}</td>
					<td>${item.play_date}</td>
					<td>${item.mat_status}</td>
					<td><button>매칭취소</button></td>
				</tr>
			</c:forEach>

		</table>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>