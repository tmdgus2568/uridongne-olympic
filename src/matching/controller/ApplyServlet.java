package matching.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import matching.model.Mat_applyService;
import matching.model.Mat_applyVO;
import matching.model.Mat_createService;
import matching.model.Mat_createVO;

/**
 * Servlet implementation class ApplyServlet
 */
@WebServlet("/matching/apply")
public class ApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Mat_applyService applyService = new Mat_applyService();
    private Mat_createService createService = new Mat_createService();
    
    

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		Mat_createVO create = new Mat_createVO();
		create = createService.selectById(Integer.parseInt(request.getParameter("mat_id")));
		System.out.println(create);
		
		request.setAttribute("create", create);
		
		RequestDispatcher rd = request.getRequestDispatcher("applyForm.jsp");
		
        rd.forward(request,response);
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
    // apply에 저장 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Mat_applyVO apply = new Mat_applyVO();
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		
		// 방 id로 방 가져와서 저장 
		Mat_createVO create = new Mat_createVO();
		
		System.out.println("param: "+request.getParameter("mat_id"));
		create = createService.selectById(Integer.parseInt(request.getParameter("mat_id")));
		
		// apply 테이블에 저장 
		apply.setUser_id(session.getAttribute("test_id").toString());
		apply.setMat_create(create);
		apply.setTogether(Integer.parseInt(request.getParameter("together")));
		
		int result = applyService.insertApply(apply);
		
		if(result > 0) response.sendRedirect("list?message=success");
		else response.sendRedirect("list?message=failed");
		
	}

}
