<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/><jsp:include flush="true" page="/admin/top.jsp"/>
<%
ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
if(userlogin == null || userlogin.size() == 0){
	%>
<script>alert('����û�е�¼!');window.navigate('../index.jsp');</script>
<%
}else{
if(userlogin.get(3) != null && !userlogin.get(3).equals("����Ա")){
	%>
<script>alert('������ݲ��ԣ������µ�¼!');window.navigate('../index.jsp');</script>
<%
}else{
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String id = request.getParameter("id");
ArrayList invalid = array.getInvalidAdmin(id);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script language="JavaScript">
function check()
{
	var pattern = /^(([1-9]\d*)|0)(\.\d{1,2})?$/;
	
	if (document.form1.name.value == "" ) 
	{
		alert("������ҩƷ����!");
		document.form1.name.focus();
		return false;
	}
	if (document.form1.spec.value == "" ) 
	{
		alert("��������!");
		document.form1.spec.focus();
		return false;
	}
	if (document.form1.factory.value == "" ) 
	{
		alert("��������������!");
		document.form1.factory.focus();
		return false;
	}
	if (document.form1.price.value == "" ) 
	{
		alert("������۸�!");
		document.form1.price.focus();
		return false;
	}
	if (!pattern.test(document.form1.price.value) )  
	{
		alert("�۸��ʽ����(��ʽΪ20.25)!");
		document.form1.price.focus();
		return false;
	}
	if (document.form1.caption.value == "" ) 
	{
		alert("������˵��!");
		document.form1.caption.focus();
		return false;
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
    <td class="border_left border_right border_bottom" height="400" valign="top" align="center"><table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="5"></td>
        </tr>
      </table>
      <form name="form1" method="post" action="" onSubmit="return check()">
        <table width="55%" border="0" cellspacing="1" cellpadding="10" bgcolor="#333333">
          <tr>
            <td colspan="2" align="center" bgcolor="#C5E8EF">�Һŵ�����</td>
</tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">��־�ţ�</td>
            <td bgcolor="#C5E8EF"><%=invalid.get(1) %></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">����������</td>
            <td bgcolor="#C5E8EF"><%=invalid.get(2) %></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">�Ա�</td>
            <td bgcolor="#C5E8EF"><%=invalid.get(3) %></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">���䣺</td>
            <td bgcolor="#C5E8EF"><%=invalid.get(4) %></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">��ͥסַ��</td>
            <td bgcolor="#C5E8EF"><%=invalid.get(5) %></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">���ҿ��ң�</td>
            <td bgcolor="#C5E8EF"><%=invalid.get(6) %></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">�Һ����ͣ�</td>
            <td bgcolor="#C5E8EF"><%=invalid.get(7) %></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">�۸�</td>
            <td bgcolor="#C5E8EF"><%=invalid.get(8) %>Ԫ</td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">�Һ�Ա��</td>
            <td bgcolor="#C5E8EF"><%=invalid.get(9) %></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">ʱ�䣺</td>
            <td bgcolor="#C5E8EF"><%=invalid.get(10).toString().substring(0,16) %></td>
          </tr>
        </table>
            </form></td>
  </tr>
</table>
</body>
<jsp:include flush="true" page="/admin/bottom.jsp"/>
</html>
<%}} %>
