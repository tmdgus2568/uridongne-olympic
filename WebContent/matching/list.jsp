<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link href="../css/tableStyle.css" rel="stylesheet" type="text/css">
	<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">
	<style>
		.select_style{
			width:80px;
			height:30px;
			border-radius:10px;
			border:1px solid grey;
			text-align:center;
		}
		
		.search_style{
			margin-left:8px;
			padding-left:8px;
			width:300px;
			height:28px;
			border-radius:10px;
			border:1px solid grey;
			
		}
		button{
			/* background-image:url(../image/search_icon.png);
			background-repeat:no-repeat;
			background-position:0px 0px;
			border:none;
			width:40px;
			height:40px; */
			background:black;
			color:white;
			width:100px;
			height:30px;
			border-radius:10px;
			font-size:14px;
			font-weight:normal;
			
		}
		
	</style>
</head>
<meta charset="UTF-8">
<title>매칭 참여</title>

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

</head>
<body>
<%@ include file="../header.jsp" %>
<div class="content">
	<h2>매칭 참여</h2>
	<form method="get" id="search" align="right">
		<div>
			<select name="sports" class="select_style">
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
			<select name="option" class="select_style">
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
			<lable>경기장</lable>
			<input type="text" name="filter" value="${param.filter}" class="search_style">
			<button type="submit" id="search_btn">검색하기</button>
		</div>
	<br>
	</form>
	<table border="1" class="table_style" align="center" id="matching_list">
		<tr class="table_title">
			<td hidden=true>id</td>
			<td>순서</td>
			<td>방이름</td>
			<td>인원</td>
			<td>종목</td>
			<td>지역명</td>
			<td>경기날짜</td>
		</tr>
	 	<c:forEach var="item" items="${createJoinList}" varStatus="list">
	   		<tr align="center" class="table_content">
	   			<td hidden=true>${item.mat_id}</td>
	        	<td>${list.count}</td>
	         	<td>${item.mat_title}</td>
	         	<td>${item.nowjoin_people}/${item.mat_people}</td>
	         	<td>${item.sports_name}</td>
	         	<td>${item.location}</td>
	         	<td>${item.play_date}</td>
	        </tr>
	 	</c:forEach>

	</table>	

</div>
<%@ include file="../footer.jsp" %>
</body>
</html>