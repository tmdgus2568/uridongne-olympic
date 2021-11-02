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
		<h3>����� ���</h3>
		<table>
			<tr>
				<th>������</th>
				<th>�̿���</th>
				<th>���밡���ο�</th>
				<th>���������</th>
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