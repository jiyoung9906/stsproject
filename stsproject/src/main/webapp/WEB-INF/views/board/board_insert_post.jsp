<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/stsproject/resources/css/board_write_post.css">
<script src="/stsproject/resources/js/httpRequest.js"></script>
<script>
		function send( f ){
			let title = f.title.value;
			let content = f.content.value;
			
			//유효성 체크
			if( title == '' ){
				alert('제목을 입력하세요');
				return;
			}
			
			if( content == '' ){
				alert('내용을 입력하세요');
				return;
			}
			
			f.action = "insert.do"; //url 맵핑(컨트롤러에서만 가능)
			f.submit(); //전송
		}
	</script>
</head>
<body>
	<h1>게시물 작성</h1>

<%-- 	<h1>${param.section}</h1> --%>

	<form method="post" enctype="multipart/form-data">
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
		<input type="submit" value="작성" onclick="send(this.form);">
	</form>
</body>
</html>