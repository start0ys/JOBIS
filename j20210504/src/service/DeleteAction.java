package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OtherDao;

public class DeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
	        request.setCharacterEncoding("utf-8");
	        int m_num  = Integer.parseInt(request.getParameter("m_num"));
	        System.out.println("m_num ->" + m_num);
	        OtherDao od = OtherDao.getInstance();
            int result = od.delete(m_num);
            if(result == 1) {
    	        request.setAttribute("result", 1);
            } else if (result == 0) {
            	request.setAttribute("result", 0);
            }
	         
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	      }

	      return "delete.jsp";
		}
}