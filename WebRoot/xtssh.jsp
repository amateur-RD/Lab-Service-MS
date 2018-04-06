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
<script language="javascript" >
function xtss()
{ document.form1.action="xtss.jsp";
document.form1.submit();}
function xttj()
{ document.form1.action="xttj.jsp";
document.form1.submit();}
function xtsc()
{ document.form1.action="xtsc.jsp";
document.form1.submit();}
function xtsszd()
{ document.form1.action="xtsszd.jsp";
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
<%@include file="zbrconn.jsp" %>
<% 
String id=codeToString(request.getParameter("xtid"));
String xtmc=codeToString(request.getParameter("xtmc"));
String xtlx=codeToString(request.getParameter("xtlx"));
session.setAttribute("id",id);
session.setAttribute("xtmc",xtmc);
session.setAttribute("xtlx",xtlx);

Class.forName(driverClass);
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt = conn.createStatement();
String sql1=new String("");
if(id==null&&xtmc==null&&xtlx==null)
sql1="select  count(*) as total from system ";
if(id!=null)
sql1="select  count(*) as total from system where sysid like '%"+id+"%'";
if(xtmc!=null)
{
if(id!=null)
sql1=sql1.concat("  and sysname like '%"+xtmc+"%'");
else
sql1=sql1.concat("  where sysname like '%"+xtmc+"%'");
}

if(xtlx!=null)
{
if(!(id==null&&xtmc==null))
sql1=sql1.concat("  and systype like '%"+xtlx+"%'");
else
sql1=sql1.concat("  where systype like '%"+xtlx+"%'");
}
ResultSet rs1=stmt.executeQuery(sql1);
rs1.next();
int total=rs1.getInt("total"); 
String sql=new String("");
if(id==null&&xtmc==null&&xtlx==null)
sql="select  * from system";
if(id!=null)
sql="select  * from system where sysid like '%"+id+"%'";
if(xtmc!=null)
{
if(id!=null)
sql=sql.concat("  and sysname like '%"+xtmc+"%'");
else
sql=sql.concat("  where sysname like '%"+xtmc+"%'");
}

if(xtlx!=null)
{
if(!(id==null&&xtmc==null))
sql=sql.concat("  and systype like '%"+xtlx+"%'");
else
sql=sql.concat("  where systype like '%"+xtlx+"%'");
}
ResultSet rs=stmt.executeQuery(sql);
rs.last();


int pageSize=15;
int pageCount=(total+pageSize-1)/pageSize;
int list_notice=1;//当前页
String goToPage = request.getParameter("list_notice");
if (goToPage == null)
{goToPage = "1"; } 
try{list_notice= Integer.parseInt(goToPage);}
catch (NumberFormatException ex){list_notice = 1;}
if(list_notice <=1)
{list_notice = 1; }
else if(list_notice >= pageCount)
{list_notice =  pageCount;}        
int posion = (list_notice -1 ) * pageSize + 1;         //设置游标的位置,游标的位置 (当前页 - 1) * 页面大小 + 1                   
rs.absolute(posion);         //循环显示表中的数据 pageSize(每页所显示的记录)               
//rs.isAfterLast() 游标是否在最后一行之后 说明后面已经没记录              
int i=0;  

%>   
<%if(total==0&&!(id==null&&xtmc==null&&xtlx==null)) 
{response.sendRedirect("xtss.jsp?sb=0");
 }else{ %>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="table-layout:fixed">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1">系统信息表</span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
              <input type="checkbox" name="checkboxall" onclick=sel('checkboxrj') >
              全选      &nbsp;&nbsp;
              <input type="image" src="images/add.gif" width="10" height="10" onClick="xttj()"> 添加   &nbsp; 
              <input type="image" src="images/del.gif" width="10" height="10" onClick="xtsc();" > 删除   &nbsp;&nbsp;
              <input type="image" src="images/edit.gif" width="10" height="10" onClick="xtss()"> 搜索   &nbsp;</span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce"  style="table-layout:fixed">
      <tr>
        <td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">
          <input type="checkbox" name="checkboxall2" onclick=sel('checkboxrj') />
        </div></td>
        <td width="20%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >系统ID</div></td>
        <td width="30%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >系统名称</div></td>
        <td width="25%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >系统类型</div></td>
         <td width="22%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >操作</div></td>
      </tr>
      <tr>

        
<% 
 while (i<pageSize && !rs.isAfterLast())
{
        String sysid=rs.getString("sysid");
        String sysname=rs.getString("sysname");
        String systype=rs.getString("systype");
        
 
out.print("<tr><td height='20' bgcolor='#FFFFFF'><div align='center'><input type='checkbox' name='checkboxrj'  value='"+sysid+"'></div></td>");
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+sysid+" </div></td>");   
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'>"+sysname+" </div></td>");  
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+systype+" </div></td>");  

%>
<td height='20' bgcolor='#FFFFFF' class='STYLE6'><div align='center'><span class='STYLE21'><a href="xtbj.jsp?id=<%=sysid%>">编辑</a></span></div></td></tr>
<% 

rs.next();
i++;
}
rs.close();
 %>
  </table></td>
  </tr>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="33%"><div align="left"><span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共有<strong><%=total%> </strong> 条记录，当前第<strong> <%=list_notice%></strong> 页，共 <strong><%=pageCount%></strong> 页</span></div></td>
        <td width="67%"><table width="312" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
<% 
if(list_notice < pageCount)
{out.println("<td class='STYLE22'><div align='center'><a href=xtssy.jsp?list_notice="+ (list_notice+1) +"  height='15'>[下一页]</div></td></a>") ;}                   
if(list_notice > 1)
{out.println("<td class='STYLE22'><div align='center'><a href=xtssy.jsp?list_notice="+ (list_notice-1) +"  height='15'>[上一页]</div></td></a>") ;}
out.println("<td class='STYLE22'><div align='center'><a href=xtssy.jsp?list_notice="+1+"  height='15'>『首页』</div></td></a>") ;
out.println("<td class='STYLE22'><div align='center'><a href=xtssy.jsp?list_notice="+pageCount+"  height='15'>『尾页』</div></td></a>") ;
%>
            <td width="37" class="STYLE22"><div align="center">转到</div></td>
            <td width="22"><div align="center">
              <input type="text" name="textfield" id="textfield"  style="width:20px; height:12px; font-size:12px; border:solid 1px #7aaebd;"/>
            </div></td>
            <td width="22" class="STYLE22"><div align="center">页</div></td>
            <td width="30" class="STYLE22"><input type="button" onClick="xtsszd();" value="确定" width="20" height="15" /></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
 </form>
</body>
<%}%>