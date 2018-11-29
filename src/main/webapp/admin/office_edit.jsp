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
<script type="text/javascript">
function check()
{
	if(form1.name.value == "")
	{
		alert("请输入科室名称!");
		document.form1.name.focus();
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
      <form name="form1" method="post" action="OfficeServlet" onSubmit="return check()">
        <table width="50%" border="0" cellspacing="1" cellpadding="10" bgcolor="#333333">
          <tr>
            <td colspan="2" align="center" bgcolor="#C5E8EF">添加科室</td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">科室名称：</td>
            <td bgcolor="#C5E8EF"><input type="text" name="name"></td>
          </tr>
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
