<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scalnume=1.0" />
    <title>main</title>
    <link rel="stylesheet" href="http://localhost:8090/prj/css/member/signin.css" />
    <!-- 폰트 -->
    <!-- 폰트 : 로고 -->
    <link
      href="https://fonts.googleapis.com/css2?family=Kalam&display=swap"
      rel="stylesheet"
    />
    <!-- 폰트 : 메뉴 -->
    <link
      href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Hi+Melody&display=swap"
      rel="stylesheet"
    />
    <!-- 폰트 : 메인 -->
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Sunflower:wght@300&display=swap"
      rel="stylesheet"
    />
    <!-- font awesome -->
    <script
      src="https://kit.fontawesome.com/2d323a629b.js"
      crossorigin="anonymous"
    ></script>
    <!-- font awesome -->
    <script
      src="https://kit.fontawesome.com/2d323a629b.js"
      crossorigin="anonymous"
    ></script>
    <script defer src="http://localhost:8090/prj/js/member/signin.js"></script>
  </head>
  <body>
    <!-- uppermost -->
    <div class="uppermost">
      <div class="container">
        <!-- logo -->
        <div class="logo">
          <a href="#"><i class="fab fa-slack"></i></a>
          <div>TEAM MAKER</div>
        </div>

        <!-- navbar -->
        <ul class="navbar_upper">
          <li><a href="#">팀원 모집</a></li>
          <li><a href="#">공모전</a></li>
          <li><a href="#">대외활동</a></li>
          <li><a href="#">커뮤니티</a></li>
        </ul>
		
        <!-- 로그인 -->
        <ul class="uplog_upper">
          <li><a href="/prj/loginForm" class="uplog">로그인</a></li>
          <li><span> | </span></li>
          <li><a href="/prj/member/joinForm" class="uplog">회원가입</a></li>
        </ul>
		
        <!-- 토글 버튼 -->
        <a href="#" class="toggleBtn">
          <i class="fas fa-bars"></i>
        </a>
      </div>
    </div>

    <!-- header -->
    <header>
      <div class="container">
        <div>
          <a href="#"><img src="http://localhost:8090/prj/img/banner.jpg" alt="" /></a>
        </div>
      </div>
    </header>

    <!-- nav -->
    <nav>
      <div class="container">
        <ul class="navbar">
          <li><a href="">팀원 모집</a></li>
          <li><a href="">공모전</a></li>
          <li><a href="">대외활동</a></li>
          <li><a href="">커뮤니티</a></li>
        </ul>
      </div>
    </nav>

    <!-- main -->
    <main>
      <div class="container">
        <div class="content">
          <form id="loginForm" action="/prj/login" method="post">
            <div class="item">
              <input type="text" name="id" id="id" placeholder="아이디" />
            </div>
            <div class="item">
              <span class="errmsg" id="errmsg_id"></span>
            </div>
            <div class="item">
              <input type="password" name="pw" id="pw" placeholder="비밀번호" />
            </div>
            <div class="item">
              <span class="errmsg" id="errmsg_pw"></span>
            </div>
            <div class="item">
              <input type="submit" id="loginBtn">로그인
            </div>
            <div class="item check">
              <input type="checkbox" name="login_chk" id="login_chk" />
              <label for="login_chk" id="login_chk">로그인 상태 유지</label>
            </div>
            <div class="item find_info">
              <a href="/prj/member/findIDForm" id="findID">아이디 찾기</a><span>|</span>
              <a href="/prj/member/findPWForm" id="findPW">비밀번호 찾기</a><span>|</span>
              <a href="/prj/member/joinForm">회원가입</a>
            </div>
          </form>
        </div>
      </div>
    </main>

    <!-- footer -->
    <footer>
      <div class="container">
        <!-- footer_menu1 -->
        <div class="footer_menu1">
          <ul>
            <li><a href="#">사이트 소개</a></li>
            <li><a href="#">광고 안내</a></li>
            <li><a href="#">이용약관</a></li>
            <li><a href="#" id="policy">개인정보처리방침</a></li>
            <li><a href="#">고객센터</a></li>
          </ul>
        </div>

        <!-- footer_menu2 -->
        <div class="footer_menu2">
          <div class="left">
            <a href="#"><img src="http://localhost:8090/prj/img/map.png" alt="" /></a>
          </div>

          <div class="right">
            <div class="right_up">
              <div>TEAM MAKER</div>
              <div>대표: 홍길동</div>
              <div>E-mail: teammaker@gmail.com</div>
            </div>

            <div class="right_down">
              <div>주소: (00000) 울산광역시 신정동 OOOOO OOO</div>
              <div>Copyright 2020 TEAM MAKER Corp. All right reserved.</div>
            </div>
          </div>
        </div>
      </div>
    </footer>
  </body>
</html>
