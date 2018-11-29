<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
if(userlogin != null || userlogin.size() != 0){
	%><script>alert('您还没有登录!');window.navigate('../index.jsp');</script><%
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
		alert("请输入原密码!");
		document.form2.oldpwd.focus();
		return false;
	}
	if (document.form2.oldpwd.value != "<%=userlogin.get(2) %>" ) 
	{
		alert("原密码错误!");
		document.form2.oldpwd.focus();
		return false;
	}
	if (document.form2.newpwd.value == ""  )  
	{
		alert("请输入新密码!");
		document.form2.newpwd.focus();
		return false;
	}
	if (document.form2.newpwd.value.length < 3 )  
	{
		alert("密码长度最少3个字符!");
		document.form2.newpwd.focus();
		return false;
	}
	if (!pattern.test(document.form2.newpwd.value) )  
	{
		alert("密码只能包含字母、数字!");
		document.form2.newpwd.focus();
		return false;
	}
	if (document.form2.repetition.value == ""  )  
	{
		alert("请输入重复新密码!");
		document.form2.repetition.focus();
		return false;
	}
	if (document.form2.repetition.value != document.form2.newpwd.value  )  
	{
		alert("两次密码不一致!");
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
                <td height="25" colspan="2" align="center" class="tabletd2">修改密码</td>
			  </tr>
              <tr>
                <td width="42%" height="25" align="right" class="tabletd1">原密码：</td>
                <td width="58%" height="25" class="tabletd1">&nbsp;<input type="password" name="oldpwd"></td>
              </tr>
              <tr>
                <td height="25" align="right" class="tabletd2">新密码：</td>
                <td height="25" class="tabletd2">&nbsp;<input type="password" name="newpwd"></td>
              </tr>
              <tr>
                <td height="25" align="right" class="tabletd1">重复新密码：</td>
                <td height="25" class="tabletd1">&nbsp;<input type="password" name="repetition"></td>
              </tr>
			  <tr>
            	<td height="25" colspan="2" align="center" class="tabletd2"><input type="submit" value="提交" class="input"></td>
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
