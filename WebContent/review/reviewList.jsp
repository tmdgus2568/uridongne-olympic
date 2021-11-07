<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!--<link href="../css/tableStyle.css" rel="stylesheet" type="text/css"> 
<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">
<link href="../css/modal.css" rel="stylesheet" type="text/css"> -->
<style>
div .input {
	display: inline;
}
</style>
<meta charset="UTF-8">
<title>리뷰</title>
</head>

<body>
	<%-- <%@ include file="../header.jsp"%> --%>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="content">
		<div style="color: gray; font-weight: bold; font-size: 35px;">🔎리뷰 검색</div><br>
		
		<form method="get" id="search">
			<div>
				<select name="option" class="btn btn-secondary btn-lm dropdown-toggle">
					<option value="none">검색</option>
					<option value="user_id">작성자</option>
					<option value="stadium_name">경기장</option>
				</select>
				</div>
				<br>
				<div class="input-group mb-3" id="filter_div">
        			<input type="text" name="search" value="${param.search }" class="form-control" aria-describedby="button-addon2" style="width: 250px; display:inline">
        			<button type="submit" id="search_btn" class="btn btn-primary">검색하기</button>
     			
				</div>
			
			<br>
		</form>

	<div class="content" text-align="center" id="here">
	<div style="color: gray; font-weight: bold; font-size: 35px;">🧾리뷰 목록</div><br>
		<table border="1" class="table table-hover">
  			<thead>
   				<tr align="center" class="table-secondary">
			      <th>작성자</th>
			      <th>경기장</th>
			      <th>경기일</th>
			      <th>후기</th>
			      <th>평점</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty reviewList}">
						<tr>
							<td colspan="5">
								<p align="center">
									<b><span style="font-style: italic; font-size: 15pt;">후기를 기다리고 있어요.</span></b>
								</p>
							</td>
						</tr>
					</c:when>
					<c:when test="${!empty reviewList}">
						<c:forEach var="review" items="${reviewList }">
							<tr align="center">
								<td>${review.user_id}</td>
								<td>${review.stadium_name}</td>
								<td>${review.play_date }</td>
								<td>${review.review_content }</td>
								<td>
									<script>
										for(let i=1; i<=${review.review_star }; i++){
											document.write("★");
										}
									</script>
								</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>    			
			</tbody>
		</table>

		<!-- Trigger the modal with a button -->
		<c:if test="${reviewPosslist!=null}">
			<button type="modalBtn" class="btn btn-primary btn-lg"
				data-bs-toggle="modal" data-bs-target="#myModal" style="float: right;">리뷰 남기기</button>
		</c:if>
		
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-lg">
			
				<!-- Modal content-->
				<div class="modal-content modal-fullsize">
					<div class="modal-header">
						<h5 class="modal-title">예약 선택</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<c:choose>
						<c:when test="${empty reviewPosslist}">
							<p>후기 작성 가능한 예약 내역이 없습니다.</p>
						</c:when>
						<c:when test="${!empty reviewPosslist}">
							<p>아직 후기를 작성하지 않은 예약 내역입니다.</p>
							<c:forEach var="poss" items="${reviewPosslist}">
								<form action="reviewinsert">		
									<div class="input">
										<input name="stadium_name" type="text" value="${poss.stadium_name }" readonly size="40">					
										<input name="sports_name" type="text" value="${poss.sports_name }" readonly size="8">	
										<input name="res_date" type="text" value="${poss.res_date }" readonly size="6">							
										<input name="play_date" type="text" value="${poss.play_date }" readonly size="6">								
										<input name="res_number" type="text" value="${poss.res_number }" readonly size="1">
									</div>								
									<input type="submit" class="btn btn-default" value="선택">
									<br>
								</form>
							</c:forEach>
						</c:when>
					</c:choose>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	
	</div>

</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>

