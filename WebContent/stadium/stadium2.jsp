<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
		<table>
			<tr>
				<th>경기장명</th>
				<th>이용요금</th>
				<th>수용가능인원</th>
				<th>경기장종류</th>
			</tr>
			<tbody>
				<c:forEach var="stadium" items="${stadiumList }">
					<tr>
						<td><a href="detail?id=${stadium.stadium_name }">${stadium.stadium_name }</a></td>
						<td>${stadium.payment_method }</td>
						<td>${stadium.stadium_number}</td>
						<td>${stadium.sports_name}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
</body>
</html>