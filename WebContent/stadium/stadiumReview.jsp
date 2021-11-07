<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/tableStyle.css" rel="stylesheet" type="text/css">
<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">

<style>
</style>
<meta charset="UTF-8">
<title>리뷰모아보기</title>

</head>
<body>
<%-- <%@ include file="../header.jsp"%> --%>
<jsp:include page="../header.jsp"></jsp:include>
	<div class="content">
		<div style="color: gray; font: bold 2.0em/1.0em Verdana;">🧾상세 리뷰 목록</div><br>
		<table border="1" class="table table-hover" align="center" id="stadiumList">
			<thead>
   				<tr align="center" class="table-secondary">
					<td>작성자</td>
					<td>경기장</td>
					<td>후기</td>
					<td>평점</td>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${empty stadium}">
					<tr height="10">
						<td colspan="5">
							<p align="center">
								<b><span style="font-style: italic; font-size:15pt;">아직 작성된 후기가 없습니다.</span></b>
							</p>
						</td>
					</tr>
				</c:when>
				<c:when test="${!empty stadium}">
					<c:forEach var="stadium" items="${stadium}">
						<tr align="center">
							<td>${stadium.user_id}</td>
							<td>${stadium.stadium_name}</td>
							<td>${stadium.review_content }</td>
							<td>
								<script>
								  for(let i=1; i<=${stadium.review_star }; i++){
									  document.write("★");
								  }
								</script>
							</td>

						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
</div>
	<%@ include file="../footer.jsp"%>
	</body>
</html>