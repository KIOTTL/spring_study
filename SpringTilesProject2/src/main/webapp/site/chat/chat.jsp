<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.row1{
	width: 800px;
	height: 750px;
}
#chatArea{
	height: 250px;
	overflow-y: auto;
	border: 1px solid black;
}
.container{
	margin-top: 30px;
}
.row{
	margin: 0px auto;
	width: 100%;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script type="text/javascript">
let websocket;
function connection(){		// 연결
	// websocket => 웹에서 연결이 되게 만드는 소프트웨어
	websocket=new WebSocket("ws://localhost:8080/web/site/chat/chat-ws");	// ChatServer 클래스의 @ServerEndpoint("/chat/chat-ws")
	websocket.onopen=onOpen;	// callback(시스템에 의해 자동으로 실행) => 연결되었을 때 자동으로 onOpen 함수 호출
	websocket.onclose=onClose;
	websocket.onmessage=onMessage;
}
function onOpen(event){		// 연결되었을 때 처리
	alert("채팅 서버와 연결되었습니다");
}
function onClose(event){	// 퇴장시 처리
	alert("채팅 서버와 연결이 종료되었습니다")
}
function onMessage(event){	// 채팅 메세지 전송시
	let data=event.data;
	if(data.substring(0,4)=="msg:"){
		appendMessage(data.substring(4));
	}
}
function disconnection(){	// 퇴장 버튼 클릭시
	websocket.close();	// onclose 함수 호출 (websocket.onclose)
}
function send(){
	let name=$('#name').val();
	if(name.trim()==""){
		$('name').focus();
		return;
	}
	let msg=$('#sendMsg').val();
	if(msg.trim()==""){
		$('#sendMsg').focus();
		return;
	}
	
	websocket.send("msg:["+name+"]"+msg);	// onmessage 함수 호출
	$('#sendMsg').val("");	// 채팅 전송 후 채팅 입력 창 공백
	$('#sendMsg').focus();
}
function appendMessage(msg){	// 채팅 문자열 추가
	$('#recvMsg').append(msg+"<br>");
	let ch=$('#chatArea').height();
	let m=$('#recvMsg').height()-ch;
	$('#chatArea').scrollTop(m);	// 스크롤 위치 지정 => 스크롤 위로 올라가는 것 막기(스크롤 제일 밑으로)
}
$(function(){
	$('#startBtn').click(function(){
		connection();		
	})
	
	$('#endBtn').click(function(){
		disconnection();
	})

	$('#sendBtn').click(function(){
		send();
	})
	
	$('#sendMsg').keydown(function(key){
		if(key.keyCode==13){	// 엔터키 눌렀을 때
			send();
		}
	})
})
</script>
</head>
<body>
  <div class="container">
    <div class="row row1">
      <h1 class="text-center">WebSocket 채팅</h1>
      <table class="table">
        <tr>
          <td>
                    이름 : <input type=text id="name" size=15 class="input-sm">
            <input type=button id="startBtn" value="입장" class="btn btn-sm btn-danger"> 
            <input type=button id="endBtn" value="퇴장" class="btn btn-sm btn-primary"> 
          </td>
        </tr>
        <tr>
          <td>
            <div id="chatArea">
              <div id="recvMsg"></div>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" id="sendMsg" size=80 class="input-sm">
            <input type=button id="sendBtn" value="전송" class="btn btn-sm btn-success">
          </td>
        </tr>
      </table>
    </div>
  </div>
</body>
</html>