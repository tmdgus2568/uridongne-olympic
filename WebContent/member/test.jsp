<%@page import="member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
	session = request.getSession();
	
	MemberVO member = (MemberVO)session.getAttribute("member");
	out.println(member.getUser_name() + "님 환영합니다 <br/>");
	%>


</body>
</html>