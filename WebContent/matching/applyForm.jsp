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
<form action="apply" method="post">
	<div>
		<div>인원선택: <input type="number" name="together"></div>
		<div hidden="true">mat_id: <input type="text" name="mat_id" value=${create.mat_id}></div> 
		<%-- <div>${create.mat_id}</div> --%>
	</div>
	<button type="submit">완료</button>
</form>
</body>
</html>