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
  	<a href="users/index.jsp">首页</a>
  	<a href="users/teacher.jsp">教员信息</a>
  	<a href="users/student.jsp">学员信息</a>
  	<a href="users/search.jsp">信息搜索</a>
  	<a href="users/reg.jsp">注册会员</a>
  </tr>
</table>
</body>
</html>
