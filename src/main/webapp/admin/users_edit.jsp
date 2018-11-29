<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/><jsp:include flush="true" page="/admin/top.jsp"/>
<%
ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
if(userlogin == null || userlogin.size() == 0){
	%>
<script>alert('您还没有登录!');window.navigate('../index.jsp');</script>
<%
}else{
if(userlogin.get(3) != null && !userlogin.get(3).equals("管理员")){
	%>
<script>alert('您的身份不对，请重新登录!');window.navigate('../index.jsp');</script>
<%
}else{
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String name = "";
String mark = request.getParameter("mark");
String id = request.getParameter("id");
if(mark != null && mark.equals("register")){
	name = "挂号人员";
}
if(mark != null && mark.equals("doctor")){
	name = "门诊医生";
}
if(mark != null && mark.equals("pharmacy")){
	name = "药局人员";
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script language="JavaScript">
function check()
{
	var pattern = /^[a-zA-Z0-9_]+$/;
	if (document.form1.name.value == "" ) 
	{
		alert("请输入用户名!");
		document.form1.name.focus();
		return false;
	}
	if (document.form1.name.value.length < 3 )  
	{
		alert("用户名长度最少3个字符!");
		document.form1.name.focus();
		return false;
	}
	if (!pattern.test(document.form1.name.value) )  
	{
		alert("用户名只能包含字母、数字!");
		document.form1.name.focus();
		return false;
	}
	if (document.form1.pwd.value == "" ) 
	{
		alert("请输入密码!");
		document.form1.pwd.focus();
		return false;
	}
	if (document.form1.pwd.value.length < 3 )  
	{
		alert("密码长度最少3个字符!");
		document.form1.pwd.focus();
		return false;
	}
	if (!pattern.test(document.form1.pwd.value) )  
	{
		alert("密码只能包含字母、数字!");
		document.form1.pwd.focus();
		return false;
	}
	<%
     if(mark != null && mark.equals("doctor")){
     %>
	if (document.form1.realname.value == "" ) 
	{
		alert("请输入真实姓名!");
		document.form1.realname.focus();
		return false;
	}
	if (document.form1.office.value == "" ) 
	{
		alert("请先添加科室后在添加医生!");
		document.form1.office.focus();
		return false;
	}
	<%}%>
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
      <form name="form1" method="post" action="UserServlet?mark=<%=mark %>" onSubmit="return check()">
        <table width="50%" border="0" cellspacing="1" cellpadding="10" bgcolor="#333333">
          <tr>
            <td colspan="2" align="center" bgcolor="#C5E8EF">添加<%=name %></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">用户名：</td>
            <td bgcolor="#C5E8EF"><input type="text" name="name"></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">密码：</td>
            <td bgcolor="#C5E8EF"><input type="password" name="pwd"></td>
          </tr>
          <%
            if(mark != null && mark.equals("doctor")){
             %>
          <tr>
            <td align="right" bgcolor="#C5E8EF">真实姓名：</td>
            <td bgcolor="#C5E8EF"><input type="text" name="realname"></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">所属科室：</td>
            <td bgcolor="#C5E8EF"><select name="office">
            <%
            ArrayList office = array.getOffice();
            for(int i = 0;i < office.size();i++){
            	ArrayList alRow = (ArrayList)office.get(i);
             %>
            <option value="<%=alRow.get(1) %>"><%=alRow.get(1) %></option>
            <%} %>
            </select></td>
          </tr>
          <%} %>
          <tr>
            <td colspan="2" align="center" bgcolor="#C5E8EF"><input type="submit" value="提交"></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>
<jsp:include flush="true" page="/admin/bottom.jsp"/>
</html>
<%}} %>
