<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���侲��</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
    obj.action="${contextPath}/reviewList.jsp";
    obj.submit();
  }
</script>
</head>
<body>
	<h1 style="text-align: center">���� ����</h1>
	<form name="articleForm" method="post"
		action="${contextPath}/board/addArticle.do"
		enctype="multipart/form-data">
		<table border=0 align="center">
			<tr>
				<td align="right" valign="top"><br>����:</td>
				<td colspan=2><textarea name="content" rows="10" cols="65"
						maxlength="4000"></textarea></td>
			</tr>
			<tr>
				<td align="right">�̹��� ÷��:</td>
				<td><input type="file" name="imageFileName"
					onchange="readURL(this);" /></td>
				<td><img id="preview" src="#" width=200 height=200 /></td>
			</tr>
			<tr>
				<td align="right"></td>
				<td colspan="2"><input type="submit" value="����ϱ�" /> <input
					type=button value="��Ϻ���" onClick="backToList(this.form)" /></td>
			</tr>
		</table>
	</form>
</body>
</html>