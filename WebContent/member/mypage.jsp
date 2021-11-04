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
ul {
	list-style-type: none;
	padding: 0px;
	margin: 0px;
	width: 100px;
	background: white;
	height: 100%;
	overflow: auto;
	position: fixed;
}

li a {
	text-decoration: none;
	padding: 10px;
	display: block;
	color: #000;
	font-weight: bold;
}

li a:hover {
	background: #333;
	color: #fff;
}

li a.home {
	background: #333;
	color: #fff;
}

.cd1 {
	margin-left: 120px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
	$(function() {
		$('#user_state').val("${member.getUser_state() }").prop("selected",
				true);
	});

	$(function() {

		var strData = "${member.getUser_interest() }";
		var arrInterest = strData.split(", ");

		console.log(arrInterest[0]);

		$('.user_interest').prop('checked', false); // 일단 모두 uncheck

		for ( var nArrCnt in arrInterest) {

			$("input[name=user_interest][value=" + arrInterest[nArrCnt] + "]")
					.prop("checked", true);

		}

	});
</script>
</head>
<body>



	<div id="main" style="margin-top: 10px;">
		<div id="left_main"
			style="height: 300px; width: 100px; margin-right: 10px; float: left;">

			<ul>
				<li><a class="home" href="#">마이페이지</a></li>
				<li><a href="#">경기장예약</a></li>
				<li><a href="#">매칭</a></li>
				<li><a href="#">리뷰</a></li>
			</ul>
		</div>

		<div id="right_main" style="height: 300px; width: 490px; float: left;">

	<h2> 마이페이지 </h2>

			<table border="1">
				<tr>
					<td>아이디</td>
					<td>${member.user_id}</td>
				</tr>
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
</body>
</html>