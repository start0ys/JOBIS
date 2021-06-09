package service;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Other;
import dao.OtherDao;


public class UpdatePageAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
		try {
			request.setCharacterEncoding("utf-8");
	        String m_nickname = null;
	        int m_num = 0;
            HttpSession session = request.getSession();
            m_num = (int)session.getAttribute("m_num");
            OtherDao od = OtherDao.getInstance();
            m_nickname = od.getNickname(m_num);
            Other other = od.select(m_num);
			request.setAttribute("m_num", m_num);
	        request.setAttribute("m_nickname", m_nickname);
	        request.setAttribute("m_id", other.getM_id());
	        request.setAttribute("m_pw", other.getM_pw());
	        request.setAttribute("m_name", other.getM_name());
	        request.setAttribute("m_sex", other.getM_sex());
	        request.setAttribute("mail", other.getMail());
	        request.setAttribute("college", other.getCollege());
	        request.setAttribute("major", other.getMajor());
	        request.setAttribute("millitary", other.getMillitary());
	        request.setAttribute("m_dept", other.getM_dept());
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	      }
		return "updatePage.jsp";
	}

}
