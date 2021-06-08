package service;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Board;
import dao.BoardDao;

public class BupdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			
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
			
			int filedel = Integer.parseInt(multi.getParameter("filedel"));
			if(filedel == 0) {
				fileResult = 0;
			} else if(filedel == 1) {
				fileResult = 1;
			} else if(filedel == 2) {
				fileResult = 2;
			} 
			int b_type = Integer.parseInt(multi.getParameter("b_type"));
			String b_title = null;
			if(b_type == 0 || b_type == 1) { b_title = multi.getParameter("t_type") + multi.getParameter("b_title"); }
			else if (b_type == 2) { b_title = multi.getParameter("b_title"); }
			Board board = new Board();
			
			if(fileResult == 1) {
				board.setB_img(filename);
			}
			
			
			int pageNum = Integer.parseInt(multi.getParameter("pageNum"));
			board.setM_num(Integer.parseInt(multi.getParameter("m_num")));
			board.setM_nickname(multi.getParameter("m_nickname"));
			board.setB_title(b_title);
			board.setB_content(multi.getParameter("b_content"));
			board.setB_idx(Integer.parseInt(multi.getParameter("b_idx")));
			
			BoardDao bd = BoardDao.getInstance();
			
			int result = bd.update(board,fileResult);
			
			
			request.setAttribute("result", result);
			request.setAttribute("b_idx", board.getB_idx());
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "bupdatePro.jsp";
	}

}
