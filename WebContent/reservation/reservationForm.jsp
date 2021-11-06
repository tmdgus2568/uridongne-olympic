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
<style>


.refer {
	font-size: 12px;
	text-align: left;
	width: auto;
}
</style>

</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include> 
	<nav>
	    <div class="m-4 py-2 ">
		  <h4>경기장 예약</h4>
	    </div>
	</nav>
	<section class=" d-flex">
		<!-- 경기장 정보 -->
	    <section class="col-8"> <!-- bg-warning--> 
	    
	    	  <!-- 검색 섹션 -->
			  <article class="d-flex mx-4">
			  	<!-- 종목선택 -->
			    <div class="col-2 m-1">
				  <select class="form-select" id="sports_name" name="sports_name">
				    <option selected>🏆 종목 선택(9)</option>
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
				</div>
				<!-- 지역선택: GetRegionServlet sports_name 전달 > regionList.jsp -->
				<div class="col-2 m-1">
				  <select class="form-select" id="region">
			  		<option>🚕 지역 선택(0)</option>
				  </select>
				</div>
				<!-- 날짜선택, 함수실행-->
				<div class="col-4 m-1">
			  	  <input type="text" class="form-control" id="datepicker" name="datepicker" value="📅 예약일 선택" /> <!-- onchange="call2(this) -->
			    </div>
			<!--     <div class="col-4 m-1">
			      <input type="button" id="resultCnt" name="resertCnt" class="btn btn-light disabled" value="총 0건 검색"/>
			    </div> ${" 총 "}${fn:length(availStadiumList)}${"건 검색"} -->
			  </article>
			  
		  	  <!-- 경기장 확인 GetStadiumServlet > availStaduimList.jsp -->
			  <article>
			  	  <div id="availStadium"></div> <!-- 원래 p태그 -->
			  </article>
		  </section>


		<!-- 나의예약정보 -->
		<aside class="col-4 bg-dark">
			<div class="">
			  <form name="reserveInfo" method="post" action="stadiumConfirmed" onsubmit='return btnActive("${user_id}")'>
			  <!-- 테이블 -->
				<table class="table table-hover mx-4 bg-info">
				    <thead>
					  <tr class="table-active">
					    <th scope="col" colspan="2" class="font-weight-bold">상세 예약 정보</th>
					  </tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">🌈 경기장소</th>
							<td>
								<span id='stadium_name2'></span> 
								<!-- stadium_id2 form으로 서버에 전송 --> 
								<input type='hidden' id='stadium_id2' name='stadium_id2' value=''>
							</td>
						</tr>
						<tr>
							<th scope="row">🌈 경기일자</th>
							<!-- form으로 서버에 전송 -->
							<td>
								<span id='date'></span>
								<input type='hidden' id='play_date' name='play_date' value=''>
							</td>
						</tr>
						<tr>
							<th scope="row">🌈 경기시간</th>
							<td>
								<span id='time'></span>
								<input type='hidden' id='play_time' name='play_time' value=''>
							</td>
						</tr>
						<tr>
							<th scope="row">🌈 취소기간</th>
							<td>
								<span id="canceledDate"></span>
								<br>
								<span id='canceledDateEx' class="refer"></span>
								
							</td>
						</tr>
						<tr>
							<th scope="row">🌈 결제금액</th>
							<td>
								<span id="price"></span>
								<input type='hidden' id="stadium_price" name='stadium_price' value=''>
								<br>
								<span id='priceEx' class="refer"></span>
							</td>
						</tr>
					</tbody>
				</table>
				<br> 
				<div>
				  <input type="submit" id="reserveBtn" value="예약하기" class="btn btn-warning"/>
				</div>
			</form>
		  </div>
		</aside>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include> 
	<!-- jsjsjsjsjsjs -->
	<script>
		//종목선택 > 지역옵션 표시(o)
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
		
		//날짜선택 > 예약가능 경기장 표시(0)
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
						$("#availStadium").html(responseData);
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
		
		  // 문자열을 Date타입으로 변경하는 함수(dateStr 형식 = '2021/11/21')
		  function toDate(dateStr)
		  {
		      var yyyyMMdd = String(dateStr);
		      var sYear = yyyyMMdd.substring(0,4);
		      var sMonth = yyyyMMdd.substring(5,7);
		      var sDate = yyyyMMdd.substring(8,10);

		      var date = new Date(Number(sYear), Number(sMonth)-1, Number(sDate));
		      
		      return date;
		  }
		  
		  // 취소가능기간 계산하는 함수
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
		  
		  // 사용요금 계산하는 함수(주말:6만원, 평일4만원. 2시간 고정)
		  function calPrice(dateStr){
			  var date = new Date(dateStr).getDay();
			  var price = 0;
			  var week = 40000;
			  var weekend = 60000;
			  var times = 2;
			  if(date == 0 || date == 6){ //주말일때
				  price = weekend * times;
			  } else {
				  price = week * times;
			  }
			  
			  return price;
		  }
		  
		  function showCalPrice(dateStr){
			  var price = calPrice(dateStr)
			  
			  price = price.toLocaleString('ko-KR');
			  
			  return price + " 원";
		  }
		  
		  // 날짜 변경시, 나의예약정보에 경기날짜, 취소가능기간, 사용요금 출력
		  $("#datepicker").change(function(){
			  var dateStr = $("#datepicker").val();
			  
			  $("#date").html(dateStr);
			  $("#play_date").val(dateStr);
			  $("#canceledDate").html(canceledDate(dateStr));
			  $("#price").html(showCalPrice(dateStr));
			  $("#stadium_price").val(calPrice(dateStr));
			  $("#canceledDateEx").html("(이용일 5일 전까지 취소 가능)");
			  $("#priceEx").html("평일(40,000원/시간), 주말(60,000원/시간)");
			  $("#resultCnt").html($("#count").val());
			  
		  });
		  	   
		 	
 		 // 예약날짜 나의예약정보에 선택시 예약시간,경기장소 출력
 		 function call(obj){
			//예약시간	  
			$("#play_time").val($(obj).val());
			$("#time").html($(obj).val());
			//장소이름&장소ID
			$("#stadium_name2").html($("#stadium_name").val());
			$("#stadium_id2").val($("#stadium_id").val());
		 }
 		  		 
 		 //로그인되지 않았을 시 예약불가, 알람창 띄움
		 function btnActive(user_id){
 			if( user_id == '' || user_id == null) {
 				alert("로그인이 필요합니다.");
 				return false;
 			} 
 		 }
	</script>
</body>
</html>