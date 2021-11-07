<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("LesoS08CKTFNELCZN_Ia",
				"http://localhost:9090/uridongne-olympic/member/callback.jsp");
		// 접근 토큰 값 출력
		//console.log(naver_id_login.oauthParams.access_token);
		console.log(naver_id_login.oauthParams.access_token);
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {

			var social_user_id = naver_id_login.getProfileData('id');
			var social_user_email = naver_id_login.getProfileData('email');
			var login_platform = "네이버";

			var accessToken = naver_id_login.oauthParams.access_token;

			//console.log(naver_id_login.getProfileData('email'));

			$("#social_user_id").val(social_user_id);
			$("#social_user_email").val(social_user_email);
			$("#login_platform").val(login_platform);
			$("#accessToken").val(accessToken);
			$("#socialFrmLogin").submit();
		}
	</script>
	<form name="socialFrmLogin" id="socialFrmLogin"
		action="sociallogincheck" method="post">
		<input type="hidden" id="social_user_id" name="social_user_id">
		<input type="hidden" id="social_user_email" name="social_user_email">
		<input type="hidden" id="login_platform" name="login_platform">
		<input type="hidden" id="accessToken" name="accessToken">
	</form>
</body>
</html>