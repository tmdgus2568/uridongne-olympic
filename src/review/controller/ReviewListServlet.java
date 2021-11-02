package review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import member.model.MemberService;
import review.model.ReviewVO;
import review.model.ReviewListVO;
import review.model.ReviewService;


/**
 * Servlet implementation class ReviewListServlet
 */
@WebServlet("/review/list")
public class ReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReviewService reviewService;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = getServletContext().getRealPath(".");
		reviewService = new ReviewService(path);
		List<ReviewListVO> reviewList = reviewService.selectAllReview();
		
		
		for(ReviewListVO list : reviewList) {
			System.out.println(list);
		}
		
		
		request.setAttribute("reviewList", reviewList);//"사용할변수", 조회된 내용 전부 저장		
		RequestDispatcher rd = request.getRequestDispatcher("reviewList.jsp");//보여줄페이지
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
