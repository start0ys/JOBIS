package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board;
import dao.BoardDao;
import dao.Comment;
import dao.CommentDao;

public class BviewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			//세션작업
			request.setCharacterEncoding("utf-8");
	        String m_nickname = null;
	        int m_num = 0;
            HttpSession session = request.getSession();
            m_num = (int)session.getAttribute("m_num");
            BoardDao bd = BoardDao.getInstance();
            m_nickname = bd.getNickname(m_num);
	      
	        request.setAttribute("m_nickname", m_nickname);
	        request.setAttribute("m_num", m_num);
			
	        //게시글보기위한 작업
			int b_idx = Integer.parseInt(request.getParameter("b_idx"));
			String pageNum = request.getParameter("pageNum");
			bd.readCount(b_idx);
			Board board = bd.select(b_idx);
			//게시글작성할때 뛰어쓰기 한 것을 그대로 불러오기위한 작업
			String content = board.getB_content();
			content = content.replace("\r\n","<br>");
		
			
			request.setAttribute("b_idx", b_idx);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("board", board);
			//뛰어쓰기 작업때문에 따로 작업한것을 보내기
			request.setAttribute("content", content);
			

			//대댓글 작업
			int c_idx = 0, ref = 0, re_level = 0, re_step = 0;
			if (pageNum == null ) pageNum = "1";
			CommentDao cd = CommentDao.getInstance();
			if(request.getParameter("c_idx") != null ) {
				c_idx = Integer.parseInt(request.getParameter("c_idx"));
				Comment comment = cd.select(c_idx);
				ref = comment.getRef();
				re_level = comment.getRe_level();
				re_step = comment.getRe_step();
			}
			request.setAttribute("c_idx", c_idx);	
			request.setAttribute("ref", ref);	
			request.setAttribute("re_level", re_level);	
			request.setAttribute("re_step", re_step);
			
			//댓글작업
			List<Comment> list = cd.list(b_idx);
			
			request.setAttribute("list", list);
		
			
			
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "bview.jsp";
	}

}
