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
import member.model.MemberVO;

/**
 * Servlet implementation class ApplyServlet
 */
@WebServlet("/matching/apply")
public class ApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private MatApplyService applyService;
    private MatCreateService createService;

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
//		MatCreateJoinVO createJoin = new MatCreateJoinVO();
//		
//		System.out.println("param: "+request.getParameter("mat_id"));
//		createJoin = createService.selectById(Integer.parseInt(request.getParameter("mat_id")));
		
		// apply 테이블에 저장 
		MemberVO member = (MemberVO)session.getAttribute("member"); 
		apply.setUser_id(member.getUser_id());
		apply.setMat_id(Integer.parseInt(request.getParameter("mat_id")));
		apply.setTogether(Integer.parseInt(request.getParameter("together")));
		
		int result = applyService.insertApply(apply);
//		System.out.println("result : " + result);
		
		RequestDispatcher rd;
		if(result > 0) {
			
			
			rd = request.getRequestDispatcher("confirm.jsp?page=apply&message=success");
		}
		else rd = request.getRequestDispatcher("confirm.jsp?page=apply&message=failed");
		
		rd.forward(request, response);
		
	}

}
