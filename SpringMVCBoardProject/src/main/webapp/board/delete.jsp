<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 900px;
}
h1{
	text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#writeBtn').on('click',function(){
		let pwd=$('#pwd').val();
		if (pwd.trim()==""){
			$('#pwd').focus();
			return;
		}
		
		$('#frm').submit();
	})
})
</script>
</head>
<body>
  <div class="container">
    <h1>삭제하기</h1>
    <div class="row">
      <form method=post action="delete_ok.do" id="frm">
      <table class="table">
        <tr>
          <th width=20% class="text-right">비밀번호</th>
          <td width=80%>
            <input type=password name=pwd id=pwd size=15 class="input-sm">
            <input type=hidden name=no value="${vo.no }">
          </td>
        </tr>
        <tr>
          <td colspan="2" class=text-center>
            <input type=button value="확인" class="btn btn-sm btn-warning" id="writeBtn">
            <input type=button value="취소" class="btn btn-sm btn-info" onclick="javascript:history.back()">
          </td>
        </tr>
      </table>
      </form>
    </div>
  </div>
</body>
</html>