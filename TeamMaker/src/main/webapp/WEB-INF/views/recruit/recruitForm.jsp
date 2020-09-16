<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
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
	href="http://localhost:8090/prj/css/recruit/recruitForm.css" />
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
<script type="text/javascript">
window.addEventListener("load",init);
function init(){
	let writeBtn = document.getElementById('writeBtn');
	writeBtn.addEventListener("click", writeFn);
}
function writeFn(e){
	e.preventDefault();
	console.log(e.target);
	let writeForm = document.getElementById('writeForm');
	let rpw = document.getElementById('rpw');
	let rtitle = document.getElementById('rtitle');
	let ronoff = document.querySelectorAll("input[name='ronoff']");
	let areas = document.querySelectorAll("input[name='rregion']");
	if(rpw.value.trim().length == 0){
		alert('비밀번호를 입력하세요');
		return;
	}
	let ronofflist = Array.from(ronoff);
	if(ronofflist[0].checked != true && ronofflist[1].checked != true){
		alert('온/오프 여부를 입력하세요');
		return;
	}
	let arealist = Array.from(areas);
	let areacheck  = 0;
	for(let i = 0; i<arealist.length; i++){
		if(arealist[i].checked== true)
			areacheck++;
	}
	if(ronofflist[1].checked && areacheck < 1){
		alert('지역을 선택하세요');
		return;
	}if(rtitle.value.trim().length == 0){
		alert('제목을 입력하세요');
		return;
	}
	if($("#rcategory").val() == ""){
		alert("카테고리를 정해주세요.");
		return;
	}
	
	writeForm.method="post";
	writeForm.submit();
}
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
          <form action="/prj/insertR" id="writeForm" name="writeForm" method="post">
            <legend>팀원 모집 글쓰기</legend>
            <ul>
              <li>
                <ul class="catePart">
                  <li>
                    <select name="rcategory" id="rcategory">
                      <option value="">==선택==</option>
                      <option value="공모전">공모전</option>
                      <option value="대외활동">대외활동</option>
                      <option value="스터디">스터디</option>
                    </select>
                  </li>
                  <li class="writePWC">
                    <label for="writePW">비밀번호 설정</label>
                    <input type="password" id="rpw" name="rpw" />
                  </li>
                </ul>
              </li>
              <li class="radioButton">
                <div>유형</div>
                <ul>
                  <li>
                    <input
                      type="radio"
                      name="ronoff"
                      id="online"
                      value="on"
                    />
                    <label for="online">온라인</label>
                  </li>
                  <li>
                    <input
                      type="radio"
                      name="ronoff"
                      id="offline"
                      value="off"
                    />
                    <label for="offline">오프라인</label>
                  </li>
                </ul>
              </li>
              <li>
                <!-- 오프라인 클릭 시 지역 세분화 -->
                <ul class="wrapper-area">
                  <li class="area title">지역</li>
                  <ul class="area content">
                    <li>
                      <input type="radio" name="rregion" id="a1" value="서울" />
                      <label for="a1">서울</label>
                    </li>
                    <li>
                      <input type="radio" name="rregion" id="a2" value="경기" />
                      <label for="a2">경기</label>
                    </li>
                    <li>
                      <input type="radio" name="rregion" id="a3" value="인천" />
                      <label for="a3">인천</label>
                    </li>
                    <li>
                      <input type="radio" name="rregion" id="a4" value="대전" />
                      <label for="a4">대전</label>
                    </li>
                    <li>
                      <input type="radio" name="rregion" id="a5" value="대구" />
                      <label for="a5">대구</label>
                    </li>
                    <li>
                      <input type="radio" name="rregion" id="a6" value="부산" />
                      <label for="a6">부산</label>
                    </li>
                    <li>
                      <input type="radio" name="rregion" id="a7" value="울산" />
                      <label for="a7">울산</label>
                    </li>
                    <li>
                      <input type="radio" name="rregion" id="a8" value="광주" />
                      <label for="a8">광주</label>
                    </li>
                    <li>
                      <input type="radio" name="rregion" id="a9" value="강원" />
                      <label for="a9">강원</label>
                    </li>
                    <li>
                      <input type="radio" name="rregion" id="a10" value="세종" />
                      <label for="a10">세종</label>
                    </li>
                    <li>
                      <input type="radio" name="rregion" id="a11" value="충북" />
                      <label for="a11">충북</label>
                    </li>
                    <li>
                      <input type="radio" name="rregion" id="a12" value="충남" />
                      <label for="a12">충남</label>
                    </li>
                    <li>
                      <input type="radio" name="rregion" id="a13" value="경북" />
                      <label for="a13">경북</label>
                    </li>
                    <li>
                      <input type="radio" name="rregion" id="a14" value="경남" />
                      <label for="a14">경남</label>
                    </li>
                    <li>
                      <input type="radio" name="rregion" id="a15" value="전북" />
                      <label for="a15">전북</label>
                    </li>
                    <li>
                      <input type="radio" name="rregion" id="a16" value="전남" />
                      <label for="a16">전남</label>
                    </li>
                    <li>
                      <input type="radio" name="rregion" id="a17" value="제주" />
                      <label for="a17">제주</label>
                    </li>
                    <li>
                      <input type="radio" name="rregion" id="a18" value="전국" />
                      <label for="a18">전국</label>
                    </li>
                  </ul>
                </ul>
              </li>
              <li>
                <input type="text" id="rtitle" name="rtitle" placeholder="제목을 입력해 주세요." />
              </li>
              <li>
                <textarea
                  name="rcomment"
                  id="rcomment"
                  placeholder="내용을 입력해 주세요."
                ></textarea>
              </li>
              <li class="attached">
                <c:forEach var="row" items="${list }">
                	<input type="radio" name="tno" value="${row.tno }">${row.title }
                </c:forEach>
              </li>
              <li class="btnGrp">
                <button id="writeBtn" name="writeBtn" class="writeBtn" onClick="writeFn()">등록</button>
                <button class="cancelBtn">취소</button>
              </li>
            </ul>
             <input type="hidden" id="id" name="id" value="${sessionScope.member.id }" />
          </form>
        </div>
      </div>
    </main>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script src="http://localhost:8090/prj/js/recruit/recruitForm.js"></script>
</body>
</html>
