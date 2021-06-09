package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SeBoard;
import dao.SeBoardDao;

public class SeUpdateProAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try { 
			request.setCharacterEncoding("utf-8"); 
	        String pageNum = request.getParameter("pageNum");
	        SeBoard Seboard = new SeBoard();
	        Seboard.setS_idx(Integer.parseInt(request.getParameter("s_idx")));
	        Seboard.setM_num(Integer.parseInt(request.getParameter("m_num")));
	        Seboard.setS_type(Integer.parseInt(request.getParameter("s_type")));
	        Seboard.setS_companyname(request.getParameter("s_companyname"));
	        Seboard.setM_nickname(request.getParameter("m_nickname"));
			Seboard.setS_content(request.getParameter("s_content"));
			
			SeBoardDao bd = SeBoardDao.getInstance();
			int result = bd.update(Seboard);
			request.setAttribute("result", result);
			request.setAttribute("s_idx", Seboard.getS_idx());
			request.setAttribute("pageNum", pageNum);
		} catch(Exception e) { 
			System.out.println(e.getMessage()); 
		}
		return "SeupdatePro.jsp";	}

}
