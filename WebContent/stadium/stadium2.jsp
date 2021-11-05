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
	
	<div class="content">

		<h3>경기장 목록</h3>
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
</body>
</html>