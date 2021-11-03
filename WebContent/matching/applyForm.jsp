<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참가 폼</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<h1>참가 폼</h1>
<div>
	<div>방이름: ${createJoin.mat_title}</div>
	<div>내용: ${createJoin.mat_content}</div>
	<div>경기날짜: ${createJoin.play_date} 
	${createJoin.play_start}~${createJoin.play_end}</div>
	<div>인원수: ${createJoin.nowjoin_people}/${createJoin.mat_people}</div>
	<div>1인당 예상가격: 약 ${createJoin.stadium_price/createJoin.mat_people}원</div>
	
</div>
<form action="apply" method="post">
	<div>
		<div>인원선택: <input type="number" name="together" value="1" min="1"></div>
		<div hidden="true">mat_id: <input type="text" name="mat_id" value=${create.mat_id}></div> 
		<%-- <div>${create.mat_id}</div> --%>
	</div>
	<button type="submit">완료</button>
</form>

</body>
</html>