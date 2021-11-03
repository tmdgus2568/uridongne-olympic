package review.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import review.model.ReviewInfoVO;
import review.model.ReviewListService;
import review.model.ReviewService;
import review.model.ReviewVO;

/**
 * Servlet implementation class ReviewServlet
 */
@WebServlet("/review/reviewinsert")
public class ReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReviewService ReviewService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = getServletContext().getRealPath(".");
		ReviewService = new ReviewService(path);
		
		// res_number 끌어오기

		// 예약 정보
		List<ReviewInfoVO> infoList = ReviewService.selectInfoReview();
		
		for (ReviewInfoVO list : infoList) {
			System.out.println(list);
		}
		request.setAttribute("infoList", infoList);
		
		// 입력폼 보여주기
		RequestDispatcher rd = request.getRequestDispatcher("reviewForm.jsp");
		rd.forward(request, response);
	}

	
	  @Override protected void doPost(HttpServletRequest request,
	  HttpServletResponse response) throws ServletException, IOException {
	  
	  //리뷰테이블에 입력하기
	  request.setCharacterEncoding("utf-8"); 
	  
	  ReviewVO review = makeReview(request);
	  String path = getServletContext().getRealPath("."); 
	  ReviewService service = new ReviewService(path);
	  int result = service.reviewInsert(review);
	  
	  request.setAttribute("message", result > 0? "입력성공" : "입력실패");
	  RequestDispatcher rd = request.getRequestDispatcher("reviewList.jsp");
	  rd.forward(request, response); 
			
	}
	  
	private ReviewVO makeReview(HttpServletRequest request) {		
		  
		//inset
		int res_number = Integer.parseInt(request.getParameter("res_number"));
		String[] review_star = request.getParameterValues("review_star");
		String review_content = request.getParameter("review_content");
		//review.setReview_photo(request.getParameter("review_photo"));
		
		ReviewVO review = new ReviewVO();
		review.setRes_number(res_number);
		review.setReview_star(Arrays.toString(review_star));
		review.setReview_content(review_content);
		return review;
	}
	
	
	

}
