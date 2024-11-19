<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
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
                                    <h3 class="text-center font-weight-light my-4">Sign Up</h3>
                                </div>
                                <div class="card-body">
                                    <!-- 회원가입 폼 -->
                                    <form action="Session/RegisterProcess.jsp" method="post">
                                        <!-- ID 입력 -->
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="inputId" name="id" type="text" placeholder="Enter your ID" required>
                                            <label for="inputId">ID</label>
                                        </div>
                                        <!-- 비밀번호 입력 -->
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="inputPassword" name="pass" type="password" placeholder="Enter your password" required>
                                            <label for="inputPassword">Password</label>
                                        </div>
                                        <!-- 이름 입력 -->
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="inputName" name="name" type="text" placeholder="Enter your name" required>
                                            <label for="inputName">Name</label>
                                        </div>
                                        <!-- 이메일 입력 -->
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="inputEmail" name="email" type="email" placeholder="name@example.com" required>
                                            <label for="inputEmail">Email</label>
                                        </div>
                                        <!-- 전화번호 입력 -->
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="inputPhone" name="phone" type="text" placeholder="Enter your phone number">
                                            <label for="inputPhone">Phone</label>
                                        </div>
                                        <!-- 회원가입 버튼 -->
                                        <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                            <button type="submit" class="btn btn-primary w-100">Sign Up</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="card-footer text-center py-3">
                                    <div class="small"><a href="login.jsp">Already have an account? Login!</a></div>
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
</body>
</html>
