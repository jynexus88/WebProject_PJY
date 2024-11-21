package free_board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class FreeBoardDAO extends JDBConnect {
	
	public FreeBoardDAO(ServletContext application) {
		super(application);
	}
	
	// ㅇ
	public int insertFreeBoard(FreeBoardDTO dto) {
		int result = 0;
		String query = "INSERT INTO free_board (user_id, title, content) VALUES (?, ?, ?)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getUser_id());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	// 목록 출력을 위한 메서드
    public List<FreeBoardDTO> getAllPosts() {
    	// FreeBoardDTO 인스턴스를 저장할 수 있는 리스트 생성
        List<FreeBoardDTO> postList = new ArrayList<>();
        // select 쿼리문 작성
        String query = "SELECT * FROM free_board ORDER BY created_at DESC";

        try {
            psmt = con.prepareStatement(query);
            rs = psmt.executeQuery();

            while (rs.next()) {
                FreeBoardDTO dto = new FreeBoardDTO();
                dto.setPost_id(rs.getInt("post_id"));
                dto.setUser_id(rs.getString("user_id"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setCreated_at(rs.getString("created_at"));
                dto.setUpdated_at(rs.getString("updated_at"));
                dto.setViews(rs.getInt("views"));
                dto.setLikes(rs.getInt("likes"));

                postList.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return postList;
    }
}
