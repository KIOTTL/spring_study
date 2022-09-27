<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.goods.dao.*,com.sist.goods.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<CategoryVO> list=FoodDAO.categoryListData();
%>
<c:set var="list" value="<%=list %>"/>  <%-- request.setAttribute() --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 100%;
}
</style>
</head>
<body>
<div class="container">
    <div class="row">
      <h3>믿고 보는 맛집 리스트</h3>
      <hr>
      <c:forEach var="vo" items="${list }" varStatus="s">
        <c:if test="${s.index>=0 && s.index<12 }">
          <div class="col-md-3">
	        <div class="thumbnail">
	          <a href="../food/food_list.jsp?cno=${vo.cno }">
	            <img src="${vo.poster }" title="${vo.subject }" style="width:100%">
	            <div class="caption">
	              <p>${vo.title }</p>
	            </div>
	          </a>
	        </div>
  	      </div>
        </c:if>
      </c:forEach>
    </div>
    <div style="height: 20px"></div>
    <div class="row">
      <h3>지역별 인기 맛집 리스트</h3>
      <hr>
      <c:forEach var="vo" items="${list }" varStatus="s">
        <c:if test="${s.index>=12 && s.index<18 }">
          <div class="col-md-4">
	        <div class="thumbnail">
	          <a href="../food/food_list.jsp?cno=${vo.cno }">
	            <img src="${vo.poster }" title="${vo.subject }" style="width:100%">
	            <div class="caption">
	              <p>${vo.title }</p>
	            </div>
	          </a>
	        </div>
  	      </div>
        </c:if>
      </c:forEach>
    </div>
    <div style="height: 20px"></div>
    <div class="row">
      <h3>메뉴별 인기 맛집 리스트</h3>
      <hr>
      <c:forEach var="vo" items="${list }" varStatus="s">
        <c:if test="${s.index>=18 && s.index<30 }">
          <div class="col-md-3">
	        <div class="thumbnail">
	          <a href="../food/food_list.jsp?cno=${vo.cno }">
	            <img src="${vo.poster }" title="${vo.subject }" style="width:100%">
	            <div class="caption">
	              <p>${vo.title }</p>
	            </div>
	          </a>
	        </div>
  	      </div>
        </c:if>
      </c:forEach>
    </div>
  </div>
</body>
</html>