<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*" %>
<%!
public String codeToString(String str)
{
String s=str;
try
{
byte tempB[]=s.getBytes("ISO-8859-1");
s=new String(tempB);
return s;
}
catch(Exception e)
{
return s;
}
}%>
<% 
         String d=(String)session.getAttribute("id");
         String jjbf=codeToString(request.getParameter("jjbf"));
         String yxj=codeToString(request.getParameter("yxj"));
         String sjzt=codeToString(request.getParameter("sjzt"));
         String sjlx=codeToString(request.getParameter("sjlx"));
         String djsj=request.getParameter("djsj");  
         String clr=codeToString(request.getParameter("clr"));
         
%>
<script language="javascript" >

function sel(a)
{
  o=document.getElementsByName(a)
  for(i=0;i<o.length;i++)
  o[i].checked=event.srcElement.checked
 }
 function changeTitle(obj){
 if(obj.offsetWidth>obj.parentElement.offsetWidth){
  obj.title=obj.innerText;
 }else{
  obj.title="";
 }
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE7 { overflow:hidden; text-overflow:ellipsis;color: #000000; font-size: 12;}
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
-->
</style>
</head>
<body>
<form name="form1" method="post" >
<%@include file="conn.jsp" %>

<% 

int rtn=stmt.executeUpdate("update event set username='"+clr+"',solution='"+jjbf+"',perior='"+yxj+"',state='"+sjzt+"',time='"+djsj+"',type='"+sjlx+"' where eventid="+d+"");


response.sendRedirect("sjgc.jsp");
%>
 </form>
 
</body>