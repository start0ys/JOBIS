package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;

public class LoginProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String    id    = request.getParameter("id");
			String password = request.getParameter("password");
			BoardDao bd = BoardDao.getInstance();
			int result = bd.login(id, password);
			if(result == 1){
				HttpSession session = request.getSession();
				int m_num = bd.getM_num(id);
				session.setAttribute("m_num", m_num);
				request.setAttribute("result", 1);
	 		} else if (result == 0) {
	 			request.setAttribute("result", 0);
			} else { 
				request.setAttribute("result", -1);
			} 
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "loginPro.jsp";
	}

}
