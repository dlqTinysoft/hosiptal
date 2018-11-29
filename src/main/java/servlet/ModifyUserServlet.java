package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.InsertUpdateDelBean;

public class ModifyUserServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ModifyUserServlet() {
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
		
		String mark = request.getParameter("mark");
		String str = "";
		
		String newpwd = request.getParameter("newpwd");
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		HttpSession session = request.getSession();
		ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
		
		if(mark != null && mark.equals("userpass")){
			str = "/users/userpass.jsp";
			String sql = "update users set pwd='"+newpwd+"' where id="+userlogin.get(0);
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "�����޸ĳɹ���");
			userlogin.set(2, newpwd);
		}
		if(mark != null && mark.equals("usertext")){
			String realname = request.getParameter("realname");
			String sex = request.getParameter("sex");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			str = "/users/usertext.jsp";
			String sql = "update users set realname='"+realname+"',sex='"+sex+"',phone='"+phone+"',address='"+address+"' where id="+userlogin.get(0);
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "�����޸ĳɹ���");
		}
		
		request.getRequestDispatcher(str).forward(request, response);
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
