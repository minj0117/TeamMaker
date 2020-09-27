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
	href="${contextPath }/prj/css/member/modifyForm.css" />
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
<script type="text/javascript">
	function modFn(){
		let id = document.getElementById('id').innerText;
		let pwReg = /^[A-Za-z0-9]{6,12}$/;
		let pw = document.getElementById('pw').value;
		let pwcheck = document.getElementById('pwcheck').value
		let phone = document.getElementById('phone').value;
		let free = document.getElementById('free').value;
		let email = document.getElementById('email').value;
		let emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(pw != pwcheck){
			alert("비밀번호가 틀립니다.");
			return;
		}
		if(pwReg.test(pw) != true){
			alert("숫자와 문자 포함 형태의 6~12자리로 작성해주세요");
			return;
		}
		if(phone.length > 15){
			alert("전화번호를 바르게 입력하세요")
			return
		}
		if(free.length == 0){
			alert("자기소개를 입력하세요");
			return
		}
		if(emailReg.test(email) != true){
			alert('이메일 형식으로 입력하세요');
			return;
		}
		const memberInfo = JSON.stringify({id:id,pw:pw,email:email,free:free,phone:phone});
		$.ajax({
			data : memberInfo,
			url : "http://localhost:8090/prj/member/modify",
			type : "put",
			dataType : "JSON",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				//var result = JSON.parse(data);
				if(data == 1){
					alert("수정되었습니다.");
					location.href="${contextPath}/prj";
				}else{
					alert("수정에 실패했습니다.");				
				}
			},
			error : function(data,textStatus){
				alert("에러가 발생했습니다.");
			}
		})
	}

	function fn_emailchk(){
		let email = document.getElementById('email').value;
		let emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(emailReg.test(email) != true){
			alert('이메일 형식으로 입력하세요');
			return;
		}
		const Email = JSON.stringify({email:email});
		$.ajax({
			data : Email,
			url : "http://localhost:8090/prj/member/emailCheck",
			type : "post",
			dataType : "JSON",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				console.log(data);
				//var result = JSON.parse(data);
				if(data == 0){
					$('#message2').val("사용 가능한 email입니다.");
					$('#message2').text("사용 가능한 email입니다.");
					$('#message2').css("color","green");	
					$('#message2').css("font-weight","bold");				
				}else{
					$('#message2').val("이미 사용중인 이메일 입니다.");
					$('#message2').text("이미 사용중인 이메일 입니다.");
					$('#message2').css("color","red");
					$('#message2').css("font-weight","bold");
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
	<!-- nav -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>


	<!-- main -->
	<main>
		<div class="container">
			<div class="content">
				<!-- aside -->
				<aside>
					<div>
						<div class="atitle">마이페이지</div>

						<ul>
							<li class="astitle">나의 활동</li>
							<ul>
								<li><a href="${contextPath }/prj/teamForm">팀 만들기</a></li>
								<li><a href="${contextPath }/prj/mylist">팀 게시판</a></li>
							</ul>
						</ul>
						<ul>
							<li class="astitle">나의 정보</li>
							<ul>
								<li><a href="${contextPath }/prj/member/modifyForm">회원정보
										수정</a></li>
								<li><a href="${contextPath }/prj/member/delMemberForm">회원
										탈퇴</a></li>
							</ul>
						</ul>
					</div>
				</aside>
				<!-- section 시작-->
				<section>
					<div class="atitle">
						마이 페이지<span>&nbsp;</span> <i class="fas fa-chevron-right"></i> <span>&nbsp;</span>나의
						정보
					</div>
					<div class="stitle">
						<span>abcdefg</span>님 반갑습니다
					</div>
					<form method="POST" action="" id="modifyForm" name="modifyForm">
						<div class="ftitle">회원정보 수정</div>
						<fieldset>
							<ul>
								<li><label for="userid">아이디</label>
									<div id="id">${sessionScope.member.id }</div></li>
								<li><label for="pw">비밀번호</label> <input type="password"
									id="pw" name="pw" /></li>
								<li><label for="pwcheck">비밀번호 확인</label> <input
									type="password" id="pwcheck" name="pwcheck" /></li>
								<li><label for="name">이름</label>
									<div>${sessionScope.member.name }</div></li>
								<li><label for="birth">생년월일</label> <input type="date"
									id="birth" name="birth" value="${sessionScope.member.birth }"
									readonly="readonly" /></li>
								<li><label for="gender">성별</label>
									<div>
										<input type="radio" name="gender" value="남"
											${sessionScope.member.gender == "남" ? 'checked="checked"' : ''}
											onclick="return(false);" />남 <input type="radio"
											name="gender" value="여"
											${sessionScope.member.gender == "여" ? 'checked="checked"' : ''}
											onclick="return(false);" />여<br>
									</div></li>
								<li><label for="phone">휴대폰 번호</label> <input type="text"
									id="phone" name="phone" value="${sessionScope.member.phone }" />
								</li>
								<li><label for="email">이메일</label> <input type="text"
									id="email" name="email" value="${sessionScope.member.email }" />
									<input type="button" value="중복 확인" onClick="fn_emailchk()" />
									<div id="message2"></div></li>
								<li><label for="free">자기소개서</label> <textarea name="free"
										id="free">${sessionScope.member.free }</textarea>
									<div></div></li>
							</ul>
							<div class="btnGrp">
								<input type="button" id="modifyBtn" onClick="modFn()" value="수정" />
								<input type="reset" id="cancelBtn" value="취소" />
							</div>
						</fieldset>
					</form>
				</section>
				<!-- section 끝 -->
			</div>
		</div>
		<div class="clearfix"></div>
	</main>


	<!-- footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>