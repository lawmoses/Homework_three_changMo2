package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;
import controller.CommandHandler;

public class UpdateFormAction implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		// TODO Auto-generated method stub
		String boardid = req.getParameter("boardid");
		  if (boardid==null) boardid = "1";
		  String pageNum = req.getParameter("pageNum");
			if (pageNum == null || pageNum == "") {
				pageNum = "1";	}
			
			
			  int num = Integer.parseInt(req.getParameter("num"));
			  
			      BoardDBBean dbPro = BoardDBBean.getInstance();
			      BoardDataBean
			      article =  dbPro.getArticle(num, boardid, "update");
			req.setAttribute("article", article);
	//주의!! 선생님 코드에 없음
		req.setAttribute("pageNum", pageNum);
		
		
		return "/view/updateForm.jsp";
	}

	
	
}
