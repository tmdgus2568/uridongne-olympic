<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭 상세정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

<h1>매칭 상세정보</h1>
<%-- <h1>${param.res_number}</h1> --%>
<div>
	<div>방이름: ${createJoin.mat_title}</div>
	<div>내용: ${createJoin.mat_content}</div>
	<div>경기날짜: ${createJoin.play_date} 
	${createJoin.play_start}~${createJoin.play_end}</div>
	<div>인원수: ${createJoin.nowjoin_people}/${createJoin.mat_people}</div>
	<div>1인당 예상가격: 약 ${createJoin.stadium_price/createJoin.mat_people}원</div>
	
</div>
<button onClick="apply(${createJoin.mat_id})">참가하기</button>
<!-- <button href a=""></button>
<form action="detail" method="get">
	<button type="submit">신청하기</button>
</form> -->
<script>
function apply(mat_id){
	location.href = "apply?mat_id="+mat_id;
};
</script>
</body>
</html>