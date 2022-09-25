<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="../css/mypage/nicepage.css" media="screen">
<link rel="stylesheet" href="../css/mypage/style2.css" media="screen">
<script class="u-script" type="text/javascript" src="../css/mypage/jquery.js" defer=""></script>
<script class="u-script" type="text/javascript" src="../css/mypage/nicepage.js" defer=""></script>
<link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
<style type="text/css">
.tab:hover{
	font-weight: 700;
}
.tab1:hover{
	font-weight: 700;
}
a.u-button-style.u-button-style.u-button-style.u-text-hover-palette-5-dark-3[class*="u-border-"].active, a.u-button-style.u-button-style.u-button-style.u-text-hover-palette-5-dark-3:active, a.u-button-style.u-button-style.u-button-style.u-text-hover-palette-5-dark-3[class*="u-border-"]:active, a.u-button-style.u-button-style.u-text-hover-palette-5-dark-3:focus, a.u-button-style.u-button-style.u-text-hover-palette-5-dark-3[class*="u-border-"]:focus, a.u-button-style.u-button-style.u-button-style.u-button-style.u-text-active-palette-5-dark-3:active, a.u-button-style.u-button-style.u-button-style.u-button-style.u-text-active-palette-5-dark-3[class*="u-border-"]:active, a.u-button-style.u-button-style.u-button-style.u-button-style.u-text-active-palette-5-dark-3.active, a.u-button-style.u-button-style.u-button-style.u-button-style.u-text-active-palette-5-dark-3[class*="u-border-"].active, a.u-button-style.u-button-style.active > .u-text-active-palette-5-dark-3, a.u-button-style.u-button-style.active > .u-text-active-palette-5-dark-3[class*="u-border-"], :not(.level-2) > .u-nav > .u-nav-item > a.u-nav-link.u-text-hover-palette-5-dark-3:hover, :not(.level-2) > .u-nav > .u-nav-item > a.u-nav-link.u-nav-link.u-text-active-palette-5-dark-3.active, .u-text-hover-palette-5-dark-3.u-language-url:hover, .u-text-hover-palette-5-dark-3 .u-language-url:hover, .u-popupmenu-items.u-text-hover-palette-5-dark-3 .u-nav-link:hover, .u-popupmenu-items.u-popupmenu-items.u-text-active-palette-5-dark-3 .u-nav-link.active {
    font-weight: 700;
	border-bottom: 3px solid red;
	text-decoration: none;
}   
a.u-button-style:hover > .u-text-hover-palette-2-base, a.u-button-style:hover > .u-text-hover-palette-2-base[class*="u-border-"], a.u-button-style.u-button-style.u-text-hover-palette-2-base:hover, a.u-button-style.u-button-style.u-text-hover-palette-2-base[class*="u-border-"]:hover, a.u-button-style.u-button-style.u-button-style.u-text-hover-palette-2-base.active, a.u-button-style.u-button-style.u-button-style.u-text-hover-palette-2-base[class*="u-border-"].active, a.u-button-style.u-button-style.u-button-style.u-text-hover-palette-2-base:active, a.u-button-style.u-button-style.u-button-style.u-text-hover-palette-2-base[class*="u-border-"]:active, a.u-button-style.u-button-style.u-text-hover-palette-2-base:focus, a.u-button-style.u-button-style.u-text-hover-palette-2-base[class*="u-border-"]:focus, a.u-button-style.u-button-style.u-button-style.u-button-style.u-text-active-palette-2-base:active, a.u-button-style.u-button-style.u-button-style.u-button-style.u-text-active-palette-2-base[class*="u-border-"]:active, a.u-button-style.u-button-style.u-button-style.u-button-style.u-text-active-palette-2-base.active, a.u-button-style.u-button-style.u-button-style.u-button-style.u-text-active-palette-2-base[class*="u-border-"].active, a.u-button-style.u-button-style.active > .u-text-active-palette-2-base, a.u-button-style.u-button-style.active > .u-text-active-palette-2-base[class*="u-border-"], :not(.level-2) > .u-nav > .u-nav-item > a.u-nav-link.u-text-hover-palette-2-base:hover, :not(.level-2) > .u-nav > .u-nav-item > a.u-nav-link.u-nav-link.u-text-active-palette-2-base.active, .u-text-hover-palette-2-base.u-language-url:hover, .u-text-hover-palette-2-base .u-language-url:hover, .u-popupmenu-items.u-text-hover-palette-2-base .u-nav-link:hover, .u-popupmenu-items.u-popupmenu-items.u-text-active-palette-2-base .u-nav-link.active {
    color: #db545a !important;
    font-weight: 600;
    text-decoration: none;
} 


.u-section-1 .u-repeater-1 {
    grid-template-columns: 25% 25% 25% 25%;
    min-height: 466px;
    grid-gap: 0px 0px;
}
@-webkit-keyframes progress-bar-stripes{from{background-position:40px 0}to{background-position:0 0}}
@-o-keyframes progress-bar-stripes{from{background-position:40px 0}to{background-position:0 0}}
@keyframes progress-bar-stripes{from{background-position:40px 0}to{background-position:0 0}}
.progress{height:20px;margin-bottom:20px;overflow:hidden;background-color:#f5f5f5;border-radius:4px;-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,.1);box-shadow:inset 0 1px 2px rgba(0,0,0,.1)}
.progress-bar{float:left;width:0%;height:100%;font-size:12px;line-height:20px;color:#fff;text-align:center;background-color:#f77272;-webkit-box-shadow:inset 0 -1px 0 rgba(0,0,0,.15);box-shadow:inset 0 -1px 0 rgba(0,0,0,.15);-webkit-transition:width .6s ease;-o-transition:width .6s ease;transition:width .6s ease}
.progress-bar-striped,.progress-striped .progress-bar{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);-webkit-background-size:40px 40px;background-size:40px 40px}
.progress-bar.active,.progress.active .progress-bar{-webkit-animation:progress-bar-stripes 2s linear infinite;-o-animation:progress-bar-stripes 2s linear infinite;animation:progress-bar-stripes 2s linear infinite}
.progress-bar-success{background-color:#5cb85c}
.progress-striped .progress-bar-success{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent)}
.progress-bar-info{background-color:#5bc0de}
.progress-striped .progress-bar-info{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent)}
.progress-bar-warning{background-color:#f0ad4e}
.progress-striped .progress-bar-warning{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent)}
.progress-bar-danger{background-color:#d9534f}
.progress-striped .progress-bar-danger{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent)}
.progress-bar{
	height: 10px;
}
.progress{
	height: 10px;
}

input::placeholder {
  font-size: 14px;
}

p:not(.u-text-variant) {
    margin-top: 10px;
    margin-bottom: 10px;
}

</style>
<link rel="stylesheet" href="../css/mypage/modal2.css" media="screen">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	  /* $("#confirm").click(function(){
	      modalClose(); //모달 닫기 함수 호출
	      
	      //컨펌 이벤트 처리
	  }); */
	  /* $("#modal-open").click(function(){        
	      $("#popup").css('display','flex').hide().fadeIn();
	      //팝업을 flex속성으로 바꿔준 후 hide()로 숨기고 다시 fadeIn()으로 효과
	  });  */
	  /* $("#close").click(function(){
	      modalClose(); //모달 닫기 함수 호출
	  }); */
	 /*  function modalClose(){
	      $("#popup").fadeOut(); //페이드아웃 효과
	  } */
	});
</script>
</head>
<body class="u-body u-xl-mode" data-lang="en">
    <section class="u-align-center u-clearfix u-section-1" id="sec-992d">
      <div class="u-clearfix u-sheet u-valign-middle u-sheet-1" style="margin-top: 30px;">
        <div class="u-expanded-width u-tab-links-align-center u-tabs u-tabs-1">
          <ul class="u-border-1 u-border-no-left u-border-no-right u-border-no-top u-border-palette-5-light-1 u-spacing-10 u-tab-list u-unstyled" role="tablist" style="border: none;">
            <li class="u-tab-item" role="presentation">
              <a class="active u-button-style u-tab-link u-text-active-palette-5-dark-3 u-text-hover-palette-5-dark-3 u-text-palette-5-light-1 u-tab-link-1 tab" id="link-tab-62f5" href="#tab-62f5" role="tab" aria-controls="tab-62f5" aria-selected="true">프로필</a>
            </li>
            <li class="u-tab-item" role="presentation">
              <a class="u-button-style u-tab-link u-text-active-palette-5-dark-3 u-text-hover-palette-5-dark-3 u-text-palette-5-light-1 u-tab-link-2 tab" id="link-tab-db87" href="#tab-db87" role="tab" aria-controls="tab-db87" aria-selected="false">펀딩</a>
            </li>
            <li class="u-tab-item" role="presentation">
              <a class="u-button-style u-tab-link u-text-active-palette-5-dark-3 u-text-hover-palette-5-dark-3 u-text-palette-5-light-1 u-tab-link-3 tab" id="link-tab-b22d" href="#tab-b22d" role="tab" aria-controls="tab-b22d" aria-selected="false">스토어</a>
            </li>
          </ul>
          <div class="u-tab-content">
            <div class="u-align-center u-container-style u-tab-active u-tab-pane u-tab-pane-1" id="tab-62f5" role="tabpanel" aria-labelledby="link-tab-62f5">
              <div class="u-container-layout u-container-layout-1">
                <div class="u-align-left u-clearfix u-sheet u-valign-middle u-sheet-1">
			        <div class="u-expanded-width u-tabs u-tabs-1">
			          <ul class="u-tab-list u-unstyled" role="tablist" style="justify-content: left; border-bottom: 1px solid black;">
			            <li class="u-tab-item" role="presentation">
			              <a class="active u-button-style u-tab-link u-text-active-palette-2-base u-text-hover-palette-2-base u-tab-link-1 tab1" id="link-tab-8c3e" href="#tab-8c3e" style="font-size: 1.3rem;" role="tab" aria-controls="tab-8c3e" aria-selected="true">계정</a>
			            </li>
			            <li class="u-tab-item" role="presentation">
			              <a class="u-button-style u-tab-link u-text-active-palette-2-base u-text-hover-palette-2-base u-tab-link-2 tab1" id="link-tab-22fd" href="#tab-22fd" style="font-size: 1.3rem;" role="tab" aria-controls="tab-22fd" aria-selected="false">결제수단</a>
			            </li>
			            <li class="u-tab-item" role="presentation">
			              <a class="u-button-style u-tab-link u-text-active-palette-2-base u-text-hover-palette-2-base u-tab-link-3 tab1" id="link-tab-fd16" href="#tab-fd16" style="font-size: 1.3rem;" role="tab" aria-controls="tab-fd16" aria-selected="false">배송지</a>
			            </li>
			          </ul>
			          <div class="u-tab-content profile">
			            <div class="u-container-style u-tab-active u-tab-pane" id="tab-8c3e" role="tabpanel" aria-labelledby="link-tab-8c3e">
			              <div class="u-container-layout u-container-layout-1">
			                <div class="u-expanded-width u-table u-table-responsive u-table-1">
			                  <table class="u-table-entity">
			                    <colgroup>
			                      <col width="74.8%">
			                      <col width="25.2%">
			                    </colgroup>
			                    <tbody class="u-table-body">
			                      <tr style="height: 31px;">
			                        <td class="u-table-cell" colspan="2" style="font-weight: 700; font-size: 19px; padding: 40px 20px 0px 20px;">이름</td>
			                      </tr>
			                      <tr style="height: auto;">
			                        <td class="u-table-cell" colspan="2" style="color: black; font-weight: 400; padding: 20px; font-size: 17px;">
			                          	{{vo.name}}
			                        </td>
			                      </tr>
			                      <tr style="height: 31px;">
			                        <td class="u-border-1 u-border-no-left u-border-no-right u-border-no-bottom u-border-palette-5-light-1 u-table-cell" style="font-weight: 700; font-size: 19px; padding: 40px 20px 0px 20px;">이메일</td>
			                        <td class="u-border-1 u-border-no-left u-border-no-right u-border-no-bottom u-border-palette-5-light-1 u-table-cell" style="text-align: right; padding: 40px 20px 0px 20px;" v-if="vo.email===null">
			                          <input type=button value="+추가" style="border: none; border-radius: 14px; padding: 7px 15px; font-size: 13px; cursor: pointer; font-weight: 600;" v-on:click="modalOpen()"> <!-- id="modal-open" -->
			                        </td>
			                        <td class="u-border-1 u-border-no-left u-border-no-right u-border-no-bottom u-border-palette-5-light-1 u-table-cell" style="text-align: right; padding: 40px 20px 0px 20px;" v-if="vo.email!=null">
			                          <input type=button value="변경" style="border: none; border-radius: 14px; padding: 7px 15px; font-size: 13px; cursor: pointer; font-weight: 600;" v-on:click="modalOpen()">
			                        </td>
			                      </tr>
			                      <tr style="height: auto;">
			                        <td class="u-table-cell" colspan="2" style="color: darkgray; font-weight: 600; padding: 20px; font-size: 18px;" v-if="vo.email===null">
			                          	등록된 이메일이 없습니다
			                        </td>
			                        <td class="u-table-cell" colspan="2" style="color: black; font-weight: 400; padding: 20px; font-size: 17px;" v-if="vo.email!=null">
			                          	{{vo.email}}
			                        </td>
			                      </tr>
			                      
									  <div class="popup-wrap" :style="{'display' : display}"> <!-- id="popup"  -->
									    <div class="popup">	
									     <div class="popup-head" style="text-align: right; margin-top: 5px;">	
									          <span class="head-title pop-btn close"  style="margin-right: 3px;"><input type=button value="X" style="border: none; background-color: white; color: black" v-on:click="modalClose()"></span><!-- id="close" -->
									      </div>
									      <div class="popup-body">	
									        <div class="body-content">
									          <div class="body-contentbox">
									            <p> 이메일</p>
									            <p style="margin-top: 0px; margin-bottom: 0px;"> <input type="text" v-model="email" ref="email" style="width: 100%;"> </p>
									          </div>
									        </div>
									      </div>
									      <div class="popup-foot" style="text-align: right;">
									        <span class="pop-btn confirm" id="confirm"><input type=button value="확인" style="margin-right: 30px; background: black; border: none; color: white;" v-on:click="emailUpdate()"></span>
									      </div>
									    </div>
									  </div>
			                      
			                      <tr style="height: 80px;" class="up">
			                        <td class="u-border-1 u-border-no-left u-border-no-right u-border-palette-5-light-1 u-table-cell" style="font-weight: 700; font-size: 19px; padding: 40px 20px;">비밀번호</td>
			                        <td class="u-border-1 u-border-no-left u-border-no-right u-border-palette-5-light-1 u-table-cell" style="text-align: right; padding: 20px;">
			                          <input type=submit value="변경" style="border: none; border-radius: 14px; padding: 7px 15px; font-size: 13px; cursor: pointer; font-weight: 600;"  v-on:click="modalOpen3()">
			                        </td>
			                      </tr>
			                      
			                      <div class="popup-wrap" :style="{'display' : display3}"> <!-- id="popup"  -->
									    <div class="popup">	
									     <div class="popup-head" style="text-align: right; margin-top: 5px;">	
									          <span class="head-title pop-btn close"  style="margin-right: 3px;"><input type=button value="X" style="border: none; background-color: white; color: black" v-on:click="modalClose3()"></span><!-- id="close" -->
									      </div>
									      <div class="popup-body">	
									        <div class="body-content">
									          <div class="body-contentbox" style="max-height: 300px;">
									            <p> 현재 비밀번호</p>
									            <p style="margin-top: 0px; margin-bottom: 0px;"> <input type="password" v-model="nowpwd" ref="nowpwd" style="width: 100%;"> </p>
									            <p> 새 비밀번호</p>
									            <p style="margin-top: 0px; margin-bottom: 0px;"> <input type="password" v-model="pwd" ref="pwd" style="width: 100%;"> </p>
									          </div>
									        </div>
									      </div>
									      <div class="popup-foot" style="text-align: right;">
									        <span class="pop-btn confirm" id="confirm"><input type=button value="확인" style="margin-right: 30px; background: black; border: none; color: white;" v-on:click="pwdUpdate()"></span>
									      </div>
									    </div>
									  </div>
			                      
			                      <tr style="height: 26px;">
			                        <td class="u-table-cell u-table-cell-7" style="font-weight: 700; font-size: 19px; padding: 40px 20px 0px 20px;">연락처</td>
			                        <td class="u-table-cell" style="text-align: right; padding: 40px 20px 0px 20px;" v-if="vo.tel===null">
			                          <input type=button value="+추가" style="border: none; border-radius: 14px; padding: 7px 15px; font-size: 13px; cursor: pointer; font-weight: 600;" v-on:click="modalOpen2()" >
			                        </td>
			                        <td class="u-table-cell" style="text-align: right; padding: 40px 20px 0px 20px;" v-if="vo.tel!=null">
			                          <input type=button value="변경" style="border: none; border-radius: 14px; padding: 7px 15px; font-size: 13px; cursor: pointer; font-weight: 600;" v-on:click="modalOpen2()" >
			                        </td>
			                      </tr>
			                      <tr style="height: auto;" >
			                        <td class="u-table-cell u-table-cell-9" colspan="2" style="color: darkgray; font-weight: 600; padding: 20px; font-size: 18px;" v-if="vo.tel===null">
			                         	등록된 연락처가 없습니다
			                        </td>
			                        <td class="u-table-cell u-table-cell-9" colspan="2" style="color: black; font-weight: 400; padding: 20px; font-size: 17px;" v-if="vo.tel!=null">
			                         	{{vo.tel}}
			                        </td>
			                      </tr>
			                      
			                      <div class="popup-wrap" :style="{'display' : display2}"> <!-- id="popup"  -->
									    <div class="popup">	
									     <div class="popup-head" style="text-align: right; margin-top: 5px;">	
									          <span class="head-title pop-btn close"  style="margin-right: 3px;"><input type=button value="X" style="border: none; background-color: white; color: black" v-on:click="modalClose2()"></span><!-- id="close" -->
									      </div>
									      <div class="popup-body">	
									        <div class="body-content">
									          <div class="body-contentbox">
									            <p> 연락처</p>
									            <p style="margin-top: 0px; margin-bottom: 0px;"> 
									              <input type="text" v-model="tel1" ref="tel1" style="width: 30%;"> -
									              <input type="text" v-model="tel2" ref="tel2" style="width: 30%;"> -
									              <input type="text" v-model="tel3" ref="tel3" style="width: 30%;">
									              
									            </p>
									          </div>
									        </div>
									      </div>
									      <div class="popup-foot" style="text-align: right;">
									        <span class="pop-btn confirm" id="confirm"><input type=button value="확인" style="margin-right: 30px; background: black; border: none; color: white;" v-on:click="telUpdate()"></span>
									      </div>
									    </div>
									  </div>
			                      
			                      <tr style="height: 25px;">
			                        <td class="u-border-1 u-border-no-left u-border-no-right u-border-palette-5-light-1 u-table-cell u-table-cell-11" style="font-weight: 700; font-size: 19px; padding: 40px 20px;">회원탈퇴</td>
			                        <td class="u-border-1 u-border-no-left u-border-no-right u-border-palette-5-light-1 u-table-cell" style="text-align: right; padding: 20px;">
			                          <input type=button value="탈퇴" style="border: none; border-radius: 14px; padding: 7px 15px; font-size: 13px; cursor: pointer; font-weight: 600;">
			                        </td>
			                      </tr>
			                    </tbody>
			                  </table>
			                </div>
			              </div>
			            </div>
			            <div class="u-container-style u-tab-pane" id="tab-22fd" role="tabpanel" aria-labelledby="link-tab-22fd">
			              <div class="u-container-layout u-container-layout-1">
			                <div class="u-expanded-width u-table u-table-responsive u-table-2">
			                  <table class="u-table-entity">
			                    <colgroup>
			                      <col width="88.5%">
			                      <col width="11.5%">
			                    </colgroup>
			                    <tbody class="u-table-body">
			                      <tr style="height: 25px;">
			                        <td class="u-table-cell u-table-cell-13" style="font-weight: 700; font-size: 19px; padding: 20px;">등록된 결제수단</td>
			                        <td class="u-table-cell" style="text-align: right;" v-if="vo.card_number===null">
			                          <input type=button value="+추가" style="border: none; border-radius: 14px; padding: 7px 15px; font-size: 13px; cursor: pointer; font-weight: 600;" v-on:click="modalOpen4()">
			                        </td>
			                        <td class="u-table-cell" style="text-align: right;" v-if="vo.card_number!=null">
			                          <input type=button value="변경" style="border: none; border-radius: 14px; padding: 7px 15px; font-size: 13px; cursor: pointer; font-weight: 600;" v-on:click="modalOpen4()">
			                        </td>
			                      </tr>
			                      <tr style="height: 45px;">
			                        <td class="u-table-cell u-table-cell-15" colspan=2">
			                          <div class="u-border-1 u-border-palette-5-light-1 u-container-style u-group u-radius-5 u-shape-round u-group-1">
					                    <div class="u-container-layout-3" style="padding: 40px 20px; text-align: center; flex: 1; max-width: 100%; transition-duration: inherit;" v-if="vo.card_number===null">
					                      <img src="../mypage/images/mark.png" style="width: 50px;"><br><br>
					                      	<span style="color: lightgray; font-size: 18px;">
					                      	등록된 결제수단이 없습니다.</br>
					                      	결제 수단을 추가해주세요.
					                      	</span>
					                    </div>
					                    <div class="u-container-layout u-container-layout-3" style="padding: 10px 20px;" v-if="vo.card_number!=null">
					                      <input type=button value="×" style="float: right; border-radius: 15px; padding: 0px 10px; border: none; background-color: white; font-size: 20px; cursor: pointer; height: 20px;">
					                      <table>
					                        <tr>
					                          <td rowspan="2" style="width: 230px; padding-top: 0px;" >
					                            <img :src="'../mypage/images/'+vo.bank_name+'.png'" style="width:200px;">
					                          </td>
					                          <td>
					                            <h6 class="u-text u-text-default u-text-1" style="display: inline;">{{vo.bank_name}}</h6>
					                          </td>
					                        </tr>
					                          <td>
					                            <h6 class="u-text u-text-default u-text-2" style="margin-top:0px; margin-bottom:0px;">{{vo.card_number}} / {{vo.name}} </h6>
					                          </td>
					                        <tr>
					                        </tr>
					                      </table>
					                      <!-- <img src="../mypage/images/국민.png">
					                      <h6 class="u-text u-text-default u-text-1" style="display: inline;">{{vo.bank_name}}</h6>
					                      <h6 class="u-text u-text-default u-text-2">{{vo.card_number}} / {{vo.name}} </h6> -->
					                    </div>
					                  </div>
			                        </td>
			                      </tr>
			                      
			                      <div class="popup-wrap" :style="{'display' : display4}"> <!-- id="popup"  -->
									    <div class="popup">	
									     <div class="popup-head" style="text-align: right; margin-top: 5px;">	
									          <span class="head-title pop-btn close"  style="margin-right: 3px;"><input type=button value="X" style="border: none; background-color: white; color: black" v-on:click="modalClose4()"></span><!-- id="close" -->
									      </div>
									      <div class="popup-body">	
									        <div class="body-content">
									          <div class="body-contentbox" style="max-height: 500px;">
									            <p> 은행 </p>
									            <p style="margin-top: 0px; margin-bottom: 0px;"> 
									              <!-- <input type="text" v-model="bank_name" ref="bank_name" style="width: 100%;"> -->
									              <select v-model="bank_name" style="width: 100%;">
												    <option value="현대카드">현대카드</option>
												    <option value="비씨카드">비씨카드</option>
												    <option value="삼성카드">삼성카드</option>
												    <option value="국민카드">국민카드</option>
												    <option value="하나카드">하나카드</option>
												    <option value="신한카드">신한카드</option>
												    <option value="롯데카드">롯데카드</option>
												  </select>
									            </p>
									            <p> 카드 번호 </p>
									            <p style="margin-top: 0px; margin-bottom: 0px;"> 
									              <input type="text" v-model="cn1" ref="cn1" style="width: 22%;">-
									              <input type="text" v-model="cn2" ref="cn2" style="width: 22%;">-
									              <input type="text" v-model="cn3" ref="cn3" style="width: 22%;">-
									              <input type="text" v-model="cn4" ref="cn4" style="width: 22%;">
									            </p>
									            <p> 카드 유효기간 </p>
									            <p style="margin-top: 0px; margin-bottom: 0px;"> 
									              <input type="month" v-model="card_date" ref="card_date" style="width: 100%;">
									            </p>
									            <p > <span style="width: 50%; ">카드 비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <span style="width: 50%;">생년월일</span></p>
									            <p style="margin-top: 0px; margin-bottom: 0px;"> 
									              <input type="password" v-model="card_pwd" ref="card_pwd" style="width: 49%;" placeholder="앞 2자리 입력">
									              <input type="text" v-model="bday" ref="bday" style="width: 49%;" placeholder="예)980101">
									            </p>
									          </div>
									        </div>
									      </div>
									      <div class="popup-foot" style="text-align: right;">
									        <span class="pop-btn confirm" id="confirm"><input type=button value="확인" style="margin-right: 30px; background: black; border: none; color: white;" v-on:click="cardUpdate()"></span>
									      </div>
									    </div>
									  </div>
			                      
			                    </tbody>
			                  </table>
			                </div>
			                
			              </div>
			            </div>
			            <div class="u-container-style u-tab-pane" id="tab-fd16" role="tabpanel" aria-labelledby="link-tab-fd16">
			              <div class="u-container-layout u-valign-bottom u-container-layout-1">
			                <div class="u-expanded-width u-table u-table-responsive u-table-3">
			                  <table class="u-table-entity">
			                    <colgroup>
			                      <col width="88.5%">
			                      <col width="11.5%">
			                    </colgroup>
			                    <tbody class="u-table-body">
			                      <tr style="height: 25px;">
			                        <td class="u-table-cell u-table-cell-17" style="font-weight: 700; font-size: 19px; padding: 20px;">등록된 배송지</td>
			                        <td class="u-table-cell" style="text-align: right;" v-if="vo.zipcode===null">
			                          <input type=button value="+추가" style="border: none; border-radius: 14px; padding: 7px 15px; font-size: 13px; cursor: pointer; font-weight: 600;">
			                        </td>
			                        <td class="u-table-cell" style="text-align: right;" v-if="vo.zipcode!=null">
			                          <input type=button value="변경" style="border: none; border-radius: 14px; padding: 7px 15px; font-size: 13px; cursor: pointer; font-weight: 600;">
			                        </td>
			                      </tr>
			                      <tr style="height: 45px;">
			                        <td class="u-table-cell u-table-cell-19" colspan="2">
			                          <div class="u-border-1 u-border-palette-5-light-1 u-container-style u-group u-radius-5 u-shape-round u-group-2">
					                    <div class="u-container-layout u-container-layout-5" style="padding: 40px 20px; text-align: center;" v-if="vo.zipcode===null">
					                      <img src="../mypage/images/mark.png" style="width: 50px;"><br><br>
					                      	<span style="color: lightgray; font-size: 18px;">
					                      	등록된 배송지가 없습니다.</br>
					                      	배송지를 추가해주세요.
					                      	</span>
					                    </div>
					                    <div class="u-container-layout u-container-layout-5" style="padding: 10px 20px;" v-if="vo.zipcode!=null">
					                      <input type=button value="×" style="float: right; border-radius: 15px; padding: 0px 10px; border: none; background-color: white; font-size: 20px; cursor: pointer;">
					                      <h6 class="u-text u-text-default u-text-3" style="font-weight: 600; font-size: 19px;">{{vo.name}}</h6>
					                      <h6 class="u-text u-text-default u-text-4" style="font-size: 16px;">[{{vo.zipcode}}] {{vo.addr}}</h6>
					                      <h6 class="u-text u-text-default u-text-5" style="font-size: 16px;">{{vo.tel}}</h6>
					                    </div>
					                  </div>
			                        </td>
			                      </tr>
			                    </tbody>
			                  </table>
			                </div>
			                
			              </div>
			            </div>
			          </div>
			        </div>
			      </div>
              </div>
            </div>
            <div class="u-container-style u-tab-pane u-tab-pane-2" id="tab-db87" role="tabpanel" aria-labelledby="link-tab-db87">
              <div class="u-container-layout u-container-layout-1">
			      <div class="u-align-left u-clearfix u-sheet u-valign-middle u-sheet-1">
			        <div class="u-expanded-width u-tabs u-tabs-1">
			          <ul class="u-tab-list u-unstyled" role="tablist" style="justify-content: left; border-bottom: 1px solid black;">
			            <li class="u-tab-item" role="presentation">
			              <a class="active u-button-style u-tab-link u-text-active-palette-2-base u-text-hover-palette-2-base u-tab-link-1" id="link-tab-8c3e" href="#tab-8c3e" style="font-size: 1.3rem;" role="tab" aria-controls="tab-8c3e" aria-selected="true">올린 프로젝트</a>
			            </li>
			            <li class="u-tab-item" role="presentation">
			              <a class="u-button-style u-tab-link u-text-active-palette-2-base u-text-hover-palette-2-base u-tab-link-2" id="link-tab-22fd" href="#tab-22fd" style="font-size: 1.3rem;" role="tab" aria-controls="tab-22fd" aria-selected="false">후원현황</a>
			            </li>
			            <li class="u-tab-item" role="presentation">
			              <a class="u-button-style u-tab-link u-text-active-palette-2-base u-text-hover-palette-2-base u-tab-link-3" id="link-tab-fd16" href="#tab-fd16" style="font-size: 1.3rem;" role="tab" aria-controls="tab-fd16" aria-selected="false">관심목록</a>
			            </li>
			            <li class="u-tab-item" role="presentation">
			              <a class="u-button-style u-tab-link u-text-hover-palette-2-base u-tab-link-4" id="link-tab-01b9" href="#tab-01b9" style="font-size: 1.3rem;" role="tab" aria-controls="tab-01b9" aria-selected="false">리뷰</a>
			            </li>
			          </ul>
			          <div class="u-tab-content funding">
			            <div class="u-container-style u-tab-active u-tab-pane" id="tab-8c3e" role="tabpanel" aria-labelledby="link-tab-8c3e">
			              <div class="u-container-layout u-valign-bottom u-container-layout-1">
			                <div class="u-expanded-width u-table u-table-responsive u-table-1">
			                  <table class="u-table-entity">
			                    <colgroup>
			                      <col width="100%">
			                    </colgroup>
			                    <tbody class="u-table-body">
			                      <tr style="height: 25px;">
			                        <td class="u-table-cell u-table-cell-1" style="font-weight: 700; font-size: 19px; padding: 20px;" colspan="2">올린 프로젝트 ({{count}})</td>
			                      </tr>
			                      <tr style="height: 45px;" v-for="vo in project_list">
			                        <td class="u-table-cell u-table-cell-3">
			                          <div class="u-expanded-width u-table u-table-responsive u-table-2" style="border: 1px solid darkgray; border-radius: 5px;">
						                  <table class="u-table-entity">
						                    <colgroup>
						                      <col width="20%">
						                      <col width="80%">
						                    </colgroup>
						                    <tbody class="u-table-body">
						                      <tr style="height: 84px;">
						                        <td class="u-table-cell" rowspan="3">
						                          <img :src="vo.img" style="width: 250px;">
						                        </td>
						                        <td class="u-table-cell u-table-cell-6" style="font-size: 18px; font-weight: 700;">{{vo.title}}</td>
						                      </tr>
						                      <tr style="height: 32px;">
						                        <td class="u-table-cell u-table-valign-bottom u-table-cell-9" style="font-size: 14px; font-weight: 500; padding: 0px 10px;" :key="vo.goal_amount">{{vo.goal_amount | comma}}원 목표</td>
						                      </tr>
						                      <tr style="height: 40px;">
						                        <td class="u-table-cell u-table-valign-top u-table-cell-12" style="font-size: 14px; font-weight: 700; color: #db545a; padding-bottom: 20px;">{{vo.close_date}}까지 진행</td>
						                      </tr>
						                    </tbody>
						                  </table>
						                </div>
			                        </td>
			                      </tr>
			                      <tr colspan="2">
			                        <td style="text-align: center;">
				                        <button v-on:click="prev()">이전</button>
										  {{curpage}} page / {{totalpage}} pages
							            <button v-on:click="next()">다음</button>
			                        </td>
			                      </tr>
			                    </tbody>
			                  </table>
			                </div>
			              </div>
			            </div>
			            <div class="u-container-style u-tab-pane" id="tab-22fd" role="tabpanel" aria-labelledby="link-tab-22fd">
			              <div class="u-container-layout u-container-layout-1">
			                <div class="u-expanded-width u-table u-table-responsive u-table-3">
			                  <table class="u-table-entity">
			                    <colgroup>
			                      <col width="100%">
			                    </colgroup>
			                    <tbody class="u-table-body">
			                      <tr style="height: 25px;">
			                        <td class="u-table-cell u-table-cell-14" style="font-weight: 700; font-size: 19px; padding: 20px;" colspan="2">후원 진행 중 ({{count}})</td>
			                      </tr>
			                      <tr style="height: 45px;" v-for="vo in paying_list">
			                        <td class="u-table-cell u-table-cell-16">
			                          <div class="u-expanded-width u-table u-table-responsive u-table-5" style="border: 1px solid darkgray; border-radius: 5px;">
						                  <table class="u-table-entity">
						                    <colgroup>
						                      <col width="20%">
						                      <col width="80%">
						                    </colgroup>
						                    <tbody class="u-table-body">
						                      <tr style="height: 29px;">
						                        <td class="u-table-cell" rowspan="5">
						                          <img :src="vo.img" style="width: 250px;">
						                        </td>
						                        <td class="u-table-cell u-table-valign-bottom u-table-cell-23" style="font-size: 14px; padding: 15px 10px 0px 10px;">후원일 [{{vo.rgdate}}]</td>
						                      </tr>
						                      <tr style="height: 26px;">
						                        <td class="u-table-cell u-table-cell-25" style="font-size: 18px; font-weight: 700; padding-top: 5px;">{{vo.title}}</td>
						                      </tr>
						                      <tr style="height: 28px;">
						                        <td class="u-table-cell u-table-valign-top"><li>영국식 미트파이</li></td>
						                      </tr>
						                      <tr style="height: 27px;">
						                        <td class="u-table-cell u-table-valign-bottom u-table-cell-29" style="font-size: 16px; font-weight: 500; padding: 0px 10px; font-weight: 700; color: gray;" :key="vo.ph_price">{{vo.ph_price | comma}}원 결제 예약</td>
						                      </tr>
						                      <tr style="height: 25px;">
						                        <td class="u-table-cell u-table-valign-top u-text-palette-2-base u-table-cell-31" style="font-size: 14px; font-weight: 700; color: #db545a; padding: 3px 10px 15px 10px;">결제 예정일 {{vo.expect_pay}}</td>
						                      </tr>
						                    </tbody>
						                  </table>
						                </div>
			                        </td>
			                      </tr>
			                    </tbody>
			                  </table>
			                </div>
			                <div class="u-expanded-width u-table u-table-responsive u-table-4">
			                  <table class="u-table-entity">
			                    <colgroup>
			                      <col width="100%">
			                    </colgroup>
			                    <tbody class="u-table-body">
			                      <tr style="height: 25px;">
			                        <td class="u-table-cell u-table-cell-18" style="font-weight: 700; font-size: 19px; padding: 35px 20px 20px 20px;" colspan="2">후원 성공 ({{count}})</td>
			                      </tr>
			                      <tr style="height: 45px;" v-for="vo in payingfin_list">
			                        <td class="u-table-cell u-table-cell-20">
			                          <div class="u-expanded-width u-table u-table-responsive u-table-6" style="border: 1px solid darkgray; border-radius: 5px;">
						                  <table class="u-table-entity">
						                    <colgroup>
						                      <col width="20%">
						                      <col width="80%">
						                    </colgroup>
						                    <tbody class="u-table-body">
						                      <tr style="height: 25px;">
						                        <td class="u-table-cell" rowspan="5">
						                          <img :src="vo.img" style="width: 250px;">
						                        </td>
						                        <td class="u-table-cell u-table-valign-bottom u-table-cell-33" style="font-size: 14px; padding: 15px 10px 0px 10px;">결제완료일 [{{vo.expect_pay}}]</td>
						                      </tr>
						                      <tr style="height: 26px;">
						                        <td class="u-table-cell u-table-cell-35" style="font-size: 18px; font-weight: 700; padding-top: 5px;">{{vo.title}}</td>
						                      </tr>
						                      <tr style="height: 32px;">
						                        <td class="u-table-cell u-table-valign-top"><li>영국식 미트파이</li></td>
						                      </tr>
						                      <tr style="height: 25px;">
						                        <td class="u-table-cell u-table-valign-bottom u-table-cell-39" style="font-size: 16px; font-weight: 500; padding: 0px 10px; font-weight: 700; color: gray;" :key="vo.ph_price">{{vo.ph_price | comma}}원 결제 완료</td>
						                      </tr>
						                      <tr style="height: 26px;">
						                        <td class="u-table-cell u-table-valign-top u-text-palette-2-base u-table-cell-41" style="font-size: 14px; font-weight: 700; color: #db545a; padding: 3px 10px 15px 10px;">선물 예상 전달일 {{vo.dbday}}</td>
						                      </tr>
						                    </tbody>
						                  </table>
						                </div>
			                        </td>
			                      </tr>
			                    </tbody>
			                  </table>
			                </div>
			              </div>
			            </div>
			            <div class="u-container-style u-tab-pane" id="tab-fd16" role="tabpanel" aria-labelledby="link-tab-fd16">
			              <div class="u-container-layout u-valign-bottom u-container-layout-1">
			                <div class="u-expanded-width u-table u-table-responsive u-table-7">
			                  <table class="u-table-entity">
			                    <colgroup>
			                      <col width="100">
			                    </colgroup>
			                    <tbody class="u-table-body">
			                      <tr style="height: 25px;">
			                        <td class="u-table-cell u-table-cell-42" style="font-weight: 700; font-size: 19px; padding: 20px;">관심 프로젝트(1)</td>
			                      </tr>
			                    </tbody>
			                  </table>
			                  <div class="u-repeater u-repeater-1" style="margin-top: 0px; margin: 0px auto; grid-gap: 30px 20px; grid-template-columns: 33.3333% 33.3333% 33.3333%; min-height: 466px; grid-gap: 0px 0px;">
					            <div class="u-container-style u-list-item u-repeater-item" style="width: 350px; height: auto;" v-for="vo in like_list">
					              <div class="u-container-layout u-similar-container u-container-layout-1" style="width: 350px; height: auto;  padding: 9px 10px;">
					                <img alt="" class="u-expanded-width u-image u-image-default u-image-1" :src="vo.img" style="object-fit: fill; height: 305px; margin: 2px 0 0;">
					                <div class="u-clearfix u-group-elements u-group-elements-1" style="width: 100%; min-height: 23px; margin: 19px auto 0 0;">
					                  <p class="" style="width: 100%;  margin-top: 0px; margin-bottom: 5px; font-size: 0.9rem;">&nbsp;{{vo.category}} | {{vo.id}}</p>
					                </div>
					                <h3 class="u-custom-font u-font-open-sans u-text u-text-4" style="height: 54px; width: 100%; font-size: 1.1rem; font-weight: 700; margin: 12px 180px 0 3px;">{{vo.title}}</h3>
					                <div style="height: 5px"></div>
					                <div style="width: 100%" class="info">
					                  <h3 class="u-custom-font u-font-open-sans u-text u-text-palette-2-base u-text-5" style="display: inline; margin: 0px; font-size: 1.125rem; font-weight: 700;"><div class="rate" style="display:inline;" >{{vo.rate}}</div>% &nbsp;</h3>
					                  <h3 class="u-custom-font u-font-open-sans u-text u-text-5" style="display: inline; margin: 0px; color: black; font-weight: 500; font-size: 1.0rem;" :key="vo.now_amount">{{vo.now_amount | comma}}원</h3>
					                  <h3 class="u-custom-font u-font-open-sans u-text u-text-5" style="display: inline; margin: 0px; float: right; color: gray; font-size: 1.0rem; font-weight: 700;">{{vo.left_day}}일 남음</h3>
					                </div>
					                <div style="height: 10px;"></div>
					                <div class="progress">
									  <div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" :style="{'width': vo.rate + '%'}">
									  </div>
									</div>
					              </div>
					            </div>
					          </div>
			                </div>
			              </div>
			            </div>
			            <div class="u-container-style u-tab-pane" id="tab-01b9" role="tabpanel" aria-labelledby="link-tab-01b9">
			              <div class="u-container-layout u-container-layout-5"></div>
			            </div>
			          </div>
			        </div>
			      </div>
              </div>
            </div>
            <div class="u-align-center u-container-style u-tab-pane u-tab-pane-3" id="tab-b22d" role="tabpanel" aria-labelledby="link-tab-b22d">
              <div class="u-container-layout u-container-layout-1">
                <div class="u-align-left u-clearfix u-sheet u-valign-middle u-sheet-1">
			        <div class="u-expanded-width u-tabs u-tabs-1">
			          <ul class="u-tab-list u-unstyled" role="tablist" style="justify-content: left; border-bottom: 1px solid black;">
			            <li class="u-tab-item" role="presentation">
			              <a class="active u-button-style u-tab-link u-text-active-palette-2-base u-text-hover-palette-2-base u-tab-link-1" id="link-tab-8c3e" href="#tab-8c3e" style="font-size: 1.3rem;" role="tab" aria-controls="tab-8c3e" aria-selected="true">장바구니</a>
			            </li>
			            <li class="u-tab-item" role="presentation">
			              <a class="u-button-style u-tab-link u-text-active-palette-2-base u-text-hover-palette-2-base u-tab-link-2" id="link-tab-22fd" href="#tab-22fd" role="tab" style="font-size: 1.3rem;" aria-controls="tab-22fd" aria-selected="false">구매내역</a>
			            </li>
			            <li class="u-tab-item" role="presentation">
			              <a class="u-button-style u-tab-link u-text-hover-palette-2-base u-tab-link-3" id="link-tab-01b9" href="#tab-01b9" style="font-size: 1.3rem;" role="tab" aria-controls="tab-01b9" aria-selected="false">리뷰</a>
			            </li>
			            <li class="u-tab-item" role="presentation">
			              <a class="u-button-style u-tab-link u-text-active-palette-2-base u-text-hover-palette-2-base u-tab-link-4" id="link-tab-a371" href="#tab-a371" style="font-size: 1.3rem;" role="tab" aria-controls="tab-a371" aria-selected="false">최근 본 상품<br>
			              </a>
			            </li>
			          </ul>
			          <div class="u-tab-content">
			            <div class="u-container-style u-tab-active u-tab-pane" id="tab-8c3e" role="tabpanel" aria-labelledby="link-tab-8c3e">
			              <div class="u-container-layout u-container-layout-1">
			                <div class="u-expanded-width u-table u-table-responsive u-table-1">
			                  <table class="u-table-entity">
			                    <colgroup>
			                      <col width="100%">
			                    </colgroup>
			                    <tbody class="u-table-body">
			                      <tr style="height: 25px;">
			                        <td class="u-table-cell u-table-cell-1" style="font-weight: 700; font-size: 19px; padding: 20px;">장바구니 [1]</td>
			                      </tr>
			                      <tr style="height: 45px;">
			                        <td class="u-table-cell u-table-cell-3">
			                          <div class="u-expanded-width u-table u-table-responsive u-table-2">
						                  <table class="u-table-entity">
						                    <colgroup>
						                      <col width="4.5%">
						                      <col width="61%">
						                      <col width="14.9%">
						                      <col width="11.3%">
						                      <col width="8.3%">
						                    </colgroup>
						                    <tbody class="u-table-body">
						                      <tr style="height: 50px; border: 1px solid lightgray;">
						                        <td class="u-table-cell u-table-cell-5"></td>
						                        <td class="u-align-center u-table-cell u-table-cell-6" style="font-weight: 700; font-size: 14px;">상품명</td>
						                        <td class="u-align-center u-table-cell u-table-cell-7" style="font-weight: 700; font-size: 14px;">판매가</td>
						                        <td class="u-align-center u-table-cell u-table-cell-8" style="font-weight: 700; font-size: 14px;">수량</td>
						                        <td class="u-align-center u-table-cell u-table-cell-9" style="font-weight: 700; font-size: 14px;">주문 관리</td>
						                      </tr>
						                      <tr style="height: 32px; border: 1px solid lightgray;">
						                        <td class="u-table-cell u-table-valign-middle u-table-cell-10" style="text-align: center;">
						                          <input type="checkbox">
						                        </td>
						                        <td class="u-table-cell u-table-valign-middle u-table-cell-11">
						                          <div class="u-expanded-width u-table u-table-responsive u-table-3">
									                  <table class="u-table-entity">
									                    <colgroup>
									                      <col width="10.2%">
									                      <col width="89.8%">
									                    </colgroup>
									                    <tbody class="u-table-body">
									                      <tr style="height: 46px;">
									                        <td class="u-table-cell u-table-cell-15" rowspan="2">
									                          <img alt="" src="">
									                        </td>
									                        <td class="u-table-cell u-table-cell-16" style="font-size: 14px; padding: 10px 10px 0px;">[어디어디 주식회사]&nbsp;<br>
									                        </td>
									                      </tr>
									                      <tr style="height: 46px;">
									                        <td class="u-table-cell u-table-cell-18" style="font-size: 18px; font-weight: 700; padding: 0px 10px 10px 10px">라미 2000 만년필 브라운 한정판</td>
									                      </tr>
									                    </tbody>
									                  </table>
									                </div>
						                        </td>
						                        <td class="u-align-center u-table-cell u-table-valign-middle u-table-cell-12">40,000원</td>
						                        <td class="u-table-cell u-table-valign-middle u-table-cell-13" style="text-align: center;">
						                          <input type="button" value="－" style="border: none; cursor: pointer;">
						                          &nbsp;1&nbsp;
						                          <input type="button" value="＋" style="border: none; cursor: pointer;">
						                        </td>
						                        <td class="u-table-cell u-table-valign-middle u-table-cell-14" style="text-align: center;">
						                          <input type=button value="삭제" style="cursor: pointer; border: 1px solid #b9c1cc; color: black; background-color: white; font-size: 14px;">
						                        </td>
						                      </tr>
						                      <tr style="height: 50px; border: 1px solid lightgray;">
						                        <td class="u-align-center u-table-cell u-table-cell-5" colspan="5" style="font-size: 16px; font-weight: 700; text-align: right; padding: 10px 30px;">총 주문 금액&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp; <span style="color: red; font-size: 20px; font-weight: 700;">140,000원</span></td>
						                      </tr>
						                      <tr style="height: 50px; border: none;">
						                        <td class="u-align-right u-table-cell u-table-cell-5" colspan="5" style="">
						                          <input type="button" value="주문하기" style="cursor: pointer; font-size: 18px; background-color: black; color: white; border: none; padding: 8px 10px;">
						                        </td>
						                      </tr>
						                    </tbody>
						                  </table>
						                </div>
			                        </td>
			                      </tr>
			                    </tbody>
			                  </table>
			                </div>
			              </div>
			            </div>
			            <div class="u-container-style u-tab-pane" id="tab-22fd" role="tabpanel" aria-labelledby="link-tab-22fd">
			              <div class="u-container-layout u-container-layout-1">
							<div class="u-expanded-width u-table u-table-responsive u-table-1">
			                  <table class="u-table-entity">
			                    <colgroup>
			                      <col width="100%">
			                    </colgroup>
			                    <tbody class="u-table-body">
			                      <tr style="height: 25px;">
			                        <td class="u-table-cell u-table-cell-1" style="font-weight: 700; font-size: 19px; padding: 20px;">구매내역 [1]</td>
			                      </tr>
			                      <tr style="height: 45px;">
			                        <td class="u-table-cell u-table-cell-3">
			                          <div class="u-expanded-width u-table u-table-responsive u-table-2">
						                  <table class="u-table-entity">
						                    <colgroup>
						                      <col width="55%">
						                      <col width="15%">
						                      <col width="10%">
						                      <col width="10%">
						                      <col width="10%">
						                    </colgroup>
						                    <tbody class="u-table-body">
						                      <tr style="height: 50px; border: 1px solid lightgray;">
						                        <td class="u-align-center u-table-cell u-table-cell-5" style="font-weight: 700; font-size: 14px;">상품명</td>
						                        <td class="u-align-center u-table-cell u-table-cell-6" style="font-weight: 700; font-size: 14px;">주문일자</td>
						                        <td class="u-align-center u-table-cell u-table-cell-7" style="font-weight: 700; font-size: 14px;">주문금액</td>
						                        <td class="u-align-center u-table-cell u-table-cell-8" style="font-weight: 700; font-size: 14px;">수량</td>
						                        <td class="u-align-center u-table-cell u-table-cell-9" style="font-weight: 700; font-size: 14px;">리뷰 작성</td>
						                      </tr>
						                      <tr style="height: 32px; border: 1px solid lightgray;">
						                        <td class="u-table-cell u-table-valign-middle u-table-cell-10">
						                          <div class="u-expanded-width u-table u-table-responsive u-table-3">
									                  <table class="u-table-entity">
									                    <colgroup>
									                      <col width="10.2%">
									                      <col width="89.8%">
									                    </colgroup>
									                    <tbody class="u-table-body">
									                      <tr style="height: 46px;">
									                        <td class="u-table-cell u-table-cell-15" rowspan="2">
									                          <img alt="" src="">
									                        </td>
									                        <td class="u-table-cell u-table-cell-16" style="font-size: 14px; padding: 10px 10px 0px;">[어디어디 주식회사]&nbsp;<br>
									                        </td>
									                      </tr>
									                      <tr style="height: 46px;">
									                        <td class="u-table-cell u-table-cell-18" style="font-size: 18px; font-weight: 700; padding: 0px 10px 10px 10px">라미 2000 만년필 브라운 한정판</td>
									                      </tr>
									                    </tbody>
									                  </table>
									                </div>
						                        </td>
						                        <td class="u-table-cell u-table-valign-middle u-table-cell-11" style="text-align: center">2022.09.23</td>
						                        <td class="u-align-center u-table-cell u-table-valign-middle u-table-cell-12">40,000원</td>
						                        <td class="u-table-cell u-table-valign-middle u-table-cell-13" style="text-align: center"> 1개 </td>
						                        <td class="u-table-cell u-table-valign-middle u-table-cell-14" style="text-align: center;">
						                          <input type=button value="리뷰" style="cursor: pointer; border: 1px solid #b9c1cc; color: black; background-color: white; font-size: 14px;">
						                        </td>
						                      </tr>
						                    </tbody>
						                  </table>
						                </div>
			                        </td>
			                      </tr>
			                    </tbody>
			                  </table>
			                </div>			              
			              </div>
			            </div>
			            <div class="u-container-style u-tab-pane" id="tab-01b9" role="tabpanel" aria-labelledby="link-tab-01b9">
			              <div class="u-container-layout u-container-layout-3"></div>
			            </div>
			            <div class="u-container-style u-tab-pane" id="tab-a371" role="tabpanel" aria-labelledby="link-tab-a371">
			              <div class="u-container-layout u-container-layout-1">
					       <div class="u-expanded-width u-table u-table-responsive u-table-7">
			                  <table class="u-table-entity">
			                    <colgroup>
			                      <col width="100">
			                    </colgroup>
			                    <tbody class="u-table-body">
			                      <tr style="height: 25px;">
			                        <td class="u-table-cell u-table-cell-42" style="font-weight: 700; font-size: 19px; padding: 20px;">최근 본 목록</td>
			                      </tr>
			                    </tbody>
			                  </table>
			                  <div class="u-repeater u-repeater-1" style="margin-top: 0px; margin: 0px auto; grid-gap: 30px 20px; grid-template-columns: 33.3333% 33.3333% 33.3333%; min-height: 466px; grid-gap: 0px 0px;">
					            <div class="u-container-style u-list-item u-repeater-item" style="width: 350px; height: auto;">
					              <div class="u-container-layout u-similar-container u-container-layout-1" style="width: 350px; height: auto;  padding: 9px 10px;">
							          <a href="#"><img src="" width="320" height="230" alt=""></a><p>
							            <figcaption style="display:block; margin:0; padding:0;">  
							              <a href="#"><h2 style="font-style: regular; color: black; font-size: 12pt; font-weight: bold">라미 2000 만년필 브라운 한정판</h2></a><p>
							              <div style="font-size: 9pt">123</div><p>
							              <a href="#" style="color:black; font-size: 14pt">140,000원</a><p>
							              
							              	  <p>
								              <img src="../images/star.png" width="18px" height="18px"><span style="color: #FF8C00; font-size: 13pt;">9.8</span>
								              <span style="float: right">
							              
							              <img src="../images/person.png" width="15px" height="15px"><span style="color: grey; font-size: 10pt">123명 참여</span></span>
							            
							              <div style="height:40px"></div>
							            </figcaption>  
					              </div>
					            </div>
					          </div>
			                </div>
					       	 
			              </div>
			            </div>
			          </div>
			        </div>
			      </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <script>
    new Vue({
    	el:'.profile',
    	data:{
    		vo:{},
    		id:'${id}',
    		display:'', display2:'', display3:'', display4:'',
    		email:'',
    		tel1:'', tel2:'', tel3:'',
    		nowpwd:'', pwd:'',
    		res:'',
    		bank_name:'', cn1:'', cn2:'', cn3:'', cn4:'', card_date:'', card_pwd:'', bday:''
    	},
    	mounted:function(){
    		let _this=this;
    		_this.display='none';
    		_this.display2='none';
    		_this.display3='none';
    		_this.display4='none';
    		axios.get("http://localhost:8080/web/mypage/profile.do",{
    			params:{
    				id:_this.id
    			}
    		}).then(function(result){
    			_this.vo=result.data;
    			console.log(result.data);
    		})
    	},
    	methods:{
    		modalOpen:function(){
    			let _this=this;
    			_this.display= 'flex';
    		},
    		modalOpen2:function(){
    			let _this=this;
    			_this.display2= 'flex';
    		},
    		modalOpen3:function(){
    			let _this=this;
    			_this.display3= 'flex';
    		},
    		modalOpen4:function(){
    			let _this=this;
    			_this.display4= 'flex';
    		},
    		modalClose:function(){
    			let _this=this;
    			_this.display= 'none';
    		},
    		modalClose2:function(){
    			let _this=this;
    			_this.display2= 'none';
    		},
    		modalClose3:function(){
    			let _this=this;
    			_this.display3= 'none';
    		},
    		modalClose4:function(){
    			let _this=this;
    			_this.display4= 'none';
    		},
    		emailUpdate:function(){
    			let _this=this;
    			if(_this.email.trim()==""){
    				_this.$refs.email.focus();
    				retrun;
    			}
    			axios.get("http://localhost:8080/web/user/email_update.do",{
    				params:{
    					email:_this.email,
    					id:'${id}'
    				}
    			}).then(function(result){
    				location.href="../mypage/mypage.do"
    			})
    		},
    		telUpdate:function(){
    			let _this=this;
    			if(_this.tel1.trim()==""){
    				_this.$refs.tel1.focus();
    				retrun;
    			} 
    			if(_this.tel2.trim()==""){
    				_this.$refs.tel2.focus();
    				retrun;
    			} 
    			if(_this.tel3.trim()==""){
    				_this.$refs.tel3.focus();
    				retrun;
    			} 
    			axios.get("http://localhost:8080/web/user/tel_update.do",{
    				params:{
    					tel1:_this.tel1,
    					tel2:_this.tel2,
    					tel3:_this.tel3,
    					id:'${id}'
    				}
    			}).then(function(result){
    				location.href="../mypage/mypage.do"
    			})
    		},
    		pwdUpdate:function(){
    			let _this=this;
    			if(_this.pwd.trim()==""){
    				_this.$refs.pwd.focus();
    				retrun;
    			}
    			if(_this.nowpwd.trim()==""){
    				_this.$refs.nowpwd.focus();
    				retrun;
    			}
    			axios.get("http://localhost:8080/web/user/pwd_update.do",{
    				params:{
    					pwd:_this.pwd,
    					nowpwd:_this.nowpwd,
    					id:'${id}'
    				}
    			}).then(function(result){
    				_this.res=result.data;
    				if(_this.res==='yes'){
    					location.href="../mypage/mypage.do"
    				} else {
    					alert("비밀번호가 틀렸습니다");
    					_this.nowpwd="";
    					_this.pwd="";
    					_this.$refs.nowpwd.focus();
    				}
    			})
    		},
    		cardUpdate:function(){
    			let _this=this;
    			if(_this.bank_name.trim()==""){
    				_this.$refs.bank_name.focus();
    				retrun;
    			} 
    			if(_this.cn1.trim()==""){
    				_this.$refs.cn1.focus();
    				retrun;
    			} 
    			if(_this.cn2.trim()==""){
    				_this.$refs.cn2.focus();
    				retrun;
    			} 
    			if(_this.cn3.trim()==""){
    				_this.$refs.cn3.focus();
    				retrun;
    			} 
    			if(_this.cn4.trim()==""){
    				_this.$refs.cn4.focus();
    				retrun;
    			} 
    			if(_this.card_date.trim()==""){
    				_this.$refs.card_date.focus();
    				retrun;
    			} 
    			if(_this.card_pwd.trim()==""){
    				_this.$refs.card_pwd.focus();
    				retrun;
    			} 
    			if(_this.bday.trim()==""){
    				_this.$refs.bday.focus();
    				retrun;
    			} 
    			axios.get("http://localhost:8080/web/user/card_update.do",{
    				params:{
    					bank_name:_this.bank_name,
    					cn1:_this.cn1,
    					cn2:_this.cn2,
    					cn3:_this.cn3,
    					cn4:_this.cn4,
    					card_date:_this.card_date,
    					card_pwd:_this.card_pwd,
    					bday:_this.bday,
    					id:'${id}'
    				}
    			}).then(function(result){
    				location.href="../mypage/mypage.do"
    			})
    		}
    	}
      })
   
      new Vue({
    	 el:'.funding',
    	 data:{
    		 project_list:[],
    		 paying_list:[],
    		 payingfin_list:[],
    		 like_list:[],
    		 project_detail:{},
    		 user_no:${user_no},
    		 curpage:1,
    		 totalpage:0,
    		 count:0
    	 },
    	 mounted:function(){
    		 this.send();
    		 this.send2();
    		 this.send3();
    		 this.send4();
    	 },
    	 methods:{
    		 send:function(){
    			 let _this=this;
        		 axios.get("http://localhost:8080/web/mypage/project.do",{
        			 params:{
        				 page:_this.curpage,
        				 user_no:_this.user_no
        			 }
        		 }).then(function(result){
        			 _this.project_list=result.data;
        			 _this.curpage=result.data[0].curpage;
        			 _this.totalpage=result.data[0].totalpage;
        			 _this.count=result.data[0].count;
        			 console.log(result.data);
        		 }) 
    		 },
    		 send2:function(){
    			let _this=this;
    			axios.get("http://localhost:8080/web/mypage/paying.do",{
    				params:{
    					user_no:_this.user_no
    				}
    			}).then(function(result){
    				_this.paying_list=result.data;
    				_this.count=result.data[0].count;
    				console.log(result.data);
    			})
    		 },
    		 send3:function(){
    			let _this=this;
    			axios.get("http://localhost:8080/web/mypage/payingfin.do",{
    				params:{
    					user_no:_this.user_no
    				}
    			}).then(function(result){
    				_this.payingfin_list=result.data;
    				_this.count=result.data[0].count;
    				console.log(result.data);
    			})
    		 },
    		 send4:function(){
    			let _this=this;
    			axios.get("http://localhost:8080/web/mypage/like.do",{
    				params:{
    					user_no:_this.user_no
    				}
    			}).then(function(result){
    				_this.like_list=result.data;
    				console.log(result.data);
    			})
    		 },
    		 prev:function(){
 				this.curpage=this.curpage>1 ? this.curpage-1:this.curpage;
 				this.send();
 			},
 			next:function(){
 				this.curpage=this.curpage<this.totalpage ? this.curpage+1:this.curpage;
 				this.send(); 
 			}
    	 },
    	 filters:{
    		 comma(val){
    			 return String(val).replace(/\B(?=(\d{3})+(?!\d))/g, ',')
    		 }
    	 }
     }) 
    
    /* new Vue({
    	el:'.profile',
    	data:{
    		display:'none'
    	},
    	mounted:function(){
    		let _this=this;
    		_this.display:'none';
    	},
    	methods:{
    		modalOpen:function(){
    			let _this=this;
    			_this.display: 'flex';
    		}
    	}
    }) */
    </script>
</body>
</html>