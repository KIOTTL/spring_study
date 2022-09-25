<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/join.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<style type="text/css">
.join_submit_k {
    width: 100%;
    height: 45px;
    color: #3B1E1E;
    background-color: #FAE100;
    border-radius: 4px;
    border: none;
    font-weight: 800;
    cursor: pointer;
    background-image: url("../css/img/kakao.png");
    background-repeat: no-repeat;/*이미지 반복 없이 한 개만 출력*/
    background-size: 18px;
    background-position: 41px 17.5px;/*영역 안에서 이미지 위치 x축 y축 위치값*/
    padding-left: 1px;/*padding값이 없으면 placeholder="Add List"와 겹친다. */
}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<body>
	<div class="wrapper">
		<div class="join_container">
			<div class="join_title">
				<div class="joinmember">LOGIN</div>
				<div class="join_logo" style="font-size: 18px; letter-spacing: 10px; margin-left:15px;">FUNDABLE</div>
			</div>
				<div class="join_input">
					<p>
						<label class="join_label">아이디</label>
					</p>
					<input type="id" placeholder="아이디" name="id" style="width: 100%;"
						v-model="id">

					<p>
						<label class="join_label">비밀번호</label>
					</p>
					<div class="pwd_eye">
						<input class="eye" type="password" style="width: 100%;"
							placeholder="비밀번호 (영문, 숫자 조합 최소 8자)" name="pwd" v-model="pwd">
					</div>
					
					<p>
					  <input type=checkbox name="ck" v-model="ck" style="width: 13px; height: auto; margin: 5px;">
					  <span style="padding: 5px; font-size: 13px;">아이디 저장</span>
					</p>

				</div>

				<!-- div class="login_check">
					<span><input type="checkbox">로그인 상태 유지하기 </span> <span><a
						href="">아이디/비밀먼호 찾기</a></span>
				</div -->
				<div style="height: 30px;"></div>
				<div>
					<button class="join_submit" type="button" name="login" style="font-size: 14px;" v-on:click="login()">로그인</button>
				</div>
				<div style="height: 10px;"></div>
				<div id="naver_id_login" style="display: inline;"></div>
				<script type="text/javascript">
				  	var naver_id_login = new naver_id_login("uhNmhIO3APAf6c9w50Vt", "http://localhost:8080/naverLogin");
				  	var state = naver_id_login.getUniqState();
				  	naver_id_login.setButton("green", 3, 48);
				  	naver_id_login.setDomain("http://localhost:8080");
				  	naver_id_login.setState(state);
				  	naver_id_login.setPopup();
				  	naver_id_login.init_naver_id_login();
				</script>
				<div style="display:inline; width: 50%">
					<button class="join_submit_k" class="kakao" onclick="kakaoLogin();"
						type="button" style="width: 50%; height: 50px; font-size: 15px; border-radius: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;카카오로 로그인</button>
				</div>
				<div class="join_member">
					<span>회원 혜택을 받아보세요.</span> <span><a
						href="../user/join.do">회원가입</a></span>
				</div>
		</div>

	</div>
  <script>
    new Vue({
    	el:'.wrapper',
    	data:{
    		id:'',
    		pwd:'',
    		ck:'',
    		result:{}
    	},
    	mounted:function(){
    		let _this=this;
    		axios.get("http://localhost:8080/web/user/login.do",{
				params:{
				}    			
    		}).then(function(result){
    			_this.id='${id}';
    			if(_this.id!='') {
    				_this.ck='true';
    			}
    		})
    		
    	},
    	methods:{
    		login:function(){
    			if(this.id==""){
    				alert("아이디를 입력하세요");
    				return;
    			}
    			if(this.pwd==""){
    				alert("비밀번호를 입력하세요");
    				return;
    			}
				
    			axios.get("http://localhost:8080/web/user/login_ok.do",{
    				params:{
    					id:this.id,
    					pwd:this.pwd,
    					ck:this.ck
    				}
    			}).then(result=>{
    				console.log(result.data);
    				this.result=result.data;
    				if(this.result.msg=="NOID"){
    					alert("아이디가 존재하지 않습니다");
    					this.id="";
    					this.pwd="";
    				} else if(this.result.msg=="NOPWD"){
    					alert("비밀번호가 틀립니다")
    					this.pwd="";
    				} else {
    					location.href="../main/main.do";
    				}
    				console.log(ck);
    			})
    		}
    	}
    })
  </script>
</body>
</html>