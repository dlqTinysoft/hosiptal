<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");


String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>  
  <body>
  <%
    request.getRequestDispatcher("/admin/modifyname.jsp").forward(request,response);
     %>
</body>
</html>
<% %>