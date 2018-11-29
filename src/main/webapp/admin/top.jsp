<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>医院门诊管理信息系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="img/css.css">

  </head>
  
  <body>
  <table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="img/117367.jpg" width="800" height="100"/></td>
  </tr>
  <tr><td class="tdmenu"><div id="menu">
  	<a href="admin/users.jsp?mark=register">挂号人员管理</a>
  	<a href="admin/users.jsp?mark=doctor">门诊医生管理</a>
  	<a href="admin/users.jsp?mark=pharmacy">药局人员管理</a>
  	<a href="admin/office.jsp">科室管理</a>
  	<a href="admin/medicine.jsp">药品管理</a>
  	<a href="admin/register.jsp">挂号信息管理</a>
  	<a href="admin/cases.jsp">病人病例管理</a>
  	<a href="admin/prescription.jsp">取药信息管理</a>
  	<a href="admin/adminlist.jsp">系统用户管理</a>
  	<a href="RemoveServlet?mark=user">注销退出</a></div></td>
  </tr>
</table>
  </body>
</html>
