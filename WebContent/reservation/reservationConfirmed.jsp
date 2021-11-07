<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기장 예약완료</title>
<style>
	#message{
		text-align:center;
		margin-top:100px;
	}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<section class="container">
		<div class="justify-content-center">
<!-- 		<div class="bg-secondary m-5"> -->
			<div id="message">
				<h3>🌟🌟 경기장 예약이 완료되었습니다! 🌟🌟</h3>
			</div>
			<br><br><br>
			<div class="d-flex justify-content-center">
				<!-- <button type="button" class="btn btn-primary m-1" onClick="location.href='../member/mypage'">예약정보 확인하러 가기</button> -->
				<button type="button" class="btn btn-primary m-1" onClick="location.href='../member/reserveinfo'">예약정보 확인하러 가기</button>
				<button type="button" class="btn btn-secondary m-1" onClick="location.href='../main/uridongneMain.jsp'">Home</button>
			</div>
		</div>
	</section>
<!-- 	</div> -->
	<jsp:include page="../footer.jsp"></jsp:include> 
	
</body>
</html>