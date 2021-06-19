package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ERBoard;
import dao.ERBoardDao;

public class ERWriteProAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
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
			int result = bd.erNew(erboard);
			request.setAttribute("m_num", erboard.getM_num());
			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} return "erukwritePro.jsp";
	}
}
