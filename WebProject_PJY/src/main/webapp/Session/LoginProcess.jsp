<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="membership.MemberDAO, membership.MemberDTO" %>
<%
    String userId = request.getParameter("id");
    String userPwd = request.getParameter("pass");

    MemberDAO dao = new MemberDAO(application);
    MemberDTO member = dao.getMemberDTO(userId, userPwd);

    if (member != null && member.getId() != null) {
        // 로그인 성공
        session.setAttribute("id", member.getId());
        session.setAttribute("name", member.getName());
        response.sendRedirect("../index.jsp");
    } else {
        // 로그인 실패
        request.setAttribute("errorMessage", "Invalid ID or Password. Please try again.");
%>
        <script>
            alert("<%= request.getAttribute("errorMessage") %>");
            location.href = "../login.jsp";
        </script>
<%
    }
    dao.close();
%>
