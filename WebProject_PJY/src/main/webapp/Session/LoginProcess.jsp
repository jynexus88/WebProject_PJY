<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="membership.MemberDAO, membership.MemberDTO" %>

<%
	// 클라이언트가 login.jsp에서 <form>태그를 통해 POST방식으로 전송한 데이터(id, pass)를 
	// 서버에서 가져와 변수에 저장(userId, userPwd) 
    String userId = request.getParameter("id");
    String userPwd = request.getParameter("pass");
	
    // 데이터베이스 작업을 위해 DAO 객체 생성
    // application 객체를 전달하여 DB연결 정보 초기화
    MemberDAO dao = new MemberDAO(application);
    
    // DAO의 getMemberDTO 메서드 호출 -> 데이터베이스에서 id, pass 확인
    // 입력받은 userId, userPwd를 사용해 조회한 결과를 member 객체에 담아 반환
    MemberDTO member = dao.getMemberDTO(userId, userPwd);

    // 데이터베이스에 일치하는 사용자(id, pass)가 있는지 확인하여  
    // MemberDTO객체가 null이 아니고, id정보가 존재하는 경우 로그인 성공 처리
    if (member != null && member.getId() != null) {
        // 로그인 성공 => 세션에 id, 이름을 저장하여 로그인 상태 유지
        session.setAttribute("id", member.getId());
        session.setAttribute("name", member.getName());
        // index.jsp로 리다이렉트하여 로그인 후 화면 표시
        response.sendRedirect("../index.jsp");
    } 
    
    else {
      	// 로그인 실패 => request객체에 저장(요청이 끝나면 데이터 사라짐)
        request.setAttribute("errorMessage", "입력 정보가 일치하지 않습니다. 다시 시도해주세요.");
%>
		
		<!-- request.setAttribute로 저장된 데이터(errorMessage)를 가져옴. 
		팝업창으로 에러메세지 표시 후 login.jsp파일로 돌아감-->
        <script>
            alert("<%= request.getAttribute("errorMessage") %>");
            location.href = "../login.jsp";
        </script>

<%
    }
    dao.close();
%>
