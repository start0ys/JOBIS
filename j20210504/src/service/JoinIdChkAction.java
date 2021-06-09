package service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

public class JoinIdChkAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String    id    = request.getParameter("id");
			MemberDao md = MemberDao.getInstance();
			int result = md.idchk(id);
			response.setContentType("text/html;charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			if(result == 1) out.println("0");
			else 			out.println("1");
			
			out.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

}
