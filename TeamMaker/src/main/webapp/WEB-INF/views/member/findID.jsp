<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scalnume=1.0" />
    <title>main</title>
    <link rel="stylesheet" href="http://localhost:8090/prj/css/member/findID.css" />
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
    <script defer src="http://localhost:8090/prj/js/member/findID.js"></script>
  </head>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function fn_findid(){
	var result = "";
	var name = $('#name').val();
	var email = $('#email').val();
	console.log(name);
	console.log(email);
	const memberInfo = JSON.stringify({name:name,email:email});
	console.log(memberInfo);
	$.ajax({
		data : memberInfo,
		url : "http://localhost:8090/prj/member/findid",
		type : "post",
		dataType : "text",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			console.log(data);
			if(data.length < 4){
				$('#message').text("아이디가 없습니다");
				$('#message').css("color","red");	
				$('#message').css("font-weight","bold");
			}else{
				$('#message').text("아이디 : " + data);
				$('#message').css("color","green");	
				$('#message').css("font-weight","bold");
				
			}
		},
		error : function(data,textStatus){
			alert("에러가 발생했습니다.");
		}
	})
}
</script>
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
        <div class="content">
          <h1>아이디 찾기</h1>
          <form action="/prj/member/findid" id="findIDForm" action="post">
            <div>
              <label for="username">이름</label>
              <input type="text" name="name" id="name" />
            </div>
            <div>
              <label for="email">이메일</label>
              <input type="text" name="email" id="email" />
              <input
                type="submit"
                name="submitBtn"
                id="submitBtn"
                value="인증번호 받기"
              />
            </div>
            <div>
              <input
                type="text"
                name="submitW"
                id="submitW"
                placeholder="인증번호 입력"
              />              
            </div>
            <div id="message"></div>
            
            <div>
              <input
                type="button"
                name="findIDBtn"
                id="findIDBtn"
                onClick="fn_findid()"
                value="아이디 찾기"
              />
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
