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
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/img/css.css">
	<script type="text/javascript" src="<%=path %>/img/calendar.js"></script>

  </head>  
  
  <body>
  <table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="img/117367.jpg" width="800" height="100"/></td>
  </tr>
  <tr><td class="tdmenu"><div id="menu">
  	<a href="users/charge.jsp">药费单</a>
  	<a href="users/summarizing.jsp">销售汇总</a>
  	<a href="users/summarizing1-10.jsp">销售前十</a>
  	<a href="users/entry.jsp">药品入库</a>
  	<a href="users/stock.jsp">出入库记录</a>
  	<a href="users/userpass.jsp" target="_blank">修改密码</a>
  	<a href="RemoveServlet?mark=user">注销退出</a>
  </tr>
</table>
</body>
</html>
