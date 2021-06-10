package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Other;
import dao.OtherDao;

public class UserModifyAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			int result = 0;
			int m_num = 0;
		try {
			request.setCharacterEncoding("utf-8");
            HttpSession session = request.getSession();
            m_num = (int)session.getAttribute("m_num");
			Other other = new Other();
			other.setM_num(m_num);
			other.setM_pw(request.getParameter("m_pw"));
			other.setM_name(request.getParameter("m_name"));
			other.setM_sex(request.getParameter("m_sex"));
			other.setMail(request.getParameter("mail"));
			other.setM_nickname(request.getParameter("m_nickname"));
			other.setCollege(request.getParameter("college"));
			other.setMajor(request.getParameter("major"));
			other.setMillitary(request.getParameter("millitary"));
			other.setM_dept(request.getParameter("m_dept"));
			OtherDao od = OtherDao.getInstance();
			result = od.update(other);
			request.setAttribute("result",  result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "updatePro.jsp";
	}

}
