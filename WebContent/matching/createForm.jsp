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
	// 총 인원수가 최대 n명 의 n을 넘지 못하게 처리 
	
	// change event 처리 -> 가격 올림처리 
	$('input[name=people]').change(function(){
		var max = ${stadium.mat_max};
		if($(this).val() > max){
			alert("최대 수용 가능 인원을 넘었습니다");
			$(this).val(max);
			
		}
	
		var prev_price = ${reservation.stadium_price};
		var price = Math.ceil(Number(prev_price)/$(this).val());
		
		$('#price').text(price);
		
		
		
	});	
	
	$('#create').submit(function(){
		 if(!confirm("정말 매칭을 생성하시겠습니까?")){
			 return false;
		 }
		 else{
			 if($('input[name=people]').val());		 
		 }
		
	});
	
	
});

</script>


</head>
<body>
<%@ include file="../header.jsp" %>
<div class="content">
	<h2>매칭 생성</h2>
	<br>
	<form method="post" id="create" action="confirm">
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
					<input type="number" name="people" min="1" value="1" required >
					<div>최대 ${stadium.mat_max}명까지 수용 가능</div>
				</td>
				
			</tr>
			
		</table>
		<div align="right">
			<div>인당 예상 가격</div>
			<div class="money">약 <span id="price">${reservation.stadium_price}</span> 원</div>
		
		</div>
		<div align="center" class="buttons">
			<input type="button" value="취소하기" id="cancel_btn">
			<input type="submit" value="생성하기">
		</div>
		
<!-- 		
	private int res_number;
	private String stadium_id; // 경기장아이디
	private String user_id;
	private Date res_date; // 예약신청일자
	private Date play_date; // 경기예약일자
	private String play_start;
	private String play_end;
	private int stadium_price; // 평일 40,000원 주말: 60,000원 (1시간 당)
	private String res_status;
	private int matching; // 매칭여부 no: 0, yes: 1 -->
		<div hidden="true">
			<input type="text" name="stadium_id" value="${reservation.stadium_id}">
			<input type="text" name="res_date" value="${reservation.res_date}">
			<input type="text" name="play_date" value="${reservation.play_date}">
			<input type="text" name="play_start" value="${reservation.play_start}">
			<input type="text" name="play_end" value="${reservation.play_end}">
			<input type="text" name="stadium_price" value="${reservation.stadium_price}">
	
		</div>
	</form>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>