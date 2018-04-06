<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*"%>
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
String id=codeToString(request.getParameter("wtid"));
String tjwtz=codeToString(request.getParameter("tjwtz"));
String tjsj=codeToString(request.getParameter("tjsj"));
String sysmc=codeToString(request.getParameter("sysmc"));
String rjmc=codeToString(request.getParameter("rjmc"));
String xtmc=codeToString(request.getParameter("xtmc"));
String gzyjbh=codeToString(request.getParameter("gzyjbh"));
String wtzt=codeToString(request.getParameter("wtzt"));
String wtlx=codeToString(request.getParameter("wtlx"));
String jjfa=codeToString(request.getParameter("jjfa"));
String xx=codeToString(request.getParameter("xx"));
session.setAttribute("id",id);
session.setAttribute("tjwtz",tjwtz);
session.setAttribute("tjsj",tjsj);
session.setAttribute("sysmc",sysmc);
session.setAttribute("rjmc",rjmc);
session.setAttribute("xtmc",xtmc);
session.setAttribute("gzyjbh",gzyjbh);
session.setAttribute("wtzt",wtzt);
session.setAttribute("wzlx",wtlx);
session.setAttribute("jjfa",jjfa);
session.setAttribute("xx",xx);
%>
<script language="javascript" >
function wtss()
{ document.form1.action="wtss.jsp";
document.form1.submit();}
function wttj()
{ document.form1.action="wttj.jsp";
document.form1.submit();}
function wtsc()
{ document.form1.action="wtsc.jsp";
document.form1.submit();}
function wtsszd()
{ document.form1.action="wtsszd.jsp";
document.form1.submit();}
function checkAll()
{
   for(var i=0;i<document.test.checkboxrj.length;i++)
   {
      document.test.checkboxrj[i].checked = true;
   }
}
function uncheckAll()
{
   for(var i=0;i<document.test.checkboxrj.length;i++)
   {
       document.test.checkboxrj[i].checked = false;
    }  
}  
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

Class.forName(driverClass);
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt = conn.createStatement();
String sql1=new String("");
if(id==null&&tjwtz==null&&tjsj==null&&sysmc==null&&rjmc==null&&xtmc==null&&gzyjbh==null&&wtzt==null&&wtlx==null&&jjfa==null&&xx==null)
sql1="select  count(*) as total from problem ";
if(id!=null)
sql1="select  count(*) as total from problem where proid like '%"+id+"%'";
if(tjwtz!=null)
{
  if(id!=null)
    sql1=sql1.concat("  and userid like '%"+tjwtz+"%'");
  else
    sql1=sql1.concat(" where userid like '%"+tjwtz+"%'");  
}

if(tjsj!=null)
{
  if(!(id==null&&tjwtz==null))
    sql1=sql1.concat("  and prodate like '%"+tjsj+"%'");
  else
    sql1=sql1.concat(" where prodate like '%"+tjsj+"%'");
}

if(sysmc!=null)
{
if(!(id==null&&tjwtz==null&&tjsj==null))
sql1=sql1.concat(" and locname like '%"+sysmc+"%'");
else
sql1=sql1.concat(" where locname like '%"+sysmc+"%'");
}

if(rjmc!=null)
{
if(!(id==null&&tjwtz==null&&tjsj==null&&sysmc==null))
sql1=sql1.concat("  and softname like '%"+rjmc+"%'");
else
sql1=sql1.concat("  where softname like '%"+rjmc+"%'");
}

if(xtmc!=null)
{
if(!(id==null&&tjwtz==null&&tjsj==null&&sysmc==null&&rjmc==null))
sql1=sql1.concat("  and sysname like '%"+xtmc+"%'");
else
sql1=sql1.concat(" where sysname like '%"+xtmc+"%'");
}

if(gzyjbh!=null)
{
if(!(id==null&&tjwtz==null&&tjsj==null&&sysmc==null&&rjmc==null&&xtmc==null))
sql1=sql1.concat(" and hsnumber like '%"+gzyjbh+"%'");
else
sql1=sql1.concat(" where hsnumber like '%"+gzyjbh+"%'");
}

if(wtzt!=null)
{
if(!(id==null&&tjwtz==null&&tjsj==null&&sysmc==null&&rjmc==null&&xtmc==null&&gzyjbh==null))
sql1=sql1.concat("  and prostate like '%"+wtzt+"%'");
else
sql1=sql1.concat(" where prostate like '%"+wtzt+"%'");
}

if(wtlx!=null)
{
if(!(id==null&&tjwtz==null&&tjsj==null&&sysmc==null&&rjmc==null&&xtmc==null&&gzyjbh==null&&wtzt==null))
sql1=sql1.concat("  and type like '%"+wtlx+"%'");
else
sql1=sql1.concat(" where type like '%"+wtlx+"%'");
}

if(jjfa!=null)
{
if(!(id==null&&tjwtz==null&&tjsj==null&&sysmc==null&&rjmc==null&&xtmc==null&&gzyjbh==null&&wtzt==null&&wtlx==null))
sql1=sql1.concat(" and prophenomenon like '%"+jjfa+"%'");
else
sql1=sql1.concat("  where prophenomenon like '%"+jjfa+"%'");
}

if(xx!=null)
{
if(!(id==null&&tjwtz==null&&tjsj==null&&sysmc==null&&rjmc==null&&xtmc==null&&gzyjbh==null&&wtzt==null&&wtlx==null&&jjfa==null))
sql1=sql1.concat("  and prosolution like '%"+xx+"%'");
else
sql1=sql1.concat(" where  prosolution like '%"+xx+"%'");
}

ResultSet rs1=stmt.executeQuery(sql1);
rs1.next();
int total=rs1.getInt("total"); 
String sql=new String("");
if(id==null&&tjwtz==null&&tjsj==null&&sysmc==null&&rjmc==null&&xtmc==null&&gzyjbh==null&&wtzt==null&&wtlx==null&&jjfa==null&&xx==null)
sql="select * from problem ";
if(id!=null)
sql="select  * from problem where proid like '%"+id+"%'";
if(tjwtz!=null)
{
  if(id!=null)
    sql=sql.concat("  and userid like '%"+tjwtz+"%'");
  else
    sql=sql.concat(" where userid like '%"+tjwtz+"%'");  
}

if(tjsj!=null)
{
  if(!(id==null&&tjwtz==null))
    sql=sql.concat("  and prodate like '%"+tjsj+"%'");
  else
    sql=sql.concat(" where prodate like '%"+tjsj+"%'");
}

if(sysmc!=null)
{
if(!(id==null&&tjwtz==null&&tjsj==null))
sql=sql.concat(" and locname like '%"+sysmc+"%'");
else
sql=sql.concat(" where locname like '%"+sysmc+"%'");
}

if(rjmc!=null)
{
if(!(id==null&&tjwtz==null&&tjsj==null&&sysmc==null))
sql=sql.concat("  and softname like '%"+rjmc+"%'");
else
sql=sql.concat(" where softname like '%"+rjmc+"%'");
}

if(xtmc!=null)
{
if(!(id==null&&tjwtz==null&&tjsj==null&&sysmc==null&&rjmc==null))
sql=sql.concat("  and sysname like '%"+xtmc+"%'");
else
sql=sql.concat(" where sysname like '%"+xtmc+"%'");
}

if(gzyjbh!=null)
{
if(!(id==null&&tjwtz==null&&tjsj==null&&sysmc==null&&rjmc==null&&xtmc==null))
sql=sql.concat(" and hsnumber like '%"+gzyjbh+"%'");
else
sql=sql.concat(" where hsnumber like '%"+gzyjbh+"%'");
}

if(wtzt!=null)
{
if(!(id==null&&tjwtz==null&&tjsj==null&&sysmc==null&&rjmc==null&&xtmc==null&&gzyjbh==null))
sql=sql.concat("  and prostate like '%"+wtzt+"%'");
else
sql=sql.concat(" where prostate like '%"+wtzt+"%'");
}

if(wtlx!=null)
{
if(!(id==null&&tjwtz==null&&tjsj==null&&sysmc==null&&rjmc==null&&xtmc==null&&gzyjbh==null&&wtzt==null))
sql=sql.concat("  and type like '%"+wtlx+"%'");
else
sql=sql.concat("where type like '%"+wtlx+"%'");
}

if(jjfa!=null)
{
if(!(id==null&&tjwtz==null&&tjsj==null&&sysmc==null&&rjmc==null&&xtmc==null&&gzyjbh==null&&wtzt==null&&wtlx==null))
sql=sql.concat(" and prophenomenon like '%"+jjfa+"%'");
else
sql=sql.concat(" where prophenomenon like '%"+jjfa+"%'");
}

if(xx!=null)
{
if(!(id==null&&tjwtz==null&&tjsj==null&&sysmc==null&&rjmc==null&&xtmc==null&&gzyjbh==null&&wtzt==null&&wtlx==null&&jjfa==null))
sql=sql.concat("  and prosolution like '%"+xx+"%'");
else
sql=sql.concat(" where prosolution like '%"+xx+"%'");
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
<%if(total==0&&!(id==null&&tjwtz==null&&tjsj==null&&sysmc==null&&rjmc==null&&xtmc==null&&gzyjbh==null&&wtzt==null&&wtlx==null&&jjfa==null&&xx==null)) 
{response.sendRedirect("wtss.jsp?sb=0");
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
                <td width="94%" valign="bottom"><span class="STYLE1"> 问题信息表</span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
              <input type="checkbox" name="checkboxall" onclick=sel('checkboxrj') />
              全选      &nbsp;&nbsp;
              <input type="image" src="images/add.gif" width="10" height="10" onClick="wttj()"> 添加   &nbsp; 
              <input type="image" src="images/del.gif" width="10" height="10" onClick="wtsc();" > 删除   &nbsp;&nbsp;
              <input type="image" src="images/edit.gif" width="10" height="10" onClick="wtss()"> 搜索   &nbsp;</span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" style="table-layout:fixed">
      <tr>
        <td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">
          <input type="checkbox" name="checkboxall2" onclick=sel('checkboxrj') />
        </div></td>
        <td width="6%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">问题ID</span></div></td>
        <td width="9%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">提交问题者</span></div></td>
        <td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">提交时间</span></div></td>
        <td width="9%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">实验室名称</span></div></td>
        <td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">软件名称</span></div></td>
        <td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">系统名称</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">故障硬件编号</span></div></td>
        <td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">问题状态</span></div></td>
        <td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">问题类型</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">解决方案</span></div></td>
        <td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">现象</span></div></td>
        <td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">操作</span></div></td>
      </tr>
      <tr>

        
<% 
 while (i<pageSize &&rs.next())
{
        String proid=rs.getString("proid");
        String userid=rs.getString("userid");
        String prodate=rs.getString("prodate");
        String locname=rs.getString("locname");
        String softname=rs.getString("softname");
        String sysname=rs.getString("sysname");
        String hsnumber=rs.getString("hsnumber");
        String prostate=rs.getString("prostate");        
        String type=rs.getString("type");
        String prophenomenon=rs.getString("prophenomenon");
        String prosolution=rs.getString("prosolution");
out.print("<tr><td height='20' bgcolor='#FFFFFF'><div align='center'><input type='checkbox' name='checkboxrj'  value='"+proid+"'></div></td>");
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'>"+proid+"</div></td>");
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'>"+userid+"</div></td>");   
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'>"+prodate+" </div></td>");  
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'>"+locname+" </div></td>");  
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'>"+softname+" </div></td>");
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'>"+sysname+" </div></td>");   
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+hsnumber+" </div></td>");  
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'>"+prostate+" </div></td>");  
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+type+" </div></td>");
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+prophenomenon+" </div></td>");  
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+prosolution+" </div></td>");  

%>
<td height='20' bgcolor='#FFFFFF' class='STYLE6'><div align='center'><span class='STYLE21'><a href="wtbj.jsp?id=<%=proid%>">编辑</a></span></div></td></tr>
<% 

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
{out.println("<td class='STYLE22'><div align='center'><a href=wtssy.jsp?list_notice="+ (list_notice+1) +"  height='15'>[下一页]</div></td></a>") ;}                   
if(list_notice > 1)
{out.println("<td class='STYLE22'><div align='center'><a href=wtssy.jsp?list_notice="+ (list_notice-1) +"  height='15'>[上一页]</div></td></a>") ;}
out.println("<td class='STYLE22'><div align='center'><a href=wtssy.jsp?list_notice="+1+"  height='15'>『首页』</div></td></a>") ;
out.println("<td class='STYLE22'><div align='center'><a href=wtssy.jsp?list_notice="+pageCount+"  height='15'>『尾页』</div></td></a>") ;
%>
            <td width="37" class="STYLE22"><div align="center">转到</div></td>
            <td width="22"><div align="center">
              <input type="text" name="textfield" id="textfield"  style="width:20px; height:12px; font-size:12px; border:solid 1px #7aaebd;"/>
            </div></td>
            <td width="22" class="STYLE22"><div align="center">页</div></td>
            <td width="35"><input type="button" onClick="wtsszd();" value="确定" width="26" height="15" /></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
 </form>
</body>
<%}%>