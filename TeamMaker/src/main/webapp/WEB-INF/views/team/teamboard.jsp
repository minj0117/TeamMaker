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
	    <link rel="stylesheet" href="http://localhost:8090/prj/css/team/teamboard.css" />
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
            <form action="">
              <!-- 문서 부분 -->
              <div class="filePart">
                <div class="filePart_up">
                  <div><i class="far fa-folder-open"></i>문서</div>
                  <button class="uploadBtn">파일 업로드</button>
                </div>
                <div class="filePart_down">
                  <!-- con1 -->
                  <div class="file">
                    <a href=""
                      >Lorem ipsum dolor sit amet consectetur adipisicing elit.
                      Architecto maior
                    </a>
                  </div>
                  <div class="id"><a href="">작성자 아이디</a></div>
                  <div class="rdate">2020.09.10</div>
                  <!-- con1 -->
                  <div class="file"><a href="">파일 관련 제목</a></div>
                  <div class="id"><a href="">작성자 아이디</a></div>
                  <div class="rdate">2020.09.10</div>
                  <!-- con1 -->
                  <div class="file"><a href="">파일 관련 제목</a></div>
                  <div class="id"><a href="">작성자 아이디</a></div>
                  <div class="rdate">2020.09.10</div>
                  <!-- con1 -->
                  <div class="file"><a href="">파일 관련 제목</a></div>
                  <div class="id"><a href="">작성자 아이디</a></div>
                  <div class="rdate">2020.09.10</div>
                  <!-- con1 -->
                  <div class="file"><a href="">파일 관련 제목</a></div>
                  <div class="id"><a href="">작성자 아이디</a></div>
                  <div class="rdate">2020.09.10</div>
                  <!-- con1 -->
                  <div class="file"><a href="">파일 관련 제목</a></div>
                  <div class="id"><a href="">작성자 아이디</a></div>
                  <div class="rdate">2020.09.10</div>
                  <!-- con1 -->
                  <div class="file"><a href="">파일 관련 제목</a></div>
                  <div class="id"><a href="">작성자 아이디</a></div>
                  <div class="rdate">2020.09.10</div>
                  <!-- con1 -->
                  <div class="file"><a href="">파일 관련 제목</a></div>
                  <div class="id"><a href="">작성자 아이디</a></div>
                  <div class="rdate">2020.09.10</div>
                  <!-- con1 -->
                  <div class="file"><a href="">파일 관련 제목</a></div>
                  <div class="id"><a href="">작성자 아이디</a></div>
                  <div class="rdate">2020.09.10</div>
                  <!-- con1 -->
                  <div class="file"><a href="">파일 관련 제목</a></div>
                  <div class="id"><a href="">작성자 아이디</a></div>
                  <div class="rdate">2020.09.10</div>
                </div>
                <!-- 페이징 -->
                <ul class="paging">
                  <li>
                    <a href="#"><i class="fas fa-angle-double-left"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="fas fa-angle-left"></i></a>
                  </li>
                  <li><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">5</a></li>
                  <li><a href="#">6</a></li>
                  <li><a href="#">7</a></li>
                  <li><a href="#">8</a></li>
                  <li><a href="#">9</a></li>
                  <li><a href="#">10</a></li>
                  <li>
                    <a href="#"><i class="fas fa-angle-right"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="fas fa-angle-double-right"></i></a>
                  </li>
                </ul>
              </div>
              <!-- 게시판 부분 -->
              <div class="boardPart">
                <div class="boardPart_up">
                  <div><i class="fas fa-chalkboard"></i>게시판</div>
                  <input type="button" class="boardBtn" value="글쓰기" onClick="location.href='${contextPath}/prj/tboard/boardForm?tno=${tno }'"></button>
                </div>
                <div class="boardPart_down">
                  <div class="boardPartTitle">
                    <div>제목</div>
                    <div>아이디</div>
                    <div>작성일</div>
                  </div>
                  <div class="boardPartContent">
                  <c:if test='${list ne null }'>
                  	<c:forEach var="row" items="${list }">
                    <!-- con1 -->
                    <c:choose>
                    <c:when test='${row.level > 1 }'>
                    <div class="reply">
                    <c:forEach begin="1" end="${row.level }" step="1">
                    	<div class="test" style="padding-left:20px"></div>
                    </c:forEach>
                    	<div class="rtitle"><a href="${contextPath }/prj/tboard/boardView/${row.bno }?bno=${row.bno}">${row.title }</a></div>
                    </div>
                    <!-- <div style="padding-left:40px" class="rtitle"><a href="">${row.title }</a></div> -->
                    <div class="id"><a href="">${row.writer }</a></div>
                    <div class="rdate">${row.cdate }</div>
                    </c:when>
                    <c:otherwise>
                    <div class="rtitle"><a href="${contextPath }/prj/tboard/boardView/${row.bno }?bno=${row.bno}">${row.title }</a></div>
                    <div class="id"><a href="">${row.writer }</a></div>
                    <div class="rdate">${row.cdate }</div>
                    </c:otherwise>
                    </c:choose>
                    </c:forEach>
                   </c:if>
                  </div>
                </div>
                <!-- 페이징 -->
                <ul class="paging">
                  <li>
                    <a href="#"><i class="fas fa-angle-double-left"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="fas fa-angle-left"></i></a>
                  </li>
                  <li><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">5</a></li>
                  <li><a href="#">6</a></li>
                  <li><a href="#">7</a></li>
                  <li><a href="#">8</a></li>
                  <li><a href="#">9</a></li>
                  <li><a href="#">10</a></li>
                  <li>
                    <a href="#"><i class="fas fa-angle-right"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="fas fa-angle-double-right"></i></a>
                  </li>
                </ul>
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