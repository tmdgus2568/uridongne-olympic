<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<!-- <link href="../css/tableStyle.css" rel="stylesheet" type="text/css">
<link href="../css/contentStyle.css" rel="stylesheet" type="text/css"> -->
<meta charset="UTF-8">
<title>리뷰작성</title>
<link href="../css/starRating.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
  function backToList(obj){
    obj.action="../review/list";
    obj.submit();
  }
</script>
</head>
<body>
<%@ include file="../header.jsp"%>
<div class="content">
	<h2>후기 작성</h2>
	<h1 style="text-align: center">${member.user_id}님 후기를 남겨주세요!</h1>
	<h3 style="text-align: center">${param.stadium_name}시설 이용에 얼마나 만족하셨나요?</h3>

	<form action="reviewinsert" name="reviewForm" method="post">
	<fieldset>
	<div hidden="true">
	<input type="text" name="res_number" value="${param.res_number }"></div>
	
	<%-- <div hidden="true">
	<input type="text" name="res_number" value="${param.res_number }"></div>
		<table border=0 align="center">
		<tr>
				<!-- 평점 선택창 -->
    			<f:label path="rating">
	    			<td align="right">평가:</td>
	    			<td align="left">
		    			<div class="star-rating space-x-4 mx-auto">
		    			
							<input type="radio" id="5-stars" name="review_star" value="5"/>
							<label for="5-stars" class="star pr-4">★</label>
							<input type="radio" id="4-stars" name="review_star" value="4"/>
							<label for="4-stars" class="star">★</label>
							<input type="radio" id="3-stars" name="review_star" value="3"/>
							<label for="3-stars" class="star">★</label>
							<input type="radio" id="2-stars" name="review_star" value="2"/>
							<label for="2-stars" class="star">★</label>
							<input type="radio" id="1-star" name="review_star" value="1"/>
							<label for="1-star" class="star">★</label>
						</div>
					</td>
				</f:label>				
			</tr>
			<tr>
				<td align="right" valign="top"><br>후기:</td>
				<td colspan=2><textarea name="review_content" rows="10" cols="65"
						maxlength="4000"></textarea></td>
			</tr>

			<tr>
				<td align="right"></td>
				<td colspan="2" align="center">
				<input type="submit" value="등록하기" /> 
				<input type=button value="돌아가기" onClick="backToList(this.form)" /></td>
			</tr>
		</table> --%>
		<div class="form-group">
			<label for="starRating" class="form-label mt-4">평점</label>
			<div class="star-rating space-x-4 mx-auto">
		    			
							<input type="radio" id="5-stars" name="review_star" value="5"/>
							<label for="5-stars" class="star pr-4">★</label>
							<input type="radio" id="4-stars" name="review_star" value="4"/>
							<label for="4-stars" class="star">★</label>
							<input type="radio" id="3-stars" name="review_star" value="3"/>
							<label for="3-stars" class="star">★</label>
							<input type="radio" id="2-stars" name="review_star" value="2"/>
							<label for="2-stars" class="star">★</label>
							<input type="radio" id="1-star" name="review_star" value="1"/>
							<label for="1-star" class="star">★</label>
						</div>
		</div>
		
		<div class="form-group">
      		<label for="textarea" class="form-label mt-4">후기</label>
      		<textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
    	</div>
    	</fieldset>
<!-- !!!!!!!!!!!!!!!!!!버튼 function!!!!!!!!!!!!!!!!!!!!!!! -->
    	<button type="submit" class="btn btn-primary" value="등록하기" onClick>등록하기</button>
    	<button type="submit" class="btn btn-primary" value="돌아가기" onClick="backToList(this.form)">돌아가기</button>
    	<!-- <input type="submit" value="등록하기" /> 
		<input type=button value="돌아가기" onClick="backToList(this.form)" /> -->
	</form>
	</div>
<%@ include file="../footer.jsp"%>
</body>
</html>