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
.navbar-left {
    float: right;
}
.navbar-inverse .navbar-nav>.open>a, .navbar-inverse .navbar-nav>.open>a:focus, .navbar-inverse .navbar-nav>.open>a:hover {
    color: #fff;
    background-color: white;
}
.open>.dropdown-menu {
    display: flex;
}
a:hover {
	color:red;
}
</style>
</head>
<body>
<nav class="navbar navbar-inverse" style="background-color: white; border: none;">
  <div class="container-fluid" style="margin-top: -15px;">
    <ul class="nav navbar-nav" style="font-size: 20px; margin-left: 250px;">
      <li class="dropdown" style="margin-right: 40px;">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black;">카테고리
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li style="font-size: 18px;"><a href="#">전체</a></li>
          <li style="font-size: 18px;"><a href="#">디자인 문구</a></li>
          <li style="font-size: 18px;"><a href="#">푸드</a></li>
          <li style="font-size: 18px;"><a href="#">출판</a></li>
          <li style="font-size: 18px;"><a href="#">반려동물</a></li>
        </ul>
      </li>
      <li style="margin-right: 40px;"><a href="#" style="color: black;">펀딩 예정</a></li>
      <li style="margin-right: 40px;"><a href="#" style="color: black;">펀딩</a></li>
      <li style="margin-right: 40px;"><a href="#" style="color: black;">스토어</a></li>
    </ul>
    <form class="navbar-form" action="/action_page.php" style="text-align: right; margin-top: 40px; margin-right: 300px;">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search" name="search">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>
  </div>
  <div style="width: 95%; height: 0.1px; border-top: 1px solid lightgray; margin-left: 50px;"></div>
</nav>
</body>
</html>