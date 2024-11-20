<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 세션에서 저장된 비밀번호 가져오기
String sessionPassword = (String) session.getAttribute("password");
String inputPassword = request.getParameter("password");

// 비밀번호 확인 로직
if (sessionPassword != null && sessionPassword.equals(inputPassword)) {
	// 비밀번호 일치 - 프로필 업데이트 페이지로 이동
	response.sendRedirect("UpdateProfile.jsp");
} else {
	// 비밀번호 불일치 - 경고 메시지 출력 후 다시 비밀번호 확인 페이지로 이동
%>
<script>
	alert("비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
	location.href = "PasswordCheck.jsp";
</script>
<%
}
%>
