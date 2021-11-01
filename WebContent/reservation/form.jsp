<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기장 예약</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
	.reserveChoice{width:70%}
	.reserveDetails{width: 30%}
	.flex-row{display:flex;}
	.refer{font-size: 12px}
</style>
<script>
	$(function() {
		$("#sports_name").change(function() {
			$.ajax({ //종목 이름이 서블릿으로 넘어감
				url : "getRegionBySports",
				data : {
					"sports_name" : $("#sports_name").val()
				},
				success : function(responseData) {
					$("#stadium_address").html(responseData);
				}
			});
		});
	});

	$(function() {
		$("#datepicker").change(function() {
			$.ajax({ //날짜가 서블릿으로 넘어감
				url : "getStadiumByDate",
				data : {
					"datepicker" : $("#datepicker").val(),
					"sports_name" : $("#sports_name").val(),
					"region" : $("#region").val()
				},
				success : function(responseData) {
					$("#availStaduim").html(responseData);
				}
			});
		});
	});
	
	$(function() {
		$("#datepicker").datepicker({
			minDate : 0
		});
	});
</script>
</head>
<body>
	<section class="contents flex-row">
		<section class="reserveChoice" >
			<h2>경기장 예약 페이지</h2>
			<!-- <span>종목선택</span> -->
			<select id="sports_name" name="sports_name">
				<!-- 종목 9개 고정 -->
				<option selected>종목(9)</option>
				<option value="농구장">농구</option>
				<option value="배구장">배구</option>
				<option value="배드민턴장">배드민턴</option>
				<option value="야구장">야구</option>
				<option value="족구장">족구</option>
				<option value="축구장">축구</option>
				<option value="탁구장">탁구</option>
				<option value="테니스장">테니스</option>
				<option value="풋살장">풋살</option>
			</select>

			<span id="stadium_address"> </span>

			<p><input type="text" id="datepicker" name="datepicker" value="날짜선택"> </p>
			
			<p id="availStaduim"> </p>


		</section>
		
		<!-- 나의예약정보 -->
		<aside class="reserveDetails">
			<form name="reserveInfo" method="get" action="reserveConfirmed">
				<h3>나의 예약 정보</h3>
				<hr>
				<table>
					<tr>
						<td>이용장소</td>
						<td></td>
					</tr>
					<tr>
						<td>이용일자</td>
						<td></td>
					</tr>
					<tr>
						<td>이용시간</td>
						<td></td>
					</tr>
					<tr>
						<td>취소기간</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td class="refer">(이용일 5일 전까지 취소 가능)</td>
					</tr>
					<tr>
						<td>결제금액</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td class="refer">평일(40,000원/시간), 주말(60,000원/시간)</td>
					</tr>
				</table>
				<br> <input type="submit" value="예약하기">
			</form>
		</aside>
	</section>

</body>
</html>