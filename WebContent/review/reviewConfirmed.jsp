<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리뷰 등록 완료</title>
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

			<div id="message">
				<h3>리뷰 작성이 완료되었습니다!</h3>
			</div>
			<br><br><br>
			<div class="d-flex justify-content-center">
				<button type="button" class="btn btn-primary m-1" onClick="location.href='../member/reserveinfo.jsp'">리뷰 확인하러 가기</button>
				<button type="button" class="btn btn-secondary m-1" onClick="location.href='../member/reserveinfo.jsp'">Home</button>
			</div>
		</div>
	</section>

	<jsp:include page="../footer.jsp"></jsp:include> 
</body>
</html>