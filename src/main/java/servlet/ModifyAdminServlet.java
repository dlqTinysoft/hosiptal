package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.InsertUpdateDelBean;

public class ModifyAdminServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ModifyAdminServlet() {
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
		
		String newpwd = request.getParameter("newpwd");
		String newname = request.getParameter("newname");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		String sql = "";
		String str = "/index.jsp";
		
		HttpSession  session = request.getSession();
		ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
		
		if(mark != null && mark.equals("password")){
			sql = "update admin set pwd='"+newpwd+"' where id="+userlogin.get(0);
			ib.insertANDupdateANDdel(sql);
			session.removeAttribute("userlogin");
			request.setAttribute("message", "�����ɹ��������µ�¼��");
		}
		if(mark != null && mark.equals("username")){
			sql = "update admin set name='"+newname+"' where id="+userlogin.get(0);
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				str = "/admin/modifyname.jsp";
				request.setAttribute("message", "�û����ظ���");
			}else{
				request.setAttribute("message", "�����ɹ��������µ�¼��");
				session.removeAttribute("userlogin");
			}
		}
		if(mark != null && mark.equals("insert")){
			sql = "insert into admin(name,pwd) values('"+name+"','"+pwd+"')";
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				str = "/admin/adduser.jsp";
				request.setAttribute("message", "�û����ظ���");
			}else{
				request.setAttribute("message", "�����ɹ��������µ�¼��");
				session.removeAttribute("userlogin");
			}
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
