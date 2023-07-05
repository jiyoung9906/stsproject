<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/stsproject/resources/css/main.css">
<link rel="stylesheet" href="/stsproject/resources/css/post_list_detail.css">
<script src="/stsproject/resources/js/httpRequest.js"></script>
</head>
<body>
	<div class=".container"></div>
	<h2>게시물 상세보기</h2>

	<form class="post-form" method="post">
		<p class="author">작성자: John Doe</p>
		<p class="date">작성일: 2023-06-30</p>
		<h3>증멍사진</h3>
		<p>우리집 강아지 사진 찍었어요! 너무 귀엽죠 ㅠㅠ 저만 보기 아까워서 자랑하려 여기에 올려요ㅎㅎ 우리집 강아지 모두
			많이 많이 봐주세요ㅎㅎㅎㅎ</p>
		<img src="dog.jpg" alt="img">
		</div>

		<div class="password-input">
			<label for="pwd">비밀번호</label> <input type="password" id="pwd"
				name="pwd"> <input type="button" value="수정하기"
				onclick="send(this.form);"> <input type="button"
				value="삭제하기" onclick="deletePost();">
		</div>
	</form>
</body>
</html>