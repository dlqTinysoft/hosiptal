<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AdminListBean"/>
<jsp:include flush="true" page="/admin/top.jsp"/>
<%
ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
if(userlogin == null || userlogin.size() == 0){
	%><script>alert('您还没有登录!');window.navigate('../index.jsp');</script><%
}else{
if(userlogin.get(3) != null && !userlogin.get(3).equals("管理员")){
	%><script>alert('您的身份不对，请重新登录!');window.navigate('../index.jsp');</script><%
}else{
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%>  
  <body>
    <table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="border_left border_right border_bottom" height="400" valign="top" align="center">
        <table width="800" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="30" class="adminmenu" align="center"><a href="admin/modifypwd.jsp">修改密码</a>&nbsp;&nbsp;&nbsp;
				<a href="admin/modifyname.jsp">修改用户名</a>&nbsp;&nbsp;&nbsp;
				<a href="admin/addadmin.jsp">添加系统用户</a>&nbsp;&nbsp;&nbsp;
				<a href="admin/adminlist.jsp">系统用户管理</a></td>
          </tr>
        </table>
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="5"></td>
          </tr>
        </table>
		<form name="form1" method="post" action="ModifyAdminServlet?mark=username" onSubmit="return check()">
        <table width="98%" border="0" cellspacing="0" cellpadding="0" bgcolor="#999999">
          <tr class="tabletop">
            <td height="25" colspan="4" align="center">系统用户管理</td>
		  </tr>
          <tr class="tablemenu">
            <td height="20" align="center">序号</td>
            <td height="20" align="center">用户ID</td>
            <td height="20" align="center">用户名</td>
            <td height="20" align="center"></td>
          </tr>
          <%
          ArrayList admin = array.getAdminList();
          for(int i = 0;i < admin.size();i++){
          	ArrayList alRow = (ArrayList)admin.get(i);
           %>
          <tr class="tabletd<%=i%2+1 %>">
            <td height="25" align="center"><%=i+1 %></td>
            <td height="25" align="center"><%=alRow.get(0) %></td>
            <td height="25" align="center"><%=alRow.get(1) %></td>
            <td height="25" align="center"><a href="DelServlet?adminid=<%=alRow.get(0) %>">删除</a></td>
          </tr>
          <%} %>
		</table>
      </form>
        </td>
  </tr>
</table>
  </body>
  <jsp:include flush="true" page="/admin/bottom.jsp"/>
</html>
<%}} %>
