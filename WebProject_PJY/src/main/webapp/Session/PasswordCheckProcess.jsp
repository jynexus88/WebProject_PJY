<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="membership.MemberDAO" %>
<%
    String userId = (String) session.getAttribute("UserId");
    String userPass = request.getParameter("pass");

    MemberDAO dao = new MemberDAO(application);
    boolean isPasswordCorrect = dao.verifyPassword(userId, userPass);
    dao.close();

    if (isPasswordCorrect) {
        response.sendRedirect("UpdateProfile.jsp");
    } else {
%>
        <script>
            alert("비밀번호가 일치하지 않습니다.");
            location.href = "PasswordCheck.jsp";
        </script>
<%
    }
%>
