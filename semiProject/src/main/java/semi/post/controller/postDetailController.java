package semi.post.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.stream.events.Comment;

import semi.member.model.vo.Member;

import semi.post.model.service.PostService;
import semi.post.model.vo.Post;

/**
 * Servlet implementation class postDetailController
 */
@WebServlet("/postDetail.po")
public class postDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getmId();
		
		
		
		int result = new PostService().increaseCount(pno);
		
		if(result > 0) {
			
			Post p = new PostService().selectPost(pno);
		   boolean hasRecommended = new PostService().hasRecommended(pno, userId);
			
			request.setAttribute("p", p);
			request.setAttribute("hasRecommended", hasRecommended);
			request.getRequestDispatcher("views/post/postDetail.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
