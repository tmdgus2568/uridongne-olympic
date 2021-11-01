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
import matching.model.MatApplyVO;
import matching.model.MatCreateJoinVO;
import matching.model.MatCreateService;
import matching.model.MatCreateVO;

/**
 * Servlet implementation class ApplyServlet
 */
@WebServlet("/matching/apply")
public class ApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private MatApplyService applyService;
    private MatCreateService createService;
    
    

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String dbPath = getServletContext().getRealPath(".");
		createService = new MatCreateService(dbPath);
		
		MatCreateJoinVO createJoin = new MatCreateJoinVO();
		createJoin = createService.selectById(Integer.parseInt(request.getParameter("mat_id")));
		System.out.println(createJoin);
		
		request.setAttribute("createJoin", createJoin);
		
		RequestDispatcher rd = request.getRequestDispatcher("applyForm.jsp");
		
        rd.forward(request,response);
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
    // apply에 저장 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String dbPath = getServletContext().getRealPath(".");
		createService = new MatCreateService(dbPath);
		applyService = new MatApplyService(dbPath);
		
		MatApplyVO apply = new MatApplyVO();
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		
		// 방 id로 방 가져와서 저장 
		MatCreateJoinVO createJoin = new MatCreateJoinVO();
		
		System.out.println("param: "+request.getParameter("mat_id"));
		createJoin = createService.selectById(Integer.parseInt(request.getParameter("mat_id")));
		
		// apply 테이블에 저장 
		apply.setUser_id(session.getAttribute("test_id").toString());
		apply.setMat_id(Integer.parseInt(request.getParameter("mat_id")));
		apply.setTogether(Integer.parseInt(request.getParameter("together")));
		
		int result = applyService.insertApply(apply);
		
		if(result > 0) {
			
			response.sendRedirect("list?message=success");
		}
		else response.sendRedirect("list?message=failed");
		
	}

}
