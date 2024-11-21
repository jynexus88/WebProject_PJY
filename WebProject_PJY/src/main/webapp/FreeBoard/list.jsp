<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>자유게시판 목록</title>
    <link href="../css/styles.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">

	<!-- 상단 네비게이션 바 -->
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- 로고 -->
		<a class="navbar-brand ps-3" href="../index.jsp" style="font-family: 'Arial', sans-serif; font-size: 20px; color: #ffffff; border-radius: 8px; text-decoration: none; font-weight: bold; box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.2);">
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
					<li><a class="dropdown-item" href="../PasswordCheck.jsp">회원정보수정</a></li>
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
				</ul>
			</li>
		</ul>
	</nav>
	
	<!-- 사이드 바 -->
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
                    <ol class="breadcrumb mb-4"></ol>
                    <div class="card mb-4">
                    	<!-- 제목 -->
                        <div class="card-header">
                            당신의 소중한 식물을 자랑해주세요!
                            <a href="write.jsp" class="btn btn-primary btn-sm float-end">
                            자랑하기</a>
                        </div>
                        <!-- 게시글 목록 -->
                        <div class="card-body">
                            <table class="table table-bordered">
                            	<!-- 컬럼 -->
                                <thead>
                                    <tr>
                                        <th>글순서</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>조회수</th>
                                        <th>좋아요</th>
                                    </tr>
                                </thead>
                                <!-- 리스트 출력 -->
                                <tbody>
                                	<c:choose>
                                		<c:when test="${empty boardLists}">
                                			<tr>
                                				<td colspan="6" align="center">등록된 게시물이 없습니다.</td>
                                			</tr>
                                		</c:when>
                                	<c:otherwise>
                                    <c:forEach items="${boardLists}" var="post" varStatus="loop" >
                                    <tr align="center">
                                    	<td>
                                    		<!-- totalCount에서 인출되는 인스턴스의 인덱스를 차막해서 순차적인 번호를 출력 -->
                                    		${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index) }
                                    	</td>
                                    	<td align="left">
            							<!-- 제목 클릭시 '열람'페이지로 이동해야하므로 게시물의 일련번호를 파라미터로 전달한다. -->
            						    <a href="../free_board/view.do?post_id=${post.post_id}">${post.title}</a> 
            						    </td>
                                        	<!-- 각 멤버변수의 getter()를 통해 저장된 값을 출력한다. -->
                                            <td>${post.post_id}</td>
                                            <td>${post.title}</td>
                                            <td>${post.user_id}</td>
                                            <td>${post.created_at}</td>
                                            <td>${post.views}</td>
                                            <td>${post.likes}</td>
                                        </tr>
                                    </c:forEach>
                                    </c:otherwise>
                                    </c:choose>
                                </tbody> 
                            </table>
                            
                        <!-- 검색 폼 -->
						<form action="/free_board/list.do" method="get" class="d-flex justify-content-center my-3">
    						<div class="input-group" style="width: 60%;">
       							<!-- 검색 필드 선택 -->
        						<select name="searchField" class="form-select" style="max-width: 20%;">
    	        					<option value="title">제목</option>
      	 	     					<option value="user_id">작성자</option>
       							</select>
        						<!-- 검색어 입력 -->
       							<input type="text" name="searchWord" class="form-control" placeholder="검색어를 입력하세요" />
        						<!-- 검색 버튼 -->
      							<button type="submit" class="btn btn-primary">검색</button>
					 	  	</div>
						</form>
						
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
