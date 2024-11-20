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
                                    <!-- 
                                    로그인 입력폼:
                                    아이디와 이메일을 입력받아 LoginProcess.jsp로 post방식으로 전달함
                                    post방식: 데이터 추가/수정/삭제, 데이터를 눈에 보이지 않게 전송(URL표시되지않음)
                                    id="inputID" => 필드의 고유 식별자
                                    name="id" => 폼 데이터가 서버로 전송될때 id로 받아 LoginProcess.jsp로 전달
                                    placeholder => 입력 필드 힌트 메세지
                                    required => 필수 입력 항목 / 입력하지 않으면 폼 제출시 브라우조 경고 메세지 발송
                                    <label> => 어떤 입력필드와 연경되어 있는지 지정, 사용자가 ID라벨을 클릭하면 해당 입력 필드로 포커스 이동
                                    -->
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
                                <!-- 회원가입 버튼 -->
                                <div class="card-footer text-center py-3">
                                    <div class="small"><a href="register.jsp">계정이 없으신가요? 지금 가입하세요!</a></div>
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
	/*
	LoginProcess.jsp: 로그인 처리 로직 담당, 실패 시 에러메세지를 설정한 뒤 login.jsp로 이동
	login.jsp: 전달받은 에러메세지를 사용자에게 표시함
	*/
    <% if (request.getAttribute("errorMessage") != null) { %>
        alert("<%= request.getAttribute("errorMessage") %>");
    <% } %>
</script>
</body>
</html>
