package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ERBoard;
import dao.ERBoardDao;

public class ERUpdatePro implements CommandProcess  {
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("ERUpdatePro start...");
			request.setCharacterEncoding("utf-8");
			ERBoard erboard = new ERBoard();
			erboard.setM_num(Integer.parseInt(request.getParameter("m_num")));
			erboard.setM_name(request.getParameter("m_name"));
			erboard.setMail(request.getParameter("mail"));
			erboard.setAdditions(request.getParameter("additions"));
			erboard.setCollege(request.getParameter("collage"));
			erboard.setMajor(request.getParameter("major"));
			erboard.setDate1(request.getParameter("date1"));
			erboard.setDate2(request.getParameter("date2"));
			erboard.setCredit(request.getParameter("credit"));
			erboard.setMillitary(request.getParameter("millitary"));
			erboard.setM_dept(request.getParameter("m_dept"));
			erboard.setM_class(request.getParameter("m_class"));
			erboard.setM_date1(request.getParameter("m_date1"));
			erboard.setM_date2(request.getParameter("m_date2"));
			erboard.setAname(request.getParameter("aname"));
			erboard.setAdate1(request.getParameter("adate1"));
			erboard.setAdate2(request.getParameter("adate2"));
			erboard.setEdate1(request.getParameter("edate1"));
			erboard.setEname(request.getParameter("ename"));
			erboard.setAcontent(request.getParameter("acontent"));
			erboard.setEcontent(request.getParameter("econtent"));
			erboard.setEjob(request.getParameter("ejob"));
			erboard.setEdate2(request.getParameter("edate2"));
			erboard.setTnumber(request.getParameter("tnumber"));
			erboard.setCol(request.getParameter("col"));
			erboard.setTname(request.getParameter("tname"));
			erboard.setTscore(request.getParameter("tscore"));
			erboard.setTdate(request.getParameter("tdate"));
			erboard.setLdate(request.getParameter("ldate"));
			erboard.setLname(request.getParameter("lname"));
			erboard.setLdate(request.getParameter("ldate"));
			erboard.setPrice(request.getParameter("price"));
			erboard.setPcontent(request.getParameter("pcontent"));
			erboard.setPdate(request.getParameter("pdate"));
			erboard.setPdept(request.getParameter("pdept"));
			erboard.setPname(request.getParameter("pname"));
			erboard.setP_id(request.getParameter("p_id"));
			
			ERBoardDao bd = ERBoardDao.getInstance(); 
			int result1 = bd.erUpdate1(erboard);
			int result2 = bd.erUpdate2(erboard);
			int result3 = bd.erUpdate3(erboard);
			int result4 = bd.erUpdate4(erboard);
			int result5 = bd.erUpdate5(erboard);
			System.out.println("ERUpdatePro result1->"+result1);
			System.out.println("ERUpdatePro result2->"+result2);
			System.out.println("ERUpdatePro result3->"+result3);
			System.out.println("ERUpdatePro result4->"+result4);
			System.out.println("ERUpdatePro result5->"+result5);

			request.setAttribute("m_num", erboard.getM_num());
			request.setAttribute("result1", result1);
			request.setAttribute("result2", result2);
			request.setAttribute("result3", result3);
			request.setAttribute("result4", result4);
			request.setAttribute("result5", result5);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "erukupdatePro.jsp";
	}
}
