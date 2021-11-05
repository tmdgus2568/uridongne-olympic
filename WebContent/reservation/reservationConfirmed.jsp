<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기장 예약완료</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="content">
		<div>
			<h4>${user_id}님!</h4>
			<h3>${confirmedCnt}건 예약 완료되었습니다.</h3>
		</div>
		<div class="d-flex">
			<button type="button" onClick="location.href='../member/reserveinfo.jsp'">예약정보확인</button>
			<button type="button" onClick="location.href='../member/reserveinfo.jsp'">메인페이지</button>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
	
</body>
</html>