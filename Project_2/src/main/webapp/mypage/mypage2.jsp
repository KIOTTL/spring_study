<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</style>
</head>
<body class="u-body u-xl-mode" data-lang="en">
    <section class="u-align-center u-clearfix u-section-1" id="sec-992d">
      <div class="u-clearfix u-sheet u-valign-middle u-sheet-1" style="margin-top: 30px;">
        <div class="u-expanded-width u-tab-links-align-center u-tabs u-tabs-1">
          <ul class="u-border-1 u-border-no-left u-border-no-right u-border-no-top u-border-palette-5-light-1 u-spacing-10 u-tab-list u-unstyled" role="tablist" style="border: none;">
            <li class="u-tab-item" role="presentation">
              <a class="active u-button-style u-tab-link u-text-active-palette-5-dark-3 u-text-hover-palette-5-dark-3 u-text-palette-5-light-1 u-tab-link-1 tab" id="link-tab-62f5" href="#tab-62f5" role="tab" aria-controls="tab-62f5" aria-selected="true">?????????</a>
            </li>
            <li class="u-tab-item" role="presentation">
              <a class="u-button-style u-tab-link u-text-active-palette-5-dark-3 u-text-hover-palette-5-dark-3 u-text-palette-5-light-1 u-tab-link-2 tab" id="link-tab-db87" href="#tab-db87" role="tab" aria-controls="tab-db87" aria-selected="false">??????</a>
            </li>
            <li class="u-tab-item" role="presentation">
              <a class="u-button-style u-tab-link u-text-active-palette-5-dark-3 u-text-hover-palette-5-dark-3 u-text-palette-5-light-1 u-tab-link-3 tab" id="link-tab-b22d" href="#tab-b22d" role="tab" aria-controls="tab-b22d" aria-selected="false">?????????</a>
            </li>
          </ul>
          <div class="u-tab-content">
            <div class="u-align-center u-container-style u-tab-active u-tab-pane u-tab-pane-1" id="tab-62f5" role="tabpanel" aria-labelledby="link-tab-62f5">
              <div class="u-container-layout u-container-layout-1">
                <div class="u-align-left u-clearfix u-sheet u-valign-middle u-sheet-1">
			        <div class="u-expanded-width u-tabs u-tabs-1">
			          <ul class="u-tab-list u-unstyled" role="tablist" style="justify-content: left; border-bottom: 1px solid black;">
			            <li class="u-tab-item" role="presentation">
			              <a class="active u-button-style u-tab-link u-text-active-palette-2-base u-text-hover-palette-2-base u-tab-link-1 tab1" id="link-tab-8c3e" href="#tab-8c3e" style="font-size: 1.3rem;" role="tab" aria-controls="tab-8c3e" aria-selected="true">??????</a>
			            </li>
			            <li class="u-tab-item" role="presentation">
			              <a class="u-button-style u-tab-link u-text-active-palette-2-base u-text-hover-palette-2-base u-tab-link-2 tab1" id="link-tab-22fd" href="#tab-22fd" style="font-size: 1.3rem;" role="tab" aria-controls="tab-22fd" aria-selected="false">????????????</a>
			            </li>
			            <li class="u-tab-item" role="presentation">
			              <a class="u-button-style u-tab-link u-text-active-palette-2-base u-text-hover-palette-2-base u-tab-link-3 tab1" id="link-tab-fd16" href="#tab-fd16" style="font-size: 1.3rem;" role="tab" aria-controls="tab-fd16" aria-selected="false">?????????</a>
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
			                        <td class="u-table-cell" colspan="2" style="font-weight: 700; font-size: 19px; padding: 40px 20px 0px 20px;">??????</td>
			                      </tr>
			                      <tr style="height: auto;">
			                        <td class="u-table-cell" colspan="2" style="color: black; font-weight: 400; padding: 20px; font-size: 17px;">
			                          	{{vo.name}}
			                        </td>
			                      </tr>
			                      <tr style="height: 31px;">
			                        <td class="u-border-1 u-border-no-left u-border-no-right u-border-no-bottom u-border-palette-5-light-1 u-table-cell" style="font-weight: 700; font-size: 19px; padding: 40px 20px 0px 20px;">?????????</td>
			                        <td class="u-border-1 u-border-no-left u-border-no-right u-border-no-bottom u-border-palette-5-light-1 u-table-cell" style="text-align: right; padding: 40px 20px 0px 20px;">
			                          <input type=button value="??????" style="border: none; border-radius: 14px; padding: 7px 15px; font-size: 13px; cursor: pointer; font-weight: 600;">
			                        </td>
			                      </tr>
			                      <tr style="height: auto;">
			                        <td class="u-table-cell" colspan="2" style="color: darkgray; font-weight: 600; padding: 20px; font-size: 18px;" v-if="vo.email===null">
			                          	????????? ???????????? ????????????
			                        </td>
			                        <td class="u-table-cell" colspan="2" style="color: black; font-weight: 400; padding: 20px; font-size: 17px;" v-if="vo.email!=null">
			                          	{{vo.email}}
			                        </td>
			                      </tr>
			                      <tr style="height: 80px;" class="up">
			                        <td class="u-border-1 u-border-no-left u-border-no-right u-border-palette-5-light-1 u-table-cell" style="font-weight: 700; font-size: 19px; padding: 40px 20px;">????????????</td>
			                        <td class="u-border-1 u-border-no-left u-border-no-right u-border-palette-5-light-1 u-table-cell" style="text-align: right; padding: 20px;">
			                          <input type=submit value="??????" style="border: none; border-radius: 14px; padding: 7px 15px; font-size: 13px; cursor: pointer; font-weight: 600;">
			                        </td>
			                      </tr>
			                      <tr style="height: 26px;">
			                        <td class="u-table-cell u-table-cell-7" style="font-weight: 700; font-size: 19px; padding: 40px 20px 0px 20px;">?????????</td>
			                        <td class="u-table-cell" style="text-align: right; padding: 40px 20px 0px 20px;">
			                          <input type=button value="??????" style="border: none; border-radius: 14px; padding: 7px 15px; font-size: 13px; cursor: pointer; font-weight: 600;">
			                        </td>
			                      </tr>
			                      <tr style="height: auto;" >
			                        <td class="u-table-cell u-table-cell-9" colspan="2" style="color: darkgray; font-weight: 600; padding: 20px; font-size: 18px;" v-if="vo.tel===null">
			                         	????????? ???????????? ????????????
			                        </td>
			                        <td class="u-table-cell u-table-cell-9" colspan="2" style="color: black; font-weight: 400; padding: 20px; font-size: 17px;" v-if="vo.tel!=null">
			                         	{{vo.tel}}
			                        </td>
			                      </tr>
			                      <tr style="height: 25px;">
			                        <td class="u-border-1 u-border-no-left u-border-no-right u-border-palette-5-light-1 u-table-cell u-table-cell-11" style="font-weight: 700; font-size: 19px; padding: 40px 20px;">????????????</td>
			                        <td class="u-border-1 u-border-no-left u-border-no-right u-border-palette-5-light-1 u-table-cell" style="text-align: right; padding: 20px;">
			                          <input type=button value="??????" style="border: none; border-radius: 14px; padding: 7px 15px; font-size: 13px; cursor: pointer; font-weight: 600;">
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
			                        <td class="u-table-cell u-table-cell-13" style="font-weight: 700; font-size: 19px; padding: 20px;">????????? ????????????</td>
			                        <td class="u-table-cell" style="text-align: right;" v-if="vo.card_number===null">
			                          <input type=button value="+??????" style="border: none; border-radius: 14px; padding: 7px 15px; font-size: 13px; cursor: pointer; font-weight: 600;">
			                        </td>
			                        <td class="u-table-cell" style="text-align: right;" v-if="vo.card_number!=null">
			                          <input type=button value="??????" style="border: none; border-radius: 14px; padding: 7px 15px; font-size: 13px; cursor: pointer; font-weight: 600;">
			                        </td>
			                      </tr>
			                      <tr style="height: 45px;">
			                        <td class="u-table-cell u-table-cell-15" colspan=2">
			                          <div class="u-border-1 u-border-palette-5-light-1 u-container-style u-group u-radius-5 u-shape-round u-group-1">
					                    <div class="u-container-layout u-container-layout-3" style="padding: 40px 20px; text-align: center;" v-if="vo.card_number===null">
					                      <img src="../mypage/images/mark.png" style="width: 50px;"><br><br>
					                      	<span style="color: lightgray; font-size: 18px;">
					                      	????????? ??????????????? ????????????.</br>
					                      	?????? ????????? ??????????????????.
					                      	</span>
					                    </div>
					                    <div class="u-container-layout u-container-layout-3" style="padding: 10px 20px;" v-if="vo.card_number!=null">
					                      <input type=button value="??" style="float: right; border-radius: 15px; padding: 0px 10px; border: none; background-color: white; font-size: 20px; cursor: pointer;">
					                      <h6 class="u-text u-text-default u-text-1">{{vo.bank_name}}</h6>
					                      <h6 class="u-text u-text-default u-text-2">{{vo.card_number}} / {{vo.name}} </h6>
					                    </div>
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
			                <div class="u-expanded-width u-table u-table-responsive u-table-3">
			                  <table class="u-table-entity">
			                    <colgroup>
			                      <col width="88.5%">
			                      <col width="11.5%">
			                    </colgroup>
			                    <tbody class="u-table-body">
			                      <tr style="height: 25px;">
			                        <td class="u-table-cell u-table-cell-17" style="font-weight: 700; font-size: 19px; padding: 20px;">????????? ?????????</td>
			                        <td class="u-table-cell" style="text-align: right;" v-if="vo.zipcode===null">
			                          <input type=button value="+??????" style="border: none; border-radius: 14px; padding: 7px 15px; font-size: 13px; cursor: pointer; font-weight: 600;">
			                        </td>
			                        <td class="u-table-cell" style="text-align: right;" v-if="vo.zipcode!=null">
			                          <input type=button value="??????" style="border: none; border-radius: 14px; padding: 7px 15px; font-size: 13px; cursor: pointer; font-weight: 600;">
			                        </td>
			                      </tr>
			                      <tr style="height: 45px;">
			                        <td class="u-table-cell u-table-cell-19" colspan="2">
			                          <div class="u-border-1 u-border-palette-5-light-1 u-container-style u-group u-radius-5 u-shape-round u-group-2">
					                    <div class="u-container-layout u-container-layout-5" style="padding: 40px 20px; text-align: center;" v-if="vo.zipcode===null">
					                      <img src="../mypage/images/mark.png" style="width: 50px;"><br><br>
					                      	<span style="color: lightgray; font-size: 18px;">
					                      	????????? ???????????? ????????????.</br>
					                      	???????????? ??????????????????.
					                      	</span>
					                    </div>
					                    <div class="u-container-layout u-container-layout-5" style="padding: 10px 20px;" v-if="vo.zipcode!=null">
					                      <input type=button value="??" style="float: right; border-radius: 15px; padding: 0px 10px; border: none; background-color: white; font-size: 20px; cursor: pointer;">
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
            <div class="u-container-style u-tab-pane u-tab-pane-2" id="tab-db87" role="tabpanel" aria-labelledby="link-tab-db87" v-on:click="fund()">
              <div class="u-container-layout u-container-layout-1">
			      <div class="u-align-left u-clearfix u-sheet u-valign-middle u-sheet-1">
			        <div class="u-expanded-width u-tabs u-tabs-1">
			          <ul class="u-tab-list u-unstyled" role="tablist" style="justify-content: left; border-bottom: 1px solid black;">
			            <li class="u-tab-item" role="presentation">
			              <a class="active u-button-style u-tab-link u-text-active-palette-2-base u-text-hover-palette-2-base u-tab-link-1" id="link-tab-8c3e" href="#tab-8c3e" style="font-size: 1.3rem;" role="tab" aria-controls="tab-8c3e" aria-selected="true">?????? ????????????</a>
			            </li>
			            <li class="u-tab-item" role="presentation">
			              <a class="u-button-style u-tab-link u-text-active-palette-2-base u-text-hover-palette-2-base u-tab-link-2" id="link-tab-22fd" href="#tab-22fd" style="font-size: 1.3rem;" role="tab" aria-controls="tab-22fd" aria-selected="false">????????????</a>
			            </li>
			            <li class="u-tab-item" role="presentation">
			              <a class="u-button-style u-tab-link u-text-active-palette-2-base u-text-hover-palette-2-base u-tab-link-3" id="link-tab-fd16" href="#tab-fd16" style="font-size: 1.3rem;" role="tab" aria-controls="tab-fd16" aria-selected="false">????????????</a>
			            </li>
			            <li class="u-tab-item" role="presentation">
			              <a class="u-button-style u-tab-link u-text-hover-palette-2-base u-tab-link-4" id="link-tab-01b9" href="#tab-01b9" style="font-size: 1.3rem;" role="tab" aria-controls="tab-01b9" aria-selected="false">??????</a>
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
			                        <td class="u-table-cell u-table-cell-1" style="font-weight: 700; font-size: 19px; padding: 20px;" colspan="2">?????? ???????????? (1)</td>
			                      </tr>
			                      <tr style="height: 45px;" v-for="">
			                        <td class="u-table-cell u-table-cell-3">
			                          <div class="u-expanded-width u-table u-table-responsive u-table-2" style="border: 1px solid darkgray; border-radius: 5px;">
						                  <table class="u-table-entity">
						                    <colgroup>
						                      <col width="20%">
						                      <col width="80%">
						                    </colgroup>
						                    <tbody class="u-table-body">
						                      <tr style="height: 84px;">
						                        <td class="u-table-cell" rowspan="3"></td>
						                        <td class="u-table-cell u-table-cell-6" style="font-size: 18px; font-weight: 700;">No ?????????! ????????? ?????? &lt;????????? ????????? ????????????&gt;</td>
						                      </tr>
						                      <tr style="height: 32px;">
						                        <td class="u-table-cell u-table-valign-bottom u-table-cell-9" style="font-size: 14px; font-weight: 500; padding: 0px 10px;">1,000,000??? ??????</td>
						                      </tr>
						                      <tr style="height: 40px;">
						                        <td class="u-table-cell u-table-valign-top u-table-cell-12" style="font-size: 14px; font-weight: 700; color: #db545a; padding-bottom: 20px;">2022.09.22?????? ??????</td>
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
			                <div class="u-expanded-width u-table u-table-responsive u-table-3">
			                  <table class="u-table-entity">
			                    <colgroup>
			                      <col width="100%">
			                    </colgroup>
			                    <tbody class="u-table-body">
			                      <tr style="height: 25px;">
			                        <td class="u-table-cell u-table-cell-14" style="font-weight: 700; font-size: 19px; padding: 20px;" colspan="2">?????? ?????? ??? (1)</td>
			                      </tr>
			                      <tr style="height: 45px;">
			                        <td class="u-table-cell u-table-cell-16">
			                          <div class="u-expanded-width u-table u-table-responsive u-table-5" style="border: 1px solid darkgray; border-radius: 5px;">
						                  <table class="u-table-entity">
						                    <colgroup>
						                      <col width="20%">
						                      <col width="80%">
						                    </colgroup>
						                    <tbody class="u-table-body">
						                      <tr style="height: 29px;">
						                        <td class="u-table-cell" rowspan="5"></td>
						                        <td class="u-table-cell u-table-valign-bottom u-table-cell-23" style="font-size: 14px; padding: 15px 10px 0px 10px;">????????? [2022.09.22]</td>
						                      </tr>
						                      <tr style="height: 26px;">
						                        <td class="u-table-cell u-table-cell-25" style="font-size: 18px; font-weight: 700; padding-top: 5px;">No ?????????! ????????? ?????? &lt;????????? ????????? ????????????&gt;</td>
						                      </tr>
						                      <tr style="height: 28px;">
						                        <td class="u-table-cell u-table-valign-top"><li>????????? ????????????</li></td>
						                      </tr>
						                      <tr style="height: 27px;">
						                        <td class="u-table-cell u-table-valign-bottom u-table-cell-29" style="font-size: 16px; font-weight: 500; padding: 0px 10px; font-weight: 700; color: gray;">40,000??? ?????? ??????</td>
						                      </tr>
						                      <tr style="height: 25px;">
						                        <td class="u-table-cell u-table-valign-top u-text-palette-2-base u-table-cell-31" style="font-size: 14px; font-weight: 700; color: #db545a; padding: 3px 10px 15px 10px;">?????? ????????? 2022.10.30</td>
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
			                        <td class="u-table-cell u-table-cell-18" style="font-weight: 700; font-size: 19px; padding: 35px 20px 20px 20px;" colspan="2">?????? ?????? (1)</td>
			                      </tr>
			                      <tr style="height: 45px;">
			                        <td class="u-table-cell u-table-cell-20">
			                          <div class="u-expanded-width u-table u-table-responsive u-table-6" style="border: 1px solid darkgray; border-radius: 5px;">
						                  <table class="u-table-entity">
						                    <colgroup>
						                      <col width="20%">
						                      <col width="80%">
						                    </colgroup>
						                    <tbody class="u-table-body">
						                      <tr style="height: 25px;">
						                        <td class="u-table-cell" rowspan="5"></td>
						                        <td class="u-table-cell u-table-valign-bottom u-table-cell-33" style="font-size: 14px; padding: 15px 10px 0px 10px;">??????????????? [2022.09.22]</td>
						                      </tr>
						                      <tr style="height: 26px;">
						                        <td class="u-table-cell u-table-cell-35" style="font-size: 18px; font-weight: 700; padding-top: 5px;">No ?????????! ????????? ?????? &lt;????????? ????????? ????????????&gt;</td>
						                      </tr>
						                      <tr style="height: 32px;">
						                        <td class="u-table-cell u-table-valign-top">????????? ????????????</td>
						                      </tr>
						                      <tr style="height: 25px;">
						                        <td class="u-table-cell u-table-valign-bottom u-table-cell-39" style="font-size: 16px; font-weight: 500; padding: 0px 10px; font-weight: 700; color: gray;">40,000??? ?????? ??????</td>
						                      </tr>
						                      <tr style="height: 26px;">
						                        <td class="u-table-cell u-table-valign-top u-text-palette-2-base u-table-cell-41" style="font-size: 14px; font-weight: 700; color: #db545a; padding: 3px 10px 15px 10px;">?????? ?????? ????????? 2022.10.30</td>
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
			                        <td class="u-table-cell u-table-cell-42" style="font-weight: 700; font-size: 19px; padding: 20px;">?????? ????????????(1)</td>
			                      </tr>
			                    </tbody>
			                  </table>
			                  <div class="u-repeater u-repeater-1" style="margin-top: 0px; margin: 0px auto; grid-gap: 30px 20px; grid-template-columns: 33.3333% 33.3333% 33.3333%; min-height: 466px; grid-gap: 0px 0px;">
					            <div class="u-container-style u-list-item u-repeater-item" style="width: 350px; height: auto;">
					              <div class="u-container-layout u-similar-container u-container-layout-1" style="width: 350px; height: auto;  padding: 9px 10px;">
					                <img alt="" class="u-expanded-width u-image u-image-default u-image-1" src="" style="object-fit: fill; height: 305px; margin: 2px 0 0;">
					                <div class="u-clearfix u-group-elements u-group-elements-1" style="width: 100%; min-height: 23px; margin: 19px auto 0 0;">
					                  <p class="" style="width: 100%;  margin-top: 0px; margin-bottom: 5px; font-size: 0.9rem;">&nbsp;?????? | park</p>
					                </div>
					                <h3 class="u-custom-font u-font-open-sans u-text u-text-4" style="height: 54px; width: 100%; font-size: 1.1rem; font-weight: 700; margin: 12px 180px 0 3px;">?????????????????????</h3>
					                <div style="height: 5px"></div>
					                <div style="width: 100%" class="info">
					                  <h3 class="u-custom-font u-font-open-sans u-text u-text-palette-2-base u-text-5" style="display: inline; margin: 0px; font-size: 1.125rem; font-weight: 700;"><div class="rate" style="display:inline;" >100</div>% &nbsp;</h3>
					                  <h3 class="u-custom-font u-font-open-sans u-text u-text-5" style="display: inline; margin: 0px; color: black; font-weight: 500; font-size: 1.0rem;" >1,000,000???</h3>
					                  <h3 class="u-custom-font u-font-open-sans u-text u-text-5" style="display: inline; margin: 0px; float: right; color: gray; font-size: 1.0rem; font-weight: 700;">30??? ??????</h3>
					                </div>
					                <div style="height: 10px;"></div>
					                <div class="progress">
									  <div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">
									    <span class="sr-only">70</span>
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
			              <a class="active u-button-style u-tab-link u-text-active-palette-2-base u-text-hover-palette-2-base u-tab-link-1" id="link-tab-8c3e" href="#tab-8c3e" style="font-size: 1.3rem;" role="tab" aria-controls="tab-8c3e" aria-selected="true">????????????</a>
			            </li>
			            <li class="u-tab-item" role="presentation">
			              <a class="u-button-style u-tab-link u-text-active-palette-2-base u-text-hover-palette-2-base u-tab-link-2" id="link-tab-22fd" href="#tab-22fd" role="tab" style="font-size: 1.3rem;" aria-controls="tab-22fd" aria-selected="false">????????????</a>
			            </li>
			            <li class="u-tab-item" role="presentation">
			              <a class="u-button-style u-tab-link u-text-hover-palette-2-base u-tab-link-3" id="link-tab-01b9" href="#tab-01b9" style="font-size: 1.3rem;" role="tab" aria-controls="tab-01b9" aria-selected="false">??????</a>
			            </li>
			            <li class="u-tab-item" role="presentation">
			              <a class="u-button-style u-tab-link u-text-active-palette-2-base u-text-hover-palette-2-base u-tab-link-4" id="link-tab-a371" href="#tab-a371" style="font-size: 1.3rem;" role="tab" aria-controls="tab-a371" aria-selected="false">?????? ??? ??????<br>
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
			                        <td class="u-table-cell u-table-cell-1" style="font-weight: 700; font-size: 19px; padding: 20px;">???????????? [1]</td>
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
						                        <td class="u-align-center u-table-cell u-table-cell-6" style="font-weight: 700; font-size: 14px;">?????????</td>
						                        <td class="u-align-center u-table-cell u-table-cell-7" style="font-weight: 700; font-size: 14px;">?????????</td>
						                        <td class="u-align-center u-table-cell u-table-cell-8" style="font-weight: 700; font-size: 14px;">??????</td>
						                        <td class="u-align-center u-table-cell u-table-cell-9" style="font-weight: 700; font-size: 14px;">?????? ??????</td>
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
									                        <td class="u-table-cell u-table-cell-16" style="font-size: 14px; padding: 10px 10px 0px;">[???????????? ????????????]&nbsp;<br>
									                        </td>
									                      </tr>
									                      <tr style="height: 46px;">
									                        <td class="u-table-cell u-table-cell-18" style="font-size: 18px; font-weight: 700; padding: 0px 10px 10px 10px">?????? 2000 ????????? ????????? ?????????</td>
									                      </tr>
									                    </tbody>
									                  </table>
									                </div>
						                        </td>
						                        <td class="u-align-center u-table-cell u-table-valign-middle u-table-cell-12">40,000???</td>
						                        <td class="u-table-cell u-table-valign-middle u-table-cell-13" style="text-align: center;">
						                          <input type="button" value="???" style="border: none; cursor: pointer;">
						                          &nbsp;1&nbsp;
						                          <input type="button" value="???" style="border: none; cursor: pointer;">
						                        </td>
						                        <td class="u-table-cell u-table-valign-middle u-table-cell-14" style="text-align: center;">
						                          <input type=button value="??????" style="cursor: pointer; border: 1px solid #b9c1cc; color: black; background-color: white; font-size: 14px;">
						                        </td>
						                      </tr>
						                      <tr style="height: 50px; border: 1px solid lightgray;">
						                        <td class="u-align-center u-table-cell u-table-cell-5" colspan="5" style="font-size: 16px; font-weight: 700; text-align: right; padding: 10px 30px;">??? ?????? ??????&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp; <span style="color: red; font-size: 20px; font-weight: 700;">140,000???</span></td>
						                      </tr>
						                      <tr style="height: 50px; border: none;">
						                        <td class="u-align-right u-table-cell u-table-cell-5" colspan="5" style="">
						                          <input type="button" value="????????????" style="cursor: pointer; font-size: 18px; background-color: black; color: white; border: none; padding: 8px 10px;">
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
			                        <td class="u-table-cell u-table-cell-1" style="font-weight: 700; font-size: 19px; padding: 20px;">???????????? [1]</td>
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
						                        <td class="u-align-center u-table-cell u-table-cell-5" style="font-weight: 700; font-size: 14px;">?????????</td>
						                        <td class="u-align-center u-table-cell u-table-cell-6" style="font-weight: 700; font-size: 14px;">????????????</td>
						                        <td class="u-align-center u-table-cell u-table-cell-7" style="font-weight: 700; font-size: 14px;">????????????</td>
						                        <td class="u-align-center u-table-cell u-table-cell-8" style="font-weight: 700; font-size: 14px;">??????</td>
						                        <td class="u-align-center u-table-cell u-table-cell-9" style="font-weight: 700; font-size: 14px;">?????? ??????</td>
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
									                        <td class="u-table-cell u-table-cell-16" style="font-size: 14px; padding: 10px 10px 0px;">[???????????? ????????????]&nbsp;<br>
									                        </td>
									                      </tr>
									                      <tr style="height: 46px;">
									                        <td class="u-table-cell u-table-cell-18" style="font-size: 18px; font-weight: 700; padding: 0px 10px 10px 10px">?????? 2000 ????????? ????????? ?????????</td>
									                      </tr>
									                    </tbody>
									                  </table>
									                </div>
						                        </td>
						                        <td class="u-table-cell u-table-valign-middle u-table-cell-11" style="text-align: center">2022.09.23</td>
						                        <td class="u-align-center u-table-cell u-table-valign-middle u-table-cell-12">40,000???</td>
						                        <td class="u-table-cell u-table-valign-middle u-table-cell-13" style="text-align: center"> 1??? </td>
						                        <td class="u-table-cell u-table-valign-middle u-table-cell-14" style="text-align: center;">
						                          <input type=button value="??????" style="cursor: pointer; border: 1px solid #b9c1cc; color: black; background-color: white; font-size: 14px;">
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
			                        <td class="u-table-cell u-table-cell-42" style="font-weight: 700; font-size: 19px; padding: 20px;">?????? ??? ??????</td>
			                      </tr>
			                    </tbody>
			                  </table>
			                  <div class="u-repeater u-repeater-1" style="margin-top: 0px; margin: 0px auto; grid-gap: 30px 20px; grid-template-columns: 33.3333% 33.3333% 33.3333%; min-height: 466px; grid-gap: 0px 0px;">
					            <div class="u-container-style u-list-item u-repeater-item" style="width: 350px; height: auto;">
					              <div class="u-container-layout u-similar-container u-container-layout-1" style="width: 350px; height: auto;  padding: 9px 10px;">
							          <a href="#"><img src="" width="320" height="230" alt=""></a><p>
							            <figcaption style="display:block; margin:0; padding:0;">  
							              <a href="#"><h2 style="font-style: regular; color: black; font-size: 12pt; font-weight: bold">?????? 2000 ????????? ????????? ?????????</h2></a><p>
							              <div style="font-size: 9pt">123</div><p>
							              <a href="#" style="color:black; font-size: 14pt">140,000???</a><p>
							              
							              	  <p>
								              <img src="../images/star.png" width="18px" height="18px"><span style="color: #FF8C00; font-size: 13pt;">9.8</span>
								              <span style="float: right">
							              
							              <img src="../images/person.png" width="15px" height="15px"><span style="color: grey; font-size: 10pt">123??? ??????</span></span>
							            
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
    		id:'${id}'
    	},
    	mounted:function(){
    		let _this=this;
    		axios.get("http://localhost:8080/web/mypage/profile.do",{
    			params:{
    				id:_this.id
    			}
    		}).then(function(result){
    			_this.vo=result.data;
    			console.log(result.data);
    		})
    	}
      })
     
      new Vue({
    	 el:'.funding',
    	 data:{
    		 project_list:[],
    		 user_no:${user_no},
    		 curpage:1,
    		 totalpage:0
    	 },
    	 mounted:function(){
	    		 let _this=this;
	    		 axios.get("http://localhost:8080/web/mypage/project.do",{
	    			 params:{
	    				 user_no:_this.user_no
	    			 }
	    		 }).then(function(result){
	    			 console.log(result)
	    			 _this.project_list=result.data;
	    			 _this.curpage=result.data[0].curpage;
	    			 _this.totalpage=result.data[0].totalpage;
	    			 console.log(_this.project_list);
	    			 console.log(result.data[4]);
	    			 console.log(_this.project_list[0]);
	    		 })
	    	 
    	 }
     }) 
    </script>
</body>
</html>