package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.InsertUpdateDelBean;

public class UserServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserServlet() {
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
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String realname = request.getParameter("realname");
		String office = request.getParameter("office");
				
		String status = "";
		if(mark != null && mark.equals("register")){
			status = "�Һ�";
		}
		if(mark != null && mark.equals("doctor")){
			status = "ҽ��";
		}
		if(mark != null && mark.equals("pharmacy")){
			status = "ҩ��";
		}
		
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		String sql = "insert into users(name,pwd,status) values('"+name+"','"+pwd+"','"+status+"')";
		if(mark != null && mark.equals("doctor")){
			sql = "insert into users(name,pwd,realname,office,status) values('"+name+"','"+pwd+"','"+realname+"','"+office+"','"+status+"')";
		}
		
		String str = "";
		int flag = ib.insertANDupdateANDdel(sql);		
		if(flag == -1){
			str = "/admin/users_edit.jsp?mark="+mark;
			request.setAttribute("message", "�û����ظ���");
		}else{
			str = "/admin/users.jsp?mark="+mark;
			request.setAttribute("message", "�����ɹ���");
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
