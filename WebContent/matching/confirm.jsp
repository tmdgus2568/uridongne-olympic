<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>νμΈμ°½</title>

<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">
<style>
	#message{
		text-align:center;
		margin-top:100px;
	}

</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class=".content">
	<div id="message" align="center">
		<c:choose>
			<c:when test="${param.page eq 'create'}">
				<c:choose>
					<c:when test="${param.message eq 'success'}">
						<h3>ππλ§€μΉ­ μμ±μ΄ μλ£λμμ΅λλ€!ππ</h3>
					</c:when>
					<c:when test="${param.message eq 'failed'}">
						<h3>π­λ§€μΉ­ μμ±μ μ€ν¨νμμ΅λλ€π­</h3>
					</c:when>
				</c:choose>	
			</c:when>
			<c:when test="${param.page eq 'apply'}">
				<c:choose>
					<c:when test="${param.message eq 'success'}">
						<h3>ππλ§€μΉ­ μ°Έμ¬κ° μλ£λμμ΅λλ€!ππ</h3>
					</c:when>
					<c:when test="${param.message eq 'failed'}">
						<h3>π­λ§€μΉ­ μ°Έμ¬μ μ€ν¨νμμ΅λλ€π­</h3>
					</c:when>
					<c:when test="${param.message eq '101'}">
						<h3>π­μ΄λ―Έ μ°Έμ¬ν λ§€μΉ­μλλ€π­</h3>
					</c:when>
					<c:when test="${param.message eq '102'}">
						<h3>π­μ°Έμ¬ μΈμμκ° μ΄κ³Όλμμ΅λλ€π­</h3>
					</c:when>
					<c:when test="${param.message eq '103'}">
						<h3>π­ν΄λΉ λ§€μΉ­μ μ°Έμ¬νμ€ μ μμ΅λλ€(κ°μ€μ)π­</h3>
					</c:when>
				</c:choose>	
			</c:when>
		</c:choose>	
	</div>
	<br><br><br>
	<c:choose>
		<c:when test="${param.page eq 'create'}">
			<c:choose>
				<c:when test="${param.message eq 'success'}">
						<div class="d-flex justify-content-center">
							<button type="button" class="btn btn-primary m-1" onClick="location.href='../member/matchingcreateinfo'">νμΈνλ¬ κ°κΈ°</button>
							<button type="button" class="btn btn-secondary m-1" onClick="location.href='../main/uridongneMain.jsp'">Home</button>
						</div>
				</c:when>
				<c:when test="${param.message eq 'failed'}">
						<div class="d-flex justify-content-center">
							<button type="button" class="btn btn-primary m-1" onClick="location.href='../matching/stadium'">λμκ°κΈ°</button>
							<button type="button" class="btn btn-secondary m-1" onClick="location.href='../main/uridongneMain.jsp'">Home</button>
						</div>
				</c:when>
			</c:choose>	
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${param.page eq 'apply'}">
			<c:choose>
				<c:when test="${param.message eq 'success'}">
						<div class="d-flex justify-content-center">
							<button type="button" class="btn btn-primary m-1" onClick="location.href='../member/matchingapplyinfo'">νμΈνλ¬ κ°κΈ°</button>
							<button type="button" class="btn btn-secondary m-1" onClick="location.href='../main/uridongneMain.jsp'">Home</button>
						</div>
					
				</c:when>
				<c:when test="${param.message eq 'failed'}">
						<div class="d-flex justify-content-center">
							<button type="button" class="btn btn-primary m-1" onClick="location.href='../matching/list'">λμκ°κΈ°</button>
							<button type="button" class="btn btn-secondary m-1" onClick="location.href='../main/uridongneMain.jsp'">Home</button>
						</div>
					
				</c:when>
				<c:when test="${param.message eq '101'}">
						<div class="d-flex justify-content-center">
							<button type="button" class="btn btn-primary m-1" onClick="location.href='../matching/list'">λμκ°κΈ°</button>
							<button type="button" class="btn btn-secondary m-1" onClick="location.href='../main/uridongneMain.jsp'">Home</button>
						</div>
					
				</c:when>
				<c:when test="${param.message eq '102'}">
						<div class="d-flex justify-content-center">
							<button type="button" class="btn btn-primary m-1" onClick="location.href='../matching/list'">λμκ°κΈ°</button>
							<button type="button" class="btn btn-secondary m-1" onClick="location.href='../main/uridongneMain.jsp'">Home</button>
						</div>
				</c:when>
				<c:when test="${param.message eq '103'}">
						<div class="d-flex justify-content-center">
							<button type="button" class="btn btn-primary m-1" onClick="location.href='../matching/list'">λμκ°κΈ°</button>
							<button type="button" class="btn btn-secondary m-1" onClick="location.href='../main/uridongneMain.jsp'">Home</button>
						</div>
				</c:when>
			</c:choose>	
		</c:when>
	</c:choose>


</div>
<%@ include file="../footer.jsp" %>
</body>
</html>