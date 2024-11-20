<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="membership.MemberDAO, membership.MemberDTO" %>
<%
    String id = (String) session.getAttribute("id");
    if (id == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    // 로그인된 사용자 정보 가져오기
    MemberDAO dao = new MemberDAO(application);
    MemberDTO member = dao.getMemberDTOById(id);
    dao.close();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보수정</title>
    <link href="../css/styles.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <a class="navbar-brand ps-3" href="../index.jsp">WebProject</a>
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <a class="nav-link" href="../index.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Dashboard
                        </a>
                        <a class="nav-link" href="UpdateProfile.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-user-edit"></i></div>
                            Update Profile
                        </a>
                        <a class="nav-link" href="Logout.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-sign-out-alt"></i></div>
                            Logout
                        </a>
                    </div>
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Update Profile</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="../index.jsp">Dashboard</a></li>
                        <li class="breadcrumb-item active">Update Profile</li>
                    </ol>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-user-edit me-1"></i>
                            Edit Your Information
                        </div>
                        <div class="card-body">
                            <form action="UpdateProcess.jsp" method="post">
                                <div class="form-group mb-3">
                                    <label for="inputId">ID</label>
                                    <input type="text" class="form-control" id="inputId" name="id" value="<%=member.getId()%>" readonly>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="inputName">Name</label>
                                    <input type="text" class="form-control" id="inputName" name="name" value="<%=member.getName()%>" required>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="inputEmail">Email</label>
                                    <input type="email" class="form-control" id="inputEmail" name="email" value="<%=member.getEmail()%>" readonly>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="inputPhone">Phone</label>
                                    <input type="text" class="form-control" id="inputPhone" name="phone" value="<%=member.getPhone()%>">
                                </div>
                                <div class="form-group mb-3">
                                    <label for="inputPassword">New Password</label>
                                    <input type="password" class="form-control" id="inputPassword" name="pass" placeholder="Leave blank to keep current password">
                                </div>
                                <button type="submit" class="btn btn-primary">Update</button>
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
