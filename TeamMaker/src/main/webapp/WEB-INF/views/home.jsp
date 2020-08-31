<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scalnume=1.0" />
    <title>main</title>
    <link rel="stylesheet" href="http://localhost:8090/prj/css/main.css" />
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
    <script defer src="http://localhost:8090/prj/js/main.js"></script>
  </head>
  <body>
   	<!-- uppermost -->
    <%@ include file="/WEB-INF/views/include/uppermost.jsp" %>
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
        <!-- 팀원 모집 -->
        <div class="team_matching">
          <div id="matching_title">팀원 모집</div>
          <div class="matching_wrapper">
            <div>
              <marquee behavior="" direction=""><a href="#"
                >Lorem ipsum dolor sit amet consectetur adipisicing elit. Ex
                commodi consequuntur placeat fuga perspiciatis atque architecto
                quibusdam ad, maiores ipsa velit assumenda vel soluta,
                dignissimos rem rerum minus numquam. Possimus?</a
              ></marquee>
            </div>
            <div><a href="#">2</a></div>
            <div><a href="#">3</a></div>
            <div><a href="#">4</a></div>
            <div><a href="#">5</a></div>
            <div><a href="#">6</a></div>
          </div>
        </div>

        <!-- 공모전 -->
        <div class="gong">
          <div id="gong_title">공모전</div>
          <div class="gong_wrapper">
            <div>
              <a href="#"><img src="http://localhost:8090/prj/img/pic.jpg" alt="" /></a>
            </div>
            <div>
              <a href="#"><img src="http://localhost:8090/prj/img/pic.jpg" alt="" /></a>
            </div>
            <div class="gong_text">
              <div>공모전 제목1 Lorem ipsum dolor sit amet consectetur.</div>
              <div>기간 : 2020.08.01 - 2020.09.30</div>
            </div>
            <div class="gong_text">
              <div>공모전 제목2 Lorem ipsum dolor sit amet consectetur.</div>
              <div>기간 : 2020.08.01 - 2020.09.30</div>
            </div>
          </div>
        </div>

        <!-- 대외활동 -->
        <div class="dae">
          <div id="dae_title">대외활동</div>
          <div class="dae_wrapper">
            <div>
              <a href="#"><img src="http://localhost:8090/prj/img/pic.jpg" alt="" /></a>
            </div>
            <div>
              <a href="#"><img src="http://localhost:8090/prj/img/pic.jpg" alt="" /></a>
            </div>
            <div class="dae_text">
              <div>대외활동 제목1 Lorem ipsum dolor sit amet consectetur.</div>
              <div>기간 : 2020.08.01 - 2020.09.30</div>
            </div>
            <div class="dae_text">
              <div>대외활동 제목2 Lorem ipsum dolor sit amet consectetur.</div>
              <div>기간 : 2020.08.01 - 2020.09.30</div>
            </div>
          </div>
        </div>

        <!-- 관련 기사 -->
        <div class="arti">
          <div id="arti_title">관련 기사</div>
          <div class="arti_wrapper">
            <div>
              <a href="#"><img src="http://localhost:8090/prj/img/pic.jpg" alt="" /></a>
            </div>
            <div>
              <a href="#"
                >관련 기사1 Lorem ipsum dolor sit amet consectetur adipisicing
                elit. Et, necessitatibus.</a
              >
            </div>
            <div id="arti_left">
              <a href="#"
                >관련 기사2 Lorem ipsum dolor, sit amet consectetur adipisicing
                elit. Tenetur, reprehenderit.</a
              >
            </div>
            <div id="arti_right"></div>
          </div>
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
