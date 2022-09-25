<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/mypage/modal2.css" media="screen">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	  $("#confirm").click(function(){
	      modalClose(); //모달 닫기 함수 호출
	      
	      //컨펌 이벤트 처리
	  });
	  $("#modal-open").click(function(){        
	      $("#popup").css('display','flex').hide().fadeIn();
	      //팝업을 flex속성으로 바꿔준 후 hide()로 숨기고 다시 fadeIn()으로 효과
	  });
	  $("#close").click(function(){
	      modalClose(); //모달 닫기 함수 호출
	  });
	  function modalClose(){
	      $("#popup").fadeOut(); //페이드아웃 효과
	  }
	});
</script>
</head>
<body>
<div class="container"> 
  <div class="popup-wrap" id="popup"> 
    <div class="popup">	
     <div class="popup-head" style="text-align: right;">	
          <span class="head-title pop-btn close" id="close" style="margin-right: 3px;"><input type=button value="X" style="border: none; background-color: white;"></span>
      </div>
      <div class="popup-body">	
        <div class="body-content">
          <div class="body-titlebox">
            <h1>Confirm Modal</h1>
          </div>
          <div class="body-contentbox">
            <p> 모달 내용칸 </p>
          </div>
        </div>
      </div>
      <div class="popup-foot">
        <span class="pop-btn confirm" id="confirm"><input type=button value="확인"></span>
      </div>
    </div>
</div>
</div>
</body>
</html>