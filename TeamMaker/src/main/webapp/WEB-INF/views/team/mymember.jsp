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
	    <link rel="stylesheet" href="http://localhost:8090/prj/css/team/mymember.css" />
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
function addFn(num){
	let ano = document.getElementById('ano'.concat(num)).value;
	let tno = document.getElementById('tno'.concat(num)).value;
	let applyid = document.getElementById('applyid'.concat(num)).innerHTML;
	
	const Info = JSON.stringify({ano:ano,tno:tno,applyid:applyid});
	$.ajax({
		data : Info,
		url : "${contextPath}/prj/addteamuser",
		type : "post",
		dataType : "text",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			console.log(data);
			if(data == 1){
				alert("추가되었습니다.");
				location.reload();
			}else{
				alert("다시시도해주세요.");
			}
		},
		error : function(data,textStatus){
			alert("에러가 발생했습니다.");
		}
	})
}

function delFn(num){
	let userid = document.getElementById('userid'.concat(num)).innerText;
	let tno = document.getElementById('tnod'.concat(num)).innerText;
	console.log(userid);
	console.log(tno);
	const Info = JSON.stringify({userid:userid,tno:tno});
	$.ajax({
		data : Info,
		url : "${contextPath}/prj/delMember",
		type : "post",
		dataType : "text",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			console.log(data);
			if(data == 1){
				alert("추방되었습니다.");
				location.reload();
			}else{
				alert("다시시도해주세요.");
			}
		},
		error : function(data,textStatus){
			alert("에러가 발생했습니다.");
		}
	})
}

function profile(num){
	 let id = document.getElementById('applyid'.concat(num)).innerHTML;
	 var url = "${contextPath}/prj/member/profile?id="+id;
     var name = "popup test";
     var option = "width = 550, height = 700, top = 100, left = 200, location = no";
     window.open(url, name, option);
}
</script>
 </head>
<body>
	<!-- uppermost -->
	<%@ include file="/WEB-INF/views/include/uppermost.jsp"%>
	<!-- header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

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
            <div class="stitle"><span>abcdefg</span>님 반갑습니다</div>
            <div class="listTitle">팀 목록</div>
            <table border="1" width="700">
                <tr>
                  <th>팀번호</th>
                  <th>팀장</th>
                  <th>팀명</th>
                  <th>팀원</th>
                  <th>관리</th>
                </tr>
                <c:forEach var="row" items="${list }" varStatus="status">
                <tr>
                  <td id='tnod${status.index }'>${row.tno }</td>
                  <td>${row.owner }</td>
                  <td>${row.title }</td>
                  <td id="userid${status.index }">
                    <div>${row.userid }</div>  
           
                  </td>
                  <td>
                    <input type="button" onClick="delFn('${status.index}')" value="추방">
     
                  </td>
                </tr> 
                </c:forEach>
            </table>
            <form id="frmApply" action="${contextPath }/prj/addteamuser" method="post">
              <table border="1" width="700">
                <tr>
                    <th>지원자</th>
                    <th>추가</th>
                </tr>
                <c:forEach var="row" items="${alist }" varStatus="status">
                    <tr>                
                      <!--<td><a href="#" id="applyid${status.index }" onClick="window.open('${contextPath}/prj/member/profile?id=${row.applyid }'
                            ,'User Profile','width = 550, height = 700, top = 100, left = 200, location = no');">${row.applyid }</a></td>-->
                      <td><a href="#" id="applyid${status.index }" onClick="profile('${status.index}')">${row.applyid }</a></td>
                      <td><input type="button" onClick="addFn('${status.index}')" value="팀원추가">
                      <input type="hidden" id="ano${status.index }" value="${row.ano }"/>
                      <input type="hidden" id="tno${status.index }" value="${row.tno }"/></td>
                    </tr>
                </c:forEach>
              </table>
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