package review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberVO;
import review.model.ReviewInfoVO;
import review.model.ReviewListService;
import review.model.ReviewListVO;



/**
 * Servlet implementation class ReviewListServlet
 */
@WebServlet("/review/list")
public class ReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReviewListService reviewlistService;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = getServletContext().getRealPath(".");
		reviewlistService = new ReviewListService(path);
		
		
		//검색 파라미터
		String option_param = "none";
		String search_param = "";
		
		if(request.getParameter("option")!=null) 
			option_param = request.getParameter("option");
		if(request.getParameter("search")!=null) 
			search_param = request.getParameter("search");
		
		List<ReviewListVO> reviewList = null;
		
		//아무것도 선택하지 않았을 때
		if(!search_param.equals("")) 
			reviewList = reviewlistService.selectSearch(option_param, search_param);
		
		else reviewList = reviewlistService.selectAllReview();
		
		for(ReviewListVO list : reviewList) {
			System.out.println(list);
		}
		
		HttpSession session = request.getSession();
	    MemberVO member =(MemberVO) session.getAttribute("member");
		/*
		 * if(member == null) { member = new MemberVO(); member.setUser_id("555"); }
		 */
		List<ReviewInfoVO> reviewlistposs = reviewlistService.selectPossibleReview(member.getUser_id());
		
		for(ReviewInfoVO list : reviewlistposs) {
			System.out.println(list);
		}
		request.setAttribute("reviewList", reviewList);//"사용할변수", 조회된 내용 전부 저장
		request.setAttribute("reviewPosslist", reviewlistposs);
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
