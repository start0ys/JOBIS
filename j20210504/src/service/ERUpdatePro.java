package service;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ERBoard;
import dao.ERBoardDao;

public class ERUpdatePro implements CommandProcess  {
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			System.out.println("ERUpdatePro start...");
			int fileResult = 0;
			String filename = "";
			int maxSize = 5 * 1024 * 1024;
			String fileSave = "/fileSave";
			String realPath = request.getServletContext().getRealPath(fileSave);
			MultipartRequest multi = new MultipartRequest(request,realPath,	maxSize,"utf-8", 
					                                      new DefaultFileRenamePolicy());
			Enumeration<?> en = multi.getFileNames();
			while(en.hasMoreElements()) {
				//input 태그의 속성이 file인 태그의 name 속성값 :파라미터이름m
				String filename1 = (String)en.nextElement(); 
				//서버에 저장된 파일 이름 
				filename = multi.getFilesystemName(filename1); 
				//전송전 원래의 파일 이름 
				String original = multi.getOriginalFileName(filename1);
				//전송된 파일의 내용 타입 
				String type = multi.getContentType(filename1); 
				//전송된 파일속성이 file인 태그의 name 속성값을 이용해 파일객체생성 
				File file = multi.getFile(filename1);  
				
				fileResult = 1;
			}			
			String context = request.getContextPath();
			String file = context+"/"+"fileSave\\"+filename;
			request.setAttribute("file",file);
			
			ERBoard erboard = new ERBoard();
			
			if(fileResult == 1) {
				erboard.setPhoto(file);
			}
			

			request.setCharacterEncoding("utf-8");
			erboard.setM_num(Integer.parseInt(multi.getParameter("m_num")));
			erboard.setM_name(multi.getParameter("m_name"));
			erboard.setMail(multi.getParameter("mail"));
			erboard.setAdditions(multi.getParameter("additions"));
			erboard.setCollege(multi.getParameter("college"));
			erboard.setMajor(multi.getParameter("major"));
			erboard.setDate1(multi.getParameter("date1"));
			erboard.setDate2(multi.getParameter("date2"));
			erboard.setCredit(multi.getParameter("credit"));
			erboard.setMillitary(multi.getParameter("millitary"));
			erboard.setM_dept(multi.getParameter("m_dept"));
			erboard.setM_class(multi.getParameter("m_class"));
			erboard.setM_date1(multi.getParameter("m_date1"));
			erboard.setM_date2(multi.getParameter("m_date2"));
			erboard.setAname(multi.getParameter("aname"));
			erboard.setAdate1(multi.getParameter("adate1"));
			erboard.setAdate2(multi.getParameter("adate2"));
			erboard.setEdate1(multi.getParameter("edate1"));
			erboard.setEname(multi.getParameter("ename"));
			erboard.setAcontent(multi.getParameter("acontent"));
			erboard.setEcontent(multi.getParameter("econtent"));
			erboard.setEjob(multi.getParameter("ejob"));
			erboard.setEdate2(multi.getParameter("edate2"));
			erboard.setTnumber(multi.getParameter("tnumber"));
			erboard.setCol(multi.getParameter("col"));
			erboard.setTname(multi.getParameter("tname"));
			erboard.setTscore(multi.getParameter("tscore"));
			erboard.setTdate(multi.getParameter("tdate"));
			erboard.setLdept(multi.getParameter("ldept"));
			erboard.setLname(multi.getParameter("lname"));
			erboard.setLdate(multi.getParameter("ldate"));
			erboard.setPrice(multi.getParameter("price"));
			erboard.setPcontent(multi.getParameter("pcontent"));
			erboard.setPdate(multi.getParameter("pdate"));
			erboard.setPdept(multi.getParameter("pdept"));
			erboard.setPname(multi.getParameter("pname"));
			erboard.setP_id(multi.getParameter("p_id"));
			
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
			
			if (result1 > 0 || result2 > 0 || result3 > 0 || result4 > 0 || result5 > 0) {
				bd.setM_divide(Integer.parseInt(multi.getParameter("m_num")));
			}
			
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
