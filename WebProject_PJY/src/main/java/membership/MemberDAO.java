package membership;

import common.JDBConnect;
import jakarta.servlet.ServletContext;
import java.sql.SQLException;

public class MemberDAO extends JDBConnect {

    public MemberDAO(ServletContext application) {
        super(application);
    }

    public MemberDTO getMemberDTO(String id, String pass) {
        MemberDTO dto = null;
        String query = "SELECT * FROM member WHERE id=? AND pass=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            psmt.setString(2, pass);
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

    public boolean checkDuplicate(String id, String email) {
        boolean isDuplicate = false;
        String query = "SELECT COUNT(*) FROM member WHERE id=? OR email=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            psmt.setString(2, email);
            rs = psmt.executeQuery();
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
