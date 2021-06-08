package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.Comment;
import dao.CommentDao;

public class ReWriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			int m_num = Integer.parseInt(request.getParameter("m_num"));
			String m_nickname = request.getParameter("m_nickname");
			String pageNum = request.getParameter("pageNum");
			int b_idx = Integer.parseInt(request.getParameter("b_idx"));
			
			Comment comment = new Comment();
			comment.setB_idx(b_idx);
			comment.setM_num(m_num);
			comment.setNickname(m_nickname);
			comment.setC_content(request.getParameter("c_content"));
			comment.setC_idx(Integer.parseInt(request.getParameter("c_idx")));
			comment.setRef(Integer.parseInt(request.getParameter("ref")));
			comment.setRe_step(Integer.parseInt(request.getParameter("re_step")));
			comment.setRe_level(Integer.parseInt(request.getParameter("re_level")));
			
			CommentDao cd = CommentDao.getInstance();
			int result = cd.insert(comment);
			
			int b_type = Integer.parseInt(request.getParameter("b_type"));
			
			request.setAttribute("b_type", b_type);
			request.setAttribute("b_idx", b_idx);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("result", result);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "bviewPro.jsp";
	}

}
