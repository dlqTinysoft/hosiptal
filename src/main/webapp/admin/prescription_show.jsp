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
String id = request.getParameter("id");
ArrayList pre = array.getPrescriptionOne(id);
ArrayList invalid = array.getInvalid(pre.get(1).toString());
ArrayList inRow = (ArrayList)invalid.get(0);
ArrayList medicine = array.getMedicine(pre.get(2).toString());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script language="JavaScript">
function check()
{
	var pattern = /^(([1-9]\d*)|0)(\.\d{1,2})?$/;
	
	if (document.form1.name.value == "" ) 
	{
		alert("请输入药品名称!");
		document.form1.name.focus();
		return false;
	}
	if (document.form1.spec.value == "" ) 
	{
		alert("请输入规格!");
		document.form1.spec.focus();
		return false;
	}
	if (document.form1.factory.value == "" ) 
	{
		alert("请输入生产厂家!");
		document.form1.factory.focus();
		return false;
	}
	if (document.form1.price.value == "" ) 
	{
		alert("请输入价格!");
		document.form1.price.focus();
		return false;
	}
	if (!pattern.test(document.form1.price.value) )  
	{
		alert("价格格式错误(格式为20.25)!");
		document.form1.price.focus();
		return false;
	}
	if (document.form1.caption.value == "" ) 
	{
		alert("请输入说明!");
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
      <form name="form1" method="post" action="" onSubmit="return check()">
        <table width="55%" border="0" cellspacing="1" cellpadding="10" bgcolor="#333333">
          <tr>
            <td colspan="2" align="center" bgcolor="#C5E8EF">病人病例详情</td>
</tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">病志号：</td>
            <td bgcolor="#C5E8EF"><%=pre.get(1) %></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">病人姓名：</td>
            <td bgcolor="#C5E8EF"><%=inRow.get(2) %></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">性别：</td>
            <td bgcolor="#C5E8EF"><%=inRow.get(3) %></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">年龄：</td>
            <td bgcolor="#C5E8EF"><%=inRow.get(4) %></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">家庭住址：</td>
            <td bgcolor="#C5E8EF"><%=inRow.get(5) %></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">药品名称：</td>
            <td bgcolor="#C5E8EF"><%=medicine.get(1) %></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">数量：</td>
            <td bgcolor="#C5E8EF"><%=pre.get(3) %></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#C5E8EF">取药时间：</td>
            <td bgcolor="#C5E8EF"><%=pre.get(5) %></td>
          </tr>
</table>
    </form></td>
  </tr>
</table>
</body>
<jsp:include flush="true" page="/admin/bottom.jsp"/>
</html>
<%}} %>
