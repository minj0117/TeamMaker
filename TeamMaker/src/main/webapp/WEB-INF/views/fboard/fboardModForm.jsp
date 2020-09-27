<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
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
	href="http://localhost:8090/prj/css/fboard/fboardForm.css" />
<!-- font awesome -->
<!--  <script type="text/javascript" src="${contextPath }/prj/js/fboard/fboardForm.js" ></script>-->
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
<style type="text/css">
/* main : 페이징 */
main .paging {
	padding-left: 0px;
	display: flex;
	justify-content: center;
	font-size: 16px;
}

main .paging li {
	padding: 3px 8px;
	border: 1px solid var(- -border-color);
	font-family: "Sunflower";
}

main .paging li a {
	font-family: "Sunflower";
	text-decoration: none;
	color: var(- -text-color);
}

main .paging li:hover {
	background-color: var(- -linen-color);
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function modFn(){
		let pw = document.getElementById('pw').value;
		let title = document.getElementById('title').value;
		let f_comment = document.getElementById('f_comment').value;
		let fno = document.getElementById('fno').value;
		if(pw.length < 4){
			alert("비밀번호를 5자 이상으로 설정해주세요")	
			return;
		}
		if(title.length < 4){
			alert("제목을 5자 이상으로 작성하세요.")
			return;
		}
		if(f_comment.length < 4){
			alert("내용을 5자 이상으로 작성하세요.")
			return;
		}
		const Info = JSON.stringify({pw:pw,title:title,f_comment:f_comment,fno:fno});
		$.ajax({
			data : Info,
			url : "${contextPath}/prj/fboard/fboardmod",
			type : "put",
			dataType : "text",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data == 1){
					alert("수정성공");
					window.location="${contextPath}/prj/fboard/fboardList"
				}else{
					alert("수정실패");
				}
			},
			error : function(data){
				alert("에러발생")
			}
		})
	}
</script>
</head>
<body>
	<!-- uppermost -->
	<%@ include file="/WEB-INF/views/include/uppermost.jsp"%>

	<!-- nav -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<!-- main -->
	<main>
		<div class="container">
			<div class="content">
				<div action="#" id="writeForm">
					<legend>자유 게시판 글쓰기</legend>
					<ul>
						<li>
							<ul class="catePart">
								<li class="writePWC"><label for="writePW">비밀번호 설정</label> <input
									type="password" id="pw" name="pw" /></li>
							</ul>
						</li>
						<li><input type="hidden" id="writer" name="writer"
							value="${sessionScope.member.id}" readonly="readonly" /> <input
							type="text" id="title" name="title" placeholder="제목을 입력해 주세요."
							value="${vo.title }" /> <input type="hidden" id="fno"
							value="${vo.fno }" /></li>
						<li><textarea name="f_comment" id="f_comment"
								placeholder="내용을 입력해 주세요.">${vo.f_comment }</textarea></li>
						<li class="btnGrp">
							<button class="writeBtn" onClick="modFn()">등록</button>
							<button class="cancelBtn">취소</button>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</main>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
