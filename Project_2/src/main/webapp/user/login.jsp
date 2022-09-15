<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/join.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>


	<div class="wrapper">
		<div class="join_container">
			<div class="join_title">
				<div class="joinmember">LOGIN</div>
				<div class="join_logo" style="font-size: 18px; letter-spacing: 10px; margin-left:15px;">FUNDABLE</div>
			</div>

			<form method="post" name="loginForm" >
				<div class="join_input">
					<p>
						<label class="join_label">아이디</label>
					</p>
					<input type="id" placeholder="아이디" name="id" style="width: 100%;"
						id="login_id">

					<p>
						<label class="join_label">비밀번호</label>
					</p>
					<div class="pwd_eye">
						<input class="eye" type="password" style="width: 100%;"
							placeholder="비밀번호 (영문, 숫자 조합 최소 8자)" name="pwd" id="login_pwd">
						<!-- <div>
							<img class="eye_i" src="../images/eye.png" alt="" id="eye_i">
						</div> -->
					</div>

				</div>

				<!-- div class="login_check">
					<span><input type="checkbox">로그인 상태 유지하기 </span> <span><a
						href="">아이디/비밀먼호 찾기</a></span>
				</div -->
				<div style="height: 50px;"></div>
				<div>
					<button class="join_submit" type="button" id="login" name="login" style="font-size: 14px;">로그인</button>
				</div>
				<div style="height: 5px;"></div>
				<div>
					<button class="join_submit_k" class="kakao" onclick="kakaoLogin();"
						type="button" style="font-size: 15px; color: #ffffff; background-color: #3dbd68;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NAVER로 로그인</button>
				</div>
				<div style="height: 5px;"></div>
				<div>
					<button class="join_submit_k" class="kakao" onclick="kakaoLogin();"
						type="button" style="font-size: 15px; color: #ffffff; background-color: #3dbd68;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NAVER로 로그인</button>
				</div>
				<div class="join_member">
					<span>회원 혜택을 받아보세요.</span> <span><a
						href="#">회원가입</a></span>
				</div>
			</form>
		</div>

	</div>

</body>
</html>