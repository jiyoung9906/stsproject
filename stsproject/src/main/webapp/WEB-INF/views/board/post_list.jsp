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
	<nav>
		<div class="logo">
			<img src="/stsproject/resources/images/Logo.jpg" alt="Logo">
		</div>
		<ul class="menu">
			<li><a href="board.html">게시판</a></li>
			<li><a href="shopping.html">쇼핑몰</a></li>
			<li><a href="join.html">회원 가입</a></li>
			<li><a href="login.html">로그인</a></li>
		</ul>
	</nav>
	
	<div id="main_box">
		<h1>게시물 전체보기</h1>
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

		<c:forEach var="vo" items="${list}">
			<div class="board_box">
				<br>
				<div class="type_title">제목: ${vo.title}</div>
				<div class="type_content">${vo.content}</div>
				<c:if test="${vo.filename ne 'no_file'}">
					<img src="resources/upload/${vo.filename}" width="200" />
				</c:if>
				<div class="type_regdate">${vo.regdate}</div>
				<div class="type_animaltype">${vo.animaltype}</div>
				<div class="type_section">${vo.section}</div>
				<form>
					<input type="hidden" name="idx" value="${vo.idx}"> <input
						type="hidden" name="title" value="${vo.title}"> <input
						type="hidden" name="content" value="${vo.content}"> <input
						type="hidden" name="photo" value="${vo.filename}"> <input
						type="hidden" name="date" value="${vo.regdate}"> <input
						type="hidden" name="animaltype" value="${vo.animaltype}">
					<input type="hidden" name="section" value="${vo.section}">
					<!-- 비밀번호<input type="password" name="c_pwd"> 
					<input type="button" value="수정" onclick="modify(this.form);">
					<input type="button" value="삭제" onclick="del(this.form);"> -->
				</form>
			</div>
		</c:forEach>
	</div>
</body>
</html>