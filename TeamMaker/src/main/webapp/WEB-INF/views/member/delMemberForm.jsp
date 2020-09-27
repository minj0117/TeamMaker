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
	    <link rel="stylesheet" href="${contextPath }/prj/css/member/delForm.css" />
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
function delFn(){
	let id = document.getElementById('id').value;
	let pw = document.getElementById('pw').value;
	if(pw.length == 0){
		alert("회원정보를 입력하세요.");
		return;
	}
	const memberInfo = JSON.stringify({id:id,pw:pw});
	console.log(memberInfo);
	$.ajax({
		data : memberInfo,
		url : "${contextPath}/prj/member/delMember",
		type : "post",
		dataType : "text",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(data == 1){
				alert("그동안 이용해 주셔서 감사합니다.");
				window.location="${contextPath}/prj"
			}else{
			 	alert("회원정보가 일치하지 않습니다.");
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
              <span>&nbsp;</span>나의 정보
            </div>
            <div class="stitle"><span>abcdefg</span>님 반갑습니다</div>
            <form action="">
              <div class="scontent">
                <div class="pwchk1">비밀번호 재확인</div>
                <div class="pwchk2">
                  <div>
                    회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번
                    확인합니다.
                  </div>
                  <div>
                    비밀번호는 다른 사람에게 노출되지 않도록 주의해주시기
                    바랍니다.
                  </div>
                </div>
                <div class="pwchk3">
                  <label for="pw">비밀번호</label>
                  <input type="password" id="pw" />
                  <input type="hidden" id="id" value="${sessionScope.member.id }"/>
                </div>
                <div class="pwchk4"><input type="button" value="확인" onClick="delFn()"/></div>
              </div>
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