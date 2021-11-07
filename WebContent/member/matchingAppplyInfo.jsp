<%@page import="member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>매칭 참여 정보</title>
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
	<div class="main-container" style="display: table; height: 500px;">
		<div class="box1">
			<ul class="nav nav-pills flex-column"
				style="font-family: NanumSquareRound;">
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

		<div>
			<table class="table table-hover" id="matching_list">
				<thead>
					<tr style="text-align: left;">
						<th colspan="10" height="80px;" style="padding-bottom: 14px;"><div
								style="color: gray; font: bold 2.0em/1.0em NanumSquareRound;"
								align="left">🤼매칭 참여 정보</div></th>
					</tr>

				</thead>
				<tr class="table-secondary" style="font-family: NanumSquareRound;">
					<th hidden=true>mat_id</th>
					<th hidden=true>user_id</th>
					<th>순서</th>
					<th>방이름</th>
					<th>인원</th>
					<th>종목</th>
					<th>지역명</th>
					<th>경기날짜</th>
					<th>신청인원</th>
					<th>경기현황</th>
					<th>수정</th>
					<th>취소</th>
				</tr>
				<c:choose>
					<c:when test="${empty appList}">
						<tr class="table-secondary" height="10"
							style="font-family: NanumSquareRound;">
							<td colspan="10" style="background-color: white">
								<p align="center">
									<span
										style="font-style: italic; font-size: 12pt; text-align: center;">참여한
										매칭이 없습니다.</span>
								</p>
							</td>
						</tr>
					</c:when>
					<c:when test="${!empty appList}">
						<c:forEach var="item" items="${appList}" varStatus="list">
							<tr align="center" style="font-family: NanumSquareRound;">
								<td hidden=true>${item.mat_id}</td>
								<td hidden=true>${item.user_id}</td>
								<td>${list.count}</td>
								<td>${item.mat_title}</td>
								<td>${item.nowjoin_people}/${item.mat_people}</td>
								<td>${item.sports_name}</td>
								<td>${item.location}</td>
								<td>${item.play_date}</td>
								<td>${item.stadium_price }</td>
								<td>${item.mat_status}</td>
								<td><button type="button" class="btn btn-primary"
										onclick="matchingapplychange('${item.mat_id}', '${item.user_id}', '${item.stadium_price}', '${item.play_date}', '${item.mat_people}', '${item.nowjoin_people}')">신청인원변경</button></td>
								<td><button type="button" class="btn btn-primary"
										onclick="matchingapplycancel('${item.mat_id}', '${item.user_id}', '${item.stadium_price}', '${item.play_date}')">매칭참가취소</button></td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</table>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>

	<script>
		function matchingapplychange(mat_id, user_id, together, play_date,
				mat_people, nowjoin_people) {
			console.log(mat_id);
			console.log(user_id);
			console.log(together);
			console.log(play_date);

			
			var newtogether =  parseInt(prompt("참여 인원을 입력해주세요."));
			console.log(newtogether)
			if ((nowjoin_people - together + newtogether) > mat_people) {
				alert("매칭 가능 인원을 초과했습니다.")
				return false;
			} else {

				$.ajax({
							url : '${pageContext.request.contextPath}/member/matchingapplychange?mat_id='
									+ mat_id
									+ "&user_id="
									+ user_id
									+ "&together="
									+ together
									+ "&play_date="
									+ play_date
									+ "&newtogether="
									+ newtogether,
							type : 'get',
							success : function(data) {
								console.log("1 = 수정가능 / 0 = 수정불가 : " + data);
								if (data == 0) {
									alert("매칭 참가 수정 기한이 지났습니다.")
								} else {
									alert("매칭 인원이 수정되었습니다.")
									location.href = "matchingapplyinfo";
								}
							},
							error : function() {
								console.log("실패");
							}
						});
			}
		};

		function matchingapplycancel(mat_id, user_id, together, play_date) {
			console.log(mat_id);
			console.log(user_id);
			console.log(together);
			console.log(play_date);
			if (!confirm("정말 취소하시겠습니까?")) {
				return false;
			} else {
				$.ajax({
							url : '${pageContext.request.contextPath}/member/matchingapplycancel?mat_id='
									+ mat_id
									+ "&user_id="
									+ user_id
									+ "&together="
									+ together
									+ "&play_date="
									+ play_date,
							type : 'get',
							success : function(data) {
								console.log("1 = 삭제가능 / 0 = 삭제불가 : " + data);
								if (data == 0) {
									alert("매칭 참가 취소 기한이 지났습니다.")
								} else {
									alert("매칭 참가가 취소되었습니다.")
									location.href = "matchingapplyinfo";
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