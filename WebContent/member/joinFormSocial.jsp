<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>회원가입 (소셜로그인)</title>
<style>
form {
	margin: 0 auto;
	width: 370px;
}
</style>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.4.4.min.js"></script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<h3>소셜 로그인 추가정보 입력하기</h3>

	<%
	String user_id = request.getParameter("social_user_id");
	String user_email = request.getParameter("social_user_email");
	String login_platform = request.getParameter("login_platform");
	%>

	<form action="memberjoin" method="post" style="font-family: NanumSquareRound;">
	<input type="hidden" id="user_id" name="user_id" value=<%=user_id%>>
	<input type="hidden" id="user_email" name="user_email" value=<%=user_email%>>
	<input type="hidden" id="login_platform" name="login_platform" value=<%=login_platform%>>
	
			<div class="form-group">
				<label for="user_name" class="form-label mt-4">이름</label> <input
					type="text" class="form-control" id="user_name" name="user_name"
					placeholder="이름을 입력해주세요" required="required"><div class="check_font" id="name_check"></div>
			</div>
			<div class="form-group">
				<label for="InputBirth" class="form-label mt-4">생년월일</label> <input
					type="date" class="form-control" id="user_birth" name="user_birth" required="required">
			</div>
			<div class="form-group">
				<label for="InputEmail" class="form-label mt-4">이메일</label> <input
					type="email" class="form-control" id="user_email" name="user_email"
					 value=<%=user_email%> readonly="readonly">
			</div>
			<div class="form-group">
				<label for="InputPhone" class="form-label mt-4">핸드폰번호</label> <input
					type="text" class="form-control" id="user_phone" name="user_phone"
					placeholder="핸드폰번호를 입력해주세요"><div class="check_font" id="phone_check" required="required"></div>
			</div>
			<div class="form-group">
				<label for="InputCity" class="form-label mt-4">도시</label> <input
					type="text" class="form-control" id="user_city" name="user_city"
					value="서울특별시" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="InputState" class="form-label mt-4">구</label> <select
					class="form-select" id="user_state" name="user_state" required="required">
					<option value="강남구">강남구</option>
					<option value="강동구">강동구</option>
					<option value="강북구">강북구</option>
					<option value="강서구">강서구</option>
					<option value="관악구">관악구</option>
					<option value="관악구">관악구</option>
					<option value="구로구">구로구</option>
					<option value="금천구">금천구</option>
					<option value="노원구">노원구</option>
					<option value="도봉구">도봉구</option>
					<option value="동대문구">동대문구</option>
					<option value="동작구">동작구</option>
					<option value="마포구">마포구</option>
					<option value="서대문구">서대문구</option>
					<option value="서초구">서초구</option>
					<option value="성동구">성동구</option>
					<option value="성북구">성북구</option>
					<option value="송파구">송파구</option>
					<option value="양천구">양천구</option>
					<option value="영등포구">영등포구</option>
					<option value="용산구">용산구</option>
					<option value="은평구">은평구</option>
					<option value="종로구">종로구</option>
					<option value="중구">중구</option>
					<option value="중랑구">중랑구</option>
				</select>
			</div>

	<fieldset class="form-group">
		<label for="InputInterest" class="form-label mt-4">관심종목</label>
		<br>
				<input class="form-check-input" type="checkbox" name="user_interest" value="농구"> 농구&nbsp;&nbsp;
				<input class="form-check-input" type="checkbox" name="user_interest" value="배구"> 배구&nbsp;&nbsp;
				<input class="form-check-input" type="checkbox" name="user_interest" value="야구"> 야구&nbsp;&nbsp;
				<input class="form-check-input" type="checkbox" name="user_interest" value="배드민턴"> 배드민턴<br>
				<input class="form-check-input" type="checkbox" name="user_interest" value="족구"> 족구&nbsp;&nbsp;
				<input class="form-check-input" type="checkbox" name="user_interest" value="축구"> 축구&nbsp;&nbsp;
				<input class="form-check-input" type="checkbox" name="user_interest" value="탁구"> 탁구&nbsp;&nbsp;
				<input class="form-check-input" type="checkbox" name="user_interest" value="풋살"> 풋살&nbsp;&nbsp;
				<input class="form-check-input" type="checkbox" name="user_interest" value="테니스"> 테니스 &nbsp;&nbsp;
		</fieldset>
		<br>
			
			<div align="center">
			<button type="submit" class="btn btn-primary" value="회원가입">회원가입</button>
			<button type="reset" class="btn btn-primary" value="재입력">재입력</button>
			</div>
	</form>
	<%@ include file="../footer.jsp"%>
	
<script>

//모든 공백 체크 정규식
var empJ = /\s/g;
//아이디 정규식
var idJ = /^[a-z0-9]{4,12}$/;
// 비밀번호 정규식
var pwJ = /^[A-Za-z0-9]{4,12}$/; 
// 이름 정규식
var nameJ = /^[가-힣]{2,6}$/;
// 이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 휴대폰 번호 정규식
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

//이름
$("#user_name").blur(function() {
	if (nameJ.test($(this).val())) {
			console.log(nameJ.test($(this).val()));
			$("#name_check").text('');
	} else {
		$('#name_check').text('한글 2-6글자를 입력해주세요.');
		$('#name_check').css('color', 'red');
	}
});


// 휴대전화
$('#user_phone').blur(function(){
	if(phoneJ.test($(this).val())){
		console.log(nameJ.test($(this).val()));
		$("#phone_check").text('');
	} else {
		$('#phone_check').text('숫자로만 입력해주세요');
		$('#phone_check').css('color', 'red');
	}
});

</script>
	
</body>
</html>