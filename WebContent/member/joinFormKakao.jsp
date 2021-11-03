<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>카카오 추가정보 입력하기</h3>

	<%
	String user_id = request.getParameter("kakao_user_id");
	String user_email = request.getParameter("kakao_user_email");
	%>

	<form action="memberjoin" method="post">
	<input type="hidden" id="user_id" name="user_id" value=<%=user_id%>>
	<input type="hidden" id="user_email" name="user_email" value=<%=user_email%>>
	<input type="hidden" id="login_platform" name="login_platform" value="카카오">
	
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" id="user_name" name="user_name"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" id="user_birth" name="user_birth"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" id="user_phone" name="user_phone"></td>
			</tr>
			<tr>
				<td>도시</td>
				<td><input type="text" id="user_city" name="user_city"
					value="서울특별시" readonly="readonly"></td>
			</tr>
			<tr>
				<td>구</td>
				<td><select name="user_state">
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
				</select></td>
			</tr>
			<tr>
				<td>관심 종목</td>
				<td><input type="checkbox" name="user_interest" value="농구">농구
					<input type="checkbox" name="user_interest" value="배구">배구 <input
					type="checkbox" name="user_interest" value="배드민턴">배드민턴 <input
					type="checkbox" name="user_interest" value="야구">야구 <br>
					<input type="checkbox" name="user_interest" value="족구">족구 <input
					type="checkbox" name="user_interest" value="축구">축구 <input
					type="checkbox" name="user_interest" value="탁구">탁구 <input
					type="checkbox" name="user_interest" value="테니스">테니스 <input
					type="checkbox" name="user_interest" value="풋살">풋살</td>
			</tr>
		</table>
		<input type="submit" value="회원가입"> <input type="reset"
			value="재입력">
	</form>

</body>
</html>