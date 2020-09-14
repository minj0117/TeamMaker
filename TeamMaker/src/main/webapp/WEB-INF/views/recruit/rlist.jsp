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
	href="http://localhost:8090/prj/css/include/rlist.css" />
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
<body>
	<!-- uppermost -->
	<%@ include file="/WEB-INF/views/include/uppermost.jsp"%>

	<!-- nav -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<!-- main -->
	<main>
      <div class="container">
        <div class="mtitle">팀원모집 검색</div>
        <div class="content">
          <!-- 사용자 선택 -->
          <div class="content content_up">
            <!-- 유형 -->
            <ul class="type">
              <li class="type title">유형</li>
              <ul class="type content">
                <li>
                  <input
                    type="checkbox"
                    name="online"
                    id="online"
                    value="online"
                  />
                  <label for="online">온라인</label>
                </li>
                <li>
                  <input
                    type="checkbox"
                    name="offline"
                    id="offline"
                    value="offline"
                  />
                  <label for="offline">오프라인</label>
                </li>
              </ul>
            </ul>
            <!-- 오프라인 클릭 시 지역 세분화 -->
            <ul class="area">
              <li class="area title">지역</li>
              <ul class="area content">
                <li>
                  <input type="checkbox" name="a1" id="a1" value="서울" />
                  <label for="a1">서울</label>
                </li>
                <li>
                  <input type="checkbox" name="a2" id="a2" value="경기" />
                  <label for="a2">경기</label>
                </li>
                <li>
                  <input type="checkbox" name="a3" id="a3" value="인천" />
                  <label for="a3">인천</label>
                </li>
                <li>
                  <input type="checkbox" name="a4" id="a4" value="대전" />
                  <label for="a4">대전</label>
                </li>
                <li>
                  <input type="checkbox" name="a5" id="a5" value="대구" />
                  <label for="a5">대구</label>
                </li>
                <li>
                  <input type="checkbox" name="a6" id="a6" value="부산" />
                  <label for="a6">부산</label>
                </li>
                <li>
                  <input type="checkbox" name="a7" id="a7" value="울산" />
                  <label for="a7">울산</label>
                </li>
                <li>
                  <input type="checkbox" name="a8" id="a8" value="광주" />
                  <label for="a8">광주</label>
                </li>
                <li>
                  <input type="checkbox" name="a9" id="a9" value="강원" />
                  <label for="a9">강원</label>
                </li>
                <li>
                  <input type="checkbox" name="a10" id="a10" value="세종" />
                  <label for="a10">세종</label>
                </li>
                <li>
                  <input type="checkbox" name="a11" id="a11" value="충북" />
                  <label for="a11">충북</label>
                </li>
                <li>
                  <input type="checkbox" name="a12" id="a12" value="충남" />
                  <label for="a12">충남</label>
                </li>
                <li>
                  <input type="checkbox" name="a13" id="a13" value="경북" />
                  <label for="a13">경북</label>
                </li>
                <li>
                  <input type="checkbox" name="a14" id="a14" value="경남" />
                  <label for="a14">경남</label>
                </li>
                <li>
                  <input type="checkbox" name="a15" id="a15" value="전북" />
                  <label for="a15">전북</label>
                </li>
                <li>
                  <input type="checkbox" name="a16" id="a16" value="전남" />
                  <label for="a16">전남</label>
                </li>
                <li>
                  <input type="checkbox" name="a17" id="a17" value="제주" />
                  <label for="a17">제주</label>
                </li>
                <li>
                  <input type="checkbox" name="a18" id="a18" value="전국" />
                  <label for="a18">전국</label>
                </li>
              </ul>
            </ul>

            <!-- 분야 -->
            <ul class="field">
              <li class="field title">분야</li>
              <ul class="field content">
                <li>
                  <input type="checkbox" name="gong" id="gong" value="공모전" />
                  <label for="gong">공모전</label>
                </li>
                <li>
                  <input type="checkbox" name="dae" id="dae" value="대외활동" />
                  <label for="dae">대외활동</label>
                </li>
                <li>
                  <input
                    type="checkbox"
                    name="study"
                    id="study"
                    value="스터디"
                  />
                  <label for="study">스터디</label>
                </li>
              </ul>
            </ul>

            <!-- 버튼 -->
            <div class="btnGrp">
              <button class="findBtn"><i class="fas fa-search"></i>검색</button>
              <button class="resetBtn">
                <i class="fas fa-redo"></i>초기화
              </button>
            </div>
          </div>

          <!-- 팀원모집 글보기 -->
          <div class="content content_down">
            <div class="content_down title">
              <div>글번호</div>
              <div>카테고리</div>
              <div>제목</div>
              <div>아이디</div>
              <div>조회수</div>
            </div>
            <div class="content_down list">
              <!-- list1 -->
              <div class="rnum">111111</div>
              <div class="rcategory">대외활동</div>
              <div class="rtitle">
                <a href="#"
                  >Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  Repudiandae, explicabo!</a
                >
              </div>
              <div class="id">minj0117af</div>
              <div class="rcnt">999999</div>
              <!-- list2 -->
              <div class="rnum">111</div>
              <div class="rcategory">공모전</div>
              <div class="rtitle"><a href="#">Lorem ipsum dolor sit.</a></div>
              <div class="id">asdfg1234</div>
              <div class="rcnt">999</div>
              <!-- list3 -->
              <div class="rnum">111</div>
              <div class="rcategory">공모전</div>
              <div class="rtitle"><a href="#">Lorem ipsum dolor sit.</a></div>
              <div class="id">asdfg1234</div>
              <div class="rcnt">999</div>
              <!-- list4 -->
              <div class="rnum">111</div>
              <div class="rcategory">공모전</div>
              <div class="rtitle"><a href="#">Lorem ipsum dolor sit.</a></div>
              <div class="id">asdfg1234</div>
              <div class="rcnt">999</div>
              <!-- list5 -->
              <div class="rnum">111</div>
              <div class="rcategory">공모전</div>
              <div class="rtitle"><a href="#">Lorem ipsum dolor sit.</a></div>
              <div class="id">asdfg1234</div>
              <div class="rcnt">999</div>
              <!-- list6 -->
              <div class="rnum">111</div>
              <div class="rcategory">공모전</div>
              <div class="rtitle"><a href="#">Lorem ipsum dolor sit.</a></div>
              <div class="id">asdfg1234</div>
              <div class="rcnt">999</div>
              <!-- list7 -->
              <div class="rnum">111</div>
              <div class="rcategory">공모전</div>
              <div class="rtitle"><a href="#">Lorem ipsum dolor sit.</a></div>
              <div class="id">asdfg1234</div>
              <div class="rcnt">999</div>
              <!-- list8 -->
              <div class="rnum">111</div>
              <div class="rcategory">공모전</div>
              <div class="rtitle"><a href="#">Lorem ipsum dolor sit.</a></div>
              <div class="id">asdfg1234</div>
              <div class="rcnt">999</div>
              <!-- list9 -->
              <div class="rnum">111</div>
              <div class="rcategory">공모전</div>
              <div class="rtitle"><a href="#">Lorem ipsum dolor sit.</a></div>
              <div class="id">asdfg1234</div>
              <div class="rcnt">999</div>
              <!-- list10 -->
              <div class="rnum">111</div>
              <div class="rcategory">공모전</div>
              <div class="rtitle"><a href="#">Lorem ipsum dolor sit.</a></div>
              <div class="id">asdfg1234</div>
              <div class="rcnt">999</div>
            </div>
            <!-- 글쓰기 버튼 -->
            <div class="writeBtn">
              <button><i class="fas fa-pen"></i>글쓰기</button>
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
      </div>
    </main>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
