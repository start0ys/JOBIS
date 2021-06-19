package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Calendar1;
import dao.CalendarDao;

public class CWriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			CalendarDao cd = CalendarDao.getInstance();
			request.setCharacterEncoding("utf-8");
	        String m_nickname = null;
	        int m_num = 0;
            HttpSession session = request.getSession();
            m_num = (int)session.getAttribute("m_num");
            m_nickname = cd.getNickname(m_num);
	        int cal_cate = 0;
            if(m_num == 0) {
	        	cal_cate = 1;
	        }else cal_cate = 0;
	        
            request.setAttribute("m_nickname", m_nickname);
	        request.setAttribute("m_num", m_num);
	        request.setAttribute("cal_cate", cal_cate);
	        
	        Calendar1 calendar = new Calendar1();
	        calendar.setCal_title(request.getParameter("cal_title"));
	        calendar.setCal_date(request.getParameter("cal_date"));
	        calendar.setCal_contents(request.getParameter("cal_contents"));
	        calendar.setCal_bgcolor(request.getParameter("cal_bgcolor"));
	        
	        int result = cd.insert(m_num, cal_cate, calendar);
	        request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "cWritePro.jsp";
	}

}
