<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scalnume=1.0" />
<title>main</title>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="http://localhost:8090/prj/css/member/signup.css" />
<!-- font awesome -->
<script src="https://kit.fontawesome.com/2d323a629b.js"
	crossorigin="anonymous"></script>
<!-- 폰트 -->
<!-- 폰트 : 로고 -->
<link href="https://fonts.googleapis.com/css2?family=Kalam&display=swap"
	rel="stylesheet" />
<!-- 폰트 : 메뉴 -->
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Hi+Melody&display=swap"
	rel="stylesheet" />
<!-- 폰트 : 메인 -->
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Sunflower:wght@300&display=swap"
	rel="stylesheet" />
<script type="text/javascript">
	function joinFn(){
		let id = document.getElementById('id').value;
		let pw = document.getElementById('pw').value;
		let pwcheck = document.getElementById('pwcheck').value;
		let name = document.getElementById('name').value;
		let birth = document.getElementById('birth').value;
		let gender = document.getElementById('gender').value;
		let phone = document.getElementById('phone').value;
		let email = document.getElementById('free').value;
		let free = document.getElementById('free').value;
		if(id.length == 0){
			alert('아이디를 입력하세요');
			return;
		}if($('#message').val() != '사용할 수 있는 ID입니다.'){
			console.log($('#message').val());
			alert('아이디 중복체크를 확인해주세요');
			return;
		}if(pw.length == 0){
			alert('패스워드를 입력하세요');
			return;
		}if(pwcheck.length == 0){
			alert('패스워드를 입력하세요');
			return;
		}if(pw != pwcheck){
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}if(name.length == 0){
			alert('이름을 입력하세요');
			return;
		}if(birth.length == 0){
			alert('생일을 입력하세요');
			return;
		}
		if(gender.length == 0){
			alert('성병을 선택하세요');
			return;
		}if(phone.length == 0){
			alert('전화번호를 입력하세요');
			return;
		}if(email.length == 0){
			alert('메일 입력하세요');
			return;
		}
		const Info = JSON.stringify({id:id,pw:pw,name:name,birth:birth,gender:gender,phone:phone,email:email,free:free});
		$.ajax({
			data : Info,
			url : "http://localhost:8090/prj/member/join",
			type : "post",
			dataType : "JSON",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				//var result = JSON.parse(data);
				if(data > 0){
					alert("가입되었습니다~~");
					window.location="${contextPath}/prj/loginForm"
				}else{
					alert("다시 가입해주세요!!");			
				}
			},
			error : function(data,textStatus){
				alert("에러가 발생했습니다.");
			}
		})
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
	<%@ include file="/WEB-INF/views/include/uppermost.jsp"%>
	<!-- header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- nav -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<!-- main -->
	<main>
		<div class="container">
			<div>회원가입</div>
			<form method="POST" action="/prj/member/join" id="joinForm"
				name="joinForm">
				<fieldset>
					<div class="notice">* 필수 작성</div>
					<ul>
						<li><label for="userid">* 아이디</label> <input type="text"
							id="id" name="id" /> <input type="button" value="중복 확인" id="chk"
							onclick="fn_idchk()" />
							<div id="message"></div></li>
						<li><label for="pw">* 비밀번호</label> <input type="password"
							id="pw" name="pw" /></li>
						<li><label for="pwcheck">* 비밀번호 확인</label> <input
							type="password" id="pwcheck" name="pwcheck" /></li>
						<li><label for="name">* 이름</label> <input type="text"
							id="name" name="name" /></li>
						<li><label for="birth">* 생년월일</label> <input type="date"
							id="birth" name="birth" /></li>
						<li><label for="gender">* 성별</label>
							<div>
								<label><input type="radio"
									id="gender" name="gender" value="남" /> 남자</label> <label><input
									type="radio" id="gender" name="gender" value="여" /> 여자</label>
							</div></li>
						<li><label for="phone">* 휴대폰 번호</label> <input type="text"
							id="phone" name="phone" /></li>
						<li><label for="email">* 이메일</label> <input type="text"
							id="email" name="email" /> <input type="button" value="코드 전송" />
						</li>
						<li><label for="free"><span>&nbsp;&nbsp;</span>자기소개서</label>
							<textarea name="free" id="free" cols="10" rows="15"></textarea></li>
					</ul>
					<div class="btnGrp">
						<input type="button" id="joinBtn" value="가입하기" onClick="joinFn()" /> <input
							type="reset" id="cancelBtn" value="취소" />
					</div>
				</fieldset>
			</form>
		</div>
	</main>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
