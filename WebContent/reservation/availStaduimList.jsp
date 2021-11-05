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

div.times{
  	overflow: auto;
  	white-space: nowrap;
}

div.time{
	width: 180px;
	height: auto;
	margin-right: 10px;
	padding:10px;
	display: inline-block;
	justify-content: center;
	align-items:center;
	border-radius: 5px;
/* 	overflow:hidden;
	word-wrap:break-word; */
}
.reservedTime {
	background-color: gray;
	text-decoration: line-through;
}

.availableTime {
	background-color: buttonhighlight;
}
</style>
</head>
<body>
	<p style="background-color: red">검색결과: ${"총 "}${fn:length(availStaduimList)}${"건"}</p>
	<hr>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	<c:forEach items="${availStaduimList}" var="stadium" varStatus="status">

		<div id="stadiumList">
			<!-- 종목명/상세정보 -->
			<br>
			<h3>${stadium.stadium_name}</h3>
			<input type="hidden" id="stadium_id" name="stadium_id" value="${stadium.stadium_id}">
			<div class="flex-row">
				<div class="details">최대인원${" "}${stadium.stadium_number}${"명"}</div>
				<div class="details">${stadium.payment_method}</div>
				<button class="details" onclick="window.open('${path}/stadium/stadiumDetail?id=${stadium.stadium_id}')">상세보기</button>
			</div>

			<fmt:parseNumber value="${fn:substring(stadium.stadium_start,0,2)}" var="starttime"/>
			<fmt:parseNumber value="${fn:substring(stadium.stadium_end,0,2)}" var="endtime"/>

			<!-- 예약가능시간대 -->
			<br>
			<div class="times flex-row">
				<c:forEach begin="${starttime}" end="${endtime}" var="time" step="2">
					<c:set var="cnt2" value="0" />
					<c:forEach items="${stadium.reservedList}" var="reserved">
						<c:set var="cnt" value="0" />
						<c:forEach begin="${reserved.stime}" end="${reserved.etime}"
							var="t">
							<!-- map -->
							<c:if test="${t == time}">
								<c:set var="cnt" value="1" />
							</c:if>
						</c:forEach>
						<c:set var="cnt2" value="${cnt2 + cnt}" />
					</c:forEach>
					<!-- 가능/불가 -->
					<c:if test="${cnt2 > 0}">
						<div class="time reservedTime">
							<label><input type="radio" name="disavail"
								value="${time}:00" disabled checked>${time}:00 ~ ${time + 2}:00</label>
						</div>
					</c:if>
					<c:if test="${cnt2 == 0}">
						<div class="time availableTime">
							<label><input type="radio" name="avail" onchange="call(this)"
								value="${time}:00~${time + 2}:00 (2시간)">${time}:00 ~ ${time + 2}:00</label>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<br>
		</div>
		<hr>
	</c:forEach>
</body>
</html>