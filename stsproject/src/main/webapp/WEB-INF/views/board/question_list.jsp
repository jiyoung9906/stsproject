<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/stsproject/resources/css/main.css">
<link rel="stylesheet" href="/stsproject/resources/css/home.css">
<link rel="stylesheet"
	href="/stsproject/resources/css/question_list.css">
<script src="/stsproject/resources/js/httpRequest.js"></script>

<script>
	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {

			//컨트롤러부터 return받은 데이터를 읽어오자
			//data = "[{'result':'삭제 성공'}]";
			let data = xhr.responseText;

			//data는 JSON처럼 생긴 단순 문자열 일 뿐이므로
			//이를 실제 JSON구조로 변경해줘야 한다
			let json = eval(data);

			alert(json[0].result);

			location.href = "question_list.do"; //전체 페이지 갱신
		}
	}
</script>

</head>
<body>
	<!-- 상단 네비게이션 바 -->
	<nav>
<!-- 		<div class="logo"> -->
<!-- 			<!-- 로고 이미지 삽입 --> -->
<!-- 			<img src="logo.png" alt="Logo"> -->
<!-- 		</div> -->
		<ul class="menu">
			<li><a href="board.html">게시판</a></li>
			<li><a href="shopping.html">쇼핑몰</a></li>
			<li><a href="join.html">회원 가입</a></li>
			<li><a href="login.html">로그인</a></li>
		</ul>
	</nav>
	<h1>Question & Answer</h1>
	<br>
	<br>
	<div id="sort-container">
		<label>게시글 정렬:</label> <label> <input type="radio" name="sort"
			value="latest" checked> 최신순
		</label> <label> <input type="radio" name="sort" value="popular">
			인기순
		</label>
	</div>
	<hr>
	<br>
	<div id="post-container">
		<h3>질문과 답변 목록:</h3>
		<div id="posts"></div>
	</div>
	<div id="main_box">
		<c:forEach var="vo" items="${ qadata }">
			<div class="board_box">
				<br>
				<div class="type_qatitle">제목: ${ vo.qatitle }</div>
				<div class="type_qacontent">${ vo.qacontent }</div>
				<div class="type_qadate">${ vo.qadate }</div>
				<div class="type_qaanimaltype">${ vo.qaanimaltype }</div>
				<div class="type_qasection">${ vo.qasection }</div>
				<form>
					<input type="hidden" name="qaidx" value="${ vo.qaidx }"> <input
						type="hidden" name="qatitle" value="${ vo.qatitle }"> <input
						type="hidden" name="qacontent" value="${ vo.qacontent }"> <input
						type="hidden" name="qadate" value="${ vo.qadate }"> <input
						type="hidden" name="qaanimaltype" value="${ vo.qaanimaltype }">
					<input type="hidden" name="qasection" value="${ vo.qasection }">
					<!-- 					비밀번호<input type="password" name="c_pwd">  -->
					<!-- 					<input type="button" value="수정" onclick="modify(this.form);">  -->
					<!-- 					<input type="button" value="삭제" onclick="del(this.form);"> -->
				</form>
			</div>
	</div>

	</c:forEach>

	</div>

</body>
</html>