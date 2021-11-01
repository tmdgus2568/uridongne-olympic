<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<!-- <span>지역선택</span> -->
	<select name="region">
		<option selected>지역${"("}${fn:length(regionList)}${")"} </option> <!-- 지역의 갯수는 어떻게 check해서 넣지? -->
		<c:forEach items="${regionList}" var="region">
			<option >${region}</option>
		</c:forEach>
	</select>
</body>
</html>