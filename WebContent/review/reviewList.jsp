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
<script>
/* $(function(){
	$("#myModal").modal({
	   show:true,
	   backdrop:'static'
	});
	 //now on button click
	  $("#myModal").modal('show');
	}); */
</script>
<!-- <script type="text/javascript"></script> -->
<!-- sort관련 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
<script src="./js/jquery.tablesorter.js"></script>
<script src="../lib/jquery.tablesorter.min.js"></script> -->

<!-- modal관련 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>-->
</head>

<body>
	<%-- <%@ include file="../header.jsp"%> --%>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="content">
		<h2>후기</h2>
		<form method="get" id="search" align="right">
			<div>
				<!-- <select name="option" class="select_style"> -->
				<select class="btn btn-secondary btn-lm dropdown-toggle" 
					aria-label="Default select example" id="select" id="select" size="1">
					<option value="none">검색</option>
					<option value="user_id">작성자</option>
					<option value="stadium_name">경기장</option>
				</select>

				<!-- <lable>검색</lable> 
				<form class="d-flex">
					<input type="text" name="search" value="${param.search }" class="search_style" />
					<button type="submit" id="search_btn">검색하기</button> 
				</form>-->
<!-- !!!!!!!!!!!!!!!!!!버튼 function!!!!!!!!!!!!!!!!!!!!!!! -->
        			<input class="form-control me-sm-2" type="text" name="search" value="${param.search }" placeholder="Search">
        			<button class="btn btn-secondary my-2 my-sm-0" type="submit">검색하기</button>
     			
			</div>
			<br>
		</form>
	</div>

	<div class="content" text-align="center">
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
		<%-- <table border="1" class="table_style" align="center" id="myTable">
			<tr class="table_title">
				<td>작성자</td>
				<td>경기장</td>
				<td>경기일</td>
				<td>후기</td>
				<td>평점</td>
			</tr>
			<c:choose>
				<c:when test="${empty reviewList}">
					<tr height="10">
						<td colspan="5">
							<p align="center">
								<b><span style="font-style: italic; font-size: 15pt;">후기를 기다리고 있어요.</span></b>
							</p>
						</td>
					</tr>
				</c:when>
				<c:when test="${!empty reviewList}">
					<c:forEach var="review" items="${reviewList }">
						<tr align="center" class="table_content">
							<td>${review.user_id}</td>
							<td>${review.stadium_name}</td>
							<td>${review.play_date }</td>
							<td>${review.review_content }</td>
							<td><script>
								  for(let i=1; i<=${review.review_star }; i++){
									  document.write("★");
								  }
								</script></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table> --%>

		<!-- Trigger the modal with a button -->
		<c:if test="${reviewPosslist!=null}">
			<button type="modalBtn" class="btn btn-info btn-lg"
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
		<%-- <!-- Modal --> !!!!!!!!!!!!!!!부트스트랩 단일 모달!!!!!!!!!!!!!
		<div class="modal fade" id="myModal" role="dialog">
			<!-- aria-labelledby="myFullsizeModalLabel" -->
			<div class="modal-dialog modal-lg">

				<!-- Modal content-->
				<div class="modal-content modal-fullsize">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">예약 선택</h4>
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
										<input name="res_date" type="text" value="${poss.res_date }" readonly size="8">							
										<input name="play_date" type="text" value="${poss.play_date }" readonly size="8">								
										<input name="res_number" type="text" value="${poss.res_number }" readonly size="3">
									</div>								
									<input type="submit" class="btn btn-default" value="선택">
									<br>
								</form>
							</c:forEach>
						</c:when>
					</c:choose>
					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>

			</div> --%>
	</div>
	<!-- <script>
		$(function() {//teble sort
			  $("#myTable").tablesorter({
				  sortList: [[2,0], [4,0]] 
			  /* headers: {
				// 두번째 컬럼설정(0부터 시작함)
				// 정렬을 false로 설정	
				0: {sorter: false},
				1: {sorter: false},
				//세번째 컬럼설정
				3: {sorter: false}
				} */
			  });
		});
		</script> -->

	<%@ include file="../footer.jsp"%>
</body>
</html>

