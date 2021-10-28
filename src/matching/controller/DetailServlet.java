package matching.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import matching.model.Mat_createService;
import matching.model.Mat_createVO;

/**
 * Servlet implementation class DetailServlet
 */
@WebServlet("/matching/detail")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Mat_createService createService = new Mat_createService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		getData(request, response);
		
		// res_number값을 가지고 상세 정보를 보여준다.
		// 작성자 아이디, 위치, 인원 현황? 등등...
		Mat_createVO create = new Mat_createVO();
		create = createService.selectById(Integer.parseInt(request.getParameter("mat_id")));
		System.out.println(create);
		
		request.setAttribute("create", create);
		
		// 임시로 세션에 아이디와 비밀번호 저장 
        HttpSession session = request.getSession();
        session.setAttribute("test_id", "bb");
		
		RequestDispatcher rd = request.getRequestDispatcher("detail.jsp");
        rd.forward(request,response);
        
    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setAttribute("create", request.getAttribute("create"));
		
		RequestDispatcher rd = request.getRequestDispatcher("list.jsp");
        rd.forward(request,response);
	}
	
    private void getData(HttpServletRequest request, HttpServletResponse response) {
        String mat_id = request.getParameter("mat_id");
     
        System.out.println("mat_id = " + mat_id);

    }

}
