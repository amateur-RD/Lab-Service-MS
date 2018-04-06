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
         String yjbh=request.getParameter("yjbh");
         String qqr=codeToString(request.getParameter("qqr"));
         String sysmc=codeToString(request.getParameter("sysmc"));
         String xtmc=codeToString(request.getParameter("xtmc"));
         String rjmc=codeToString(request.getParameter("rjmc"));  
         String jdms=codeToString(request.getParameter("jdms"));
         String xxms=codeToString(request.getParameter("xxms"));
         String jjcd=codeToString(request.getParameter("jjcd"));
         String qqsj=request.getParameter("qqsj");
         String qqzt=codeToString(request.getParameter("qqzt"));
%>
<script language="javascript" >
function qqtj()
{ document.form1.action="qqtj.jsp";
document.form1.submit();}
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

int rtn=stmt.executeUpdate("update request set reqname='"+qqr+"',hsnumber='"+yjbh+"',locname='"+sysmc+"',sysname='"+xtmc+"',softname='"+rjmc+"',reqdescribe='"+jdms+"',reqdetail='"+xxms+"',reqtime='"+qqsj+"',state='"+qqzt+"',emergency='"+jjcd+"' where reqid="+d+"");
response.sendRedirect("qqgl.jsp");
%>
 </form>
</body>