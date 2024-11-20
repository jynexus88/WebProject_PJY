<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="membership.MemberDAO, membership.MemberDTO" %>
<%
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");

    MemberDAO dao = new MemberDAO(application);

    // DAO의 checkDuplicate() 메소드 호출: 회원가입 시 아이디, 이메일 중복여부 확인
    boolean isDuplicate = dao.checkDuplicate(id, email);
    if (isDuplicate) {
%>
        <script>
            alert("ID 또는 이메일이 중복됩니다. 다른 값을 사용해주세요.");
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
		
        // 회원가입 성공 시 알림 후 로그인 페이지로 이동
        if (result == 1) {
%>
            <script>
                alert("가입해주셔서 감사합니다. 로그인 후 다양한 서비스를 만나보세요.");
                location.href = "../login.jsp"; // 로그인 페이지로 이동
            </script>
       
<%
		// 회원가입 실패 시 에러메세지 팝업 후 이전 페이지로 이동
        } else {
%>
            <script>
                alert("회원가입 중 오류가 발생했습니다. 다시 시도해주세요.");
                history.back(); // 이전 페이지로 이동
            </script>
<%
        }
    }

    dao.close(); // DAO 연결 종료
%>
