<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
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
	<h3>경기장 정보검색</h3>
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
	<!--  type="button" class="btn btn-secondary btn-sm" disabled-->

	<br>
	<br>
	<br>
	<div id="here">
		<h3>경기장 목록</h3>
		<table class="table">
			<thead>
				<th scope="col">경기장번호</th>
				<th scope="col">경기장명</th>
				<th scope="col">이용요금</th>
				<th scope="col">수용가능인원</th>
				<th scope="col">경기장종류</th>
				<th scope="col">지역</th>
				</tr>
			<tbody>
				<c:forEach var="stadium" items="${stadiumList}">
					<tr>
						<td><a href="stadiumDetail?id=${stadium.stadium_id}">${stadium.stadium_id}</a></td>
						<td>${stadium.stadium_name}</td>
						<td>${stadium.payment_method}</td>
						<td>${stadium.stadium_number}</td>
						<td>${stadium.sports_name}</td>
						<td>${stadium.location}</td>
					</tr>
				</c:forEach>

			</tbody>
			</thead>
		</table>
	</div>

</body>
</html>