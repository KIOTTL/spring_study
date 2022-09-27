<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.goods.dao.*,com.sist.goods.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String fno=request.getParameter("fno");
	FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(fno));
%>
<c:set var="vo" value="<%=vo %>"/>
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
      <%-- 이미지 5개 --%>
      <table class="table">
        <tr>
          <c:forTokens items="${vo.poster }" delims="^" var="image">
            <td>
              <img src="${image }" style="width: 100%">
            </td>
          </c:forTokens>
        </tr>
      </table>
    </div>
    <div style="height: 20px;"></div>
    <div class="row">
      <div class="col-sm-8">
    	<%-- 정보 --%>
    	<table class="table">
    	  <tr>
    	    <td colspan="2"><h3>${vo.name }&nbsp;<span style="color: orange">${vo.score }</span></h3></td>
    	  </tr>
    	  <tr>
    	    <td width="30%" style="color: gray">주소</td>
    	    <td width="70%">${fn:substring(vo.address,0,fn:indexOf(vo.address,'지')) }</td>
    	  </tr>
    	  <tr>
    	    <td width="30%" style="color: gray">전화번호</td>
    	    <td width="70%">${vo.tel }</td>
    	  </tr>
    	  <tr>
    	    <td width="30%" style="color: gray">음식 종류</td>
    	    <td width="70%">${vo.type }</td>
    	  </tr>
    	  <tr>
    	    <td width="30%" style="color: gray">가격대</td>
    	    <td width="70%">${vo.price }</td>
    	  </tr>
    	  <tr>
    	    <td width="30%" style="color: gray">영업시간</td>
    	    <td width="70%">${vo.time }</td>
    	  </tr>
    	  <tr>
    	    <td width="30%" style="color: gray">주차</td>
    	    <td width="70%">${vo.parking }</td>
    	  </tr>
    	  <c:if test="${vo.menu!='no' }">
    	    <tr>
    	      <td width="30%" style="color: gray">메뉴</td>
      	      <td width="70%">
    	        <ul>
    	          <c:forTokens items="${vo.menu }" delims="원" var="m">
    	            <li>${m }원</li>
    	          </c:forTokens>
    	        </ul>
    	      </td>
    	    </tr>
    	  </c:if>
    	  <tr>
    	    <td colspan="2" class="text-right">
    	      <input type=button value="목록" class="btn btn-xs btn-warning"
    	      		onclick="javascript:history.back()"
    	      >
    	    </td>
    	  </tr>
    	</table>
      </div>
    </div>  
  </div>  
</body>
</html>