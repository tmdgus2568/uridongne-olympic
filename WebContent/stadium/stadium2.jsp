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
	<div>
			<h3>경기장 목록</h3>
	<!-- 	<table class="table"> -->
	<table border="1" class="table_style" align="center">
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
		</table>
	</div>
</body>
</html>