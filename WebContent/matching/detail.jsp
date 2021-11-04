<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭 상세정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">

<style>
	
	/* 테이블 전체 */
	.table_style{
		border-collapse:collapse;
		line-height:1.5;
		margin:20px 10px;
		width:100%;
		text-align:center;

	}
	td{
		padding:10px;
	}
	
	.td_title{
		background:black;
		color:white;
		font-weight:bold;
	}
	
	/* #title{
		width:
	} */
	
	button{
		background:black;
		color:white;
		float:right;
		width:120px;
		height:50px;
		border-radius:15px;
		font-size:15px;
		font-weight:bold;
	
	}
	
	#stadium_map{
		
		width:400px;
		height:400px;
		background:grey;
		float:left;
		margin-right:50px;
	}
	
	#join_btn{
		clear:both; /* float 속성 해제 */
		margin-bottom:150px;
	}
	
	

</style>
</head>
<body>
<%@ include file="../header.jsp" %>

<%-- <h1>${param.res_number}</h1> --%>
<div class="content">
	<h2>매칭 상세정보</h2>
	<table class="table_style" border="1">
		<tr>
			<td class="td_title">방이름</td>
			<td colspan="5">${createJoin.mat_title}</td>
		</tr>
		<tr>
			<td class="td_title">경기날짜</td>
			<td>${createJoin.play_start}~${createJoin.play_end}</td>
			<td class="td_title">인원 수</td>
			<td>${createJoin.nowjoin_people}/${createJoin.mat_people}</td>
			<td class="td_title">1인당 예상가격</td>
			<td>약 <fmt:parseNumber value="${createJoin.stadium_price/createJoin.mat_people}" integerOnly="true"/>원</td>
		</tr>
		<tr>
			<td colspan="6" style="text-align:left;">${createJoin.mat_content}</td>
		</tr>
	
	</table>

	<%-- <div>내용: ${createJoin.mat_content}</div> --%>

</div>
<div class="content" id="stadium_info" text-align="center">
	<h2>경기장 정보</h2>
	<div id="stadium_map"></div>
	<div id="stadium_deatil_info">
		<h1>${createJoin.stadium_name}</h1>
		<%-- ${createJoin.stadium_address} --%>
		서울특별시 어쩌구 저쩌구 ㅇㄹㄹㅁㄴㄹ
		
		
	</div>

</div>


<div class="content" id="join_btn">
	<button onClick="apply(${createJoin.mat_id})">참가하기</button>
</div>
<%@ include file="../footer.jsp" %>
<script>
function apply(mat_id){
	location.href = "apply?mat_id="+mat_id;
};
</script>

</body>
</html>