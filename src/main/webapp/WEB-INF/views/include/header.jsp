<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- <link rel='stylesheet' type='text/css' href="resources/css/common.css"> -->
<link rel='stylesheet' type='text/css' href="css/common.css?v=<%=new Date().getTime() %>">

<!-- jQuery 라이브러리 CDN 방식 연결 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- jQuery 라이브러리 다운로드한 파일 연결 -->
<!-- <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script> -->
<style>

header ul, header ul li {margin: 0;	padding: 0;	display: inline;}
header {width: 100%; height: auto; background: #696aad; }
header .category{width: 100%; height: 60px; position: relative;}
header .category .logo{position: absolute; left: 60px;} 
header .category .logo a{font-size: 30px; color: #fff; line-height: 37px; font-weight: 600;} 
header .category .menu{position: absolute; right: 400px; top: 15px;}
header .category .menu li{float:left; /* font-size: 15px; line-height: 25px; color: #fff; */  }
header .category .menu li a{ font-size: 20px; line-height: 25px; color: #fff; padding-right: 15px; }
header .category .login{position: absolute; right: 60px; top: 15px;}
header .category .login a{font-size: 20px; line-height: 25px; color: #fff; padding-right: 15px;}
/* header .category .login_on{position: absolute; width: 300px; height: auto;}
header .category .login_on ul{right: 80px;}
header .category .login_on a{font-size: 20px; line-height: 25px; color: #fff; } */

header .category ul li:not(:first-child) { /* 첫번째 li만 빼고 지정 */
	padding-left: 30px;
	
}

header .category ul li a:hover, header .category ul li a.active {
	font-weight: bold;
	color : #acafcf;
}



</style>
<header style="">
   <div class="category">
      <!-- logo -->
      <div class="logo">
         <ul>
            <li><a href='<c:url value="/" />' id="logo">AnaFor</a></li>
         </ul>   
      </div>
      
      <!-- menu -->
      <div class="menu">
         <ul>
            <li><a href='box.pr'  ${category eq 'pr' ? 'class="active"' : '' }>제품소개</a></li>      
            <li><a href='f_list.cu' ${category eq 'cu' ? 'class="active"' : '' }>고객센터</a></li>      
            <li><a href='list.no' ${category eq 'no' ? 'class="active"' : '' }>공지사항</a></li>      
         </ul>   
      </div>
      
      <!-- login -->
       <div class="login">
         <!-- 로그인을 하지 않은 경우 -->
         <c:if test="${ empty loginInfo }">
            <ul>
               <li>

                  <a href='userLogin' style="margin-right: 20px;">로그인</a>
                  <a href='userJoin'>회원가입</a>

               </li>         
            </ul>
         </c:if>
         
         <!-- 로그인한 경우 -->
         <c:if test="${ loginInfo.admin eq 'Y'}">
            <ul>
               <li>
                  <a href="admin"><strong>관리자 페이지</strong></a>
<%--                   <a href="admin"><strong>${loginInfo.user_name }</strong></a> 님 --%>
               </li>
               <li>         
                  <a href='logout'>로그아웃</a>
               </li>
            </ul>
         </c:if>
         <c:if test="${ loginInfo.admin eq 'N' }">
            <ul>
               <li>
                  <a href="shopList.my">${loginInfo.user_name } 님</a>
               </li>
               <li>         
                  <a href='logout'>로그아웃</a>
               </li>
            </ul>
         </c:if>
         
      </div>
      
   </div>
</header>













