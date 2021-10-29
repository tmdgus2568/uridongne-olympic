package review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.ReviewService;
import review.model.ReviewVO;

/**
 * Servlet implementation class ReviewListServlet
 */
@WebServlet("/review/list")
public class ReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewService reviewService = new ReviewService();
		List<ReviewVO> reviewList = reviewService.selectAllReview();
		
		//리뷰리스트 출력 코드 추가!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
		request.setAttribute("reviewlist", reviewService.selectAllReview());//"사용할변수", 조회된 내용 전부 저장		
		RequestDispatcher rd = request.getRequestDispatcher("reviewlist.jsp");//보여줄페이지
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
