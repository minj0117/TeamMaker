<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scalnume=1.0" />
    <title>main</title>
    <!-- bootstrap -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
      crossorigin="anonymous"
    />
    <script
      src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
      integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
      integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
      crossorigin="anonymous"
    ></script>
	    <link rel="stylesheet" href="http://localhost:8090/prj/css/team/teamboardForm.css" />
    <!-- font awesome -->
    <script
      src="https://kit.fontawesome.com/2d323a629b.js"
      crossorigin="anonymous"
    ></script>
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
    
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function writeFn(){
		let writer = document.getElementById('writer').value;
		let title = document.getElementById('title').value;
		let b_comment = document.getElementById('b_comment').value;
		let tno = document.getElementById('tno').value;
		let bno = document.getElementById('bno').value;
		
		const Info = JSON.stringify({writer:writer,title:title,b_comment:b_comment,tno:tno,bno:bno});
		$.ajax({
			data : Info,
			url : "${contextPath}/prj/tboard/boardReply",
			type : "post",
			dataType : "text",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data == 1){
					alert("등록성공");
					window.location="${contextPath}/prj/tboard/boardList?tno=${tno}"
				}else{
					alert("등록실패");
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
    <%@ include file="/WEB-INF/views/include/uppermost.jsp" %>
    <!-- nav -->
    <%@ include file="/WEB-INF/views/include/nav.jsp" %>
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
            <form action="">
              <div>팀 게시판 글쓰기</div>
              <ul>
                <li>
                  <input type="text" id="title" name="title" placeholder="제목을 입력해 주세요" />
                </li>
                <li>
                  <textarea
                    name="b_comment"
                    id="b_comment"
                    placeholder="내용을 입력해 주세요"
                  ></textarea>
                </li>
                <li class="btngrp">
                  <input type="button" onClick="writeFn()" class="submitBtn" value="등록">
                </li>
              </ul>
              <input type="hidden" id="writer" name="writer" value="${sessionScope.member.id }">
              <input type="hidden" id="tno" name="tno" value="${tno }">
              <input type="hidden" id="bno" name="bno" value="${bno }">
            </form>
          </section>
        </div>
      </div>
      <div class="clearfix"></div>
    </main>
    
	<!-- footer -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>