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
<%@ include file="../header.jsp"%>
	<div class="content" text-align="center">
		
		<table border="1" class="table_style" align="center" id="stadiumList">
			<tr class="table_title">
				<td>작성자</td>
				<td>경기장</td>
				<td>후기</td>
				<td>평점</td>
			</tr>
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
						<tr align="center" class="table_content">
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
