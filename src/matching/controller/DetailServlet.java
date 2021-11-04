package matching.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import matching.model.MatApplyService;
import matching.model.MatCreateJoinVO;
import matching.model.MatCreateService;
import matching.model.MatCreateVO;

/**
 * Servlet implementation class DetailServlet
 */
@WebServlet("/matching/detail")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MatCreateService createService;
       
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
		String dbPath = getServletContext().getRealPath(".");
		createService = new MatCreateService(dbPath);
		
		// res_number값을 가지고 상세 정보를 보여준다.
		// 작성자 아이디, 위치, 인원 현황? 등등...
		MatCreateJoinVO createJoin = new MatCreateJoinVO();
		createJoin = createService.selectById(Integer.parseInt(request.getParameter("mat_id")));
		System.out.println(createJoin);
		
		request.setAttribute("createJoin", createJoin);
		
		// 임시로 세션에 아이디와 비밀번호 저장 
        HttpSession session = request.getSession();
        session.setAttribute("test_id", "33");
		
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
