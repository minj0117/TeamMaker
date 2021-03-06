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
	href="http://localhost:8090/prj/css/team/teamboardList.css" />
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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	
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
            <div>
              <!-- 게시판 부분 -->
              <div class="boardPart">
                <div class="boardPart_up">
                  <div class="upTitle">
                    <i class="fas fa-chalkboard"></i>게시판
                  </div>
                  <div class="writeBtn">
                    <i class="fas fa-pen"></i>
                    <input
                      type="button"
                      class="boardBtn"
                      value="글쓰기"
                      onClick="location.href='${contextPath}/prj/tboard/boardForm?tno=${tno }'"
                    />
                  </div>
                </div>
                <div class="boardPart_down">
                  <div class="boardPartTitle">
                    <div>제목</div>
                    <div>아이디</div>
                    <div>작성일</div>
                  </div>
                  <div class="boardPartContent">
                    <c:if test="${list ne null }">
                      <c:forEach var="row" items="${list }">
                            <div class="original">
                              <div class="rtitle">
                              <c:choose>
                              	<c:when test="${row.level > 1 }">
                              	<c:forEach begin="1" end="${row.level }" step="1">
									<div class="paddingarea" style="padding-left : 10px;"></div>
                                </c:forEach>
                                	<a href="${contextPath }/prj/tboard/boardView/${row.bno }?bno=${row.bno}&tno=${tno}">┗> ${row.title }</a>
								</c:when>
								<c:otherwise>
									<a href="${contextPath }/prj/tboard/boardView/${row.bno }?bno=${row.bno}&tno=${tno}">${row.title }</a>
								</c:otherwise>
							  </c:choose>                                
                              </div>
                              <div class="id">${row.writer }</div>
                              <div class="rdate">${row.cdate }</div>
                            </div>
                      </c:forEach>
                    </c:if>
                  </div>
                </div>
                <!-- 페이징 -->
                <div class="paging">
                  <div id="pagingDiv">
                    <c:if test="${paging.prev}">
                      <a href="${paging.startPage - 1 }">이전</a>
                    </c:if>
                    <c:forEach
                      var="num"
                      begin="${paging.startPage}"
                      end="${paging.endPage }"
                    >
                      &nbsp;<a href="${num }">${num }</a>&nbsp;
                    </c:forEach>
                    <c:if test="${paging.next}">
                      <a id="next" href="${paging.endPage + 1 }">다음</a>
                    </c:if>
                  </div>
                  <form
                    id="pagingFrm"
                    name="pagingForm"
                    action="${contextPath }/prj/tboard/talkList"
                    method="get"
                  >
                    <input type="hidden" id="tno" name="tno" value="${tno }" />
                    <input
                      type="hidden"
                      id="pageNum"
                      name="pageNum"
                      value="${paging.cri.pageNum }"
                    />
                    <input
                      type="hidden"
                      id="amount"
                      name="amount"
                      value="${paging.cri.amount }"
                    />
                  </form>
                </div>
              </div>
            </div>
          </section>
        </div>
      </div>
      <div class="clearfix"></div>
    </main>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#pagingDiv a').click(function(e) {
								e.preventDefault();
								$('#pageNum').val($(this).attr("href"));
								pagingForm.submit();

							});
						});
	</script>
</body>
</html>