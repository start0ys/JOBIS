package service;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member;
import dao.MemberDao;

public class JoinAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			try {
				request.setCharacterEncoding("UTF-8");
				Member member = new Member();
				member.setId(request.getParameter("id"));
				member.setPw(request.getParameter("pw"));
				member.setName(request.getParameter("name"));
				Date birth = Date.valueOf(request.getParameter("birth"));
				member.setBirth(birth);
				member.setGender(request.getParameter("gender"));
				String nickname = request.getParameter("job")+request.getParameter("nickname");
				member.setNickname(nickname);
				member.setEmail(request.getParameter("email"));
				MemberDao md = MemberDao.getInstance();
				int result = md.insert(member);
				request.setAttribute("result", result);
			} catch (Exception e) {
			System.out.println(e.getMessage());
			}
			return "joinPro.jsp";
			}

}
