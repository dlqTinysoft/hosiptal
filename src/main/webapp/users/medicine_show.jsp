<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/><jsp:include flush="true" page="/users/charge_top.jsp"/>
<%
ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
if(userlogin == null || userlogin.size() == 0){
	%>
<script>alert('����û�е�¼!');window.navigate('../index.jsp');</script>
<%
}else{
if(userlogin.get(3) != null && !userlogin.get(3).equals("ҩ��")){
	%>
<script>alert('������ݲ��ԣ������µ�¼!');window.navigate('../index.jsp');</script>
<%
}else{
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String id = request.getParameter("id");
String mark = request.getParameter("mark");
String str1 = "",str2 = "";
if(mark != null && mark.equals("add")){
	str1 = "���ҩƷ";
}
if(mark != null && mark.equals("update")){
	str1 = "�޸�ҩƷ��Ϣ";
}
if(mark != null && mark.equals("show")){
	str1 = "ҩƷ��ϸ��Ϣ";
	str2 = "readonly";
}
ArrayList medicine = array.getMedicine(id);
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
      <form name="form1" method="post" action="MedicineServlet?mark=<%=mark %>&id=<%=id %>" onSubmit="return check()">
        <table width="55%" border="0" cellspacing="1" cellpadding="10" bgcolor="#333333">
          <tr>
            <td colspan="2" align="center" bgcolor="#C5E8EF"><%=str1 %></td>
</tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">ҩƷ���ƣ�</td>
            <td bgcolor="#C5E8EF"><input type="text" name="name" size="60" value="<%=medicine != null && medicine.size() != 0?medicine.get(1):"" %>" <%=str2 %>></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">���</td>
            <td bgcolor="#C5E8EF"><input type="text" name="spec" size="60" value="<%=medicine != null && medicine.size() != 0?medicine.get(2):"" %>" <%=str2 %>></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">�������ң�</td>
            <td bgcolor="#C5E8EF"><input type="text" name="factory" size="60" value="<%=medicine != null && medicine.size() != 0?medicine.get(3):"" %>" <%=str2 %>></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">�۸�</td>
            <td bgcolor="#C5E8EF"><input type="text" name="price" size="57" value="<%=medicine != null && medicine.size() != 0?medicine.get(4):"" %>" <%=str2 %>>&nbsp;Ԫ</td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">˵����</td>
            <td bgcolor="#C5E8EF"><textarea name="caption" cols="45" rows="8" <%=str2 %>><%=medicine != null && medicine.size() != 0?medicine.get(7):"" %></textarea></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">�������</td>
            <td bgcolor="#C5E8EF"><input type="text" name="price" size="57" value="<%=medicine != null && medicine.size() != 0?medicine.get(5):"" %>" <%=str2 %>></textarea></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">����������</td>
            <td bgcolor="#C5E8EF"><input type="text" name="price" size="57" value="<%=medicine != null && medicine.size() != 0?medicine.get(6):"" %>" <%=str2 %>></textarea></td>
          </tr>
        </table>
        </form></td>
  </tr>
</table>
</body>
<jsp:include flush="true" page="/users/bottom.jsp"/>
</html>
<%}} %>
