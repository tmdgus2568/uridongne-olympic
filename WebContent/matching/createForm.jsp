<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭 생성</title>
<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	/* 테이블 전체 */
	.table_style{
		border-collapse:collapse;
		line-height:1.5;
		margin:20px 10px;
		width:100%;
		text-align:center;

	}
 	tr{
		height:50px;
	
	} 
	
	.td_title{
	/* 	background:black;
		color:white; */
		font-weight:bold;
		width:6%;
		font-size:20px;
		text-align:left;
	
	}
	
	.td_title_input{
		border:1px solid grey;
		border-radius:10px;
		padding:10px;
		height:15px;
		font-size:20px;
	}
	
	/* #title{
		width:
	} */
	
	textarea{
		width:100%;
		border:1px solid grey;
		border-radius:10px;
		padding:10px;
		font-size:20px;
		resize:none;
	}
	
	input[type=text]{
		width:100%;
	}
	
	input[type=number]{
		width:100px;
		margin-left:10px;
		padding:5px;
		border:1px solid grey;
		border-radius:10px;
		
	}
	input[type=button]{
		background:black;
		color:white;
	
		width:120px;
		height:50px;
		border-radius:15px;
		font-size:15px;
		font-weight:bold;
	
	}
	
	input[type=submit]{
		background:black;
		color:white;

		width:120px;
		height:50px;
		border-radius:15px;
		font-size:15px;
		font-weight:bold;
	
	}
	.people_count{
	
		text-align:left;
		font-weight:bold;
	}
	
	.people_count div{
		margin-left:5px;
		display:inline;	
		font-weight:normal;
		font-size:12px;
		vertical-align:bottom;
		color:red;
		align:center;
	}
	
	.buttons{
	/* 	align:center; */
		margin:30px;
	}
	
	.money{
		margin-top:10px;
		font-size:40px;
		font-weight:bold;
		margin-bottom:60px;
	}

</style>

<script>

$(function(){
	// change event 처리 -> 가격 올림처리 
	$('input[name=people]').change(function(){
		console.log("here");
		
		$('.money').text("약 "+Math.ceil(100000/$(this).val()) + " 원");
		
	});	
	
	
});

</script>


</head>
<body>
<%@ include file="../header.jsp" %>
<div class="content">
	<h2>매칭 생성</h2>
	<br>
	<form method="post">
		<table align="center" class="table_style">
			<tr>
				<td class="td_title">제목</td>
				<td><input type="text" name="title" class="td_title_input" required autofocus></td>
			</tr>
			<tr>
				<td class="td_title">내용</td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="10" cols="50" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" class="people_count">
					총 인원 수
					<input type="number" name="people" min="1" required >
					<div>최대 ${stadium.mat_max}명까지 수용 가능</div>
				</td>
				
			</tr>
			
		</table>
		<div align="right">
			<div>인당 예상 가격</div>
			<div class="money">약 0 원</div>
		
		</div>
		<div align="center" class="buttons">
			<input type="button" value="취소하기" id="cancel_btn">
			<input type="submit" value="생성하기">
		</div>
	</form>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>