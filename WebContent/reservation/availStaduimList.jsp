<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.details {
	font-size: 12px;
	color: gray;
	border: 1px solid lightgray;
	border-radius: 5px;
	margin-right: 5px;
	padding: 3px 5px;
}
</style>
<script>
/* 	$(function() {
		$("#stadiumList").change(function() {
			$.ajax({
				url : "getStadiumByDate",
				data : {
					"datepicker" : $("#datepicker").val(),
					"sports_name" : $("#sports_name").val(),
					"region" : $("#region").val()
				},
				success : function(responseData) {
					$("#timelist").html(responseData);
				}
			});
		});
	});  */
</script>
</head>
<body>
	<p>검색결과: ${"총 "}${fn:length(availStaduimList)}${"건"}</p>
	<hr>
	<!-- 	<div id="stadiumList"> -->
	<c:forEach items="${availStaduimList}" var="stadium">
		<div id="stadiumList">
			<br>
			<h3>${stadium.stadium_name}</h3>
			<div class="flex-row">
				<div class="details">최대인원${" "}${stadium.stadium_number}${"명"}</div>
				<div class="details">${stadium.payment_method}</div>
				<button class="details" onclick="window.open('address')">상세보기</button>
			</div>
			<div id="timelist">${stadium.stadium_end}</div>

 
 			
 
			<%-- 			<fmt:parseNumber value="${stadium.stadium_start} var="starttime"/>
				<div class="times">${starttime}</div> --%>
			<%-- 			<c:forEach begin="${stadium.stadium_start}" end="${stadium.stadium_end}" var="time">
					<div class="flex-row">
						<div class="times">${time}</div>
					</div> 
					items="${fn:split(stadium.stadium_end,':')}" var="end"
								${end} <br>
				</c:forEach> --%>
			<br>
		</div>
		<div></div>
		<hr>
	</c:forEach>
	<%-- 
		<c:forEach items="${fn:split(stadium.stadium_start,':')}" var="start">
			<c:out value="${start}"/>
		</c:forEach> --%>
	<!-- 	</div> -->
</body>
</html>