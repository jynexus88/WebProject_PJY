<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="membership.MemberDAO, membership.MemberDTO" %>
<%

	// 회원정보 수정 진행
    String userId = (String) session.getAttribute("id");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String newPassword = request.getParameter("pass");

    // 비밀번호 값 확인
    System.out.println("입력된 비밀번호: " + newPassword);
    
    MemberDAO dao = new MemberDAO(application);
    MemberDTO member = new MemberDTO();
    member.setId(userId);
    member.setName(name);
    member.setPhone(phone);
    if (newPassword != null && !newPassword.isEmpty()) {
        member.setPass(newPassword);
    }

    int result = dao.updateMember(member);
    dao.close();

    if (result == 1) {
%>
        <script>
            alert("회원정보가 수정되었습니다. 다시 로그인해주세요.");
            location.href = "Logout.jsp";
        </script>
<%
    } else {
%>
        <script>
            alert("회원정보 수정 중 오류가 발생했습니다.");
            location.href = "../UpdateProfile.jsp";
        </script>
<%
    }
%>
