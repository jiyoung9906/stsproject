<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/stsproject/resources/css/main.css">
<link rel="stylesheet" href="/stsproject/resources/css/board.css">
<script src="/stsproject/resources/js/httpRequest.js"></script>

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
	
	// 초기 게시글 목록 표시
	//displayPostList(posts);

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
	function showSection() {
		
		let section = document.getElementById("pageSelect").value;

		if (section !== "") {
			location.href = "move_selected.do?section="+section;
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
			<li><a href="board_main.do">게시판</a></li>
			<li><a href="shopping.html">쇼핑몰</a></li>
			<li><a href="join.html">회원 가입</a></li>
			<li><a href="login.html">로그인</a></li>
		</ul>
	</nav>

	<div>
		<ul class="board">
			<li><a href="post_list.do">Post</a></li>
			<li><a href="question_list.do">Question</a></li>
			<li><a onclick="showSection('Management')">Management</a></li>
			<li><a onclick="showSection('Diary')">Diary</a></li>
		</ul>
	</div>
	
	<div class="write_post">
		<h3 class="write_post_2">글쓰기</h3>
		<select id="pageSelect">
			<option value="">글쓰기 종류를 선택하세요</option>
			<option value="post">Post</option>
			<option value="question">Question</option>
			<option value="diary">Diary</option>
		</select>
		<button onclick="showSection()" class="goToPage">이동</button>
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

			<button id="apply-button" onclick="applySelection()">적용</button>
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