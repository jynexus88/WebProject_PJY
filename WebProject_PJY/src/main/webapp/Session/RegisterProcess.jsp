<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="membership.MemberDAO, membership.MemberDTO" %>
<%
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");

    MemberDAO dao = new MemberDAO(application);

    boolean isDuplicate = dao.checkDuplicate(id, email);

    if (isDuplicate) {
        // ID 또는 이메일 중복 시 알림 띄우기
%>
        <script>
            alert("ID or Email already exists. Please use a different one.");
            history.back(); // 이전 페이지로 이동
        </script>
<%
    } else {
        MemberDTO member = new MemberDTO();
        member.setId(id);
        member.setPass(pass);
        member.setName(name);
        member.setEmail(email);
        member.setPhone(phone);

        int result = dao.insertMember(member);

        if (result == 1) {
            // 회원가입 성공 시 알림 후 로그인 페이지로 이동
%>
            <script>
                alert("Registration successful! You can now log in.");
                location.href = "../login.jsp"; // 로그인 페이지로 이동
            </script>
<%
        } else {
            // 회원가입 실패 시 알림 띄우기
%>
            <script>
                alert("An error occurred during registration. Please try again.");
                history.back(); // 이전 페이지로 이동
            </script>
<%
        }
    }

    dao.close(); // DAO 연결 종료
%>
