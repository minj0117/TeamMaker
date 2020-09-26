<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scalnume=1.0" />
<title>main</title>
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
<link rel="stylesheet" href="http://localhost:8090/prj/css/member/signin.css" /> 
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function fn_loginFn(){
		let id = document.getElementById('id').value;
		let pw = document.getElementById('pw').value;
		if(id.length == 0){
			alert("아이디를 입력해주세요.");
			return;
		}
		if(pw.length == 0){
			alert("패스워드를 입력해주세요.");
			return;
		}
		const memberInfo = JSON.stringify({id:id,pw:pw});
		$.ajax({
			data : memberInfo,
			url : "http://localhost:8090/prj/login",
			type : "post",
			dataType : "text",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				console.log(data);
				if(data == 1){
					alert("로그인 되었습니다.");
					location.href="http://localhost:8090/prj";
				}else{
					alert("회원정보를 다시 확인해주세요.");
				}
			},
			error : function(data){
				alert("실패");
			}
		})
	}
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
						<input type="button" onClick="fn_loginFn()" id="loginBtn" value="로그인" />
						<!-- <input type="submit" id="loginBtn" value="로그인" /> -->
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
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
