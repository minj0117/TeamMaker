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
<link rel="stylesheet"
	href="http://localhost:8090/prj/css/member/findPWForm.css" />
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
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function fn_findpw(){
	var result = "";
	var id = $('#id').val();
	var email = $('#email').val();
	if(id.length == 0 || email.length == 0){
		alert("회원정보를 입력하세요.");
		return;
	}
	const memberInfo = JSON.stringify({id:id,email:email});
	$.ajax({
		data : memberInfo,
		url : "${contextPath}/prj/member/findpw",
		type : "post",
		dataType : "text",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(data != null){
				//$('#message').text("비밀번호: " + data);
				$('#message').text("메일로 임시비밀번호를 발송했습니다.");
			}else{
				$('#message').text("잘못된 정보입니다.");
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
	<%@ include file="/WEB-INF/views/include/uppermost.jsp"%>
	<!-- header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- nav -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<!-- main -->
	<main>
		<div class="container">
			<div class="content">
				<h4>비밀번호 찾기</h4>
				<form action="" id="findPWForm">
					<div>
						<label for="userid">아이디</label> <input type="text" name="id"
							id="id" />
					</div>
					<div>
						<label for="useremail">이메일</label> <input type="text" name="email"
							id="email" />
					</div>
					<div class="pw_msg" id="message"></div>
					<div>
						<input type="button" id="findPWBtn" name="findPWBtn"
							onClick="fn_findpw()" value="비밀번호 찾기">
					</div>
				</form>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>