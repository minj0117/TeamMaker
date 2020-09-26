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
	href="http://localhost:8090/prj/css/member/rreport.css" />
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
              <div class="atitle">관리자 페이지</div>
              <ul>
                <li class="astitle">게시글</li>
                <ul>
                  <li>
                    <a
                      href="./gongPosting.html"
                      target="_blank"
                      onclick="window.open('./gongPosting.html','window','width=800,height=800,left=0, top=0, scrollbars=yes');return false"
                      >공모전</a
                    >
                  </li>
                  <li>
                    <a
                      href="./daePosting.html"
                      target="_blank"
                      onclick="window.open('./daePosting.html','window','width=800,height=800,left=0, top=0, scrollbars=yes');return false"
                      >대외활동</a
                    >
                  </li>
                  <li>
                    <a
                      href="./articlePosting.css"
                      target="_blank"
                      onclick="window.open('./articlePosting.html','window','width=800,height=800,left=0, top=0, scrollbars=yes');return false"
                      >관련 기사</a
                    >
                  </li>
                </ul>
              </ul>
              <ul>
                <li class="astitle">신고</li>
                <ul>
                  <li><a href="#">팀원 모집 게시판 신고</a></li>
                  <li><a href="#">자유 게시판 신고</a></li>
                  <li><a href="#">경고 누적 아이디</a></li>
                  <li><a href="#">사용 중지 아이디</a></li>
                  <li><a href="#"></a></li>
                </ul>
              </ul>
              <ul>
                <li class="astitle">고객센터</li>
                <ul>
                  <li><a href="#">1:1 문의</a></li>
                  <li><a href="#">공지사항</a></li>
                </ul>
              </ul>
            </div>
          </aside>
          <!-- section -->
          <section>
            <div class="stitle"><span>관리자</span>님 반갑습니다</div>
            <div class="mtbTitle">자유 게시판 신고</div>
            <div class="mtbReport">
              <!-- reportList 시작 -->
              <div class="reportTitle">
                <div>글번호</div>
                <div>제목</div>
                <div>아이디</div>
                <div>작성일</div>
                <div id="reportColor">신고 횟수</div>
              </div>
              <!-- reportList  -->
              <div class="reportList">
                <div class="rno">333</div>
                <div class="rtitle">
                  <a href=""
                    >Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.</a
                  >
                </div>
                <div class="id"><a href="">akdjmk2309</a></div>
                <div class="rdate">2020.09.09</div>
                <div class="reportNum">10</div>
              </div>
            </div>
          </section>
        </div>
      </div>
      <div class="clearfix"></div>
    </main>
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>