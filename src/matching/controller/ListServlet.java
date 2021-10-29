package matching.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import matching.model.Mat_createService;
import matching.model.Mat_createVO;

/**
 * Servlet implementation class ListServlet
 */
@WebServlet("/matching/list")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Mat_createService createService ;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String dbPath = getServletContext().getRealPath(".")+"/WEB-INF/Wallet_matching";
		System.out.println("dbPath: "+dbPath);
		
		createService = new Mat_createService(dbPath);
		
		List<Mat_createVO> createList = createService.selectAll();
		
		
		for(Mat_createVO item : createList) {
			System.out.println(item);
		}
		
		// 실패했으면 createList == null 
		request.setAttribute("createList", createList);
		RequestDispatcher rd = request.getRequestDispatcher("list.jsp");
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
