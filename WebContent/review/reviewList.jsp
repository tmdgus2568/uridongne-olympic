<%@page import="review.model.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
.cls1 {
	text-align: center;
	font-size: 30px;
}
</style>
<meta charset="EUC-KR">
<title>������</title>
</head>
<body>
	<table align="center" border="1" width="80%">
		<tr height="10" align="center">
			<td>�ۼ���</td>
			<td>�ı�</td>
			<td>����</td>
			<td>�ۼ���</td>
		</tr>
		<c:choose>
			<c:when test="${empty reviewList}">
				<tr height="10">
					<td colspan="4">
						<p align="center">
							<b><span style="font-size: 9pt;">�ı⸦ ��ٸ��� �־��.</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:when test="${!empty reviewList}">
				<c:forEach var="review" items="${reviewList }">
					<tr align="center">
						<td>${review.user_id}</td>
						<td>${review.review_content }</td>
						<td>${review.review_star }</td>
						<td>${review.review_date }</td>						
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<a href="${contextPath}/reviewForm.jsp">
	<p class="cls1">�ı� �����</p></a>
</body>
</html>

