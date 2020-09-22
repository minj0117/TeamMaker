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
	    <link rel="stylesheet" href="http://localhost:8090/prj/css/team/rview.css" />
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
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function deleteFn(){
		let bno = document.getElementById('bno').value;
		const Info = JSON.stringify({bno:bno});
		$.ajax({
			data : Info,
			url : "${contextPath}/prj/tboard/boardDelete",
			type : "delete",
			dataType : "text",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data == 1){
					alert("삭제성공");
					window.location="${contextPath}/prj/tboard/boardList?tno=${vo.tno}"
				}else{
					alert("삭제실패");
				}
			},
			error : function(data){
				alert("에러발생")
			}
		})
	}
	
</script>
<body>
	 <!-- main -->
    <main>
      <div class="container">
        <div class="content">
          <!-- aside -->
          <aside>
            <div>
              <div class="atitle">마이페이지</div>
              <ul>
                <li class="astitle">나의 게시글</li>
                <ul>
                  <li><a href="#">팀원 모집</a></li>
                  <li><a href="#">자유 게시판</a></li>
                </ul>
              </ul>
              <ul>
                <li class="astitle">나의 활동</li>
                <ul>
                  <li><a href="#">1:1 문의 내역</a></li>
                  <li><a href="#">나의 신청 내역</a></li>
                  <li><a href="#">지원자 보기</a></li>
                  <li><a href="#">팀 게시판</a></li>
                </ul>
              </ul>
              <ul>
                <li class="astitle">나의 정보</li>
                <ul>
                  <li><a href="#">회원정보 수정</a></li>
                  <li><a href="#">회원 탈퇴</a></li>
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
            <div class="stitle"><span>abcdefg</span>님 반갑습니다</div>
            <div class="hiddenTitle">
              모바일 버전에서는 팀 게시판 서비스를 지원하지 않습니다.
            </div>
            <form action="" id="myTeamBoardPostView">
              <div class="formTitle">팀 게시글</div>
              <!-- 글 내용 -->
              <div class="commContentBox">
                <!-- article header 부분 -->
                <div class="comm_header">
                  <div class="commTitle">
                    <input type="hidden" id="bno" name="bno" value="${vo.bno }">
                    <div class="rtitle" id="rtitle">${vo.title }</div>
                    <div class="writerInfo">
                      <div class="image">
                        <img src="../img/defaultImg.jpg" alt="" />
                      </div>
                      <div class="profile_area">
                        <div class="profile_info">
                          <div class="rid" id="rid">${vo.writer }</div>
                        </div>
                        <div class="comm_info">
                          <span class="rdate" id="rdate"
                            >2020.08.24. 08:40</span
                          >
                          <span>조회수</span>
                          <span class="rcnt">${vo.cnt }</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- article content 부분 -->
                <div class="comm_content">
                  <div class="comm_content1">
                    ${vo.b_comment }
                  </div>
              	

              <!-- comm_btns 부분 -->
              
              <div class="comm_btns">
              <c:if test="${sessionScope.member.id eq vo.writer }">
                <input type="button" class="modifyBtn" onClick="location.href='${contextPath }/prj/tboard/boardModForm?bno=${vo.bno }'" value="수정"></button>
                <input type="button" class="deleteBtn" onClick="deleteFn()" value="삭제">
                </c:if>
                <button class="replyBtn">답글</button>
                <input type="button" class="listBtn" onClick="location.href='${contextPath}/prj/tboard/boardList?tno=${vo.tno }'" value="목록"></button>
              </div>
            </form>
          </section>
        </div>
      </div>
      <div class="clearfix"></div>
    </main>
</body>
</html>