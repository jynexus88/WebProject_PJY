<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 로그아웃 처리: session 영역 전체의 속성을 삭제
session.invalidate();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Logout</title>
    <script>
        // 팝업 메시지를 띄운 뒤 인덱스 페이지로 이동
        alert("로그아웃되었습니다.");
        window.location.href = "../index.jsp";
    </script>
</head>
<body>
</body>
</html>