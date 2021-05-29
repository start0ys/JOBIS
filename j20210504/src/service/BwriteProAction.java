package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;

public class BwriteProAction  implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			//b_type을 넘겨주기위해 추가해주었습니다. 추가한 이유는 해당 게시판에서 글을쓰고나면 해당 게시판으로 이동하기위해서입니다.
			int b_type = Integer.parseInt(request.getParameter("b_type"));
			Board board = new Board();
			
			board.setM_num(Integer.parseInt(request.getParameter("m_num")));
			board.setM_nickname(request.getParameter("m_nickname"));
			board.setB_title(request.getParameter("b_title"));
			board.setB_content(request.getParameter("b_content"));
			board.setB_type(b_type);
			
			BoardDao bd = BoardDao.getInstance();
			
			int result = bd.write(board);
			
			request.setAttribute("result", result);
			//b_type 넘겨주는것을 추가했습니다.
			request.setAttribute("b_type", b_type);
			
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "bwritePro.jsp";
	}

}
