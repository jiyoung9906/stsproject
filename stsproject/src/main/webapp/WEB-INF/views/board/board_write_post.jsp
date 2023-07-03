<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1 {
	text-align: center;
}

form {
	width: 400px;
	margin: 0 auto;
}

label {
	display: inline-block;
	margin-bottom: 5px;
	font-weight: bold;
	padding: 3px;
}

input[type="text"], textarea, input[type="date"], input[type="submit"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	box-sizing: border-box;
}

textarea {
	height: 120px;
	resize: none;
}

input[type="submit"] {
	background-color: lightblue;
	color: black;
	border: none;
	cursor: pointer;
	font-weight: bold;
}

input[type="submit"]:hover {
	background-color: lightblue;
}

p:first-of-type {
	font-weight: bold;
}

label {
	display: inline-block;
	margin-bottom: 5px;
}

.file-label {
	display: block;
	margin-bottom: 5px;
}

.file-input {
	display: block;
	margin-bottom: 10px;
}

/* 게시판 선택 섹션 스타일 */
p:last-of-type {
	font-weight: bold;
	margin-bottom: 5px;
}

/* 공통 스타일 */
input[type="checkbox"] {
	margin-right: 5px;
	margin-bottom: 5px;
}
</style>
</head>
<body>
	<h1>게시물 작성</h1>

	<form action="/submit-post" method="POST" enctype="multipart/form-data">
		<label for="title">제목:</label> <input type="text" id="title"
			name="title" required> <label for="content">내용:</label>
		<textarea id="content" name="content" rows="4" cols="50" required></textarea>

		<div class="file-upload">
			<label class="file-label" for="image">파일 첨부:</label> <input
				type="file" id="image" name="image" class="file-input">
		</div>

		<label for="date">날짜:</label> <input type="date" id="date" name="date"
			required>

		<p>동물 유형 선택</p>
		<label><input type="checkbox" name="동물 유형 선택" value="dog">강아지</label>
		<label><input type="checkbox" name="동물 유형 선택" value="cat">고양이</label>
		<label><input type="checkbox" name="동물 유형 선택" value="mini">소동물</label>
		<label><input type="checkbox" name="동물 유형 선택" value="act">기타</label>


		<!-- <p>게시판 선택</p>
        <label><input type="checkbox" name="게시판 선택" value="post">post</label>
        <label><input type="checkbox" name="게시판 선택" value="guestion">guestion</label>
        <label><input type="checkbox" name="게시판 선택" value="diary">diary</label> -->

		<input type="submit" value="작성">
	</form>
</body>
</html>