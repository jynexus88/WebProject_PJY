<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="free_board.FreeBoardDAO, free_board.FreeBoardDTO" %>
<%
    FreeBoardDAO dao = new FreeBoardDAO(application);
    List<FreeBoardDTO> posts = dao.getAllPosts();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Free Board</title>
    <link href="../css/styles.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<!-- 상단 네비게이션 바 -->
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="../index.jsp"
			style="font-family: 'Arial', sans-serif; font-size: 20px; color: #ffffff; border-radius: 8px; text-decoration: none; font-weight: bold; box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.2);">
			🌱 초록 친구들 </a>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto me-0 me-md-3 my-2 my-md-0">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"> <i
					class="fas fa-user fa-fw"></i>
			</a> <%
 String userId = (String) session.getAttribute("id");
 %>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<%
					if (userId != null) {
					%>
					<!-- 로그인 상태 -->
					<li><a class="dropdown-item" href="../Session/PasswordCheck.jsp">회원정보수정</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="../Session/Logout.jsp">로그아웃</a></li>
					<%
					} else {
					%>
					<!-- 비로그인 상태 -->
					<li><a class="dropdown-item" href="../login.jsp">로그인</a></li>
					<li><a class="dropdown-item" href="../register.jsp">회원가입</a></li>
					<%
					}
					%>
				</ul></li>
		</ul>
	</nav>
	<!-- 사이드바 -->
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<!-- MAIN Section -->
						<div class="sb-sidenav-menu-heading"
							style="color: #81C784; font-weight: bold;">🌳 초록 이야기 시작 🌳
						</div>
						<a class="nav-link" href="../index.jsp" style="font-size: 14px;">
							시작 화면 </a> <a class="nav-link" href="introduce.jsp"
							style="font-size: 14px;"> 초록 이야기 </a>
						<!-- LIST Section -->
						<div class="sb-sidenav-menu-heading"
							style="color: #81C784; font-weight: bold;">🏡 함께 나누는 공간 🏡
						</div>
						<a class="nav-link" href="../FreeBoard/list.jsp" style="font-size: 14px;">
							초록 친구 자랑 </a> <a class="nav-link" href="FreeBoard/list.jsp"
							style="font-size: 14px;"> 초록 Q&A </a> <a class="nav-link"
							href="resources.js" style="font-size: 14px;"> 초록 자료실 </a>
					</div>
				</div>
			</nav>
		</div>
	</div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <ol class="breadcrumb mb-4">
                    </ol>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Free Board List
                            <a href="write.jsp" class="btn btn-primary btn-sm float-end">New Post</a>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Title</th>
                                        <th>Author</th>
                                        <th>Date</th>
                                        <th>Views</th>
                                        <th>Likes</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (FreeBoardDTO post : posts) { %>
                                        <tr>
                                            <td><%= post.getPost_id() %></td>
                                            <td><a href="view.jsp?post_id=<%= post.getPost_id() %>"><%= post.getTitle() %></a></td>
                                            <td><%= post.getUser_id() %></td>
                                            <td><%= post.getCreated_at() %></td>
                                            <td><%= post.getViews() %></td>
                                            <td><%= post.getLikes() %></td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../js/scripts.js"></script>
</body>
</html>
