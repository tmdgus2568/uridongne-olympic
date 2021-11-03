<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭 생성 폼</title>
<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">

</head>
<body>
<%@ include file="../header.jsp" %>
<div class="content">
	<h1>매칭 생성 폼</h1>
	<form method="post">
		제목: <input type="text" name="title">
		<br>
		내용: <textarea rows="50" cols="50" name="content"></textarea>
		<br>
		총 인원 수: <input type="number" name="people">
		<br>
		인당 예상 가격: 
		<div>
			<input type="button" value="취소하기">
			<input type="submit" value="생성하기">
		</div>
	</form>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>