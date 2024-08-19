package semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.member.model.service.MemberService;
import semi.member.model.vo.Member;

/**
 * Servlet implementation class MyPageUpateController
 */
@WebServlet("/update.me")
public class MyPageUpateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageUpateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      	
		request.setCharacterEncoding("utf-8");
		
		String mId = request.getParameter("userId");
		String mNickname = request.getParameter("newNickName");
		String mPwd = request.getParameter("newPwd");
		String mPhone = request.getParameter("newPhone");
		String mEmail = request.getParameter("newEmail");
		
		Member m = new Member(mId,mNickname,mPwd,mPhone,mEmail);  
		
		Member result = new MemberService().updateMember(m);
		if(result == null) {
			
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", result);
			
			response.sendRedirect(request.getContextPath() + "/myPage.me");
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
