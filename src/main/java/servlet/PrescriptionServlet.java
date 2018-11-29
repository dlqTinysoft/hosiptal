package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Validate;
import bean.AllBean;
import bean.InsertUpdateDelBean;

public class PrescriptionServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public PrescriptionServlet() {
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
		
		String medicine = request.getParameter("medicine");
		String sums = request.getParameter("sums");
		String pathographyid = request.getParameter("pathographyid");
		Validate v = new Validate();
		String str = "";
		
		AllBean ab = new AllBean();
		ArrayList al = ab.getMedicine(medicine);
		if(Integer.parseInt(sums) > Integer.parseInt(al.get(5).toString())){
			str = "/users/prescription.jsp";
			request.setAttribute("message","���������(���Ϊ"+al.get(5)+")��");
		}else{
			str = "/users/cases.jsp?pathographyid="+pathographyid;
			InsertUpdateDelBean ib = new InsertUpdateDelBean();
			String sql = "insert into prescription(pathographyid,medicineid,sums,times) values('"+pathographyid+"','"+medicine+"','"+sums+"','"+v.getSystemDate().substring(0,10)+"')";
			ib.insertANDupdateANDdel(sql);
			request.setAttribute("message","�����ɹ���");
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
