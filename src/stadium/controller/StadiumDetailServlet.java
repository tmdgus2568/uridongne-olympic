package stadium.controller;

import java.io.IOException;

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
@WebServlet("/stadium/stadiumDetail")
public class StadiumDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = getServletContext().getRealPath(".");
		StadiumListService stadiumlistService = new StadiumListService(path);
		String stadiumid = request.getParameter("id");
		StadiumListVO stadiumDetail = stadiumlistService.selectDetail(stadiumid);
		System.out.println(stadiumid);
		request.setAttribute("stadium", stadiumDetail);  //db데이터를 저장
		RequestDispatcher rd = request.getRequestDispatcher("stadiumDetail.jsp");  //jsp가 stadiumList에 담긴 정보를 가져와서 사용
		rd.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
