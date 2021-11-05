<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/tableStyle.css" rel="stylesheet" type="text/css">
<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">
<link href="../css/modal.css" rel="stylesheet" type="text/css">
<style>
.select_style{
			width:80px;
			height:30px;
			border-radius:10px;
			border:1px solid grey;
			text-align:center;
		}
		
		.search_style{
			margin-left:8px;
			padding-left:8px;
			width:300px;
			height:28px;
			border-radius:10px;
			border:1px solid grey;
			
		}
		button{
			/* background-image:url(../image/search_icon.png);
			background-repeat:no-repeat;
			background-position:0px 0px;
			border:none;
			width:40px;
			height:40px; */
			background:black;
			color:white;
			width:100px;
			height:30px;
			border-radius:10px;
			font-size:14px;
			font-weight:normal;		
		}
</style>
<meta charset="UTF-8">
<title>리뷰</title>
<script type="text/javascript"></script>
<!-- sort관련 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- <script src="../jquery.tablesorter.min.js"></script> -->
<script src="../lib/jquery.tablesorter.min.js"></script>
<!-- modal관련 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
	<%@ include file="../header.jsp"%>
	<div class="content">
		<form method="get" id="search" align="right">
			<div>
				<select name="option" class="select_style">
					<option value="none">검색</option>
					<option value="user_id">작성자</option>
					<option value="stadium_name">경기장</option>
				</select>

				<!-- <lable>검색</lable> -->
				<input type="text" name="search" value="${param.search }"
					class="search_style" />
				<button type="submit" id="search_btn">검색</button>
			</div>
			<br>
		</form>
		<table border="1" class="table_style" align="center" id="review_list">
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
								<b><span style="font-style: italic; font-size: 15pt;">후기를
										기다리고 있어요.</span></b>
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
		</table>

		<!-- Trigger the modal with a button -->
		<button type="modalBtn" class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#myModal" style="float: right;">리뷰 남기기</button>

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog"
			aria-labelledby="myFullsizeModalLabel">
			<div class="modal-dialog modal-fullsize">

				<!-- Modal content-->
				<div class="modal-content modal-fullsize">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">예약 선택</h4>
					</div>
					<div class="modal-body">
						<p>아직 후기를 작성하지 않은 예약 내역입니다.</p>
						<c:forEach items="${reviewPosslist}" var="poss">
							<form action="reviewinsert">
								<div class="col-xs-1">
									<input name="stadium_name" type="text"
										value="${poss.stadium_name }" readonly size="30">
								</div>
								<div class="col-xs-1">
									<input name="sports_name" type="text"
										value="${poss.sports_name }" readonly size="10">
								</div>
								<div class="col-xs-1">
									<input name="res_date" type="text" value="${poss.res_date }"
										readonly size="10">
								</div>
								<div class="col-xs-1">
									<input name="play_date" type="text" value="${poss.play_date }"
										readonly size="10">
								</div>
								<div class="col-xs-1">
									<input name="res_number" type="text"
										value="${poss.res_number }" readonly size="5">
								</div>
								<input type="submit" class="btn btn-default" value="선택">
								<br>
							</form>
						</c:forEach>
					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>

			</div>
		</div>
		<script>
		$(function() {//teble sort
			  $("#review_list").tablesorter();
		});
		</script>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>

