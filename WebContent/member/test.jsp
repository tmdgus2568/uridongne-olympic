<%@page import="member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
function Logout(){ sessionStorage.clear(); }

</script>
</head>
<body>

<button id="button" onclick="Logout();">버튼1</button>


</body>
</html>