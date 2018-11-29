package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.InsertUpdateDelBean;

public class MedicineServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public MedicineServlet() {
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
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String spec = request.getParameter("spec");
		String factory = request.getParameter("factory");
		String price = request.getParameter("price");
		String caption = request.getParameter("caption");
		
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		String sql = "";
		String str = "";
		if(mark != null && mark.equals("add")){
			sql = "insert into medicine(name,spec,factory,price,caption) values('"+name+"','"+spec+"','"+factory+"','"+price+"','"+caption+"')";
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				request.setAttribute("message", "ҩƷ�����ظ���");
				str = "/admin/medicine_edit.jsp?mark="+mark;
			}else{
				request.setAttribute("message", "�����ɹ���");
				str = "/admin/medicine.jsp";
			}
		}
		if(mark != null && mark.equals("update")){
			sql = "update medicine set name='"+name+"',spec='"+spec+"',factory='"+factory+"',price='"+price+"',caption='"+caption+"' where id="+id;
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				request.setAttribute("message", "ҩƷ�����ظ���");
				str = "/admin/medicine_edit.jsp?mark="+mark+"&id="+id;
			}else{
				request.setAttribute("message", "�����ɹ���");
				str = "/admin/medicine_edit.jsp?mark="+mark+"&id="+id;
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
