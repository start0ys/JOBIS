package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SeBoardDao;

public class SeDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.parameter -> num, passwd, pageNum
		// 2.BoardDao bd 생성
		// 3.int result = bd.delete(num, passwd);
		// 4.request -> num, pageNum, result 저장
		try {
			int s_idx = Integer.parseInt(request.getParameter("s_idx"));
			String passwd = request.getParameter("passwd");
			String pageNum = request.getParameter("pageNum");
			SeBoardDao bd = SeBoardDao.getInstance();
			int result = bd.delete(s_idx);
			request.setAttribute("s_idx", s_idx);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("result", result);
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return "SedeletePro.jsp";
	}

}
