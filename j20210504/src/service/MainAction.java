package service;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Calendar1;
import dao.CalendarDao;

public class MainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			CalendarDao cd = CalendarDao.getInstance();
			Calendar calendar1 = Calendar.getInstance();
			String strType = (String)request.getParameter("type");
			HttpSession session = request.getSession();
			String m_nickname = null;
			int m_num = 0;
            m_num = (int)session.getAttribute("m_num");
            m_nickname = cd.getNickname(m_num);
			request.setAttribute("m_nickname", m_nickname);
            request.setAttribute("m_num", m_num);

			if(strType != null && !strType.equals("")) {
			    int intYear     = Integer.parseInt(request.getParameter("curYear"));
			    int intMonth     = Integer.parseInt(request.getParameter("curMonth"));
			    int intDay         = Integer.parseInt(request.getParameter("curDay"));

			    if(intMonth > 12) {
			        intYear += 1;
			        intMonth = 1;
			    }
			    if(intMonth < 1) {
			        intYear -= 1;
			        intMonth = 12;
			    }

			    calendar1.set(intYear, intMonth-1, intDay);
			}

			//today ? •ë³?
			request.setAttribute("today",         calendar1.getTime());
			request.setAttribute("curYear",     calendar1.get(Calendar.YEAR));
			request.setAttribute("curMonth",     (calendar1.get(Calendar.MONTH) + 1));
			request.setAttribute("curDay",         calendar1.get(Calendar.DATE));

		
			//?•´?‹¹?›”?˜ 1?¼ë¡? ìº˜ë¦°?” ?„¤? •.
			calendar1.set(Calendar.DATE, 1); 
			request.setAttribute("firstDayOfMonth", calendar1.getTime());
			String first = String.format("%1$tF %1$tT", calendar1.getTime()).substring(0, 10);
		
			
			
			session.setAttribute("firstDayOfWeek", calendar1.get(Calendar.DAY_OF_WEEK));
			session.setAttribute("lastDayOfMonth",     calendar1.getActualMaximum(Calendar.DAY_OF_MONTH));

			//?•´?‹¹?›”?˜ ë§ˆì?ë§‰ì¼ë¡? ìº˜ë¦°?” ?„¤? •.
			calendar1.set(Calendar.DATE, calendar1.getActualMaximum(Calendar.DAY_OF_MONTH));
			session.setAttribute("lastDayOfLastWeek", calendar1.get(Calendar.DAY_OF_WEEK));

			//?‹¤?Œ?‹¬?˜ 1?¼ë¡? ?„¤? •.
			calendar1.set(Calendar.MONTH, calendar1.get(Calendar.MONTH) + 1);
			calendar1.set(Calendar.DATE, 1);
			request.setAttribute("firstDayOfNextMonth", calendar1.getTime());
			String last =String.format("%1$tF %1$tT", calendar1.getTime()).substring(0, 10);
	
			
		
			 
			 
            List<Calendar1> list = cd.list(m_num,first,last);
            System.out.println(list.get(0).getCal_date());
            System.out.println(list.get(0).getCal_title());
            request.setAttribute("list", list);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "main1.jsp";
	}

}
