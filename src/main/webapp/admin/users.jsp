<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<jsp:include flush="true" page="/admin/top.jsp"/>
<%
ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
if(userlogin == null || userlogin.size() == 0){
	%><script>alert('����û�е�¼!');window.navigate('../index.jsp');</script><%
}else{
if(userlogin.get(3) != null && !userlogin.get(3).equals("����Ա")){
	%><script>alert('������ݲ��ԣ������µ�¼!');window.navigate('../index.jsp');</script><%
}else{
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String name = "";
String mark = request.getParameter("mark");
if(mark != null && mark.equals("register")){
	name = "�Һ���Ա";
}
if(mark != null && mark.equals("doctor")){
	name = "����ҽ��";
}
if(mark != null && mark.equals("pharmacy")){
	name = "ҩ����Ա";
}
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
<table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="5"></td>
          </tr>
        </table>
		<form name="form1" method="post" action="">
		  <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="25" colspan="<%=mark != null && mark.equals("doctor")?"6":"4" %>" align="center" class="tabletd1"><%=name %>����</td>
          </tr>
          <tr class="tabletd2">
            <td height="25" align="center">���</td>
            <td height="25" align="center">�û�ID</td>
            <td height="25" align="center">�û���</td>
            <%
            if(mark != null && mark.equals("doctor")){
             %>
            <td height="25" align="center">��ʵ����</td>
            <td height="25" align="center">��������</td>
            <%} %>
            <td height="25" align="center">&nbsp;</td>
          </tr>
          <%
          ArrayList user = null;
          if(mark != null && mark.equals("register")){
			user = array.getUsers("�Һ�");
		  }
		  if(mark != null && mark.equals("doctor")){
			user = array.getUsers("ҽ��");
		  }
		  if(mark != null && mark.equals("pharmacy")){
			user = array.getUsers("ҩ��");
		  }
          for(int i = 0;i < user.size();i++){
          	ArrayList alRow = (ArrayList)user.get(i);
           %>
          <tr class="tabletd<%=i%2+1 %>">
            <td height="25" align="center"><%=i+1 %></td>
            <td height="25" align="center"><%=alRow.get(0) %></td>
            <td height="25" align="center"><%=alRow.get(1) %></td>
            <%
            if(mark != null && mark.equals("doctor")){
             %>
            <td height="25" align="center"><%=alRow.get(3) %></td>
            <td height="25" align="center"><%=alRow.get(4) %></td>
            <%} %>
            <td height="25" align="center">
            <%
            if(mark != null && mark.equals("doctor")){
             %>
            <a href="admin/doctor_edit.jsp?id=<%=alRow.get(0) %>">�޸�</a>&nbsp;&nbsp;
            <%} %>
            <a href="DelServlet?mark=<%=mark %>&users=<%=alRow.get(0) %>">ɾ��</a></td>
          </tr>
          <%} %>
          <tr>
            <td height="25" colspan="<%=mark != null && mark.equals("doctor")?"6":"4" %>" align="center"><a href="admin/users_edit.jsp?mark=<%=mark %>">���<%=name %></a></td>
          </tr>
        </table>
          </form>
        </td>
  </tr>
</table>
  </body>
  <jsp:include flush="true" page="/admin/bottom.jsp"/>
</html>
<%}} %>
