package review.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.ReviewService;
import review.model.ReviewVO;
import uridongne.util.DateUtil;

/**
 * Servlet implementation class ReviewServlet
 */
@WebServlet("/review/reviewinsert")
public class ReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//private ReviewService reviewService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//입력폼 보여주기
		RequestDispatcher rd = request.getRequestDispatcher("reviewForm.jsp");
		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//리뷰테이블에 입력하기
		request.setCharacterEncoding("utf-8");
		int res_number = Integer.parseInt(request.getParameter("res_number"));
		String[] review_star = request.getParameterValues("review_star");
		String review_content = request.getParameter("review_content");
		String review_photo = request.getParameter("review_photo");
		
		ReviewVO review = new ReviewVO();
		
		review.setRes_number(res_number);
		review.setReview_star(Arrays.toString(review_star));
		review.setReview_content(review_content);
		review.setReview_photo(review_photo);
		
		
		String path = getServletContext().getRealPath(".");
		ReviewService service = new ReviewService(path);
		int result = service.reviewInsert(review);
		
		request.setAttribute("insert", result);
		RequestDispatcher rd = request.getRequestDispatcher("reviewList.jsp");
		rd.forward(request, response);
	}
	
	
	/*
	 * private ReviewVO makeReview(HttpServletRequest request) { int review_num =
	 * Integer.parseInt(request.getParameter("review_num")); String review_content =
	 * request.getParameter("review_content"); int review_star =
	 * Integer.parseInt(request.getParameter("review_star")); Date review_date =
	 * DateUtil.convertToDate(request.getParameter("review_date"));
	 * 
	 * ReviewVO review = new ReviewVO(); review.setReview_num(review_num);
	 * review.setReview_content(review_content); review.setReview_star(review_star);
	 * review.setReview_date(review_date); return review; }
	 */
	

}
