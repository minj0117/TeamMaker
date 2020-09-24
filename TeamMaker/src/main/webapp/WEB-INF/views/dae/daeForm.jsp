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
<style type="text/css">
/* main : 페이징 */
main .paging {
  padding-left: 0px;
  display: flex;
  justify-content: center;
  font-size: 16px;
}

main .paging li {
  padding: 3px 8px;
  border: 1px solid var(--border-color);
  font-family: "Sunflower";
}

main .paging li a {
  font-family: "Sunflower";
  text-decoration: none;
  color: var(--text-color);
}

main .paging li:hover {
  background-color: var(--linen-color);
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
/*	function submitFn(){
		let writer = document.getElementById('writer').value;
		//let category = document.getElementById('category').value;
		let category = document.getElementById('category').value;
		let title = document.getElementById('title').value;
		let applystart = document.getElementById('applystart').value;
		let applyend = document.getElementById('applyend').value;
		let startday = document.getElementById('startday').value;
		let host = document.getElementById('host').value;
		let way = document.getElementById('way').value;
		let homepage = document.getElementById('homepage').value;
		let d_comment = document.getElementById('d_comment').value;
		let pic = document.getElementById('pic').value;
		let applymoney = document.getElementById('applymoney').value;
		let award = document.getElementById('award').value;
		if(title.length == 0){
			alert("제목을 입력하세요");
			return;
		}
		if(category.length == 0){
			alert('카테고리를 설정하세요');
			return;
		}
		if(applystart.length == 0){
			alert("모집시작일을 설정해주세요");
			return;
		}
		if(applyend.length == 0){
			alert("모집마감일을 설정해주세요");
			return;
		}
		if(startday.length == 0){
			alert("공모전 시작일을 설정해주세요");
			return;
		}
		if(host.length == 0){
			alert("주죄자를 설정해주세요");
			return;
		}
		if(d_comment.length == 0){
			alert("내용을 입력해주세요");
			return;
		}
		if(way.length == 0){
			alert("등록방법을 섫정해주세요");
			return;
		}
		const memberInfo = JSON.stringify({writer:writer,category:category,title:title,applystart:applystart,applyend:applyend,
			startday:startday,host:host,way:way,homepage:homepage,d_comment:d_comment,pic:pic,applymoney:applymoney,award:award});
		$.ajax({
			data : memberInfo,
			url : "http://localhost:8090/prj/dae/insertDae",
			type : "post",
			dataType : "text",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data == 1){
					alert("등록성공");
					window.location="${contextPath}/prj/dae/dlist"
				}else{
					alert("등록실패");
				}
			},
			error : function(data){
				alert("에러발생")
			}
		})
	}

	function modFn(){
		let dno = document.getElementById('dno').value;
		let category = document.getElementById('category').value;
		let title = document.getElementById('title').value;
		let applystart = document.getElementById('applystart').value;
		let applyend = document.getElementById('applyend').value;
		let startday = document.getElementById('startday').value;
		let host = document.getElementById('host').value;
		let way = document.getElementById('way').value;
		let homepage = document.getElementById('homepage').value;
		let d_comment = document.getElementById('d_comment').value;
		let pic = document.getElementById('pic').value;
		let applymoney = document.getElementById('applymoney').value;
		let award = document.getElementById('award').value;
		if(title.length == 0){
			alert("제목을 입력하세요");
			return;
		}
		if(category.length == 0){
			alert('카테고리를 설정하세요');
			return;
		}
		if(applystart.length == 0){
			alert("모집시작일을 설정해주세요");
			return;
		}
		if(applyend.length == 0){
			alert("모집마감일을 설정해주세요");
			return;
		}
		if(startday.length == 0){
			alert("공모전 시작일을 설정해주세요");
			return;
		}
		if(host.length == 0){
			alert("주죄자를 설정해주세요");
			return;
		}
		if(d_comment.length == 0){
			alert("내용을 입력해주세요");
			return;
		}
		if(way.length == 0){
			alert("등록방법을 섫정해주세요");
			return;
		}
		const memberInfo = JSON.stringify({dno:dno,category:category,title:title,applystart:applystart,applyend:applyend,
			startday:startday,host:host,way:way,homepage:homepage,d_comment:d_comment,pic:pic,applymoney:applymoney,award:award});
		$.ajax({
			data : memberInfo,
			url : "http://localhost:8090/prj/dae/daeMod",
			type : "post",
			dataType : "text",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data == 1){
					alert("수정성공");
					window.location="${contextPath}/prj/dae/dlist";
				}else{
					alert("수정실패");
				}
			},
			error : function(data){
				alert("에러발생")
			}
		})
	}
*/
</script>
</head>
<body>
	<!-- uppermost -->
	<%@ include file="/WEB-INF/views/include/uppermost.jsp"%>

	<!-- nav -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<!-- main -->
	<main>
	  <c:if test="${toggle eq 1 }">
		 <div class="container">
      <div>[대외활동 작성]</div>
      <form action="${contextPath }/prj/dae/insertDae" enctype="multipart/form-data" method="post">
      <table>
        <thead>
          <tr>
            <th>제목</th>
            <th>내용</th>
          </tr>
        </thead>
        <tbody id="addtbody">
          <tr>
            <td>작성자</td>
            <td><input type="text" id="writer" name="writer" value="${sessionScope.member.id }" readonly="readonly"/></td>
          </tr>
          <tr>
            <td>제목</td>
            <td><input type="text" id="title" name="title" /></td>
          </tr>
          <tr>
            <td>카테고리</td>
            <td>
			<select id="category" name="category">
    			<option value="">선택</option>
    			<option value="인턴십">인턴십</option>
    			<option value="교육/멘토링">교육/멘토링</option>
    			<option value="서포터즈">서포터즈</option>
    			<option value="해외탐방">해외탐방</option>
    			<option value="국내봉사">국내봉사</option>
    			<option value="해외봉사">해외봉사</option>
    			<option value="강연">강연</option>
    			<option value="마케터">마케터</option>
    			<option value="홍보대사">홍보대사</option>
    			<option value="기자단">기자단</option>
    			<option value="기타">기타</option>
			</select>
			</td>
          </tr>
          <tr>
            <td>모집일</td>
            <td><input type="date" id="applystart" name="applystart" /> ~ <input type="date" id="applyend" name="applyend"></td>
          </tr>
          <tr>
            <td>시작일</td>
            <td><input type="date" id="startday" name="startday"/></td>
          </tr>
          <tr>
            <td>주최</td>
            <td><input type="text" id="host" name="host" /></td>
          </tr>
          <tr>
            <td>내용</td>
            <td><input type="text" id="d_comment" name="d_comment" /></td>
          </tr>
          <tr>
            <td>등록방법</td>
            <td><input type="text" id="way" name="way"/></td>
          </tr>
          <tr>
            <td>홈페이지</td>
            <td><input type="text" id="homepage" name="homepage" /></td>
          </tr>
          <tr>
            <td>참가비</td>
            <td><input type="text" id="applymoney" name="applymoney"/></td>
          </tr>
          <tr>
            <td>총상금</td>
            <td><input type="text" id="award" name="award"/></td>
          </tr>
          <tr>
            <td>사진</td>
            <td><input type="file" id="uploadFile" name="uploadFile"/></td>
          </tr>
          <tr>
 	       <td><input type="submit" class="submitBtn" value="등록"> </td>
 	       </tr>
        </tbody>
 		
      </table>
      </form>
    </div>
	</c:if>
	<c:if test="${toggle eq 2 }">
			 <div class="container">
      <div>[대외활동 수정]</div>
      <form action="${contextPath }/prj/dae/daeMod" enctype="multipart/form-data" method="post">
      <table>
        <thead>
          <tr>
            <th>제목</th>
            <th>내용</th>
          </tr>
        </thead>
        <tbody id="addtbody">
          <tr>
            <td>작성자</td>
            <td><input type="text" id="writer" name="writer" value="${daeVO.writer }" readonly="readonly"/></td>
          </tr>
          <tr>
            <td>제목</td>
            <td><input type="text" id="title" name="title" value="${daeVO.title }"/></td>
          </tr>
          <tr>
            <td>카테고리</td>
            <td>
			<select id="category" name="category">
    			<option value="">선택</option>
    			<option value="인턴십">인턴십</option>
    			<option value="교육/멘토링">교육/멘토링</option>
    			<option value="서포터즈">서포터즈</option>
    			<option value="해외탐방">해외탐방</option>
    			<option value="국내봉사">국내봉사</option>
    			<option value="해외봉사">해외봉사</option>
    			<option value="강연">강연</option>
    			<option value="마케터">마케터</option>
    			<option value="홍보대사">홍보대사</option>
    			<option value="기자단">기자단</option>
    			<option value="기타">기타</option>
			</select>
			</td>
          </tr>
          <tr>
            <td>모집일</td>
            <td><input type="date" id="applystart" name="applystart" value="${daeVO.applystart }"/> ~ <input type="date" id="applyend" name="applyend" value="${daeVO.applyend }"></td>
          </tr>
          <tr>
            <td>시작일</td>
            <td><input type="date" id="startday" name="startday" value="${daeVO.startday }"/></td>
          </tr>
          <tr>
            <td>주최</td>
            <td><input type="text" id="host" name="host" value="${daeVO.host }"/></td>
          </tr>
          <tr>
            <td>내용</td>
            <td><input type="text" id="d_comment" name="d_comment" value="${daeVO.d_comment }" /></td>
          </tr>
          <tr>
            <td>등록방법</td>
            <td><input type="text" id="way" name="way" value="${daeVO.way }"/></td>
          </tr>
          <tr>
            <td>홈페이지</td>
            <td><input type="text" id="homepage" name="homepage" value="${daeVO.homepage }" /></td>
          </tr>
          <tr>
            <td>참가비</td>
            <td><input type="text" id="applymoney" name="applymoney" value="${daeVO.applymoney }"/></td>
          </tr>
          <tr>
            <td>총상금</td>
            <td><input type="text" id="award" name="award" value="${daeVO.award }"/></td>
          </tr>
          <tr>
            <td>사진</td>
            <td><input type="file" id="uploadFile" name="uploadFile"/></td>
          </tr>
          <tr>
 	       <td><input type="submit" class="submitBtn" value="등록"> </td>
 	       </tr>
        </tbody>
      </table>
	      <input type="hidden" id="dno" name="dno" value="${daeVO.dno}"/>
      </form>  
	</c:if>
	</main>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
