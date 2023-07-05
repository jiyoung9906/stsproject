<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/stsproject/resources/css/main.css">
<link rel="stylesheet" href="/stsproject/resources/css/home.css">
<link rel="stylesheet" href="/stsproject/resources/css/post_list_detail.css">
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

	<h1>반려동물 성장일기</h1>
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

	<div id="diary-container">
		<h3>성장일기 목록:</h3>
		<div id="pet-diaries"></div>
	</div>

	<div class="container">
		<div class="post" onclick="location.href='board_diary_detail.html';">

			<div class="title-container">
				<h3>증멍사진</h3>
				<div>
					<i class="fa-solid fa-arrow-right"></i>
				</div>
			</div>
			<p>우리집 강아지 사진 찍었어요! 너무 귀엽죠 ㅠㅠ</p>
			<p class="author">작성자: John Doe</p>
			<p class="date">작성일: 2023-06-30</p>
			<img src="dog.jpg" alt="img">
		</div>

		<div class="post" onclick="showPostDetails(2)">
			<div class="title-container">
				<h3>눈도뜨지못한 새끼 길고양이를 구했어요.</h3>
				<div>
					<i class="fa-solid fa-arrow-right"></i>
				</div>
			</div>
			<p>두어시간 전에 눈도 뜨지못한 새끼 길고양이를 구했어요.</p>
			<p class="author">작성자: Jane Smith</p>
			<p class="date">작성일: 2023-06-29</p>
		</div>

		<div class="post" onclick="showPostDetails(3)">
			<div class="title-container">
				<h3>강아지 발사탕</h3>
				<div>
					<i class="fa-solid fa-arrow-right"></i>
				</div>
			</div>
			<p>계속 핥으면 안좋을 것 같아서 병원에 데려가볼까하는데 혹시 강아지가 발 핥는것으로 병원가서 치료받아보신 분
				있을까요?</p>
			<p class="author">작성자: Jane Smith</p>
			<p class="date">작성일: 2023-06-29</p>
			<img src="dog2.jpg" alt="img">
		</div>
	</div>

	<script>
        // 질문 폼 제출 이벤트 핸들러
        $('#question-form').submit(function (event) {
            event.preventDefault(); // 폼 제출 시 새로고침 방지

            const question = $('#question').val();

            // AJAX 요청으로 질문 전송
            $.ajax({
                type: 'POST',
                url: '/diary',
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

            $('#diary').val(''); // 입력 필드 초기화
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