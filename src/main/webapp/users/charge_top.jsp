<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ҽԺ���������Ϣϵͳ</title>
    
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
  	<a href="users/charge.jsp">ҩ�ѵ�</a>
  	<a href="users/summarizing.jsp">���ۻ���</a>
  	<a href="users/summarizing1-10.jsp">����ǰʮ</a>
  	<a href="users/entry.jsp">ҩƷ���</a>
  	<a href="users/stock.jsp">������¼</a>
  	<a href="users/userpass.jsp" target="_blank">�޸�����</a>
  	<a href="RemoveServlet?mark=user">ע���˳�</a>
  </tr>
</table>
</body>
</html>
