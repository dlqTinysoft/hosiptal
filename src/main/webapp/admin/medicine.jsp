<%@ page language="java" import="java.util.*,util.*" pageEncoding="gb2312"%>
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
<script language="JavaScript">
function check()
{
	var pattern = /^[a-zA-Z0-9_]+$/;	
	var ints = /^[0-9_]+$/;
	if (document.form1.name.value == "" ) 
	{
		alert("������ҩƷ����!");
		document.form1.name.focus();
		return false;
	}
	else 
	{
		form1.action="admin/medicine.jsp";
		form1.submit();
	}
}
</script>
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
          <table border="0" cellspacing="1" cellpadding="5" bgcolor="#333333">
              <tr>
                <td colspan="3" align="center" bgcolor="#AADBE3">ҩƷ����</td>
</tr>
              <tr>
                <td bgcolor="#AADBE3">��ҩƷ����������</td>
                <td bgcolor="#AADBE3"><input name="name" type="text"></td>
                <td bgcolor="#AADBE3"><input type="button" value="����" onclick="check()"></td>
              </tr>
            </table><br>

		  <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="25" colspan="8" align="center" class="tabletd1">ҩƷ����</td>
          </tr>
          <tr class="tabletd2">
            <td height="25" align="center">���</td>
            <td height="25" align="center">ҩƷ����</td>
            <td height="25" align="center">���</td>
            <td align="center">��������</td>
            <td align="center">�۸�</td>
            <td align="center">���</td>
            <td align="center">����</td>
            <td height="25" align="center">&nbsp;</td>
          </tr>
          <%
          ArrayList medicine = array.getMedicineAdmin();
          Validate v = new Validate();
          String name = v.getUnicode(request.getParameter("name"));
          if(name != null && !name.equals("")){
          	medicine = array.getMedicineSearch(name);
          }
          for(int i = 0;i < medicine.size();i++){
          	ArrayList alRow = (ArrayList)medicine.get(i);
           %>
          <tr class="tabletd<%=i%2+1 %>">
            <td height="25" align="center"><%=i+1 %></td>
            <td height="25" align="center"><a href="admin/medicine_edit.jsp?mark=show&id=<%=alRow.get(0) %>"><%=alRow.get(1) %></a></td>
            <td height="25" align="center"><%=alRow.get(2) %></td>
            <td align="center"><%=alRow.get(3) %></td>
            <td align="center"><%=alRow.get(4) %></td>
            <td align="center"><%=alRow.get(5) %></td>
            <td align="center"><%=alRow.get(6) %></td>
            <td height="25" align="center"><a href="admin/medicine_edit.jsp?mark=update&id=<%=alRow.get(0) %>">�޸�</a>&nbsp;<a href="DelServlet?medicine=<%=alRow.get(0) %>">ɾ��</a></td>
          </tr>
          <%} %>
          <tr>
            <td height="25" colspan="8" align="center"><a href="admin/medicine_edit.jsp?mark=add">���ҩƷ</a></td>
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
