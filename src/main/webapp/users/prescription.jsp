<%@ page language="java" import="java.util.*,util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/><jsp:include flush="true" page="/users/cases_top.jsp"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
if(userlogin == null || userlogin.size() == 0){
	%><script>alert('您还没有登录!');window.navigate('../index.jsp');</script><%
}else{
if(userlogin.get(3) != null && !userlogin.get(3).equals("医生")){
	%><script>alert('您的身份不对，请重新登录!');window.navigate('../index.jsp');</script><%
}else{
String pathographyid = request.getParameter("pathographyid");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script language="JavaScript">
function check()
{
	var pattern = /^[a-zA-Z0-9_]+$/;	
	var ints = /^[0-9_]+$/;
	if (document.form2.sums.value == "" ) 
	{
		alert("请输入数量!");
		document.form2.sums.focus();
		return false;
	}
	else if(!ints.test(document.form2.sums.value))
	{
		alert("数量只能包含数字!");
		document.form2.sums.focus();
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
    <td height="400" align="center" valign="top" class="border_left border_right border_bottom"><table width="50%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="5"></td>
        </tr>
      </table>
      <form action="PrescriptionServlet?pathographyid=<%=pathographyid %>" method="post" name="form2" onSubmit="return check()">
      	<table width="50%" border="0" cellspacing="0" cellpadding="0" class="border">
          <tr>
            <td height="25" colspan="2" align="center" class="tabletd2">处方</td>
          </tr>
		  <tr>
            <td height="25" align="right" class="tabletd1">药品名称：</td>
            <td height="25" class="tabletd1">&nbsp;<select name="medicine">
            <%
            ArrayList medicine = array.getMedicine();
            for(int i = 0;i < medicine.size();i++){
            	ArrayList alRow = (ArrayList)medicine.get(i);
             %>
            <option value="<%=alRow.get(0) %>"><%=alRow.get(1) %></option>
            <%} %>
            </select></td>
          </tr>          
          <tr>
            <td height="25" align="right" class="tabletd2">数量：</td>
            <td height="25" class="tabletd2">&nbsp;<input name="sums" type="text" size="37"></td>
          </tr>
		  <tr>
            <td height="25" colspan="2" align="center" class="tabletd2"><input type="submit" value="提交" class="input"></td>
          </tr>
        </table>
        </form></td>
  </tr>
</table>
</body>
<jsp:include flush="true" page="/users/bottom.jsp"/>
</html>
<%}} %>
