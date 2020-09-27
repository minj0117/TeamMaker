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
	    <link rel="stylesheet" href="http://localhost:8090/prj/css/include/home.css" />
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
    <!-- header -->
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    
    <!-- nav -->
    <%@ include file="/WEB-INF/views/include/nav.jsp" %>

    <!-- main -->
    <main>
      <div class="container">
        <!-- 팀원 모집 -->
        <div class="team_matching">
          <div id="matching_title">팀원 모집</div>
          <div class="matching_wrapper">
          <c:forEach var="row" items="${rank }">
            <div>
                <a href="${contextPath }/prj/rview/${row.rno}">${row.rtitle }</a>
            </div>          	
          </c:forEach>
          </div>
        </div>

        <!-- 공모전 -->
        <div class="gong">
          <div id="gong_title">공모전</div>
          <div class="gong_wrapper">
           	<c:forEach var="row" items="${rankgong }">
            <div>
              <a href="${contextPath }/prj/gong/gview/${row.gno}"><img src="${contextPath }/imgg/${row.pic }" alt="" /></a>
            <div class="dae_text">
              <div>${row.title }</div>
              <div>기간 : ${row.applystart } - ${row.applyend }</div>
            </div>
            </div>
          </c:forEach>
          </div>
        </div>

        <!-- 대외활동 -->
        <div class="dae">
          <div id="dae_title">대외활동</div>
          <div class="dae_wrapper">
          <c:forEach var="row" items="${rankdae }">
            <div>
              <a href="${contextPath }/prj/dae/dview/${row.dno}"><img src="${contextPath }/imgs/${row.pic }" alt="" /></a>
            <div class="dae_text">
              <div>${row.title }</div>
              <div>기간 : ${row.applystart } - ${row.applyend }</div>
            </div>
            </div>
          </c:forEach>
          </div>
        </div>

        <!-- 관련 기사 -->
        <div class="arti">
          <div id="arti_title">관련 기사</div>
          <div class="arti_wrapper">
            <div>
              <a href="#"><img src="http://localhost:8090/prj/img/pic.jpg" alt="" /></a>
            </div>
            <div>
              <a href="#"
                >공모전을 준비하는 이유는?!<br> 취준생들의 솔직한 답변을 취재 해보았습니다!!!</a
              >
            </div>
            <div id="arti_left">
              <a href="#"
                >ICT, 미디어 , 디자인등 2020년 가장 핫한 공모전은 무었이었을까요?!</a
              >
            </div>
            <div id="arti_right"></div>
          </div>
        </div>
      </div>
    </main>
	<a href="${contextPath }/prj/sendMail.do">메일</a>
    <!-- footer -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
  </body>
</html>
