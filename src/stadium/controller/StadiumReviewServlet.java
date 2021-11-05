package stadium.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stadium.model.StadiumListService;
import stadium.model.StadiumListVO;

/**
 * Servlet implementation class StadiumDetailServlet
 */
@WebServlet("/stadium/stadiumReview")
public class StadiumReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = getServletContext().getRealPath(".");
		StadiumListService stadiumlistService = new StadiumListService(path);
		String stadiumid = request.getParameter("id");
		List<StadiumListVO> stadiumreview = stadiumlistService.selectReview(stadiumid);
		
	    //System.out.println(stadiumid);
		request.setAttribute("stadium", stadiumreview);  
		RequestDispatcher rd = request.getRequestDispatcher("stadiumReview.jsp");  //jsp가 stadium에 담긴 정보를 가져와서 사용
		System.out.println(stadiumreview);
		rd.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
