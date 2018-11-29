package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.InsertUpdateDelBean;
import bean.SelectBean;

public class CasesServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CasesServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=gb2312");
		request.setCharacterEncoding("gb2312");
		
		String pathographyid = request.getParameter("pathographyid");
		String history = request.getParameter("history");
		String allergy = request.getParameter("allergy");
		String symptom = request.getParameter("symptom");
		String analyze = request.getParameter("analyze");
		HttpSession session = request.getSession();
		ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
		
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		String sql = "insert into cases(pathographyid,history,allergy,symptom,analyze,userid) values('"+pathographyid+"','"+history+"','"+allergy+"','"+symptom+"','"+analyze+"','"+userlogin.get(0)+"')";
		ib.insertANDupdateANDdel(sql);
		
		request.setAttribute("message","?????????");
		request.getRequestDispatcher("/users/cases.jsp?pathographyid=").forward(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
