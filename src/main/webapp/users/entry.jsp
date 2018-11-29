<%@ page language="java" import="java.util.*,util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/><jsp:include flush="true" page="/users/charge_top.jsp"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
if(userlogin == null || userlogin.size() == 0){
	%><script>alert('您还没有登录!');window.navigate('../index.jsp');</script><%
}else{
if(userlogin.get(3) != null && !userlogin.get(3).equals("药局")){
	%><script>alert('您的身份不对，请重新登录!');window.navigate('../index.jsp');</script><%
}else{
Validate v = new Validate();
String pathographyid = request.getParameter("pathographyid");
ArrayList pre = array.getPrescription(pathographyid,v.getSystemDate().substring(0,10));
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
		alert("请输入入库数量!");
		document.form2.sums.focus();
		return false;
	}
	else if(!ints.test(document.form2.sums.value))
	{
		alert("入库数量只能包含数字!");
		document.form2.sums.focus();
		return false;
	}
	else 
	{
		form2.action="EntryServlet";
		form2.submit();
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
      <form action="RegisterServlet" method="post" name="form2">
      	<table border="0" cellspacing="1" cellpadding="5" bgcolor="#333333">
		  <tr>
		    <td colspan="2" align="center" bgcolor="#BBD7FD">药品入库</td>
		  </tr>
		  <tr>
		    <td bgcolor="#BBD7FD">药品名称：</td>
		    <td bgcolor="#BBD7FD">&nbsp;<select name="medicine">
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
		    <td bgcolor="#BBD7FD">入库数量：</td>
		    <td bgcolor="#BBD7FD">&nbsp;<input name="sums" type="text"></td>
	      </tr>
		  <tr>
            <td colspan="2" align="center" bgcolor="#BBD7FD"><input type="button" value="入库" onClick="check()"></td>
		  </tr>
        </table>
                      </form></td>
  </tr>
</table>
</body>
<jsp:include flush="true" page="/users/bottom.jsp"/>
</html>
<%}} %>
