<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	
	<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">
	<style>
		.select_style{
			width:80px;
			height:30px;
			border-radius:10px;
			border:1px solid grey;
			text-align:center;
		}
		
		#filter_div{
			margin-top:20px;
		}
		
		input[name=filter]{
			width:30%;
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
	<div style="color: gray; font-weight: bold; font-size: 35px;">🔎매칭 검색</div><br>
	<form method="get" id="search">
		<div>
			<select name="sports" class="btn btn-secondary btn-lm dropdown-toggle">
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
			<select name="option" class="btn btn-secondary btn-lm dropdown-toggle">
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

			<div class="input-group mb-3" id="filter_div">
				<input type="text" name="filter" value="${param.filter}" class="form-control" aria-describedby="button-addon2" style="width: 250px; display:inline">
				<button type="submit" id="search_btn" class="btn btn-primary" >검색하기</button>
			
			</div>
		<!-- 	<lable>경기장</lable> -->
		</div>
	<br>
	</form>
	<br><br>
	
	
	<div style="color: gray; font-weight: bold; font-size: 35px;">🧾매칭 목록</div><br>
	<table border="1" align="center" id="matching_list" class="table table-hover">
		<thead>
			<tr class="table-secondary" align="center">
				<td hidden=true>id</td>
				<th scope="col">순서</th>
				<th scope="col">방이름</th>
				<th scope="col">인원</th>
				<th scope="col">종목</th>
				<th scope="col">지역명</th>
				<th scope="col">경기날짜</th>
			</tr>
		</thead>
		<c:choose>
			<c:when test="${fn:length(createJoinList)==0}">
				<td align="center" colspan="6">매칭 목록이 없습니다</td>
			</c:when>
			<c:otherwise>
			
				<c:forEach var="item" items="${createJoinList}" varStatus="list">
	   				<tr align="center" class="table-default">
	   					<td hidden=true>${item.mat_id}</td>
	        			<th  scope="row">${list.count}</th>
	         			<td>${item.mat_title}</td>
	         			<td>${item.nowjoin_people}/${item.mat_people}</td>
	         			<td>${item.sports_name}</td>
	         			<td>${item.location}</td>
	         			<td>${item.play_date}</td>
	       			 </tr>
	 			</c:forEach>
			</c:otherwise>
		
		</c:choose>

	</table>	

</div>
<%@ include file="../footer.jsp" %>
</body>
</html>