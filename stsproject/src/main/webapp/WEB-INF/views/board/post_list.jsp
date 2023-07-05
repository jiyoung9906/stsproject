<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/stsproject/resources/css/main.css">
<link rel="stylesheet" href="/stsproject/resources/css/home.css">
<link rel="stylesheet" href="/stsproject/resources/css/post_list.css">

<script src="/stsproject/resources/js/httpRequest.js"></script>

<script>
// 	function modify(f) {
// 		let pwd = f.pwd.value; //원본 비번
// 		let c_pwd = f.c_pwd.value; //입력 비번

// 		if (pwd != c_pwd) {
// 			alert("비밀번호 불일치");
// 			return;
// 		}

// 		f.action = 'modify_form.do';
// 		f.submit(); //컨트롤러로 pwd,idx,name,content정보를 넘긴다
// 	}

// 	function del(f) {
// 		let pwd = f.pwd.value; //원본 비번
// 		let c_pwd = f.c_pwd.value; //입력 비번

// 		if (pwd != c_pwd) {
// 			alert("비밀번호 불일치");
// 			return;
// 		}

// 		//비밀번호가 일치할 경우 정말 삭제할 것인지 확인
// 		if (!confirm('정말 삭제하시나요?')) {
// 			return;
// 		}

// 		//삭제하고싶은 게시글의 idx번호를 컨트롤러로 전송
// 		//Ajax기능을 사용
// 		let url = "delete.do";
// 		let param = "idx= " + f.idx.value + "&photo=" + f.photo.value;
// 		sendRequest(url, param, resultFn, "get");
// 	}

	//Ajax를 통해 요청된 url이 마무리되면
	//현재 페이지로 돌아와 자동으로 호출되는 메서드(콜백 메서드)
	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {

			//컨트롤러부터 return받은 데이터를 읽어오자
			//data = "[{'result':'삭제 성공'}]";
			let data = xhr.responseText;

			//data는 JSON처럼 생긴 단순 문자열 일 뿐이므로
			//이를 실제 JSON구조로 변경해줘야 한다
			let json = eval(data);

			alert(json[0].result);

			location.href = "list.do"; //전체 페이지 갱신
		}
	}
</script>

</head>
<body>
	<!-- 상단 네비게이션 바 -->
	<nav>
		<div class="logo">
			<!-- 로고 이미지 삽입 -->
			<img src="/stsproject/resources/images/Logo.jpg" alt="Logo">
		</div>
		<ul class="menu">
			<li><a href="board.html">게시판</a></li>
			<li><a href="shopping.html">쇼핑몰</a></li>
			<li><a href="join.html">회원 가입</a></li>
			<li><a href="login.html">로그인</a></li>
		</ul>
	</nav>

	<div id="sort-container">
		<label>게시글 정렬:</label> <label> <input type="radio" name="sort"
			value="latest" checked> 최신순
		</label> <label> <input type="radio" name="sort" value="popular">
			인기순
		</label>
	</div>
	<hr>

	<div id="main_box">
		<h1>게시물 전체보기</h1>

		<c:forEach var="vo" items="${ list }">

			<div class="board_box">
				<div class="type_content">
					<pre>${ vo.content }</pre>
					<br>
					<!-- 첨부된 이미지가 있다면 img태그를 사용 -->
					<c:if test="${ vo.filename ne 'no_file' }">
						<img src="resources/upload/${ vo.filename }" width="200" />
					</c:if>
				</div>
				<div class="type_regdate">${ vo.regdate }</div>

				<form>
					<input type="hidden" name="idx" value="${ vo.idx }"> <input
						type="hidden" name="title" value="${ vo.title }"> <input
						type="hidden" name="content" value="${ vo.content }"> <input
						type="hidden" name="photo" value="${ vo.filename }"> 
						<input type="hidden" name="section" value="${ vo.section }"> 
<!-- 						비밀번호<input -->
<!-- 						type="password" name="c_pwd"> <input type="button" -->
<!-- 						value="수정" onclick="modify(this.form);"> <input -->
<!-- 						type="button" value="삭제" onclick="del(this.form);"> -->
				</form>

			</div>

		</c:forEach>

	</div>

	<!-- 	<div class="container"> -->
	<!-- 		<div class="post" onclick="location.href='post_list_detail.jsp';"> -->

	<!-- 			<div class="title-container"> -->
	<!-- 				<h3>증멍사진</h3> -->
	<!-- 				<div> -->
	<!-- 					<i class="fa-solid fa-arrow-right"></i> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<p>우리집 강아지 사진 찍었어요! 너무 귀엽죠 ㅠㅠ</p> -->
	<!-- 			<p class="author">작성자: John Doe</p> -->
	<!-- 			<p class="date">작성일: 2023-06-30</p> -->
	<!-- 			<img src="dog.jpg" alt="img"> -->
	<!-- 		</div> -->

	<!-- 		<div class="post" onclick="showPostDetails(2)"> -->
	<!-- 			<div class="title-container"> -->
	<!-- 				<h3>눈도뜨지못한 새끼 길고양이를 구했어요.</h3> -->
	<!-- 				<div> -->
	<!-- 					<i class="fa-solid fa-arrow-right"></i> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<p>두어시간 전에 눈도 뜨지못한 새끼 길고양이를 구했어요.</p> -->
	<!-- 			<p class="author">작성자: Jane Smith</p> -->
	<!-- 			<p class="date">작성일: 2023-06-29</p> -->
	<!-- 		</div> -->

	<!-- 		<div class="post" onclick="showPostDetails(3)"> -->
	<!-- 			<div class="title-container"> -->
	<!-- 				<h3>강아지 발사탕</h3> -->
	<!-- 				<div> -->
	<!-- 					<i class="fa-solid fa-arrow-right"></i> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<p>계속 핥으면 안좋을 것 같아서 병원에 데려가볼까하는데 혹시 강아지가 발 핥는것으로 병원가서 치료받아보신 분 -->
	<!-- 				있을까요?</p> -->
	<!-- 			<p class="author">작성자: Jane Smith</p> -->
	<!-- 			<p class="date">작성일: 2023-06-29</p> -->
	<!-- 			<img src="dog2.jpg" alt="img"> -->
	<!-- 		</div> -->

	<!-- 		<div class="post" onclick="showPostDetails(4)"> -->
	<!-- 			<div class="title-container"> -->
	<!-- 				<h3>고양이</h3> -->
	<!-- 				<div> -->
	<!-- 					<i class="fa-solid fa-arrow-right"></i> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<p>사료 먹고 난 뒤 갑자기 토를 하더라구요 ㅠㅜ 사료 모양 그대로던데 많이 먹어서 그런가요? 사료는 -->
	<!-- 				바꾸지않았어요ㅠㅜ 너무 걱정되네요..</p> -->
	<!-- 			<p class="author">작성자: Paul</p> -->
	<!-- 			<p class="date">작성일: 2023-06-28</p> -->
	<!-- 			<img src="cat.jpg" alt="img"> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
</body>
</html>