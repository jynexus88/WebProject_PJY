package free_board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

// DBCP(커넥션풀)을 통해 Oracle에 연결하기 위해 상속을 받아 정의
public class FreeBoardDAO extends DBConnPool {
    
    // 기본생성자를 통해 부모클래스의 기본생성자 호출
    public FreeBoardDAO() {
        super();
    }
    
    // 게시물의 갯수를 카운트하기 위한 함수
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;
        String query = "SELECT COUNT(*) FROM FREE_BOARD";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " 
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		try {
			// Statement 인스턴스 생성(정적쿼리문 실행)
			stmt = con.createStatement();
			// 쿼리문을 실행한 후 결과를 ResultSet으로 반환받는다.
			rs = stmt.executeQuery(query);
			/* count()함수는 조건에 상관없이 항상 결과가 인출되므로
			 * if문과 같은 조건절없이 바로 next()함수를 실행할 수 있다. */
			rs.next();
			// 반환된 결과를 저장한다.
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}

		return totalCount;
	}
    
    // 입력을 위한 메서드
    public int insertFreeBoard(FreeBoardDTO dto) {
        int result = 0;
        String query = "INSERT INTO free_board ( "
                     + " post_id, user_id, title, content, "
                     + " created_at, updated_at, views, likes) "
                     + " VALUES ( "
                     + " seq_free_board.NEXTVAL, ?, ?, ?, "
                     + " SYSDATE, NULL, 0, 0)";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getUser_id());
            psmt.setString(2, dto.getTitle());
            psmt.setString(3, dto.getContent());
            result = psmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("게시물 입력 중 예외 발생");
            e.printStackTrace();
        } finally {
            try {
                if (psmt != null) psmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    // 목록 출력 및 페이징 처리를 위한 메서드
    public List<FreeBoardDTO> selectListPage(Map<String, Object> map) {
        List<FreeBoardDTO> boardList = new Vector<FreeBoardDTO>();
        String query = "SELECT * FROM "
                     + " ( SELECT Tb.*, ROWNUM rNUM FROM "
                     + " ( SELECT * FROM free_board ";

        // 검색어가 있으면 WHERE 절 추가
        if(map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") 
                   + " LIKE '%" + map.get("searchWord") + "%'";
        }
        
        query += " ORDER BY post_id DESC "
              + " ) Tb "
              + " ) "
              + " WHERE rNUM BETWEEN ? AND ?";  // 페이지네이션 처리

        try {
            psmt = con.prepareStatement(query);
            
            // start와 end를 정수로 설정
            psmt.setInt(1, (Integer) map.get("start"));
            psmt.setInt(2, (Integer) map.get("end"));
            
            rs = psmt.executeQuery();

            while (rs.next()) {
                FreeBoardDTO dto = new FreeBoardDTO();
                
                // DB 컬럼에 맞는 데이터 셋팅
                dto.setPost_id(rs.getInt(1));     // post_id
                dto.setUser_id(rs.getString(2));  // user_id
                dto.setTitle(rs.getString(3));    // title
                dto.setContent(rs.getString(4));  // content
                dto.setCreated_at(rs.getString(5)); // created_at
                dto.setUpdated_at(rs.getString(6)); // updated_at
                dto.setViews(rs.getInt(7));       // views
                dto.setLikes(rs.getInt(8));       // likes
                
                boardList.add(dto);
            }
        } catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        
        return boardList;
    }

}
