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
	<!-- 지역선택> -->
		<div >
		<select class="btn btn-secondary btn-lm dropdown-toggle" aria-label="Default select example"  id="region" name="region" size="1" style="color:black; text-align: left;">
			<option selected>🚕 지역 선택${"("}${fn:length(regionList)}${")"} </option>
			<c:forEach items="${regionList}" var="region">
				<option >${region}</option>
			</c:forEach>
		  </select>
	    </div>
</body>
</html>