<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="membership.MemberDAO, membership.MemberDTO" %>
<%
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");

    MemberDAO dao = new MemberDAO(application);
    MemberDTO memberDTO = dao.getMemberDTO(id, pass);
    dao.close();

    if (memberDTO != null) {
        session.setAttribute("UserId", memberDTO.getId());
        session.setAttribute("UserName", memberDTO.getName());
        response.sendRedirect("../index.jsp");
    } else {
        request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
        request.getRequestDispatcher("../login.jsp").forward(request, response);
    }
%>
