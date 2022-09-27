<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.goods.dao.*,com.sist.goods.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cno=request.getParameter("cno");
	List<FoodVO> list=FoodDAO.categoryFoodListData(Integer.parseInt(cno));
%>
<c:set var="list" value="<%=list %>"/>
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
	width: 900px;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row row1">
      <table class="table">
        <tr>
          <td>
            <c:forEach var="vo" items="${list }">
              <table class="table">
                <tr>
                  <td width=30% rowspan="4" class="text-center">
                    <a href="../food/food_detail.jsp?fno=${vo.fno }">
                      <img src="${vo.poster }" style="width: 300px; height: 230px;">
                    </a>
                  </td>
                  <td width=70%><h3><a href="../food/food_detail.jsp?fno=${vo.fno }">${vo.name }</a>&nbsp;<span style="color: orange">${vo.score }</span></h3></td>
                </tr>
                <tr>
                  <td width=70%>${vo.address }</td>
                </tr>
                <tr>
                  <td width=70%>${vo.tel }</td>
                </tr>
                <tr>
                  <td width=70%><span class="types">${vo.type }</span></td>
                </tr>
              </table>
            </c:forEach>
          </td>
        </tr>
      </table>
    </div>
  </div>  
</body>
</html>