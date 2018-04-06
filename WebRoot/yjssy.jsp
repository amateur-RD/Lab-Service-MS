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
String id=(String)session.getAttribute("id");
String sbid=(String)session.getAttribute("sbid");
String wzid=(String)session.getAttribute("wzid");
String yjbh=(String)session.getAttribute("yjbh");
String yjip=(String)session.getAttribute("yjip");
String yjzt=(String)session.getAttribute("yjzt");
session.setAttribute("id",id);
session.setAttribute("sbid",sbid);
session.setAttribute("wzid",wzid);
session.setAttribute("yjbh",yjbh);
session.setAttribute("yjip",yjip);
session.setAttribute("yjzt",yjzt);
%>
<script language="javascript" >
function yjss()
{ document.form1.action="yjss.jsp";
document.form1.submit();}
function yjtj()
{ document.form1.action="yjtj.jsp";
document.form1.submit();}
function yjsc()
{ document.form1.action="yjsc.jsp";
document.form1.submit();}
function yjsszd()
{ document.form1.action="yjsszd.jsp";
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

Class.forName(driverClass);
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt = conn.createStatement();
String sql1=new String("");
if(id==null&&sbid==null&&wzid==null&&yjbh==null&&yjip==null&&yjzt==null)
sql1="select  count(*) as total from hardsoft ";
if(id!=null)
sql1="select  count(*) as total from hardsoft where hsid like '%"+id+"%'";
if(sbid!=null)
{
if(id!=null)
sql1=sql1.concat("  and eqid like '%"+sbid+"%'");
else
sql1=sql1.concat("  where eqid like '%"+sbid+"%'");
}
if(wzid!=null)
{
if(!(id==null&&sbid==null))
sql1=sql1.concat("  and locid like '%"+wzid+"%'");
else
sql1=sql1.concat("  where locid like '%"+wzid+"%'");
}
if(yjbh!=null)
{
if(!(id==null&&sbid==null&&wzid==null))
sql1=sql1.concat(" and hsnumber like '%"+yjbh+"%'");
else
sql1=sql1.concat(" where hsnumber like '%"+yjbh+"%'");
}
if(yjip!=null)
{
if(!(id==null&&sbid==null&&wzid==null&&yjbh==null))
sql1=sql1.concat("  and hsip like '%"+yjip+"%'");
else
sql1=sql1.concat("  where hsip like '%"+yjip+"%'");
}
if(yjzt!=null)
{
if(!(id==null&&sbid==null&&wzid==null&&yjbh==null&&yjip==null))
sql1=sql1.concat("  and hsstate like '%"+yjzt+"%'");
else
sql1=sql1.concat("  where hsstate like '%"+yjzt+"%'");
}
ResultSet rs1=stmt.executeQuery(sql1);
rs1.next();
int total=rs1.getInt("total"); 
String sql=new String("");
if(id==null&&sbid==null&&wzid==null&&yjbh==null&&yjip==null&&yjzt==null)
sql="select * from hardsoft ";
if(id!=null)
sql="select * from hardsoft where hsid like '%"+id+"%'";
if(sbid!=null)
{
if(id!=null)
sql=sql.concat("  and eqid like '%"+sbid+"%'");
else
sql=sql.concat("  where eqid like '%"+sbid+"%'");
}
if(wzid!=null)
{
if(!(id==null&&sbid==null))
sql=sql.concat("  and locid like '%"+wzid+"%'");
else
sql=sql.concat("  where locid like '%"+wzid+"%'");
}
if(yjbh!=null)
{
if(!(id==null&&sbid==null&&wzid==null))
sql=sql.concat(" and hsnumber like '%"+yjbh+"%'");
else
sql=sql.concat(" where hsnumber like '%"+yjbh+"%'");
}
if(yjip!=null)
{
if(!(id==null&&sbid==null&&wzid==null&&yjbh==null))
sql=sql.concat("  and hsip like '%"+yjip+"%'");
else
sql=sql.concat("  where hsip like '%"+yjip+"%'");
}
if(yjzt!=null)
{
if(!(id==null&&sbid==null&&wzid==null&&yjbh==null&&yjip==null))
sql=sql.concat("  and hsstate like '%"+yjzt+"%'");
else
sql=sql.concat("  where hsstate like '%"+yjzt+"%'");
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
<%if(total==0&&!(id==null&&sbid==null&&wzid==null&&yjbh==null&&yjip==null&&yjzt==null)) 
{response.sendRedirect("yjss.jsp?sb=0");
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
                <td width="94%" valign="bottom"><span class="STYLE1"> 硬件信息表</span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
              <input type="checkbox" name="checkboxall" onclick=sel('checkboxrj') >
              全选      &nbsp;&nbsp;
              <input type="image" src="images/add.gif" width="10" height="10" onClick="yjtj()"> 添加   &nbsp; 
              <input type="image" src="images/del.gif" width="10" height="10" onClick="yjsc();" > 删除   &nbsp;&nbsp;
              <input type="image" src="images/edit.gif" width="10" height="10" onClick="yjss()"> 搜索   &nbsp;</span><span class="STYLE1"> &nbsp;</span></div></td>
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
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >硬件ID</div></td>
        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >设备ID</div></td>
        <td width="17%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >位置ID</div></td>
        <td width="16%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >硬件编号</div></td>
        <td width="18%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >硬件IP</div></td>
        <td width="12%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >硬件状态</div></td>
        <td width="12%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >操作</div></td>
      </tr>
      <tr>

        
<% 
 while (i<pageSize && !rs.isAfterLast())
{
        String hsid=rs.getString("hsid");
        String eqid=rs.getString("eqid");
        String locid=rs.getString("locid");
        String hsnumber=rs.getString("hsnumber");
        String hsip=rs.getString("hsip");
        String hsstate=rs.getString("hsstate");
        
 
out.print("<tr><td height='20' bgcolor='#FFFFFF'><div align='center'><input type='checkbox' name='checkboxrj'  value='"+hsid+"'></div></td>");
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+hsid+" </div></td>");   
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'>"+eqid+" </div></td>");  
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+locid+" </div></td>");  
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+hsnumber+" </div></td>"); 
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+hsip+" </div></td>");  
out.print("<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> "+hsstate+" </div></td>"); 

%>
<td height='20' bgcolor='#FFFFFF' class='STYLE6'><div align='center'><span class='STYLE21'><a href="yjbj.jsp?id=<%=hsid%>">编辑</a></span></div></td></tr>
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
{out.println("<td class='STYLE22'><div align='center'><a href=yjssy.jsp?list_notice="+ (list_notice+1) +"  height='15'>[下一页]</div></td></a>") ;}                   
if(list_notice > 1)
{out.println("<td class='STYLE22'><div align='center'><a href=yjssy.jsp?list_notice="+ (list_notice-1) +"  height='15'>[上一页]</div></td></a>") ;}
out.println("<td class='STYLE22'><div align='center'><a href=yjssy.jsp?list_notice="+1+"  height='15'>『首页』</div></td></a>") ;
out.println("<td class='STYLE22'><div align='center'><a href=yjssy.jsp?list_notice="+pageCount+"  height='15'>『尾页』</div></td></a>") ;
%>
            <td width="37" class="STYLE22"><div align="center">转到</div></td>
            <td width="22"><div align="center">
              <input type="text" name="textfield" id="textfield"  style="width:20px; height:12px; font-size:12px; border:solid 1px #7aaebd;"/>
            </div></td>
            <td width="22" class="STYLE22"><div align="center">页</div></td>
            <td width="30" class="STYLE22"><input type="button" onClick="yjsszd();" value="确定" width="20" height="15" /></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
 </form>
</body>
<%}%>