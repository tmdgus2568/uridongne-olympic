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
		<table class="table">
			<thead>
				<th scope="col">������ȣ</th>
				<th scope="col">������</th>
				<th scope="col">�̿���</th>
				<th scope="col">���밡���ο�</th>
				<th scope="col">���������</th>
				<th scope="col">����</th>
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