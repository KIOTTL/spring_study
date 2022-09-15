<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</style>
</head>
<body>
  <jsp:include page="../main/header.jsp"></jsp:include>
  <jsp:include page="../main/nav.jsp"></jsp:include>
  <jsp:include page="${main_jsp }"></jsp:include> 
  <jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>