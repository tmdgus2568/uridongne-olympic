<%@page import="member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>경기장 예약 정보</title>
<style type="text/css">
@font-face {
	font-family: 'NanumSquareRound';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff')
		format('woff');
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
	font: NanumSquareRound;
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
	<div class="main-container" style="display: table; height: 1000px">
		<div class="box1">
			<ul class="nav nav-pills flex-column"
				style="font-family: NanumSquareRound;">
				<li class="nav-item"><a class="nav-link" href="mypage">마이페이지</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="reserveinfo">경기장예약</a></li>
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
			<table class="table table-hover" id="reserve_list">
				<thead>
					<tr>
						<th colspan="8" height="80px;" style="padding-bottom: 14px;"><div
								style="color: gray; font: bold 2.0em/1.0em NanumSquareRound;"
								align="left">🤺경기장 예약 정보</div></th>
					</tr>
				</thead>
				<tr class="table-secondary" style="font-family: NanumSquareRound;">
					<th>예약번호</th>
					<th class="stadium_name">경기장</th>
					<th>종류</th>
					<th>이용일</th>
					<th>이용시간</th>
					<th>이용 요금</th>
					<th>예약현황</th>
					<th>취소</th>
				</tr>
				<c:choose>
					<c:when test="${empty resList}">
						<tr class="table-secondary" height="10"
							style="font-family: NanumSquareRound;">
							<td colspan="8" style="background-color: white">
								<p align="center">
									<span style="font-style: italic; font-size: 12pt;">예약
										내역이 없습니다.</span>
								</p>
							</td>
						</tr>
					</c:when>
					<c:when test="${!empty resList}">
						<c:forEach var="res" items="${resList }">
							<tr align="center" style="font-family: NanumSquareRound;">
								<td>${res.res_number}</td>
								<td>${res.stadium_name}</td>
								<td>${res.sports_name}</td>
								<td>${res.play_date}</td>
								<td>${res.play_start}-${res.play_end}</td>
								<td>${res.stadium_price }</td>
								<td>${res.res_status }</td>
								<td><button type="button" class="btn btn-primary"
										id="reservecancel" name="reservecancel"
										onclick="reservecancel('${res.res_number}', '${res.play_date}')">예약취소</button></td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</table>
		</div>
	<%@ include file="../footer.jsp"%>

	<script>
		function reservecancel(res_number, play_date) {
			console.log(res_number);
			console.log(play_date)
			if (!confirm("정말 취소하시겠습니까?")) {
				return false;
			} else {
				$
						.ajax({
							url : '${pageContext.request.contextPath}/member/reservecancel?res_number='
									+ res_number + "&play_date=" + play_date,
							type : 'get',
							success : function(data) {
								console.log("1 = 삭제가능 / 0 = 삭제불가 : " + data);
								if (data == 0) {
									alert("예약 취소 기한이 지났습니다.")
								} else {
									alert("예약이 취소되었습니다.")
									location.href="reserveinfo";
								}
							},
							error : function() {
								console.log("실패");
							}
						});
			}
		};
	</script>
</body>
</html>