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

public class BwriteProAction  implements CommandProcess {

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
			
			
			
			
			
			//b_type을 넘겨주기위해 추가해주었습니다. 추가한 이유는 해당 게시판에서 글을쓰고나면 해당 게시판으로 이동하기위해서입니다.
			int b_type = Integer.parseInt(multi.getParameter("b_type"));
			String b_title = null;
			if(b_type == 0 || b_type == 1) { b_title = multi.getParameter("t_type") + multi.getParameter("b_title"); }
			else if (b_type == 2) { b_title = multi.getParameter("b_title"); }
			
			Board board = new Board();
			
			if(fileResult == 1) {
				System.out.println("널아님");
				board.setB_img(filename);
			}
			
			board.setM_num(Integer.parseInt(multi.getParameter("m_num")));
			board.setM_nickname(multi.getParameter("m_nickname"));
			board.setB_title(b_title);
			board.setB_content(multi.getParameter("b_content"));
			board.setB_type(b_type);
			
			BoardDao bd = BoardDao.getInstance();
			
			int result = bd.write(board);
			
			request.setAttribute("result", result);
			//b_type 넘겨주는것을 추가했습니다.
			request.setAttribute("b_type", b_type);
			
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "bwritePro.jsp";
	}

}
