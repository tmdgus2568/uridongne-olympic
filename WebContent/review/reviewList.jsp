<%-- <%@page import="review.model.ReviewDAO"%> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
<meta charset="UTF-8">
<title>리뷰목록</title>
</head>
<body>
	<p align="center"><a href="">최신순</a>/<a href="">평점순</a></p>
	<table align="center" border="1" width="80%">
		<tr height="10" align="center">
			<td>작성자</td>
			<td>경기장</td>
			<td>경기일</td>			
			<td>후기</td>
			<td>평점</td>
		</tr>
		<c:choose>
			<c:when test="${empty reviewList}">
				<tr height="10">
					<td colspan="5">
						<p align="center">
							<b><span style="font-size: 9pt;">후기를 기다리고 있어요.</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:when test="${!empty reviewList}">
				<c:forEach var="review" items="${reviewList }">
					<tr align="center">
						<td>${review.user_id}</td>
						<td>${review.stadium_name}</td>
						<td>${review.play_date }</td>						
						<td>${review.review_content }</td>
						<td>${review.review_star }</td>						 
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<a href="reviewForm.jsp"><p class="cls1">후기 남기기</p></a>
</body>
</html>

