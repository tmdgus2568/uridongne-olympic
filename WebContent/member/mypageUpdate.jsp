<%@page import="member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link href="../css/tableStyle.css" rel="stylesheet" type="text/css">
<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style type="text/css">
@font-face {
	font-family: 'NanumSquareRound';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.nav>li>a:hover {
	background: #ff7f50;
	color: #fff;
}

.box1 {
	width: 130px;
	height: 100px;
	float: left;
}

.box2 {
	display: center;
	flex-direction: column; /* 세로 정렬 */
	float: none;
}

form {
	margin: 0 auto;
	width: 320px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">

<script>
	$(function() {
		$('#user_state').val("${member.getUser_state() }").prop("selected",
				true);
	});

	$(function() {

		var strData = "${member.getUser_interest() }";
		var arrInterest = strData.split(", ");

		console.log(arrInterest[0]);

		$('.user_interest').prop('checked', false); // 일단 모두 uncheck

		for ( var nArrCnt in arrInterest) {

			$("input[name=user_interest][value=" + arrInterest[nArrCnt] + "]")
					.prop("checked", true);

		}

	});
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="main-container">
		<div class="box1">
			<ul class="nav nav-pills flex-column"
				style="font-family: NanumSquareRound;">
				<li class="nav-item"><a class="nav-link" href="mypage">마이페이지</a></li>
				<li class="nav-item"><a class="nav-link" href="reserveinfo">경기장예약</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">매칭개설</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="matchingcreateinfo">매칭생성</a> <a
							class="dropdown-item" href="matchingapplyinfo">매칭참여</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="reviewinfo">리뷰</a></li>
			</ul>
		</div>
		<form action="memberupdate" method="post"
			style="font-family: NanumSquareRound;">
			<div class="form-group" style="padding-top: 15px;">
				<h4>😎회원정보 수정</h4>
			</div>

			<c:choose>
				<c:when test="${member.login_platform == '일반'}">
					<div class="form-group">
						<label for="UpdateId" class="form-label mt-4">아이디</label> <input
							type="text" class="form-control" id="user_id" name="user_id"
							value="${member.getUser_id() }" aria-describedby="emailHelp"
							readonly="readonly">
					</div>
				</c:when>
				<c:otherwise>
					<div class="form-group">
						<input type="hidden" class="form-control" id="user_id"
							name="user_id" value="${member.getUser_id() }"
							aria-describedby="emailHelp" readonly="readonly">
					</div>
				</c:otherwise>
			</c:choose>

			<div class="form-group">
				<label for="UpdateName" class="form-label mt-4">이름</label> <input
					type="text" class="form-control" id="user_name" name="user_name"
					value="${member.getUser_name() }"><div class="check_font" id="name_check"></div>
			</div>
			<div class="form-group">
				<label for="UpdateBirth" class="form-label mt-4">생년월일</label> <input
					type="date" class="form-control" id="user_birth" name="user_birth"
					value="${member.getUser_birth() }">
			</div>


			<c:choose>
				<c:when test="${member.login_platform == '일반'}">
					<div class="form-group">
						<label for="UpdateEmail" class="form-label mt-4">이메일</label> <input
							type="email" class="form-control" id="user_email"
							name="user_email" value="${member.getUser_email() }"><div class="check_font" id="email_check"></div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="form-group">
						<label for="UpdateEmail" class="form-label mt-4">이메일</label> <input
							type="email" class="form-control" id="user_email"
							name="user_email" value="${member.getUser_email() }"
							readonly="readonly">
					</div>
				</c:otherwise>
			</c:choose>



			<div class="form-group">
				<label for="UpdateEmail" class="form-label mt-4">핸드폰번호</label> <input
					type="text" class="form-control" id="user_phone" name="user_phone"
					value="0${member.getUser_phone() }"><div class="check_font" id="phone_check"></div>
			</div>
			<div class="form-group">
				<label for="UpdateCity" class="form-label mt-4">도시</label> <input
					type="text" class="form-control" id="user_city" name="user_city"
					value="서울특별시" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="UpdateState" class="form-label mt-4">구</label> <select
					class="form-select" id="user_state" name="user_state">
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
				<label for="UpdateInterest" class="form-label mt-4">관심종목</label> <br>
				<input class="form-check-input" type="checkbox" name="user_interest"
					value="농구"> 농구&nbsp;&nbsp; <input class="form-check-input"
					type="checkbox" name="user_interest" value="배구">
				배구&nbsp;&nbsp; <input class="form-check-input" type="checkbox"
					name="user_interest" value="야구"> 야구&nbsp;&nbsp; <input
					class="form-check-input" type="checkbox" name="user_interest"
					value="배드민턴"> 배드민턴<br> <input class="form-check-input"
					type="checkbox" name="user_interest" value="족구">
				족구&nbsp;&nbsp; <input class="form-check-input" type="checkbox"
					name="user_interest" value="축구"> 축구&nbsp;&nbsp; <input
					class="form-check-input" type="checkbox" name="user_interest"
					value="탁구"> 탁구&nbsp;&nbsp; <input class="form-check-input"
					type="checkbox" name="user_interest" value="풋살">
				풋살&nbsp;&nbsp; <input class="form-check-input" type="checkbox"
					name="user_interest" value="테니스"> 테니스 &nbsp;&nbsp;
			</fieldset>
			<br> <input type="hidden" id="user_id" name="user_id"
				value="${member.user_id }"> <input type="hidden"
				id="login_platform" name="login_platform"
				value="${member.login_platform }">
			<div align="center">
				<button type="submit" class="btn btn-primary" value="수정하기">수정하기</button>
				<button type="reset" class="btn btn-primary" value="재입력">재입력</button>
				<button type="button" class="btn btn-primary" id="backbutton" value="돌아가기">돌아가기</button>
			</div>
		</form>
	</div>
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

//이메일
$('#user_email').blur(function(){
	if(mailJ.test($(this).val())){
		console.log(nameJ.test($(this).val()));
		$("#email_check").text('');
	} else {
		$('#email_check').text('이메일 주소를 확인해주세요.');
		$('#email_check').css('color', 'red');
	}
});

// 휴대전화
$('#user_phone').blur(function(){
	if(phoneJ.test($(this).val())){
		console.log(nameJ.test($(this).val()));
		$("#phone_check").text('');
	} else {
		$('#phone_check').text('핸드폰번호를 숫자로 입력해주세요');
		$('#phone_check').css('color', 'red');
	}
});


$('#backbutton').click(function(){
	location.href = 'mypage';
	})

</script>
	
	
	
</body>
</html>