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
	    <link rel="stylesheet" href="http://localhost:8090/prj/css/team/fileuploadForm.css" />
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
	/*function uploadFn(){
		let writer = document.getElementById('writer').value;
		let title = document.getElementById('title').value;
		let f_comment = document.getElementById('f_comment').value;
		let tno = document.getElementById('tno').value;
		let uploadFile = document.getElementById('uploadFile').value;
		
		const Info = JSON.stringify({writer:writer, title:title, f_comment:f_comment, tno:tno, uploadFile:uploadFile});
		$.ajax({
			data : Info, uploadFile
			url : "${contextPath}/prj/tboard/boardMod",
			enctype="multipart/form-data",
			processData : false,
			type : "put",
			dataType : "text",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data == 1){
					alert("수정성공");
					window.location="${contextPath}/prj/tboard/boardList?tno=${vo.tno}"
				}else{
					alert("수정실패");
				}
			},
			error : function(data){
				alert("에러발생")
			}
		})
	}*/
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
            <div class="stitle"><span>${sessionScope.member.id}</span>님 반갑습니다</div>
            <form action="${contextPath }/prj/tboard/fileupload" method="post" enctype="multipart/form-data">
              <div class="uploadTitle">파일 업로드</div>
              
              <!-- 코멘트 작성 -->
              <div class="commentPart">
                <div></div>
                <div class="commentArea">
                  <input type="text" placeholder="제목 입력" id="title" name="title" />
                  <textarea
                    name="f_comment"
                    id="f_comment"
                    placeholder="내용 입력"
                  ></textarea>
                  <!-- 파일 업로드 -->
              		<input type="file" id="uploadFile" name="uploadFile">
                </div>
              </div>
              <input type="hidden" id="writer" name="writer" value="${sessionScope.member.id }">
              <input type="hidden" id="tno" name="tno" value="${tno }">
              <!-- 버튼 -->
              <div class="btn">
                <input type="submit" id="uploadBtn" value="업로드 하기" />
                <input type="button" id="cancelBtn" value="취소" />
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
