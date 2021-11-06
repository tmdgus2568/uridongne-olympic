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
	grid-template-columns: 150px 830px;
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
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>

	<%@ include file="../header.jsp"%>
	<div class="main-container">
		<div class="box1">
			<ul class="nav nav-pills flex-column">
				<li class="nav-item"><a class="nav-link" href="mypage">마이페이지</a></li>
				<li class="nav-item"><a class="nav-link" href="reserveinfo">경기장예약</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle active" data-bs-toggle="dropdown"
					href="#" role="button" aria-haspopup="true" aria-expanded="false">매칭</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="matchingcreateinfo">매칭개설</a> <a
							class="dropdown-item" href="matchingapplyinfo">매칭참여</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="reviewinfo">리뷰</a></li>
			</ul>
		</div>

		<div class="box2" style="float: right; text-align: center;">
			<table class="table table-hover" id="matching_list">
				<thead>
					<tr>
						<th>매칭개설정보</th>
					</tr>
				</thead>
				<tr class="table-primary">
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
				<c:choose>
					<c:when test="${empty matList}">
						<tr class="table-secondary" height="10">
							<td colspan="8">
								<p align="center">
									<b><span style="font-style: italic; font-size: 12pt;">생성한
											매칭이 없습니다.</span></b>
								</p>
							</td>
						</tr>
					</c:when>
					<c:when test="${!empty matList}">
						<c:forEach var="item" items="${matList}" varStatus="list">
							<tr align="center" class="table-secondary">
								<td hidden=true>${item.mat_id}</td>
								<td>${list.count}</td>
								<td>${item.mat_title}</td>
								<td>${item.nowjoin_people}/${item.mat_people}</td>
								<td>${item.sports_name}</td>
								<td>${item.location}</td>
								<td>${item.play_date}</td>
								<td>${item.mat_status}</td>
								<td><button type="button" class="btn btn-primary"
										onclick="matchingcancel('${item.mat_id}')">매칭취소</button></td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</table>

			<form action=""></form>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>

	<script>
		function matchingcancel(mat_id) {
			if (!confirm("정말 취소하시겠습니까?")) {
				return false;
			} else {
				console.log(mat_id);
				location.href = "matchingcancel?mat_id=" + +mat_id;
				}
		};
	</script>
</body>
</html>