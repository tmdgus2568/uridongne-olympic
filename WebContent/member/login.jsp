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

<!-- 네이버 로그인 스크립트 -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>

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

						var social_user_id = response.id;
						var social_user_email = response.kakao_account.email;
						var login_platform = "카카오";

						$("#social_user_id").val(social_user_id);
						$("#social_user_email").val(social_user_email);
						$("#login_platform").val(login_platform);
						$("#socialFrmLogin").submit();

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
				src="../image/generaljoin.png" /></a>
				<br> <a onclick="kakaoLogin();"
				href="javascript:void(0)"> <img height="40"
				src="../image/kakaologin.png" /></a><br>


			<div id="naver_id_login"></div>

			<form name="socialFrmLogin" id="socialFrmLogin"
				action="sociallogincheck" method="post">
				<input type="hidden" id="social_user_id" name="social_user_id">
				<input type="hidden" id="social_user_email" name="social_user_email">
				<input type="hidden" id="login_platform" name="login_platform">
			</form>
		</div>
	</div>


	<!-- //네이버 로그인 버튼 노출 영역 -->
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("LesoS08CKTFNELCZN_Ia",
				"http://localhost:9090/uridongne-olympic/member/callback.jsp");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 3, 43);
		naver_id_login
				.setDomain("http://localhost:9090/uridongne-olympic/member/login.jsp");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>


	<%@ include file="../footer.jsp"%>
</body>
</html>