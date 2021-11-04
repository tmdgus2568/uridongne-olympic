<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">
<style type="text/css">
h5 {
	color: red;
}
</style>
<!-- 카카오 로그인 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
	Kakao.init('52f4562963d0af029fb4dd18b6358be9'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오 로그인
	function kakaoLogin() {
		Kakao.Auth.login({
			success : function(response) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(response) {
						console.log(response);
						console.log("id값: " + response.id);
						console.log("이메일: " + response.kakao_account.email);

						var kakao_user_id = response.id;
						var kakao_user_email = response.kakao_account.email;

						$("#kakao_user_id").val(kakao_user_id);
						$("#kakao_user_email").val(kakao_user_email);
						$("#kakaoFrmLogin").submit();

					},
					fail : function(error) {
						console.log(error)
					},
				})
			},
			fail : function(error) {
				console.log(error)
			},
		})
	}

</script>

</head>
<body>


	<%
	String clientId = "LesoS08CKTFNELCZN_Ia";//아이디값";
	String redirectURI = URLEncoder.encode("http://localhost:9090/uridongne-olympic/member/naverlogin", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&client_id=" + clientId;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&state=" + state;
	session.setAttribute("state", state);
	%>


	<%@ include file="../header.jsp"%>
	<div class="content">
		<div class="loginform" align="center">
			<h3>LOGIN</h3>
			<h5>${message }</h5>
			<form name="frmLogin" action="generallogincheck" method="post">
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" id="user_id" name="user_id">
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" id="user_pw" name="user_pw"></td>
					</tr>
				</table>
				<input type="submit" value="로그인">
			</form>

			<br> <a href="joinForm.jsp"><img height="40"
				src="../image/join.png" /></a><br> <a onclick="kakaoLogin();"
				href="javascript:void(0)"><img height="40"
				src="../image/kakaologin.png" /></a><br> <a href="<%=apiURL%>"><img
				height="40" src="../image/naverlogin.png" /></a>


			<form name="kakaoFrmLogin" id="kakaoFrmLogin"
				action="kakaologincheck" method="post">
				<input type="hidden" id="kakao_user_id" name="kakao_user_id">
				<input type="hidden" id="kakao_user_email" name="kakao_user_email">
			</form>


			<a onclick="kakaoLogout();" href="javascript:void(0)"> <span>카카오
					로그아웃</span>
			</a>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>