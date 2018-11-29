package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.InsertUpdateDelBean;
import bean.SelectBean;

public class RegisterServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RegisterServlet() {
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
		
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String address = request.getParameter("address");
		String office = request.getParameter("office");
		String type = request.getParameter("type");
		String price = request.getParameter("price");
		HttpSession session = request.getSession();
		ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
		
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		SelectBean sb = new SelectBean();
		String sql = "select count(*) as rows from invalid";
		String args[] = {"rows"};
		ArrayList al = sb.select(args, sql);
		if(al.get(0).equals("0")){
			sql = "insert into invalid(pathographyid,name,sex,age,address,office,type,price,userid) values('1000','"+name+"','"+sex+"','"+age+"','"+address+"','"+office+"','"+type+"','"+price+"','"+userlogin.get(0)+"')";
		}else{
			sql = "select max(pathographyid) as maxs from invalid";
			String args1[] = {"maxs"};
			ArrayList maxs = sb.select(args1, sql);
			sql = "insert into invalid(pathographyid,name,sex,age,address,office,type,price,userid) values('"+(Integer.parseInt(maxs.get(0).toString())+1)+"','"+name+"','"+sex+"','"+age+"','"+address+"','"+office+"','"+type+"','"+price+"','"+userlogin.get(0)+"')";
		}
		ib.insertANDupdateANDdel(sql);
		
		request.setAttribute("message","�����ɹ���");
		request.getRequestDispatcher("/users/register.jsp").forward(request, response);
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
