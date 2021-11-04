<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>확인창</title>

<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="../header.jsp" %>
<div class=".content" text-align="center">
	<c:choose>
		<c:when test="${param.page eq 'create'}">
			<c:choose>
				<c:when test="${param.message eq 'success'}">
					매칭 생성에 성공하였습니다 !!
				</c:when>
				<c:when test="${param.message eq 'failed'}">
					매칭 생성에 실패하였습니다..
				</c:when>
			</c:choose>	
		</c:when>
		<c:when test="${param.page eq 'apply'}">
			<c:choose>
				<c:when test="${param.message eq 'success'}">
					매칭 참여에 성공하였습니다 !!
				</c:when>
				<c:when test="${param.message eq 'failed'}">
					매칭 참여에 실패하였습니다..
				</c:when>
			</c:choose>	
		</c:when>
	</c:choose>	
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>