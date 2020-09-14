<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url_login" value="${contextPath }/loginForm" />    
<c:set var="url_logout" value="${contextPath }/logout" />
<c:set var="url_myPage" value="${contextPath }/member/myPage" />    
<!--  <link rel="stylesheet" href="http://localhost:8090/prj/css/include/main.css"> -->
    
<!-- uppermost -->
   <div class="uppermost">
     <div class="container">
       <!-- logo -->
       <div class="logo">
         <a href="/prj"><i class="fab fa-slack"></i></a>
         <div>TEAM MAKER</div>
       </div>

       <!-- navbar -->
       <ul class="navbar_upper">
         <li><a href="${contextPath }/prj/rlist">팀원 모집</a></li>
         <li><a href="#">공모전</a></li>
         <li><a href="#">대외활동</a></li>
         <li><a href="#">커뮤니티</a></li>
       </ul>
		<c:if test="${empty sessionScope.member}">
        <!-- 로그인 전-->
        <ul class="uplog_upper">
          <li><a href="/prj/loginForm" class="uplog">로그인</a></li>
          <li><span> | </span></li>
          <li><a href="/prj/member/joinForm" class="uplog">회원가입</a></li>
        </ul>
		</c:if>
		<c:if test="${!empty sessionScope.member }">
		<!-- 로그인 후-->
        <ul class="uplog_upper">
          <li><a href="/prj/member/mypage" class="uplog">${sessionScope.member.name }님</a></li>
          <li><span> | </span></li>
          <li><a href="/prj/logout" class="uplog">로그아웃</a></li>
        </ul>
        </c:if>
		
       <!-- 토글 버튼 -->
       <a href="#" class="toggleBtn">
         <i class="fas fa-bars"></i>
       </a>
     </div>
   </div>    