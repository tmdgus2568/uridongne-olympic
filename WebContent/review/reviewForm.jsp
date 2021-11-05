<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link href="../css/tableStyle.css" rel="stylesheet" type="text/css">
<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>리뷰작성</title>
<link href="../css/starRating.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
   /* function readURL(input) {
      if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        $('#preview').attr('src', e.target.result);
          }
         reader.readAsDataURL(input.files[0]);
      }
  }   */
  function backToList(obj){
    obj.action="/review/list";
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
	<div hidden="true"><input type="text" name="res_number" value="${param.res_number }"></div>
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
									
			<!-- <tr>
				<td align="right">이미지 첨부:</td>
				<td><input type="file" name="review_photo" /></td>
				<td><img id="preview" src="#" width=200 height=200 /></td>
			</tr> -->

			<tr>
				<td align="right"></td>
				<td colspan="2" align="center">
				<input type="submit" value="등록하기" /> 
				<input type=button value="목록보기" onClick="backToList(this.form)" /></td>
			</tr>
		</table>
	</form>
	</div>
<%@ include file="../footer.jsp"%>
</body>
</html>