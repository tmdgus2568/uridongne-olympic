<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�ı⾲��</title>
<link href="../css/starRating.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
   function readURL(input) {
      if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        $('#preview').attr('src', e.target.result);
          }
         reader.readAsDataURL(input.files[0]);
      }
  }  
  function backToList(obj){
    obj.action="list";
    obj.submit();
  }
</script>
</head>
<body>
	<h1 style="text-align: center">${review.user_id}�� �ı⸦ �����ּ���!</h1>
	<h3 style="text-align: center">${review.stadium_name}�� �ü� �̿뿡 �󸶳� �����ϼ̳���?</h3>
	<form name="reviewForm" method="post"  action="list"
		action="${contextPath}/upload.do" 
		enctype="multipart/form-data">
		<table border=0 align="center">
		<tr>
				<!-- ���� ����â -->
    			<f:label path="rating">
	    			<td align="right">��:</td>
	    			<td align="right">
		    			<div class="star-rating space-x-4 mx-auto">
							<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
							<label for="5-stars" class="star pr-4">��</label>
							<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
							<label for="4-stars" class="star">��</label>
							<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
							<label for="3-stars" class="star">��</label>
							<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
							<label for="2-stars" class="star">��</label>
							<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
							<label for="1-star" class="star">��</label>
						</div>
					</td>
				</f:label>				
			</tr>
			<tr>
				<td align="right" valign="top"><br>�ı�:</td>
				<td colspan=2><textarea name="review_content" rows="10" cols="65"
						maxlength="4000"></textarea></td>
			</tr>
						
			
			<tr>
				<td align="right">�̹��� ÷��:</td>
				<td><input type="file" name="review_photo"
					onchange="readURL(this);" /></td>
				<td><img id="preview" src="#" width=200 height=200 /></td>
			</tr>

			<tr>
				<td align="right"></td>
				<td colspan="2" align="center">
				<input type="submit" value="����ϱ�" /> 
				<input type=button value="��Ϻ���" onClick="backToList(this.form)" /></td>
			</tr>
		</table>
	</form>
</body>
</html>