<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 경기장 리스트 나오는 부분 -->

	<div class="content" text-align="center" id="here">
		<div style="color: gray; font: bold 2.0em/1.0em Verdana;">🧾경기장 목록</div><br>
		
		<table border="1" class="table table-hover" align="center">
		  <thead>
			<tr align="center"  class="table-secondary">
				<th scope="col">경기장번호</th>
				<th scope="col">경기장명</th>
				<th scope="col">이용요금</th>
				<th scope="col">수용가능인원</th>
				<th scope="col">경기장종류</th>
				<th scope="col">지역</th>
			</tr>
			 </thead>
  	<tbody>
			<c:forEach var="stadium" items="${stadiumList}">
			<tr align="center" >
					<td>${stadium.stadium_id}</td>
					<td><a href="stadiumDetail?id=${stadium.stadium_id}">${stadium.stadium_name}</a></td>
					<td>${stadium.payment_method}</td>
					<td>${stadium.stadium_number}</td>
					<td>${stadium.sports_name}</td>
				 	<td>${stadium.location}</td>
				</tr>
			</c:forEach>

			</thead>
		</table>
		<button type="button" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="top" title="Tooltip on top">Top</button>
		
	</div>
</body>
</html>