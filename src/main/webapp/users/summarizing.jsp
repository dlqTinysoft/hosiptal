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
ArrayList pre = array.getPrescription(v.getSystemDate().substring(0,10));
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
      	<table width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td colspan="4" align="center" class="tabletd1">本日药品销售汇总</td>
</tr>
  <tr class="tabletd2">
    <td align="center">药品名称</td>
    <td align="center">库存量</td>
    <td align="center">本日已销量</td>
    <td align="center">合计</td>
  </tr>
  <%
  float f = 0;
  for(int i = 0;i < pre.size();i++){
  	ArrayList alRow = (ArrayList)pre.get(i);
  	ArrayList medicine = array.getMedicine(alRow.get(0).toString());
   %>
  <tr class="tabletd<%=i%2+1 %>">
    <td align="center"><a title="点击查看该药品详情" href="users/medicine_show.jsp?mark=show&id=<%=alRow.get(0) %>"><%=medicine.get(1) %></a></td>
    <td align="center"><%=medicine.get(5) %></td>
    <td align="center"><%=alRow.get(1) %></td>
    <td align="center"><%=v.getRround(Float.parseFloat(medicine.get(4).toString())*Float.parseFloat(alRow.get(1).toString())) %>元</td>
  </tr>
  <%
  f += Float.parseFloat(medicine.get(4).toString())*Float.parseFloat(alRow.get(1).toString());
  } %>
  <tr>
    <td colspan="4" align="center">总计：<%=v.getRround(f) %>元</td>
</tr>
</table>

                                  </form></td>
  </tr>
</table>
</body>
<jsp:include flush="true" page="/users/bottom.jsp"/>
</html>
<%}} %>
