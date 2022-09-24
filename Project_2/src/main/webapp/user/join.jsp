<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOIN</title>
<link rel="stylesheet" href="../css/join.css" type="text/css">

<script type="text/javascript"
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- script src="../js/join.js"></script-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	//비밀번호 보이기
	$(function() {
		//눈표시 클릭 시 pwd 보이기
		$('#eye_i').on('click', function() {
			$('#eye').toggleClass('active');

			if ($('#eye').hasClass('active')) {
				$('#eye').attr('type', "text");
			} else {
				$('#eye').attr('type', "password");
			}
		});

		//아이디 중복체크

		$('#input_email').focusout(function() {
			let input_email = $('#input_email').val();
			if (input_email.trim() == "") {
				$("#input_email").focus();
				$('#checkEmail').text("이메일을 입력하세요");
				$('#checkEmail').css("color", "red");
				return;
			}

			$.ajax({
				type : 'post',
				url : '../account/email_check.do',
				data : {
					"email" : input_email
				},
				success : function(result) {
					let count = parseInt(result.trim());
					if (count == 0) {
						$('#checkEmail').text("사용가능한 이메일입니다");
						$('#checkEmail').css("color", "blue");
						//$('#input_email').attr('readonly', true);
					} else {
						$('#checkEmail').text("사용중인 이메일입니다");
						$('#checkEmail').css("color", "red");
						$('#input_email').val("");
						$('#input_email').focus();
					}
				}
			})
		});

		//전화번호 중복체크
		$('#input_tel').focusout(function() {
			let input_tel = $('#input_tel').val();
			if (input_tel.trim() == "") {
				$("#input_tel").focus();
				$('#checkTel').text("핸드폰번호를 입력하세요");
				$('#checkTel').css("color", "red");
				return;
			}

			$.ajax({
				type : 'post',
				url : '../account/tel_check.do',
				data : {
					"tel" : input_tel
				},
				success : function(result) {
					let count = parseInt(result.trim());
					if (count == 0) {
						$('#checkTel').text("사용가능한 핸드폰번호입니다");
						// $('#input_tel').attr('readonly', true);
						$('#checkTel').css("color", "blue");
					} else {
						$('#checkTel').text("사용중인 핸드폰번호입니다");
						$('#checkTel').css("color", "red");
						$('#input_tel').val("");
						$('#input_tel').focus();
					}
				}
			})
		})

		
		// 체크박스 전체 선택
		$("#checkbox_group").on("click", "#check_all", function() {
					$(this).parents("#checkbox_group").find('input').prop(
							"checked", $(this).is(":checked"));
				});

		// 체크박스 개별 선택
		$("#checkbox_group").on("click", ".normal", function() {
			var is_checked = true;

			$("#checkbox_group .normal").each(function() {
				is_checked = is_checked && $(this).is(":checked");
			});

			$("#check_all").prop("checked", is_checked);
		});
		

		$('#joinBtn').click(function() {
			// 체크(유효성 검사)
			//비밀번호 유효성 검사 패턴식 찾아서 하기 jsp
			$('#join_frm').submit(); //<input type=submit>
		})
	})
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('966c92656503c959734f1d6315fc15f6'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
</head>

<body>
	<div class="wrapper">
		<div class="join_container">
			<div class="join_title">
				<div class="joinmember">JOIN MEMBER</div>
				<div class="join_logo">FUNDABLE</div>
			</div>

			<form method="post" action="" name="join_frm" id="join_frm">
				<div class="join_input">
					<p>
						<label class="join_label">아이디</label>
					</p>
					<input type="text" placeholder="아이디" id="input_id"
						name="id">
					<!-- 이메일 중복 체크  -->
					<font id="checkEmail" size="2"></font>

					<p>
						<label class="join_label">비밀번호</label>

					</p>
					<div class="pwd_eye">
						<input class="eye" type="password"
							placeholder="비밀번호 (영문, 숫자, 특수문자 조합 최소 8자)" id="eye" name="pwd">
						<div>
							<img class="eye_i" src="../images/eye.png" alt="" id="eye_i">
						</div>
					</div>

					<p>
						<label class="join_label">이름</label>
					</p>
					<input type="text" placeholder="ex)홍길동" name="name">

					<!-- 이메일 중복 체크  -->
					<font id="checkTel" size="2"></font>
				</div>
				<div class="agree" id="checkbox_group">
					<input type="checkbox" id="check_all"> <label
						for="check_all">전체 동의</label><br> <input type="checkbox"
						id="check_1" class="normal"> <label for="check_1">서비스
						이용약관에 동의합니다. (필수)</label><br> <input type="checkbox" id="check_2"
						class="normal"> <label for="check_2">개인정보 수집 및 이용에
						동의합니다. (필수)</label><br> 
						<!-- input type="checkbox" id="check_3"
						class="normal"> <label for="check_3">마케팅 수신 동의.
						(선택)</label><br -->

				</div>
				<div>
					<input class="join_submit" type="submit" value="회원가입" id="joinBtn">
				</div>
				<div>
					<input class="join_submit_k" onclick="kakaoLogin();" class="kakao" type="submit"
						value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;카카오로 시작하기">
				</div>
			</form>
		</div>
	</div>
</body>
</html>
