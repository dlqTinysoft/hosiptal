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
            <td height="25" colspan="12" align="center" class="tabletd1">�Һ���Ϣ����</td>
          </tr>
          <tr class="tabletd2">
            <td height="25" align="center">���</td>
            <td height="25" align="center">��־��</td>
            <td height="25" align="center">��������</td>
            <td align="center">�Ա�</td>
            <td align="center">����</td>
            <td align="center">��ͥסַ</td>
            <td align="center">����ʷ</td>
            <td align="center">����ʷ</td>
            <td align="center">����֢״</td>
            <td align="center">�������</td>
            <td height="25" align="center">&nbsp;</td>
          </tr>
          <%
          ArrayList cases = array.getCases();
          for(int i = 0;i < cases.size();i++){
          	ArrayList alRow = (ArrayList)cases.get(i);
          	ArrayList invalid = array.getInvalid(alRow.get(1).toString());
          	ArrayList inRow = (ArrayList)invalid.get(0);
           %>
          <tr class="tabletd<%=i%2+1 %>">
            <td height="25" align="center"><%=i+1 %></td>
            <td height="25" align="center"><a href="admin/cases_show.jsp?id=<%=alRow.get(0) %>"><%=alRow.get(1) %></a></td>
            <td height="25" align="center"><%=inRow.get(2) %></td>
            <td align="center"><%=inRow.get(3) %></td>
            <td align="center"><%=inRow.get(4) %></td>
            <td align="center"><%=inRow.get(5) %></td>
            <td align="center"><%=alRow.get(2) %></td>
            <td align="center"><%=alRow.get(3) %></td>
            <td align="center"><%=alRow.get(4) %></td>
            <td align="center"><%=alRow.get(5) %></td>
            <td height="25" align="center"><a href="DelServlet?cases=<%=alRow.get(0) %>">ɾ��</a></td>
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
