package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.AllBean;
import bean.InsertUpdateDelBean;

public class DelServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DelServlet() {
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
		
		String sql = "";
		String str = "";
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		HttpSession session = request.getSession();
		ArrayList adminlogin = (ArrayList)session.getAttribute("adminlogin");
		AllBean ab = new AllBean();
		
		String adminid = request.getParameter("adminid");
		String office = request.getParameter("office");
		String users = request.getParameter("users");
		String mark = request.getParameter("mark");
		String medicine = request.getParameter("medicine");
		String invalid = request.getParameter("invalid");
		String cases = request.getParameter("cases");
		String prescription = request.getParameter("prescription");
		
		if(adminid != null && !adminid.equals("")){
			str = "/admin/adminlist.jsp";
			sql = "delete from admin where id="+adminid;
			if(adminid.equals("1")){
				request.setAttribute("message", "��ʼϵͳ����Ա����ɾ����");
			}else{
				ib.insertANDupdateANDdel(sql);
				request.setAttribute("message", "�����ɹ���");
			}
		}
		
		if(office != null && !office.equals("")){
			str = "/admin/office.jsp";
			sql = "delete from office where id="+office;
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "�����ɹ���");
		}
		
		if(users != null && !users.equals("")){
			
			str = "/admin/users.jsp?mark="+mark;
			sql = "delete from users where id="+users;
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "�����ɹ���");
		}
		
		if(medicine != null && !medicine.equals("")){
			
			str = "/admin/medicine.jsp";
			sql = "update medicine set flag=1 where id="+medicine;
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "�����ɹ���");
		}
		
		if(invalid != null && !invalid.equals("")){
			
			str = "/admin/register.jsp";
			sql = "update invalid set flag=1 where id="+invalid;
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "�����ɹ���");
		}
		
		if(cases != null && !cases.equals("")){
			
			str = "/admin/cases.jsp";
			sql = "delete from cases where id="+cases;
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "�����ɹ���");
		}
		
		if(prescription != null && !prescription.equals("")){
			
			str = "/admin/prescription.jsp";
			sql = "delete from prescription where id="+prescription;
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message", "�����ɹ���");
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(str);
        rd.forward(request,response);
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
