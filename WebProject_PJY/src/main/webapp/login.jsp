<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/styles.css">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-5">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header">
                                    <h3 class="text-center font-weight-light my-4">Login</h3>
                                </div>
                                <div class="card-body">
                                    <!-- 로그인 폼 -->
                                    <form action="Session/LoginProcess.jsp" method="post">
                                        <!-- 아이디 입력 -->
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="inputId" name="id" type="text" placeholder="Enter your ID" required>
                                            <label for="inputId">ID</label>
                                        </div>
                                        <!-- 비밀번호 입력 -->
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="inputPassword" name="pass" type="password" placeholder="Enter your password" required>
                                            <label for="inputPassword">Password</label>
                                        </div>
                                        <!-- 로그인 버튼 -->
                                        <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                            <button type="submit" class="btn btn-primary w-100">Login</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="card-footer text-center py-3">
                                    <div class="small"><a href="register.jsp">Need an account? Sign up!</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
<script>
    <% if (request.getAttribute("errorMessage") != null) { %>
        alert("<%= request.getAttribute("errorMessage") %>");
    <% } %>
</script>
</body>
</html>
