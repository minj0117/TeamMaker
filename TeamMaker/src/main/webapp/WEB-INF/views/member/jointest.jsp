<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
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
		let pw = document.getElementById('pw');
		let pwchech = document.getElementById('pwcheck');
		let name = document.getElementById('name');
		let birth = document.getElementById('birth');
		let gender = document.querySelectorAll("input[name='gender']");
		let phone = document.getElementById('phone');
		let email = document.getElementById('email');
		if(id.value.trim().length == 0){
			alert('아이디를 입력하세요');
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
		var inputed = $('#id').val();
		if(inputed == ''){
			alert("ID를 입력하세요");
			return;
		}else if(inputed.length < 5){
			alert("ID는 5자 이상으로 해주세요");
			return;
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
					$('#message').text("이미 사용중인 아이디 입니다.");
					$('#message').css("color","red");
					$('#message').css("font-weight","bold");
				}else{
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
</script>
</head>
<body>
	
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
</body>
</html>