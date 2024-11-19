package free_board;

import java.sql.SQLException;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class FreeBoardDAO extends JDBConnect {
	
	public FreeBoardDAO(ServletContext application) {
		super(application);
	}
	
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
}
