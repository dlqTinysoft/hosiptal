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
	
	<link rel="stylesheet" type="text/css" href="img/css.css">

  </head>
  
  <body>
  <table width="800" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="img/117367.jpg" width="800" height="100"/></td>
  </tr>
  <tr><td class="tdmenu"><div id="menu">
  	<a href="admin/users.jsp?mark=register">�Һ���Ա����</a>
  	<a href="admin/users.jsp?mark=doctor">����ҽ������</a>
  	<a href="admin/users.jsp?mark=pharmacy">ҩ����Ա����</a>
  	<a href="admin/office.jsp">���ҹ���</a>
  	<a href="admin/medicine.jsp">ҩƷ����</a>
  	<a href="admin/register.jsp">�Һ���Ϣ����</a>
  	<a href="admin/cases.jsp">���˲�������</a>
  	<a href="admin/prescription.jsp">ȡҩ��Ϣ����</a>
  	<a href="admin/adminlist.jsp">ϵͳ�û�����</a>
  	<a href="RemoveServlet?mark=user">ע���˳�</a></div></td>
  </tr>
</table>
  </body>
</html>
