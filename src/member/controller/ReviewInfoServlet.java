package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberService;
import member.model.MemberVO;
import review.model.ReviewListVO;

/**
 * Servlet implementation class ReviewInfo
 */
@WebServlet("/member/reviewinfo")
public class ReviewInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String path = getServletContext().getRealPath(".");
		MemberService service = new MemberService(path);
		String user_id = member.getUser_id();
		List<ReviewListVO> reviewList = service.reviewInfo(user_id);
		request.setAttribute("reviewList", reviewList);

		System.out.println(user_id);
		for(ReviewListVO list : reviewList) {
			System.out.println(list.getUser_id());
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("reviewinfo.jsp");
		rd.forward(request, response);

	}

}
