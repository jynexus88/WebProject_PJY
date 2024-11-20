package membership;

import common.JDBConnect;
import jakarta.servlet.ServletContext;
import java.sql.SQLException;

// DAO에서 가져온 데이터를 MemberDTO 객체에 저장해 프로그램 전반에서 사용자 정보를 쉽게 다룰 수 있음.
// DTO: 데이터를 전달하는 객체
// DAO: 데이터베이스에 연결되어 데이터를 조회, 삽입, 수정, 삭제(캡슐화)
public class MemberDAO extends JDBConnect {
	
	// ServletContext 객체를 통해 DB연결 정보를 가져와 초기화함
    public MemberDAO(ServletContext application) {
        super(application);
    }

    // 로그인 시 아이디와 비밀번호를 기반으로 회원정보를 가져옴(LoginProcess.jsp에서 사용)
    public MemberDTO getMemberDTO(String id, String pass) {
        MemberDTO dto = null; // 초기상태
        String query = "SELECT * FROM member WHERE id=? AND pass=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, id); // 첫 번째 ?에 userId 대입
            psmt.setString(2, pass); // 두 번쨰 ?에 userPwd 대입
            rs = psmt.executeQuery();

            if (rs.next()) {
                dto = new MemberDTO(); // DTO 객체 생성
                // DAO에서 가져온 데이터베이스 결과를 DTO 객체의 변수에 저장
                dto.setId(rs.getString("id"));
                dto.setPass(rs.getString("pass"));
                dto.setName(rs.getString("name"));
                dto.setEmail(rs.getString("email"));
                dto.setPhone(rs.getString("phone"));
                dto.setRegidate(rs.getString("regidate"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return dto; // DTO 객체 반환
    }
    
    // 새 회원 등록(RegisterProcess.jsp에서 사용)
    public int insertMember(MemberDTO dto) {
        int result = 0;
        String query = "INSERT INTO member (id, pass, name, email, phone) VALUES (?, ?, ?, ?, ?)";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getId());
            psmt.setString(2, dto.getPass());
            psmt.setString(3, dto.getName());
            psmt.setString(4, dto.getEmail());
            psmt.setString(5, dto.getPhone());
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return result;
    }
    
    // 비밀번호 확인
    public boolean verifyPassword(String id, String pass) {
        boolean result = false;
        String query = "SELECT COUNT(*) FROM member WHERE id=? AND pass=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            psmt.setString(2, pass);
            rs = psmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    // 회원 정보 수정
    public int updateMember(MemberDTO dto) {
        int result = 0;
        String query = "UPDATE member SET name=?, phone=?" + (dto.getPass() != null ? ", pass=?" : "") + " WHERE id=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getName());
            psmt.setString(2, dto.getPhone());
            if (dto.getPass() != null) {
                psmt.setString(3, dto.getPass());
                psmt.setString(4, dto.getId());
            } else {
                psmt.setString(3, dto.getId());
            }
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public MemberDTO getMemberDTOById(String id) {
        MemberDTO dto = null;
        String query = "SELECT * FROM member WHERE id=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            rs = psmt.executeQuery();
            if (rs.next()) {
                dto = new MemberDTO();
                dto.setId(rs.getString("id"));
                dto.setPass(rs.getString("pass"));
                dto.setName(rs.getString("name"));
                dto.setEmail(rs.getString("email"));
                dto.setPhone(rs.getString("phone"));
                dto.setRegidate(rs.getString("regidate"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return dto;
    }

    // 회원가입 시 아이디, 이메일 중복 여부 확인(RegisterProcess.jsp에서 사용)
    public boolean checkDuplicate(String id, String email) {
        boolean isDuplicate = false;
        String query = "SELECT COUNT(*) FROM member WHERE id=? OR email=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            psmt.setString(2, email);
            // 쿼리를 실행하고 결과를 ResultSet 객체(rs)로 반환
            rs = psmt.executeQuery();
            
            // 중복데이터가 있다면 1, 없다면 0
            if (rs.next() && rs.getInt(1) > 0) {
                isDuplicate = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return isDuplicate;
    }

}
