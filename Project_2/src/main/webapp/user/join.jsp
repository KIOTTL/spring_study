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

		//아이디 중복체크
		$('#input_id').focusout(function() {
			let input_id = $('#input_id').val();
			if (input_id.trim() == "") {
				$("#input_id").focus();
				$('#checkId').text("아이디를 입력하세요");
				$('#checkId').css("color", "red");
				return;
			}

			$.ajax({
				type : 'post',
				url : '../user/id_check.do',
				data : {
					"id" : input_id
				},
				success : function(result) {
					let res=result.trim();
					if (res==='YES') {
						$('#checkId').text("사용가능한 아이디입니다");
						$('#checkId').css("color", "blue");
					} else {
						$('#checkId').text("사용중인 아이디입니다");
						$('#checkId').css("color", "red");
						$('#input_id').val("");
						$('#input_id').focus();
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
				url : '../user/tel_check.do',
				data : {
					"tel" : input_tel
				},
				success : function(result) {
					let res=result.trim();
					if (res==='YES') {
						$('#checkTel').text("사용가능한 핸드폰번호입니다");
						$('#checkTel').css("color", "blue");
					} else if (res==='NO'){
						$('#checkTel').text("사용중인 핸드폰번호입니다");
						$('#checkTel').css("color", "red");
						$('#input_tel').val("");
						$('#input_tel').focus();
					} else if (res==='NO2'){
						$('#checkTel').text(" - 를 포함해 작성해주세요");
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
				<div class="join_logo" style="font-size: 18px;">FUNDABLE</div>
			</div>

			<form method="post" action="../user/join_ok.do" name="join_frm" id="join_frm">
				<div class="join_input">
					<p>
						<label class="join_label">아이디</label>
					</p>
					<input type="text" placeholder="아이디" id="input_id" name="id">
					<!-- 아이디 중복 체크  -->
					<font id="checkId" size="2" style="display: block; margin: 10px;"></font>

					<p>
						<label class="join_label">비밀번호</label>

					</p>
					<div class="pwd_eye">
						<input class="eye" type="password"
							placeholder="비밀번호 (영문, 숫자, 특수문자 조합 최소 8자)" id="eye" name="pwd">
					</div>
					
					<p>
						<label class="join_label">이름</label>
					</p>
					<input type="text" placeholder="ex)홍길동" name="name">

					<p>
						<label class="join_label">핸드폰번호</label>
					</p>
					<input type="text" placeholder="ex)010-0000-0000" id="input_tel"
						name="tel">
					<!-- 핸드폰번호 중복 체크  -->
					<font id="checkTel" size="2" style="display: block; margin: 10px;"></font>

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
					<input class="join_submit" type="submit" value="회원가입" id="joinBtn" style="font-size: 14px;">
				</div>
				<div>
					<input class="join_submit_k" onclick="kakaoLogin();" class="kakao" type="submit"
						value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;카카오로 시작하기" style="font-size: 14px;">
				</div>
			</form>
		</div>
	</div>
</body>
</html>
