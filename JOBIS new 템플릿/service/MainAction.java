package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Board;
import dao.BoardDao;




public class MainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		  try {
		        request.setCharacterEncoding("utf-8");
		        String m_nickname = null;
		        int m_num = 0;
	            HttpSession session = request.getSession();
	            m_num = (int)session.getAttribute("m_num");
	            BoardDao bd = BoardDao.getInstance();
	            m_nickname = bd.getNickname(m_num);
		      
		        request.setAttribute("m_nickname", m_nickname);
		        request.setAttribute("m_num", m_num);
		        
		        //베스트글 불러오기
		        //List<Board> best0 = bd.best(0);
		        //List<Board> best1 = bd.best(1);
		        //List<Board> best2 = bd.best(2);
		        
		        //request.setAttribute("best0", best0);
		        //request.setAttribute("best1", best1);
		        //request.setAttribute("best2", best2);
		         
		      } catch (Exception e) {
		         System.out.println(e.getMessage());
		      }

		      return "main1.jsp";
	}

}




