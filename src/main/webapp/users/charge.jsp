<%@ page language="java" import="java.util.*,util.*" pageEncoding="gb2312"%>
<%--<jsp:useBean id="array" scope="page" class="bean.AllBean"/><jsp:include flush="true" page="/users/charge_top.jsp"/>--%>
<%--<%
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
//ArrayList pre = array.getPrescription(pathographyid,v.getSystemDate().substring(0,10));
%>--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script language="JavaScript">
function check()
{
	var pattern = /^[a-zA-Z0-9_]+$/;	
	var ints = /^[0-9_]+$/;
	if (document.form2.pathographyid.value == "" ) 
	{
		alert("请输入病志号!");
		document.form2.pathographyid.focus();
		return false;
	}
	else if(!ints.test(document.form2.pathographyid.value))
	{
		alert("病志号只能包含数字!");
		document.form2.pathographyid.focus();
		return false;
	}
	else 
	{
		form2.action="users/charge.jsp";
		form2.submit();
	}
}
</script>
<%--<%
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
%>--%>
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
            <td bgcolor="#BBD7FD">病志号：</td>
            <td bgcolor="#BBD7FD"><input name="pathographyid" type="text" size="40"></td>
            <td bgcolor="#BBD7FD"><input type="button" value="查询" onClick="check()"></td>
          </tr>
        </table>
      <%--  <%
        if(pre != null && pre.size() != 0){
         %>
        <br>--%>
        <table width="100%" border="0" cellspacing="0" cellpadding="3">
          <tr>
            <td colspan="4" align="center" class="tabletd1">药费单</td>
		  </tr>
          <tr class="tabletd2">
            <td align="center">药品名称</td>
            <td align="center">价格</td>
            <td align="center">数量</td>
            <td align="center">合计</td>
          </tr>
         <%-- <%
          float f = 0;
          for(int i = 0;i < pre.size();i++){
          	ArrayList alRow = (ArrayList)pre.get(i);
          	ArrayList medicine = array.getMedicine(alRow.get(2).toString());
           %>--%>
          <tr class="tabletd5">
              <td align="center"><a title="点击查看该药品详情" href="users/medicine_show.jsp?mark=show&id=1"> </a> 阿莫西林</td>
            <td align="center">50元</td>
            <td align="center">3</td>
            <td align="center">150元</td>
          </tr>
          <%--<%
          f += Float.parseFloat(medicine.get(4).toString())*Float.parseFloat(alRow.get(3).toString());
          } %>--%>
          <tr>
            <td colspan="4" align="center">费用总计：150元</td>
		  </tr>
        </table><br>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><a href="ChargeServlet?pathographyid=11">提交药费单</a></td>
          </tr>
        </table>
		<%--<%} %>--%>
      </form></td>
  </tr>
</table>
</body>
<jsp:include flush="true" page="/users/bottom.jsp"/>
</html>
<%--<%}} %>--%>