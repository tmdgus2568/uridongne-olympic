<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 1시간씩 체크박스 여러개 선택시 로직은 나중에,,^^,, -->
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

.timeSection {
	width: 50px;
	height: 30px;
	margin-right: 5px;
	display: inline-block;
	text-align: center;
	border-radius: 5px;
}

.reservedTime {
	width: 100px;
	height: 30px;
	margin-right: 10px;
	display: inline-block;
	text-align: justify;
	border-radius: 5px;
	background-color: gray;
	text-decoration: line-through;
}


.availableTime {
	width: 100px;
	height: 30px;
	margin-right: 10px;
	display: inline-block;
	text-align: justify;
	border-radius: 5px;
	background-color: buttonhighlight;
}
</style>
<script>
	
</script>
</head>
<body>
	<p>검색결과: ${"총 "}${fn:length(availStaduimList)}${"건"}</p>
	<hr>
	<c:forEach items="${availStaduimList}" var="stadium" varStatus="status">

		<div id="stadiumList">
			${status.index}
			${status.count}
			<!-- 종목명/상세정보 -->
			<br>
			<h3 id="stadium_name">${stadium.stadium_name}</h3>
			<div class="flex-row">
				<div class="details">최대인원${" "}${stadium.stadium_number}${"명"}</div>
				<div class="details">${stadium.payment_method}</div>
				<button class="details" onclick="window.open('address')">상세보기</button>
			</div>

			<fmt:parseNumber value="${fn:substring(stadium.stadium_start,0,2)}"
				var="starttime" />
			<fmt:parseNumber value="${fn:substring(stadium.stadium_end,0,2)}"
				var="endtime" />
			<!-- test출력 **삭제** -->
			${stadium.reservedList}
			<!-- 예약가능시간대 -->
			<br>
			<div class="flex-row">
				<c:forEach begin="${starttime}" end="${endtime}" var="time">
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
						<span class="reservedTime">
							<label><input type="checkbox" name="disavail"
								value="${time}:00" disabled checked>${time}:00</label>
						</span>
					</c:if>
					<c:if test="${cnt2 == 0}">
						<span class="availableTime">
							<label><input type="checkbox" name="avail"
								value="${time}:00">${time}:00</label>
						</span>
					</c:if>
				</c:forEach>
			</div>

			<br>
		</div>
		<hr>
	</c:forEach>
</body>
</html>