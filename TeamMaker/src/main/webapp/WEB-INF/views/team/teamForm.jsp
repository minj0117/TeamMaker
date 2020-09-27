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
	href="http://localhost:8090/prj/css/team/teamForm.css" />
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
<script type="text/javascript">
	window.addEventListener("load",init);
	function init(){
		let createBtn = document.getElementById('createBtn');
		createBtn.addEventListener("click", createFn);
	}
	function createFn(e){
		e.preventDefault();
		let title = document.getElementById('title');
		let createForm = document.getElementById('createForm');
		if(title.value.trim() == 0){
			alert("팀명을 입력하세요");
			return;
		}
		createForm.method="post";
		createForm.submit();
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
                  <li><a href="${contextPath }/prj/member/modifyForm">회원정보 수정</a></li>
                  <li><a href="${contextPath }/prj/member/delMemberForm">회원 탈퇴</a></li>
                </ul>
              </ul>
            </div>
          </aside>
          <!-- section -->
          <section>
            <div class="atitle">
              마이 페이지<span>&nbsp;</span>
              <i class="fas fa-chevron-right"></i>
              <span>&nbsp;</span>나의 활동
            </div>
            <div class="stitle"><span>${sessionScope.member.id }</span>님 반갑습니다</div>
            <form action="${contextPath }/prj/maketeam" id="createForm" name="createForm">
              <ul>
                <li>
                  <label for="m1">팀장</label>
                  <span>&nbsp;</span>
                  <span>:</span>
                  <span>&nbsp;</span>
                  <input type="text" id="owner" name="owner" value="${sessionScope.member.id}" readonly="readonly"><br>
                </li>
                <li>
                  <label for="m2">팀명</label>
                  <span>&nbsp;</span>
                  <span>:</span>
                  <span>&nbsp;</span>
                  <input type="text" id="title" name="title"><br>
                </li>
                <li>
                  <label for="m3">팀소개</label>
                  <span>&nbsp;</span>
                  <span>:</span>
                  <span>&nbsp;</span>
                  <textarea rows="10" cols="10" id="acomment" name="acomment"></textarea><br>
                </li>
              </ul>
              <div>
               <input type="button" id="createBtn" name="createBtn" value="생성">
              </div>
            </form>
          </section>
        </div>
      </div>
      <div class="clearfix"></div>
    </main>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>