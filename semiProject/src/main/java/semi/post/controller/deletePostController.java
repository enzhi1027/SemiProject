package semi.post.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.post.model.service.PostService;

/**
 * Servlet implementation class deletePostController
 */
@WebServlet("/deleteAd.po")
public class deletePostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deletePostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		
		HttpSession session = request.getSession();
		
		int result = new PostService().deletePost(postNo);
		
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 글이 삭제되었습니다.");
			
		}else {
			session.setAttribute("alertMsg", "글 삭제에 실패하였습니다.");
		}
			response.sendRedirect(request.getContextPath()+"/adminList.ad?cpage=1&pCpage=1");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
