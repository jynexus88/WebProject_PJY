package free_board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.BoardPage;

// 서블릿 매핑은 web.xml에서 정의함
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("ListController 실행됨!");

		// DAO 인스턴스 생성
		FreeBoardDAO dao = new FreeBoardDAO();

		// 뷰에 전달할 매개변수 저장용 맵 생성(검색어 관련 파라미터 저장)
		Map<String, Object> map = new HashMap<String, Object>();

		// 검색어를 입력했다면 파라미터로 전달된 값을 Map에 저장
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		if (searchWord != null) {
			// 쿼리스트링으로 전달받은 매개변수 중 검색어가 있다면 map에 저장
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}

		// 게시물의 갯수 카운트를 위한 메서드 호출
		int totalCount = dao.selectCount(map);
		
		// 페이지처리
		ServletContext application = getServletContext();
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if(pageTemp!=null&&!pageTemp.equals(""))pageNum=Integer.parseInt(pageTemp);
		
		// 목록에 출력할 게시물 범위 계산
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		// DAO로 전달하기 위해 Map에 저장
		map.put("start",start);map.put("end",end);

		// DAO의 메서드를 호출하여 목록에 출력할 게시물을 얻어온다.
		List<FreeBoardDTO> boardLists = dao.selectListPage(map);dao.close();

		// 뷰에 전달할 매개변수 추가
		// 목록 하단에 출력할 페이지 바로가기 링크를 얻오운 후 Map에 추가
		String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../freeboard/list.do");
		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);

		// 전달할 데이터를 request 영역에 저장 후 List.jsp로 포워드
		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		req.getRequestDispatcher("/FreeBoard/list.jsp").forward(req, resp);
	}
}
