<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>医院门诊管理信息系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<style type="text/css">
<!--
.ld {
	font-family: "方正大标宋简体";
	color:#FFF;
	font-size: 24px;
	border: #CCC solid 1px;
	background-color: #323574;
}
.lk {
	font-size:9pt;
	border-bottom: #CCC solid 1px;
	border-left: #CCC solid 1px;
	background-color: #CDECED;
}
.lm {
	border-bottom: #CCC solid 1px;
	border-left: #CCC solid 1px;
	border-right: #CCC solid 1px;
	background-color: #CDECED;
}
.ln {
	border-bottom: #CCC solid 1px;
	border-left: #CCC solid 1px;
	border-right: #CCC solid 1px;
	background-color: #D7E9B4;
}
.input {	
	font-family: Arial, Helvetica, sans-serif;	
	font-size: 1em
	}
.submit {
	border:#039 solid 1px;
	background-color:#CCC;
	width: 50px;
	height: 25px;
	text-align: center;
	vertical-align: middle;
	padding-top:3px;
}
-->
</style>
<script language="JavaScript">
function login()
{	
	var pattern = /^[a-zA-Z0-9_]+$/;
	if (document.form1.name.value == "" ) 
	{
		alert("请输入用户名!");
		document.form1.name.focus();
		return false;
	}
	if (!pattern.test(document.form1.name.value) )  
	{
		alert("用户名只能包含字母、数字!");
		document.form1.name.focus();
		return false;
	}
	if (document.form1.pwd.value == ""  )  
	{
		alert("请输入密码!");
		document.form1.pwd.focus();
		return false;
	}
	if (!pattern.test(document.form1.pwd.value) )  
	{
		alert("密码只能包含字母、数字!");
		document.form1.pwd.focus();
		return false;
	}
}
function reg()
{	
	form1.action="users/reg.jsp";
	form1.submit();
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
  </head>
  
  <body>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td align="center" height="400" valign="middle">
      <form action="UserLoginServlet" method="post" name="form1" onSubmit="return login()">
      <table width="50%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <th height="70" colspan="2" class="ld" scope="col">医院门诊管理信息系统</th>
		  </tr>
          <tr>
            <th width="40%" height="30" align="right" scope="row" class="lk">用户名:</th>
            <td width="60%" height="30" class="lm">&nbsp;<input class="input" type="text" name="name"></td>
          </tr>
          <tr>
            <th width="40%" height="30" align="right" scope="row" class="lk">密&nbsp;&nbsp;码:</th>
            <td height="30" class="lm">&nbsp;<input class="input" type="password" name="pwd"></td>
          </tr>
          <tr>
            <th height="30" align="right" scope="row" class="lk">登录身份：</th>
            <td height="30" class="lm">&nbsp;<select name="status">
            <option value="挂号">挂号</option>
            <option value="门诊">门诊</option>
            <option value="药局">药局</option>
            <option value="管理员">管理员</option>
            </select></td>
          </tr>
          <tr>
            <th height="35" colspan="2" scope="row" class="ln"><input class="submit" type="submit" value="登录"></th>
         </tr>
        </table>
      </form>
      </td>
    </tr>
  </table>
</body>
</html>
