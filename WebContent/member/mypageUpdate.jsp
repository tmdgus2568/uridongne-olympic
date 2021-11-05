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
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
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
	<%@ include file="../header.jsp"%>
	<div class="content">
			<div id="left_main"
				style="height: 300px; width: 100px; margin-right: 10px; float: left;">

				<ul>
					<li><a class="home" href="mypage">마이페이지</a></li>
					<li><a href="reserveinfo">경기장예약</a></li>
					<li class="dropdown">
						<div class="dropdown-menu"><a>매칭</a></div>
						<div class="dropdown-content">
							<a href="matchingcreateinfo">매칭생성</a>
							<a href="matchingapplyinfo">매칭참여</a>
						</div>
					<li><a href="reviewinfo">리뷰</a></li>
				</ul>
			</div>
	<form action="memberupdate" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td>${member.getUser_id() }</td>
				<td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="user_name" name="user_name"
					value="${member.getUser_name() }"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" id="user_birth" name="user_birth"
					value="${member.getUser_birth() }"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" id="user_email" name="user_email"
					value="${member.getUser_email() }"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" id="user_phone" name="user_phone"
					value="${member.getUser_phone() }"></td>
			</tr>
			<tr>
				<td>도시</td>
				<td><input type="text" id="user_city" name="user_city"
					value="서울특별시" readonly="readonly"></td>
			</tr>
			<tr>
				<td>구</td>
				<td><select id="user_state" name="user_state">
						<option value="강남구">강남구</option>
						<option value="강동구">강동구</option>
						<option value="강북구">강북구</option>
						<option value="강서구">강서구</option>
						<option value="관악구">관악구</option>
						<option value="관악구">관악구</option>
						<option value="구로구">구로구</option>
						<option value="금천구">금천구</option>
						<option value="노원구">노원구</option>
						<option value="도봉구">도봉구</option>
						<option value="동대문구">동대문구</option>
						<option value="동작구">동작구</option>
						<option value="마포구">마포구</option>
						<option value="서대문구">서대문구</option>
						<option value="서초구">서초구</option>
						<option value="성동구">성동구</option>
						<option value="성북구">성북구</option>
						<option value="송파구">송파구</option>
						<option value="양천구">양천구</option>
						<option value="영등포구">영등포구</option>
						<option value="용산구">용산구</option>
						<option value="은평구">은평구</option>
						<option value="종로구">종로구</option>
						<option value="중구">중구</option>
						<option value="중랑구">중랑구</option>
				</select></td>
			</tr>
			<tr>
				<td>관심 종목</td>
				<td><input type="checkbox" name="user_interest" id="농구"
					value="농구">농구 <input type="checkbox" name="user_interest"
					value="배구">배구 <input type="checkbox" name="user_interest"
					value="배드민턴">배드민턴 <input type="checkbox"
					name="user_interest" value="야구">야구 <br> <input
					type="checkbox" name="user_interest" value="족구">족구 <input
					type="checkbox" name="user_interest" value="축구">축구 <input
					type="checkbox" name="user_interest" value="탁구">탁구 <input
					type="checkbox" name="user_interest" value="테니스">테니스 <input
					type="checkbox" name="user_interest" value="풋살">풋살</td>
			</tr>
		</table>
		<input type="hidden" id="user_id" name="user_id"
			value="${member.user_id }"> 
			<input type="submit" value="수정하기">
	</form>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>