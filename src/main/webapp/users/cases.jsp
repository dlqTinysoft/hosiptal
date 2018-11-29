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
function reg()
{
	var pattern = /^[a-zA-Z0-9_]+$/;	
	var ints = /^[0-9_]+$/;
	if (document.form2.history.value == "" ) 
	{
		alert("请输入既往史!");
		document.form2.history.focus();
		return false;
	}
	else if (document.form2.allergy.value == "" ) 
	{
		alert("请输入过敏史!");
		document.form2.allergy.focus();
		return false;
	}
	else if (document.form2.symptom.value == "" )  
	{
		alert("请输入病情症状!");
		document.form2.symptom.focus();
		return false;
	}
	else if (document.form2.analyze.value == "" ) 
	{
		alert("请输入病情分析!");
		document.form2.analyze.focus();
		return false;
	}
}
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
		form2.action="users/cases.jsp";
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
      <form action="CasesServlet?pathographyid=<%=pathographyid %>" method="post" name="form2" onSubmit="return reg()">
      	<table border="0" cellspacing="1" cellpadding="5" bgcolor="#333333">
          <tr>
            <td bgcolor="#BBD7FD">病志号：</td>
            <td bgcolor="#BBD7FD"><input name="pathographyid" type="text" size="40"></td>
            <td bgcolor="#BBD7FD"><input type="button" value="查询" onClick="check()"></td>
          </tr>
        </table><br>
        <%
        
        ArrayList cases = array.getCases(pathographyid);
        ArrayList user = array.getUsersOne(userlogin.get(0).toString());
        Validate v = new Validate();
        ArrayList invalid = array.getInvalid(user.get(4).toString(),v.getSystemDate().substring(0,10));
        if(pathographyid != null && !pathographyid.equals("")){
        if(invalid != null && invalid.size() != 0){
        ArrayList alRow = null;
        int i = 0;
        for(i = 0;i < invalid.size();i++){
        	
        	alRow = (ArrayList)invalid.get(i);
        	if(alRow.get(1).equals(pathographyid)){
        		break;
        	}
        }
        if(i == invalid.size()){
        	alRow = null;
        }
        if(alRow != null && alRow.size() != 0){
        if(cases != null && cases.size() > 0){
        for(i = 0;i < cases.size();i++){
        	ArrayList alRow1 = (ArrayList)cases.get(i);
         %>
        <table width="60%" border="0" cellspacing="0" cellpadding="0" class="border">
          <tr>
            <td height="25" align="right" class="tabletd2">既往史：</td>
            <td height="25" class="tabletd2">&nbsp;<textarea cols="45" rows="7"><%=alRow1.get(2) %></textarea></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">过敏史：</td>
            <td height="25" class="tabletd1">&nbsp;<textarea cols="45" rows="7"><%=alRow1.get(3) %></textarea></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">病情症状：</td>
            <td height="25" class="tabletd2">&nbsp;<textarea cols="45" rows="7"><%=alRow1.get(4) %></textarea></td>
          </tr>  
          <tr>
            <td height="25" align="right" class="tabletd1">病情分析：</td>
            <td height="25" class="tabletd1">&nbsp;<textarea cols="45" rows="7"><%=alRow1.get(5) %></textarea></td>
          </tr>
        </table>
        <%}} %>
        <table width="60%" border="0" cellspacing="0" cellpadding="0" class="border">
          <tr>
            <td height="25" colspan="2" align="center" class="tabletd2">病情诊断</td>
          </tr>
          <tr>
            <td height="25" colspan="2" align="center" class="tabletd1">病人姓名：<%=alRow != null && alRow.size() != 0?alRow.get(2):"" %>&nbsp;性别：<%=alRow != null && alRow.size() != 0?alRow.get(3):"" %>&nbsp;年龄：<%=alRow != null && alRow.size() != 0?alRow.get(4):"" %></td>
		  </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">既往史：</td>
            <td height="25" class="tabletd2">&nbsp;<textarea name="history" cols="45" rows="7"></textarea></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd1">过敏史：</td>
            <td height="25" class="tabletd1">&nbsp;<textarea name="allergy" cols="45" rows="7"></textarea></td>
          </tr>
          <tr>
            <td height="25" align="right" class="tabletd2">病情症状：</td>
            <td height="25" class="tabletd2">&nbsp;<textarea name="symptom" cols="45" rows="7"></textarea></td>
          </tr>  
          <tr>
            <td height="25" align="right" class="tabletd1">病情分析：</td>
            <td height="25" class="tabletd1">&nbsp;<textarea name="analyze" cols="45" rows="7"></textarea></td>
          </tr>
		  <tr>
		    <td height="25" align="right" class="tabletd2">处方：</td>
		    <td height="25" class="tabletd2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <%
                ArrayList pre = array.getPrescription(pathographyid,v.getSystemDate().substring(0,10));
                if(pre != null && pre.size() != 0){
                for(i = 0;i < pre.size();i++){
                ArrayList alRow2 = (ArrayList)pre.get(i);
                ArrayList medicine = array.getMedicine(alRow2.get(2).toString());
                 %>
                  <tr>
                    <td align="center">药品名称：<%=medicine.get(1) %></td>
                    <td align="center">数量：<%=alRow2.get(3) %></td>
                  </tr>
                  <%}} %>
                </table>
                </td>
                <td align="center"><a href="users/prescription.jsp?pathographyid=<%=pathographyid %>">开药</a></td>
              </tr>
			</table>
			</td>
	      </tr>
		  <tr>
            <td height="25" colspan="2" align="center" class="tabletd1"><input type="submit" value="提交" class="input"></td>
          </tr>
        </table>
        <%}}} %>
      </form></td>
  </tr>
</table>
</body>
<jsp:include flush="true" page="/users/bottom.jsp"/>
</html>
<%}} %>
