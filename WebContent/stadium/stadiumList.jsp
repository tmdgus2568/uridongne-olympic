<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<link href="../css/tableStyle.css" rel="stylesheet" type="text/css">
<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">


<style>
.cls1 {
	text-align: center;
	font-size: 30px;
}
</style>
<meta charset="UTF-8">
<title>경기장정보</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(function() {
		$("#searchButton").click(
				function() {
					//alert($("#sports").val());
					//alert($("#loc").val());
					$.ajax({
						url : "stadiumSearch",
						// data:{"sports":"'" + $("#sports").val()+"'", "loc":"'"+$("#loc").val()+"'"},
						data : "sports=" + $("#sports").val() + "&loc="
								+ $("#loc").val(),
						success : function(resposedata) {
							$("#here").html(resposedata);
						}
					});
				});
	});
</script>

</head>

<body>
	<%@ include file="../header.jsp"%>
	<div class="content" text-align="center">
		<h2>경기장 정보검색</h2>
		<br>
		<!-- <label for="sports" style="float: center">경기장 종목선택</label> -->
		<label for="sports" style="float: center"></label>
		<!-- <select class="form-select" aria-label="Default select example" id="sports" id="sports" size="1">  -->
		<select class="btn btn-secondary btn-lm dropdown-toggle"
			aria-label="Default select example" id="sports" id="sports" size="1">
			<option value="">경기장 종목선택</option>
			<option value="농구장">농구</option>
			<option value="배구장">배구</option>
			<option value="배드민턴장">배드민턴</option>
			<option value="야구장">야구</option>
			<option value="족구장">족구</option>
			<option value="축구장">축구</option>
			<option value="탁구장">탁구</option>
			<option value="테니스장">테니스</option>
			<option value="풋살장">풋살</option>
		</select>
		<!-- 	<label for="loc" style="float: left">지역선택</label> -->
		<label for="loc" style="float: left"> </label>
		<!--  	<select class="form-select" aria-label="Default select example" id="loc" id="loc" size="1">-->
		<select class="btn btn-secondary btn-lm dropdown-toggle"
			aria-label="Default select example" id="loc" id="loc" size="1">
			<option value="">지역선택</option>
			<option value="강남구">강남구</option>
			<option value="과천시">과천시</option>
			<option value="강동구">강동구</option>
			<option value="동작구">동작구</option>
			<option value="강서구">강서구</option>
			<option value="영등포구">영등포구</option>
			<option value="마포구">마포구</option>
			<option value="성동구">성동구</option>
			<option value="송파구">송파구</option>
			<option value="양천구">양천구</option>
			<option value="구로구">구로구</option>
			<option value="서초구">서초구</option>
			<option value="용산구">용산구</option>
			<option value="고양시">고양시</option>
			<option value="광진구">광진구</option>
		</select>
		<button id="searchButton" type="button"
			class="btn btn-secondary btn-lm">검색하기</button>
</div>

	<div class="content" text-align="center" id="here">
		<h2>경기장 목록</h2>
		<!-- 	<table class="table"> -->
		<table border="1" class="table_style" align="center">
			<tr align="center" class="table_title">
				<td>경기장번호</td>
				<td>경기장명</td>
				<td>이용요금</td>
				<td>수용가능인원</td>
				<td>경기장종류</td>
				<td>지역</td>
			</tr>
			<c:forEach var="stadium" items="${stadiumList}">
				<tr align="center" class="table_content">
					<td><a href="stadiumDetail?id=${stadium.stadium_id}">${stadium.stadium_id}</a></td>
					<td>${stadium.stadium_name}</td>
					<td>${stadium.payment_method}</td>
					<td>${stadium.stadium_number}</td>
					<td>${stadium.sports_name}</td>
					<td>${stadium.location}</td>
				</tr>
			</c:forEach>

			</thead>
		</table>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>