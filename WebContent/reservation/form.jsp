<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
.reserveChoice {
	width: 70%;
}

.reserveDetails {
	width: 30%;
}

.flex-row {
	display: flex;
}

.refer {
	font-size: 12px;
	text-align: left;
}
</style>
<script>
	//종목선택 > 지역옵션 표시
	$(function() {
		$("#sports_name").change(function() {
			$.ajax({
				url : "getRegionBySports",
				data : {
					"sports_name" : $("#sports_name").val()
				},
				success : function(responseData) {
					$("#region").html(responseData);
				}
			});
		});
	});
	
	//날짜선택 > 예약가능 경기장 표시
	$(function() {
		$("#datepicker").change(function() {
			$.ajax({ //날짜,종목,지역이 서블릿으로 넘어감
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
	
	//datepicker 옵션
	$(function() {
		$("#datepicker").datepicker({
			minDate : 0,
			dateFormat: 'yy/mm/dd',
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			monthNames: ['1월','2월','3월','4월','5월','6월', '7월','8월','9월','10월','11월','12월'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
			showMonthAfterYear: true,
			yearSuffix: "년"
		});
	});
</script>
</head>
<body>
	<section class="contents flex-row">
		<section class="reserveChoice">
			<h2>경기장 예약 페이지</h2>
			<!-- <span>종목선택</span> -->
			<select id="sports_name" name="sports_name">
				<!-- 종목 9개 고정 -->
				<option selected>종목선택(9)</option>
				<option value="농구장">농구</option>
				<option value="배구장">배구</option>
				<option value="배드민턴장">배드민턴</option>
				<option value="야구장">야구</option>
				<option value="족구장">족구</option>
				<option value="축구장">축구</option>
				<option value="탁구장">탁구</option>
				<option value="테니스장">테니스</option>
				<option value="풋살장">풋살</option>
			</select> <select id="region">
				<option>지역선택(0)</option>
			</select>
			<!-- style="display: none;" -->
			<span><input type="text" id="datepicker" name="datepicker"
				value="📅 경기일 선택"> </span>

			<p id="availStaduim"></p>


		</section>
		<script>
		  //dateStr 형식 = 2021/11/21
 		  function toDate(dateStr)
		  {
			  //문자를 날짜로
		      var yyyyMMdd = String(dateStr);
		      var sYear = yyyyMMdd.substring(0,4);
		      var sMonth = yyyyMMdd.substring(5,7);
		      var sDate = yyyyMMdd.substring(8,10);

		      var date = new Date(Number(sYear), Number(sMonth)-1, Number(sDate));
		      
		      return date;
		  }
		  
		  function canceledDate(dateStr){
			  
			  var date = toDate(dateStr); //Wed Nov 10 2021 00:00:00 GMT+0900 (한국 표준시)
			  
		      var five = new Date(date.getTime() - 60*60*24*1000*5); //-5일
		      
		      //날짜를 문자로
		      var year = five.getFullYear();
		      var month = ('0' + (five.getMonth() + 1)).slice(-2);
		      var day = ('0' + five.getDate()).slice(-2);

		      var dateString = year + '/' + month  + '/' + day;
		      
		      return dateString + " 11:59:59 까지";
		  } 
		  
		  function calPrice(dateStr){
			  var date = new Date(dateStr).getDay();
			  var price = 0;
			  var week = 40000;
			  var weekend = 60000;
			  if(date == 0 || date == 6){ //주말일때
				  price = weekend * 2;
			  } else {
				  price = week * 2;
			  }
			  
			  price = price.toLocaleString('ko-KR');
			  
			  return price + " 원";
		  }
		  
		  $("#datepicker").change(function(){
			  var dateStr = $("#datepicker").val();
			  
			  $("#seletedDate").html(dateStr);
			  $("#canceledDate").html(canceledDate(dateStr));
			  $("#price").html(calPrice(dateStr));
		  });
		  
		  $("#availStaduim").change(function(){ 
 				$("input[name='avail']:checked").each(function (index, element) {
					$("#seletedTime").html($(element).val());
					$('#seletedStadium').html($('#stadiumName').val());
				});
		  }); 
		  
		  
		  
		  
		</script>
		
		<!-- 나의예약정보 -->
		<aside class="reserveDetails">
			<form name="reserveInfo" method="post" action="reserveConfirmed">
				<h3>나의 예약 정보</h3>
				<hr>
				<table>
					<tr>
						<td>🌈 경기장소</td>
						<td id="seletedStadium"></td>
					</tr>
					<tr>
						<td>🌈 경기일자</td>
						<td id="seletedDate"></td>
					</tr>
					<tr>
						<td>🌈 경기시간</td>
						<td id="seletedTime"></td>
					</tr>
					<tr>
						<td>🌈 취소기간</td>
						<td id="canceledDate"></td>
					</tr>
					<tr>
						<td></td>
						<td class="refer">(이용일 5일 전까지 취소 가능)</td>
					</tr>
					<tr>
						<td>🌈 결제금액</td>
						<td id="price"></td>
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