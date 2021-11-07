<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>확인창</title>

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
						<h3>🌟🌟매칭 생성이 완료되었습니다!🌟🌟</h3>
					</c:when>
					<c:when test="${param.message eq 'failed'}">
						<h3>😭매칭 생성에 실패하였습니다😭</h3>
					</c:when>
				</c:choose>	
			</c:when>
			<c:when test="${param.page eq 'apply'}">
				<c:choose>
					<c:when test="${param.message eq 'success'}">
						<h3>🌟🌟매칭 참여가 완료되었습니다!🌟🌟</h3>
					</c:when>
					<c:when test="${param.message eq 'failed'}">
						<h3>😭매칭 참여에 실패하였습니다😭</h3>
					</c:when>
					<c:when test="${param.message eq '101'}">
						<h3>😭이미 참여한 매칭입니다😭</h3>
					</c:when>
					<c:when test="${param.message eq '102'}">
						<h3>😭참여 인원수가 초과되었습니다😭</h3>
					</c:when>
					<c:when test="${param.message eq '103'}">
						<h3>😭해당 매칭에 참여하실 수 없습니다(개설자)😭</h3>
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
							<button type="button" class="btn btn-primary m-1" onClick="location.href='../member/matchingcreateinfo'">확인하러 가기</button>
							<button type="button" class="btn btn-secondary m-1" onClick="location.href='../main/uridongneMain.jsp'">Home</button>
						</div>
				</c:when>
				<c:when test="${param.message eq 'failed'}">
						<div class="d-flex justify-content-center">
							<button type="button" class="btn btn-primary m-1" onClick="location.href='../matching/stadium'">돌아가기</button>
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
							<button type="button" class="btn btn-primary m-1" onClick="location.href='../member/matchingapplyinfo'">확인하러 가기</button>
							<button type="button" class="btn btn-secondary m-1" onClick="location.href='../main/uridongneMain.jsp'">Home</button>
						</div>
					
				</c:when>
				<c:when test="${param.message eq 'failed'}">
						<div class="d-flex justify-content-center">
							<button type="button" class="btn btn-primary m-1" onClick="location.href='../matching/list'">돌아가기</button>
							<button type="button" class="btn btn-secondary m-1" onClick="location.href='../main/uridongneMain.jsp'">Home</button>
						</div>
					
				</c:when>
				<c:when test="${param.message eq '101'}">
						<div class="d-flex justify-content-center">
							<button type="button" class="btn btn-primary m-1" onClick="location.href='../matching/list'">돌아가기</button>
							<button type="button" class="btn btn-secondary m-1" onClick="location.href='../main/uridongneMain.jsp'">Home</button>
						</div>
					
				</c:when>
				<c:when test="${param.message eq '102'}">
						<div class="d-flex justify-content-center">
							<button type="button" class="btn btn-primary m-1" onClick="location.href='../matching/list'">돌아가기</button>
							<button type="button" class="btn btn-secondary m-1" onClick="location.href='../main/uridongneMain.jsp'">Home</button>
						</div>
				</c:when>
				<c:when test="${param.message eq '103'}">
						<div class="d-flex justify-content-center">
							<button type="button" class="btn btn-primary m-1" onClick="location.href='../matching/list'">돌아가기</button>
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