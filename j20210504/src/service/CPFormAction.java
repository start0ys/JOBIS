package service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Calendar1;
import dao.CalendarDao;

public class CPFormAction implements CommandProcess {

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
	        
            String curYear = request.getParameter("curYear");
            System.out.println(curYear);
            int curMonth = Integer.parseInt(request.getParameter("curMonth"));
            System.out.println(curMonth);
            int curDay = Integer.parseInt(request.getParameter(String.valueOf("curDay")));
            System.out.println(curDay);
            String cal_date = curYear +"/"+ String.format("%02d", curMonth) +"/"+ String.format("%02d", curDay);
            System.out.println(cal_date);
            
	        request.setAttribute("m_nickname", m_nickname);
	        request.setAttribute("m_num", m_num);
	        request.setAttribute("curYear", curYear);
	        request.setAttribute("curMonth", curMonth);
	        request.setAttribute("curDay", curDay);
	        List<Calendar1> dlist = cd.dlist(m_num, cal_date);
	        request.setAttribute("dlist", dlist);
	        
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "cPlanList.jsp";
	}

}
