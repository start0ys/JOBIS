package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CalendarDao;

public class CDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
	        String m_nickname = null;
	        int m_num = 0;
            HttpSession session = request.getSession();
            m_num = (int)session.getAttribute("m_num");
            CalendarDao cd = CalendarDao.getInstance();
            m_nickname = cd.getNickname(m_num);
	        
            String cal_num = String.format("%04d",Integer.parseInt(request.getParameter("cal_num")));
            System.out.println(cal_num);
            
	        request.setAttribute("m_nickname", m_nickname);
	        request.setAttribute("m_num", m_num);
	        
	        int result = cd.Delete(cal_num);
	        request.setAttribute("result", result);
	        
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "cDeletePro.jsp";
	}

}
