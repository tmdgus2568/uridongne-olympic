<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭 리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#matching_list tr").click(function(){
		
		var tr = $(this);
		var td = tr.children();
		var td_arr = new Array();
		
		// td_arr에 한 행의 컬럼값들을 저장 
		td.each(function(i){
			td_arr.push(td.eq(i).text());
		});
		
		/* console.log(td_arr[0]); */
		if(td_arr[0] != "id"){
			location.href='detail?mat_id='+td_arr[0];
		}
		
	});
	
	 $("#search").submit(function() {
		 console.log("here");
		 console.log($("select[name=option]").val());
		if($("select[name=option]").val() == "none"){
			alert("옵션을 반드시 선택해 주세요.");
			return false;
		}
	 }); 
	
	
});
</script>
<style>
table{
	text-align: center;
}
</style>
</head>
<body>
<h1>매칭 리스트</h1>
<form method="get" id="search">
	<div>
		<select name="sports">
			<option value="none">종목 선택</option>
			<c:forEach var="item" items="${sportsNameList}" varStatus="list">
				<c:choose>
					<c:when test="${param.sports eq item}">
						<option value="${item}" selected>${item}</option>	
					</c:when>
					<c:otherwise>
						<option value="${item}">${item}</option>
					</c:otherwise>
				</c:choose>	
			</c:forEach>
		</select>
		<select name="option">
			<c:choose>
				<c:when test="${param.option eq 'none'}">
					<option value="none" selected>검색</option>	
				</c:when>
				<c:otherwise>
					<option value="none">검색</option>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${param.option eq 'content'}">
					<option value="content" selected>내용</option>	
				</c:when>
				<c:otherwise>
					<option value="content">내용</option>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${param.option eq 'title'}">
					<option value="title" selected>제목</option>	
				</c:when>
				<c:otherwise>
					<option value="title">제목</option>
				</c:otherwise>
			</c:choose>
		</select>
		
		<input type="text" name="filter" value="${param.filter}">
		<button type="submit">검색하기</button>
	</div>
<br>
</form>
<table border="1" id="matching_list">
	<tr>
		<td hidden=true>id</td>
		<td>순서</td>
		<td>방이름</td>
		<td>인원</td>
		<td>종목</td>
		<td>지역명</td>
		<td>경기날짜</td>
	</tr>
 	<c:forEach var="item" items="${createJoinList}" varStatus="list">
   		<tr align="center">
   			<td hidden=true>${item.mat_id}</td>
        	<td>${list.count}</td>
         	<td>${item.mat_title}</td>
         	<td>${item.nowjoin_people}/${item.mat_people}</td>
         	<td>${item.sports_name}</td>
         	<td></td>
         	<td>${item.play_date}</td>
        </tr>
 	</c:forEach>

</table>
</body>
</html>