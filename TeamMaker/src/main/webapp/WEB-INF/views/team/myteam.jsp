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
	    <link rel="stylesheet" href="http://localhost:8090/prj/css/team/myteam.css" />
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
            <!-- 내가 만든 팀 -->
            <div class="makeTeam">
              <div class="makeTeamTitle">내가 만든 팀</div>
              <div class="makeTeam1">
                <div class="makeTeam1_list">
                  <div class="makeTeam1_list2">              
	                <div class="belongTeam1_title"><span>팀 이름</span></div>
                    <ul>
                    	<c:forEach var="row" items="${list }">
                    		<li><a href="${contextPath }/prj/tboard/tboardlist/${row.tno}">${row.title }</a></li>
                    		 <div class="makeTeam1_list3">
                    <div></div>
                    <ul>
                      <li>
                        <a href=""
                          >관리<i class="fas fa-chevron-circle-right"></i
                        ></a>
                      </li>
                    </ul>
                  </div>
                    	</c:forEach>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <!-- 내가 속한 팀 -->
            <div class="belongTeam">
              <div class="belongTeamTitle">내가 속한 팀</div>
              <div class="belongTeam1">
                <div class="belongTeam1_title"><span>팀 이름</span></div>
                <div class="belongTeam1_list">
                  <div class="belongTeam1_list1">
                  <div class="belongTeam1_title"><span>팀 이름</span></div>
                    <ul>
                      <c:forEach var="row" items="${list2 }">
                    	<li>${row.title }</li>
                      </c:forEach>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </section>
        </div>
      </div>
      <div class="clearfix"></div>
     
     </main>
    

    <!-- footer -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
  </body>
</html>
