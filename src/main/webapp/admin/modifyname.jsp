<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:include flush="true" page="/admin/top.jsp"/>
<%
ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
if(userlogin == null || userlogin.size() == 0){
	%><script>alert('您还没有登录!');window.navigate('../index.jsp');</script><%
}else{
if(userlogin.get(3) != null && !userlogin.get(3).equals("管理员")){
	%><script>alert('您的身份不对，请重新登录!');window.navigate('../index.jsp');</script><%
}else{
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<script language="JavaScript">
function check()
{
	var pattern = /^[a-zA-Z0-9_]+$/;
	if (document.form1.oldname.value == "" ) 
	{
		alert("请输入原用户名!");
		document.form1.oldname.focus();
		return false;
	}
	if (document.form1.oldname.value != "<%=userlogin.get(1) %>" ) 
	{
		alert("原用户名错误!");
		document.form1.oldname.focus();
		return false;
	}
	if (document.form1.newname.value == ""  )  
	{
		alert("请输入新用户名!");
		document.form1.newname.focus();
		return false;
	}
	if (document.form1.newname.value.length < 3 )  
	{
		alert("用户名长度最少3个字符!");
		document.form1.newname.focus();
		return false;
	}
	if (!pattern.test(document.form1.newname.value) )  
	{
		alert("用户名只能包含字母、数字!");
		document.form1.newname.focus();
		return false;
	}
	if (document.form1.repetition.value == ""  )  
	{
		alert("请输入重复新用户名!");
		document.form1.repetition.focus();
		return false;
	}
	if (document.form1.repetition.value != document.form1.newname.value  )  
	{
		alert("两次用户名不一致!");
		document.form1.repetition.focus();
		return false;
	}
}
</script>
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
        <table width="800" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="30" class="adminmenu" align="center"><a href="admin/modifypwd.jsp">修改密码</a>&nbsp;&nbsp;&nbsp;
				<a href="admin/modifyname.jsp">修改用户名</a>&nbsp;&nbsp;&nbsp;
				<a href="admin/addadmin.jsp">添加系统用户</a>&nbsp;&nbsp;&nbsp;
				<a href="admin/adminlist.jsp">系统用户管理</a></td>
          </tr>
        </table>
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="5"></td>
          </tr>
        </table>
		<form name="form1" method="post" action="ModifyAdminServlet?mark=username" onSubmit="return check()">
        <table width="60%" border="0" cellspacing="1" cellpadding="0" bgcolor="#999999">
          <tr>
            <td height="25" colspan="2" align="center" bgcolor="#DEF1E3">修改用户名</td>
		  </tr>
          <tr>
            <td width="46%" height="25" align="right" bgcolor="#DEF1E3">原用户名：</td>
            <td width="54%" height="25" bgcolor="#DEF1E3">&nbsp;&nbsp;<input type="text" name="oldname"></td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#DEF1E3">新用户名：</td>
            <td height="25" bgcolor="#DEF1E3">&nbsp;&nbsp;<input name="newname" type="text" maxlength="10"></td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#DEF1E3">重复新用户名：</td>
            <td height="25" bgcolor="#DEF1E3">&nbsp;&nbsp;<input type="text" name="repetition"></td>
          </tr>
          <tr>
            <td height="30" colspan="2" align="center" bgcolor="#DEF1E3"><input type="submit" value="提交数据" class="input"></td>
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
