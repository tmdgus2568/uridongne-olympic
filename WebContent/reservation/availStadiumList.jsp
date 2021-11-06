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
<style>

div.times{
  	overflow: auto;
  	white-space: nowrap;
}

.details {
	font-size: 12px;
	color: gray;
	border: 1px solid lightgray;
	border-radius: 5px;
	margin-right: 5px;
	padding: 3px 5px;
}

#count{
	margin: 30px;
	font-size: 12px;
	color: gray;
}

</style>
</head>
<body>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
<%--     <div id="count">
    	<p >${"총"}${fn:length(availStadiumList)}${"건 검색"}</p>
	</div> --%>
	
	<fieldset>
	  <br>
	  <hr class="mx-4">
	  <c:forEach items="${availStadiumList}" var="stadium" varStatus="status">
		<input type="hidden" id="stadium_id" name="stadium_id" value="${stadium.stadium_id}">
		<input type="hidden" id="stadium_name" name="stadium_name" value="${stadium.stadium_name}">
		<div id="stadiumList" class=" mx-4">
				  
		  <!-- 종목명/상세정보 -->
		  <!-- <br> -->
		  <div class="form-group">
		  	
  		    <h5>🔆 ${stadium.stadium_name}</h5>
		  </div>
 	  	  <div class="d-flex my-3">
			<div class="details">최대인원${" "}${stadium.stadium_number}${"명"}</div>
			<div class="details">${stadium.payment_method}</div>
			<button class="details" onclick="window.open('${path}/stadium/stadiumDetail?id=${stadium.stadium_id}')">상세보기</button>
		  </div>
<%-- 		  <div class="form-group d-flex">
		    <span class="badge rounded-pill bg-secondary mx-3">최대인원${" "}${stadium.stadium_number}${"명"}</span>
            <span class="badge rounded-pill bg-secondary mx-3">${stadium.payment_method}</span>
            <span class="badge rounded-pill bg-dark mx-3" onclick="window.open('${path}/stadium/stadiumDetail?id=${stadium.stadium_id}')">상세보기</span>
		  </div> --%>
	
	      <fmt:parseNumber value="${fn:substring(stadium.stadium_start,0,2)}" var="starttime"/>
		  <fmt:parseNumber value="${fn:substring(stadium.stadium_end,0,2)}" var="endtime"/>
	
		  <!-- 예약가능시간대 -->
		  <div class="form-group times d-flex">
		  	<!-- 예약유무 확인 로직 -->
		    <c:forEach begin="${starttime}" end="${endtime}" var="time" step="2">
			  <c:set var="cnt2" value="0" />
			  <c:forEach items="${stadium.reservedList}" var="reserved">
				<c:set var="cnt" value="0" />
				<c:forEach begin="${reserved.stime}" end="${reserved.etime}" var="t">
				  <!-- map -->
				  <c:if test="${t == time}">
					<c:set var="cnt" value="1" />
				  </c:if>
				</c:forEach>
				<c:set var="cnt2" value="${cnt2 + cnt}" />
			  </c:forEach>
			  <!-- 예약가능/불가 표기 -->
 			  <c:if test="${cnt2 > 0}">
				<div class="form-group btn btn-dark disabled my-2"> <!-- 예약불가 -->
				  <label class="form-check-label">
				  	<input type="radio"  class="btn-check" id="disavail" name="disavail" value="${time}:00" disabled>
				  	${time}:00 ~ ${time + 2}:00
				  </label>
				</div>
				<div class="m-1"></div>
			  </c:if>
			  <c:if test="${cnt2 == 0}">
				<div class="form-group btn btn-secondary my-2" aria-label="Basic radio toggle button"> <!-- 예약가능btn-outline-warning -->
				  <label class="form-check-label">
				    <input type="radio" class="form-check-input" id="avail" name="avail" onchange="call(this)" value="${time}:00~${time + 2}:00 (2시간)">
					${time}:00 ~ ${time + 2}:00 <!--  -->
				  </label>
				</div>
				<div class="m-1"></div>
			  </c:if>
			</c:forEach>
		  </div>
		  <!-- <br> -->
		  <hr>
		</div>
	  </c:forEach>
	</fieldset>
<script>

	 function call2(obj){
		 
		var result = document.getElementById("count").value;
		
		
			
		alert(result);
			  
	}
</script>
</body>
</html>