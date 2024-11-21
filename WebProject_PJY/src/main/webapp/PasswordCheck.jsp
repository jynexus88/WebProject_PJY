<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>비밀번호 확인</title>
    <link href="css/styles.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">

	<!-- 상단 네비게이션 바 -->
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- 로고 -->
		<a class="navbar-brand ps-3" href="index.jsp" style="font-family: 'Arial', sans-serif; font-size: 20px; color: #ffffff; border-radius: 8px; text-decoration: none; font-weight: bold; box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.2);">
			🌱 초록 친구들 </a>
		<!-- 사이드바 아이콘 토글 -->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
		<!-- 회원 아이콘 토글 -->
		<ul class="navbar-nav ms-auto me-0 me-md-3 my-2 my-md-0">
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 
			<i class="fas fa-user fa-fw"></i>
			</a> 
			<!-- 
			로그인 여부에 따라 다르게 보이도록 설정함
			session.getAttribute(): 세션에 등록된 아이디 정보를 가져와 확인
			 -->
			<% String userId = (String) session.getAttribute("id"); %>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<%
					if (userId != null) {
					%>
					<!-- 로그인 상태 -->
					<li><a class="dropdown-item" href="PasswordCheck.jsp">회원정보수정</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="Session/Logout.jsp">로그아웃</a></li>
					<%
					} 
					%>
				</ul>
			</li>
		</ul>
	</nav>
	
	<!-- 사이드바 -->
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<!-- 초록 이야기 시작 -->
						<div class="sb-sidenav-menu-heading" style="color: #81C784; font-weight: bold;">
						🌳 초록 이야기 시작 🌳 </div>
						<a class="nav-link" href="../index.jsp" style="font-size: 14px;">
							시작 화면 </a> 
						<a class="nav-link" href="../introduce.jsp" style="font-size: 14px;"> 
							초록 이야기 </a>
						<!-- 함께 나누는 공간 -->
						<div class="sb-sidenav-menu-heading" style="color: #81C784; font-weight: bold;">
						🏡 함께 나누는 공간 🏡 </div>
						<a class="nav-link" href="../FreeBoard/list.jsp" style="font-size: 14px;">
							초록 친구 자랑 </a> 
						<a class="nav-link" href="../question.jsp" style="font-size: 14px;"> 
							초록 Q&A </a> 
						<a class="nav-link" href="../resources.jsp" style="font-size: 14px;"> 
							초록 자료실 </a>
					</div>
				</div>
			</nav>
		</div>

	<!-- 레이아웃 안 콘텐츠 -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
					<div class="card-body">
						<!-- 개인정보 보호 안내 메시지 -->
						<p style="font-size: 20px; color: #555; margin-bottom: 20px; text-align: center;">
							본인 확인을 위해 비밀번호를 입력해주세요.</p>
						<!-- 비밀번호 입력 폼 -->
						<form action="./Session/PasswordCheckProcess.jsp" method="post">
							<div class="form-group mb-3">
								<input type="password" class="form-control" id="password"
									name="password" placeholder="비밀번호를 입력하세요" required
									style="font-size: 16px; padding: 10px;">
							</div>
							<!-- 확인 버튼 -->
							<button type="submit" class="btn btn-primary"
								style="width: 100%; font-size: 16px; padding: 10px;">
								확인</button>
						</form>
					</div>
				</div>
			</main>
		</div>
	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>
</html>
