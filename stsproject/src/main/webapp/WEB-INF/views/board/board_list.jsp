<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/vs/resources/css/main.css">
<script src="/vs/resources/js/httpRequest.js"></script>

<!-- 동물 유형 선택 -->
<script>
	var selectedAnimals = [];

	function toggleAnimalSelection(checkbox) {
		var animal = checkbox.value;

		if (checkbox.checked) {
			selectedAnimals.push(animal);
		} else {
			var index = selectedAnimals.indexOf(animal);
			if (index !== -1) {
				selectedAnimals.splice(index, 1);
			}
		}
	}

	function applySelection() {
		if (selectedAnimals.length > 0) {
			var selectedAnimalText = "선택된 동물 유형: " + selectedAnimals.join(", ");
			showSelectedAnimals(selectedAnimalText);
		} else {
			alert("동물 유형을 선택해주세요.");
		}
	}

	function showSelectedAnimals(selectedAnimalText) {
		alert(selectedAnimalText);
	}

	// 게시글 데이터 (예시 데이터)
	var posts = [ {
		title : "글 제목 1",
		category : "post",
		date : "2023-06-25",
		views : 10
	}, {
		title : "글 제목 2",
		category : "post",
		date : "2023-06-26",
		views : 5
	}, {
		title : "글 제목 3",
		category : "question",
		date : "2023-06-27",
		views : 20
	}, {
		title : "글 제목 4",
		category : "diary",
		date : "2023-06-24",
		views : 15
	} ];

	// 초기 게시글 목록 표시
	displayPostList(posts);

	// 라디오 버튼 변경 시 이벤트 처리
	var sortOptions = document.getElementsByName("sort-option");

	sortOptions.forEach(function(option) {
		option.addEventListener("change", function() {
			var selectedOption = document
					.querySelector('input[name="sort-option"]:checked').value;
			var sortedPosts = sortPosts(posts, selectedOption);
			displayPostList(sortedPosts);
		});
	});

	// 게시글 목록을 정렬하여 보여주는 함수
	function sortPosts(posts, option) {
		var sortedPosts = [];

		if (option === "latest") {
			sortedPosts = posts.slice().sort(function(a, b) {
				return new Date(b.date) - new Date(a.date);
			});
		} else if (option === "popular") {
			sortedPosts = posts.slice().sort(function(a, b) {
				return b.views - a.views;
			});
		}

		return sortedPosts;
	}

	// 게시글 목록을 화면에 표시하는 함수
	function displayPostList(posts) {
		var postListContainer = document.getElementById("post-list-container");
		postListContainer.innerHTML = "";

		posts.forEach(function(post) {
			var postElement = document.createElement("div");
			postElement.classList.add("post-list");
			postElement.textContent = post.title;
			postListContainer.appendChild(postElement);
		});
	}
	// 게시글을 작성을 선택하는 함수
	function goToPage() {
		var selectElement = document.getElementById("pageSelect");
		var selectedValue = selectElement.value;

		if (selectedValue !== "") {
			window.location.href = selectedValue;
		}
	}
</script>
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

	<div>
		<ul class="board">
			<li><a href="board_post_4.html" onclick="showSection('post')">Post</a></li>
			<li><a href="board_question.html"
				onclick="showSection('question')">Question</a></li>
			<li><a href="board_management.html"
				onclick="showSection('management')">Management</a></li>
			<li><a href="board_diary.html" onclick="showSection('diary')">Diary</a></li>
		</ul>
	</div>

	<div class="write_post">
		<h3 class="write_post_2">글쓰기</h3>
		<select id="pageSelect">
			<option value="">글쓰기 종류를 선택하세요</option>
			<option value="write_post.html">Post</option>
			<option value="write_question.html">Question</option>
			<option value="write_diary.html">Diary</option>
		</select>
		<button onclick="goToPage()" class="goToPage">이동</button>
	</div>

	<form method="post" action="/form-action.html"
		enctype="multipart/form-data">
		<div class="container">
			<h4>동물 유형 선택</h4>
			<label> <input type="checkbox" class="animal-checkbox"
				value="강아지" onclick="toggleAnimalSelection(this)">강아지
			</label><br> <label> <input type="checkbox"
				class="animal-checkbox" value="고양이"
				onclick="toggleAnimalSelection(this)">고양이
			</label><br> <label> <input type="checkbox"
				class="animal-checkbox" value="소동물"
				onclick="toggleAnimalSelection(this)">소동물
			</label><br> <label> <input type="checkbox"
				class="animal-checkbox" value="기타"
				onclick="toggleAnimalSelection(this)">기타
			</label><br>

			<div id="apply-button" onclick="applySelection()">적용</div>
		</div>
	</form>

	<br>
	<br>

	<!-- 게시글 목록 -->
	<div id="post-list-container"></div>

	<hr>

	<!-- 정렬 라디오 버튼 -->
	<label> <input type="radio" name="sort-option" value="latest"
		checked> 최신순
	</label>
	<label> <input type="radio" name="sort-option" value="popular">
		인기순
	</label>

	<!-- 게시글 목록 -->
	<div id="post-list-container"></div>
	
</body>
</html>