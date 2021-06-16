package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import dao.User;
import dao.UserDao;

public class AdUserGradeDownAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int m_num = Integer.parseInt(request.getParameter("m_num"));
			UserDao ud = UserDao.getInstance();
			int result = ud.GradeDown(m_num);
			
			request.setAttribute("m_num", m_num);
			request.setAttribute("result", result);
	 					
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "adUserGradeDown.jsp";
	}

}
