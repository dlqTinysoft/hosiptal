<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/><jsp:include flush="true" page="/users/register_top.jsp"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
if(userlogin == null || userlogin.size() == 0){
	%><script>alert('您还没有登录!');window.navigate('../index.jsp');</script><%
}else{
if(userlogin.get(3) != null && !userlogin.get(3).equals("挂号")){
	%><script>alert('您的身份不对，请重新登录!');window.navigate('../index.jsp');</script><%
}else{
ArrayList price = array.getRegisterPrice();
for(int i = 0;i < price.size();i++){
	ArrayList alRow = (ArrayList)price.get(i);
	String str = "'"+alRow.get(1).toString()+"'";
	alRow.set(1,str);
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script language="JavaScript">
function reg()
{
	var pattern = /^[a-zA-Z0-9_]+$/;	
	var ints = /^[0-9_]+$/;
	if (document.form2.name.value == "" ) 
	{
		alert("请输入病人姓名!");
		document.form2.name.focus();
		return false;
	}
	else if (document.form2.age.value == "" ) 
	{
		alert("请输入年龄!");
		document.form2.age.focus();
		return false;
	}
	else if (!ints.test(document.form2.age.value) )  
	{
		alert("年龄只能包含数字!");
		document.form2.age.focus();
		return false;
	}
	else if (document.form2.address.value == "" ) 
	{
		alert("请输入家庭住址!");
		document.form2.address.focus();
		return false;
	}
}
function Foo()
{
	var price = <%=price %>;
	var flag = false;
	for(var j=0;j<price.length;j++)
	{
		var priceRow = price[j];
	    for (var i=0; i<form2.type.length; i++)
	    {
	        if (form2.type[i].checked)
	        {
	        	if(form2.type[i].value == priceRow[1])
	        	{
	        		form2.price.value = priceRow[2];
	        		flag = true;
	        		break;
	        	}
	        }
	    }
	    
	    if(flag == true)
	    {
	    	break;
	    }
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
      <form action="RegisterServlet" method="post" name="form2" onSubmit="return reg()">
        <table width="50%" border="0" cellspacing="0" cellpadding="0" class="border">
          <tr>
            <td height="25" colspan="2" align="center" class="tabletd2">挂号单</td>
          </tr>
          <tr>
            <td height="25" colspan="2" align="center" class="tabletd2">病志号：<%=Integer.parseInt(array.getMax().get(0).toString())+1 %></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">病人姓名：</td>
            <td height="25" class="tabletd1">&nbsp;<input type="text" name="name" size="40"></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">性别：</td>
            <td height="25" class="tabletd2">&nbsp;<input name="sex" type="radio" value="男" checked>&nbsp;男&nbsp;&nbsp;<input type="radio" name="sex" value="女">&nbsp;女</td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">年龄：</td>
            <td height="25" class="tabletd1">&nbsp;<input type="text" name="age" size="37">&nbsp;岁</td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">家庭住址：</td>
            <td height="25" class="tabletd2">&nbsp;<input type="text" name="address" size="40"></td>
          </tr>  
          <tr>
            <td height="25" align="right" class="tabletd1">挂号科室：</td>
            <td height="25" class="tabletd1">&nbsp;<select name="office">
            <%
            ArrayList office = array.getOffice();
            for(int i = 0;i < office.size();i++){
            	ArrayList alRow = (ArrayList)office.get(i);
             %>
            <option value="<%=alRow.get(1) %>"><%=alRow.get(1) %></option>
            <%} %>
            </select></td>
          </tr>          
          <tr>
            <td height="25" align="right" class="tabletd2">挂号类别：</td>
            <td height="25" class="tabletd2">&nbsp;<input name="type" type="radio" value="普通" checked onclick="Foo()">&nbsp;普通&nbsp;&nbsp;<input type="radio" name="type" value="急诊" onclick="Foo()">&nbsp;急诊&nbsp;&nbsp;<input type="radio" name="type" value="专家" onclick="Foo()">&nbsp;专家</td>
          </tr>          
          <tr>
            <td height="25" align="right" class="tabletd1">价格：</td>
            <td height="25" class="tabletd1">&nbsp;<input name="price" type="text" size="37" value="<%=array.getRegisterPrice("普通").get(2) %>" readonly="readonly">&nbsp;元</td>
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
