<%@ page language="java" import="java.util.*,util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/><jsp:include flush="true" page="/users/charge_top.jsp"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
if(userlogin == null || userlogin.size() == 0){
	%><script>alert('����û�е�¼!');window.navigate('../index.jsp');</script><%
}else{
if(userlogin.get(3) != null && !userlogin.get(3).equals("ҩ��")){
	%><script>alert('������ݲ��ԣ������µ�¼!');window.navigate('../index.jsp');</script><%
}else{
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
		alert("�������������!");
		document.form2.sums.focus();
		return false;
	}
	else if(!ints.test(document.form2.sums.value))
	{
		alert("�������ֻ�ܰ�������!");
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
    <td colspan="4" align="center" class="tabletd1">����¼</td>
</tr>
  <tr class="tabletd2">
    <td align="center">ҩƷ����</td>
    <td align="center">�����</td>
    <td align="center">���ʱ��</td>
  </tr>
  <%
  ArrayList entry = array.getEntry();
  for(int i = 0;i < entry.size();i++){
  	ArrayList alRow = (ArrayList)entry.get(i);
  	ArrayList medicine = array.getMedicine(alRow.get(1).toString());
   %>
  <tr class="tabletd<%=i%2+1 %>">
    <td align="center"><a title="����鿴��ҩƷ����" href="users/medicine_show.jsp?mark=show&id=<%=alRow.get(1) %>"><%=medicine.get(1) %></a></td>
    <td align="center"><%=alRow.get(2) %></td>
    <td align="center"><%=alRow.get(3).toString().substring(0,16) %></td>
  </tr>
  <%} %>
</table><br>
<table width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td colspan="4" align="center" class="tabletd1">�����¼</td>
</tr>
  <tr class="tabletd2">
    <td align="center">ҩƷ����</td>
    <td align="center">������</td>
    <td align="center">����ʱ��</td>
  </tr>
  <%
  ArrayList pre = array.getPrescription();
  for(int i = 0;i < pre.size();i++){
  	ArrayList alRow = (ArrayList)pre.get(i);
  	ArrayList medicine = array.getMedicine(alRow.get(2).toString());
   %>
  <tr class="tabletd<%=i%2+1 %>">
    <td align="center"><a title="����鿴��ҩƷ����" href="users/medicine_show.jsp?mark=show&id=<%=alRow.get(2) %>"><%=medicine.get(1) %></a></td>
    <td align="center"><%=alRow.get(3) %></td>
    <td align="center"><%=alRow.get(5) %></td>
  </tr>
  <%} %>
</table>

                                  </form></td>
  </tr>
</table>
</body>
<jsp:include flush="true" page="/users/bottom.jsp"/>
</html>
<%}} %>
