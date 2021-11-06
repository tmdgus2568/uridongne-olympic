<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
form { 
margin: 0 auto; 
width:320px;
}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="content">
	<form action="memberjoin" method="post">
			<div class="form-group">
				<label for="InputId" class="form-label mt-4">아이디</label> <input
					type="text" class="form-control" id="user_id" name="user_id"
					aria-describedby="emailHelp" placeholder="아이디를 입력해주세요"> <small
					id="emailHelp" class="form-text text-muted">아이디는 영문자 </small>
			</div>
			<div class="form-group">
				<label for="InputPassword" class="form-label mt-4">비밀번호</label> <input
					type="password" class="form-control" id="user_pw" name="user_pw"
					placeholder="비밀번호를 입력해주세요">
			</div>
			<div class="form-group">
				<label for="InputName" class="form-label mt-4">이름</label> <input
					type="text" class="form-control" id="user_name" name="user_name"
					placeholder="이름을 입력해주세요">
			</div>
			<div class="form-group">
				<label for="InputBirth" class="form-label mt-4">생년월일</label> <input
					type="date" class="form-control" id="user_birth" name="user_birth">
			</div>
			<div class="form-group">
				<label for="InputEmail" class="form-label mt-4">이메일</label> <input
					type="email" class="form-control" id="user_email" name="user_email"
					placeholder="이메일을 입력해주세요">
			</div>
			<div class="form-group">
				<label for="InputEmail" class="form-label mt-4">전화번호</label> <input
					type="text" class="form-control" id="user_phone" name="user_phone"
					placeholder="숫자만 입력해주세요">
			</div>
			<div class="form-group">
				<label for="InputCity" class="form-label mt-4">도시</label> <input
					type="text" class="form-control" id="user_city" name="user_city"
					value="서울특별시" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="InputState" class="form-label mt-4">구</label> <select
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
			<input type="hidden" id="login_platform" name="login_platform" value="일반"> 
			
			<div align="center">
			<button type="submit" class="btn btn-primary" value="회원가입">회원가입</button>
			<button type="reset" class="btn btn-primary" value="재입력">재입력</button>
			</div>
	</form>
		</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>