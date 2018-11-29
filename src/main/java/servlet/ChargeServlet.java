package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Validate;
import bean.AllBean;
import bean.InsertUpdateDelBean;

public class ChargeServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ChargeServlet() {
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
		HttpSession session = request.getSession();
		ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
		Validate v = new Validate();
		
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		String sql = "update prescription set times1='"+v.getSystemDate().substring(0,16)+"',userid="+userlogin.get(0)+" where pathographyid='"+pathographyid+"' and times='"+v.getSystemDate().substring(0,10)+"'";
		ib.insertANDupdateANDdel(sql);
		AllBean ab = new AllBean();
		ArrayList al = ab.getPrescription(pathographyid, v.getSystemDate().substring(0,10));
		for(int i = 0;i < al.size();i++){
			ArrayList alRow = (ArrayList)al.get(i);
			sql = "update medicine set stock=stock-"+alRow.get(3)+",sums=sums+"+alRow.get(3)+" where id="+alRow.get(2);
			ib.insertANDupdateANDdel(sql);
		}
		
		request.setAttribute("message","�����ɹ���");
		request.getRequestDispatcher("/users/charge.jsp?pathographyid=").forward(request, response);
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
