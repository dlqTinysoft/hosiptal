<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
if(userlogin != null || userlogin.size() != 0){
	%><script>alert('����û�е�¼!');window.navigate('../index.jsp');</script><%
}else{
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=path %>/img/css.css">
</head>
<script language="JavaScript">
function check()
{
	var pattern = /^[a-zA-Z0-9_]+$/;
	if (document.form2.oldpwd.value == "" ) 
	{
		alert("������ԭ����!");
		document.form2.oldpwd.focus();
		return false;
	}
	if (document.form2.oldpwd.value != "<%=userlogin.get(2) %>" ) 
	{
		alert("ԭ�������!");
		document.form2.oldpwd.focus();
		return false;
	}
	if (document.form2.newpwd.value == ""  )  
	{
		alert("������������!");
		document.form2.newpwd.focus();
		return false;
	}
	if (document.form2.newpwd.value.length < 3 )  
	{
		alert("���볤������3���ַ�!");
		document.form2.newpwd.focus();
		return false;
	}
	if (!pattern.test(document.form2.newpwd.value) )  
	{
		alert("����ֻ�ܰ�����ĸ������!");
		document.form2.newpwd.focus();
		return false;
	}
	if (document.form2.repetition.value == ""  )  
	{
		alert("�������ظ�������!");
		document.form2.repetition.focus();
		return false;
	}
	if (document.form2.repetition.value != document.form2.newpwd.value  )  
	{
		alert("�������벻һ��!");
		document.form2.repetition.focus();
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
        <td height="400" align="center" valign="top" class="border_left border_right border_bottom">
        <table width="50%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td height="5"></td>
		  </tr>
		</table>

        <form action="<%=path %>/ModifyUserServlet?mark=userpass" method="post" name="form2" onSubmit="return check()">
            <table width="50%" border="0" cellspacing="0" cellpadding="0" class="border">
              <tr>
                <td height="25" colspan="2" align="center" class="tabletd2">�޸�����</td>
			  </tr>
              <tr>
                <td width="42%" height="25" align="right" class="tabletd1">ԭ���룺</td>
                <td width="58%" height="25" class="tabletd1">&nbsp;<input type="password" name="oldpwd"></td>
              </tr>
              <tr>
                <td height="25" align="right" class="tabletd2">�����룺</td>
                <td height="25" class="tabletd2">&nbsp;<input type="password" name="newpwd"></td>
              </tr>
              <tr>
                <td height="25" align="right" class="tabletd1">�ظ������룺</td>
                <td height="25" class="tabletd1">&nbsp;<input type="password" name="repetition"></td>
              </tr>
			  <tr>
            	<td height="25" colspan="2" align="center" class="tabletd2"><input type="submit" value="�ύ" class="input"></td>
			  </tr>
            </table>
        </form>
    </td>
  </tr>
</table>
  </body>
  <jsp:include flush="true" page="/users/bottom.jsp"/>
</html>
<%} %>
