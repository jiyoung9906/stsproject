<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/stsproject/resources/css/main.css">
<link rel="stylesheet" href="/stsproject/resources/css/question_list.css">
<script src="/stsproject/resources/js/httpRequest.js"></script>

</head>
<body>
	<!-- 상단 네비게이션 바 -->
	<nav>
		<div class="logo">
			<!-- 로고 이미지 삽입 -->
			<img src="logo.png" alt="Logo">
		</div>
		<ul class="menu">
			<li><a href="board.html">게시판</a></li>
			<li><a href="shopping.html">쇼핑몰</a></li>
			<li><a href="join.html">회원 가입</a></li>
			<li><a href="login.html">로그인</a></li>
		</ul>
	</nav>
	<h1>Question & Answer</h1>
	<hr>
	<br>
	<br>
	<div id="sort-container">
		<label>게시글 정렬:</label> <label> <input type="radio" name="sort"
			value="latest" checked> 최신순
		</label> <label> <input type="radio" name="sort" value="popular">
			인기순
		</label>
	</div>
	<br>
	<div id="post-container">
		<h3>질문과 답변 목록:</h3>
		<div id="posts"></div>
	</div>

	<script>
        // 질문 폼 제출 이벤트 핸들러
        $('#question-form').submit(function (event) {
            event.preventDefault(); // 폼 제출 시 새로고침 방지

            const question = $('#question').val();

            // AJAX 요청으로 질문 전송
            $.ajax({
                type: 'POST',
                url: '/questions',
                contentType: 'application/json',
                data: JSON.stringify({ question }),
                success: function (response) {
                    const postsContainer = $('#posts');
                    const postElement = $('<div class="post">')
                        .append($('<p>').text('질문: ' + response.question))
                        .append($('<p>').text('답변: ' + response.answer))
                        .data('timestamp', response.timestamp); // 타임스탬프 데이터 추가
                    postsContainer.prepend(postElement);
                },
                error: function (xhr, status, error) {
                    console.error('Error:', error);
                }
            });

            $('#question').val(''); // 입력 필드 초기화
        });

        // 게시글 정렬 이벤트 핸들러
        $('input[name="sort"]').change(function () {
            const sortBy = $(this).val();

            if (sortBy === 'latest') {
                $('.post').sort(function (a, b) {
                    return $(b).data('timestamp') - $(a).data('timestamp');
                }).appendTo('#posts');
            } else if (sortBy === 'popular') {
                //인기순 정렬할거면 count써서 하던 나중에 추가해야함
            }
        });
    </script>
</body>
</html>