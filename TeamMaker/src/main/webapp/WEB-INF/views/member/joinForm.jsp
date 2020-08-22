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
  	<style type="text/css">
 *{
  font-family: 맑은고딕, 돋음;
  color:black;
 }
 
 form{
  position: relative;
  width: 600px;
  margin: 0 auto;
 }
 fieldset{
  width: 90%;
  border: none;
  padding: 0;
  margin: 0 auto;
  border-bottom: 2px solid #eee;
 }
 legend{
  font-weight: bold;
  font-size: 1.5em;
  color: ba;
  padding: 10px 0;
 }
 span.notice{
  position: absolute;
  top: 1.5em;
  right: 3em;
  font-size: 0.75em;
  font-weight: bold;
  color: black;
 }
 strong{
  color: black;
 }
 p{
  border: none;
  border-bottom: 1px solid #eee;
  padding: 7px 0;
  margin: 0;
 }
 .label{
  font-size: 0.9em;
  width: 20%;
  float: left;
  text-align: right;
  padding-right: 10px;
 }
 label{
  font-size: 0.9em;
 }
 .firstP{
  border-top: 2px solid #eee;
 }
 .submitP{
  text-align: center;
 }
 .submitP > input[type=submit]{
  padding: 2px 10px;
  font-weight: bold;
  color: black;
 }
 input[type=text], input[type=password]{
  width: 35%;
  height:1.1em;
  font-size: 0.9em;
  border: 1px solid #eee;
  
 }
 textarea{
  width: 70%;
  border: 1px solid #eee;
 }
</style>
<script type="text/javascript">
	window.addEventListener("load",init);
	function init(){
		let joinBtn = document.getElementById('joinBtn');
		joinBtn.addEventListener("click", joinFn);
	}
	function joinFn(e){
		e.preventDefault();
		console.log(e.target);
		let joinForm = document.getElementById('joinForm');
		let id = document.getElementById('id');
		//let idcheck = $('#message').val();
		let pw = document.getElementById('pw');
		let pwcheck = document.getElementById('pwcheck');
		let name = document.getElementById('name');
		let birth = document.getElementById('birth');
		let gender = document.querySelectorAll("input[name='gender']");
		let phone = document.getElementById('phone');
		let email = document.getElementById('email');
		if(id.value.trim().length == 0){
			alert('아이디를 입력하세요');
			return;
		}if($('#message').val() != '사용할 수 있는 ID입니다.'){
			console.log($('#message').val());
			alert('아이디 중복체크를 확인해주세요');
			return;
		}if(pw.value.trim().length == 0){
			alert('패스워드를 입력하세요');
			return;
		}if(pwcheck.value.trim().length == 0){
			alert('패스워드를 입력하세요');
			return;
		}if(pw.value.trim() != pwcheck.value.trim()){
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}if(name.value.trim().length == 0){
			alert('이름을 입력하세요');
			return;
		}if(birth.value.trim().length == 0){
			alert('생일을 입력하세요');
			return;
		}
		let genderlist = Array.from(gender);
		if(genderlist[0].checked != true && genderlist[1].checked != true){
			alert('성별을 입력하세요');
			genderlist[0].select();
			return;
		}if(phone.value.trim().length == 0){
			alert('전화번호를 입력하세요');
			return;
		}if(email.value.trim().length == 0){
			alert('메일 입력하세요');
			return;
		}
		joinForm.method="post";
		joinForm.submit();
	}

</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function fn_idchk(){
		var idCheck = 0;
		var idPattern = /^[a-zA-Z0-9]{5,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
		var inputed = $('#id').val();
		if(inputed == ''){
			alert("ID를 입력하세요");
			return;
		}
		if(idPattern.test(inputed) != true){
			alert("아이디는 5~12자, 영어와 숫자로만 생성해주세요");
			return ;
		}
		console.log(inputed);
		$.ajax({
			data : inputed,
			url : "http://localhost:8090/prj/member/idCheck",
			type : "post",
			dataType : "JSON",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				//var result = JSON.parse(data);
				if(data.check > 0){
					$('#message').val("이미 사용중인 아이디 입니다.");
					$('#message').text("이미 사용중인 아이디 입니다.");
					$('#message').css("color","red");
					$('#message').css("font-weight","bold");
				}else{
					$('#message').val("사용할 수 있는 ID입니다.");
					$('#message').text("사용할 수 있는 ID입니다.");
					$('#message').css("color","green");	
					$('#message').css("font-weight","bold");				
				}
			},
			error : function(data,textStatus){
				alert("에러가 발생했습니다.");
			}
		})
	}
	//var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
</script>
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
          <li><a href="#" class="uplog">회원가입</a></li>
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
      <form method="post" action="/prj/member/join" id="joinForm" name="joinForm">
  <fieldset>
   <span class="notice">*필수작성</span>
   <p class="firstP">
    <label for="id" class="label"><strong>*아이디</strong></label>
    <input type="text" id="id" name="id" /><input type="button" id="chk" onClick="fn_idchk()" value="중복확인" >
    <div id="message"></div>
   </p>
   <p>
    <label for="pw" class="label"><strong>*비밀번호</strong></label>
    <input type="password" id="pw" name="pw"/>
   </p>
   <p>
    <label for="pwcheck" class="label"><strong>*비밀번호확인</strong></label>
    <input type="password" id="pwcheck" />
   </p>
   <p>
    <label for="name" class="label"><strong>*이름</strong></label>
    <input type="text" id="name" name="name" />
   </p>
   <p class="firstP">
    <label for="birth" class="label"><strong>*생년월일</strong></label>
    <input type="date" id="birth" name="birth" />
   </p>
   <p>
    <label for="gender" class="label"><strong>*성별</strong></label>
     <label><input type="radio" id="gender" name="gender" value="남">남자</label>
     <label><input type="radio" id="gender" name="gender" value="여">여자</label>
    </p>
   <p class="firstP">
    <label for="phone" class="label"><strong>*휴대폰번호</strong></label>
    <input type="text" id="phone" name="phone" />
   </p>
   <p>
    <label for="email" class="label">*이메일</label>
    <input type="text" id="email" name="email"/>
    <input type="button" value="코드전송">
  </p>
   <p>
     <span class="label">자기소개서</span>
     <textarea rows="15" cols="10" id="free" name="free"></textarea>
   </p>
    <p class="submitP">
     <input id="joinBtn" type="submit" value="가입하기" />
     <input type="reset" value="리셋" />
    </p>
  </fieldset>
 </form>
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
