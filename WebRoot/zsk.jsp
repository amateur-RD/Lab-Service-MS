<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*" %>
<script src="jquery/operator.js"></script>
<script language="javascript" >
function zstj()
{ document.form1.action="zstj.jsp";
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
<style>
 a:link {    color:#0033FF;        text-decoration:none; }   
 a:visited {    color:#0033FF;      }    
 a:hover {    color:#0033FF;      }    
 a:active {    color:#0033FF;       }
</style>
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
String sql1="select  count(*) as total from knowledge";
ResultSet rs1=stmt.executeQuery(sql1);
rs1.next();
int total=rs1.getInt("total"); 
String sql="select  * from knowledge";
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

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="table-layout:fixed">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1"> 知识库</span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
              <input type="hidden" name="code" value="OK">
              <input type="checkbox" name="checkboxall" onclick=sel('checkboxrj') >
              全选      &nbsp;&nbsp;
              <input type="image" src="images/add.gif" width="10" height="10" onClick="zstj()"> 添加   &nbsp; 
              <input type="image" src="images/del.gif" width="10" height="10" onClick="zssc();" > 删除   &nbsp;&nbsp;</span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
<!--    <tr>
     <td width="40%" height="30" bgcolor="d3eaef" class="STYLE7"><div align='left'><input type="text" name="sjms"><button  style="max-width: 217px; " class="btn btn-large btn-block btn-info" type="submit">查询</button></div></td>    
  </tr>    -->
  <tr>    
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce"  style="table-layout:fixed">
      <tr>
        <td width="5%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">
          <input type="checkbox" name="checkboxall2" onclick=sel('checkboxrj') />
        </div></td>
        <td width="20%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >事件描述</div></td>
        <td width="20%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >解决方法</div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >形成时间</div></td>
        <td width="7%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >处理人</div></td>
        <td width="6%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >基本操作</div></td>
      </tr>
      <tr>

        
<% 
if(total!=0){
 while (i<pageSize &&!rs.isAfterLast())
{
        String knowid=rs.getString("knowid");
        String description=rs.getString("description");
        String solve=rs.getString("solve");
        String time=rs.getString("time");
        String name=rs.getString("name");
        
%><tr><td height="20" bgcolor="#FFFFFF"><div align="center"><input type="checkbox" name="checkboxrj"  value=<%=knowid%>></div></td> 
<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'><font title=" <%=description%>"><%=description %></font></div></td>  
<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;'  onmouseover='changeTitle(this)'><font title=" <%=solve%>"><%=solve%></font>  </div></td>
<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;'  onmouseover='changeTitle(this)'><%=time%></div></td>
<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;'  onmouseover='changeTitle(this)'><%=name%></div></td>
<td height='20' bgcolor='#FFFFFF' class='STYLE6'><div align='center'><span class='STYLE21'><a href="zsbj.jsp?id=<%=knowid%>">编辑</a></span></div></td></tr>
<% 
rs.next();
i++;
}
rs.close();}
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
{out.println("<td class='STYLE22'><div align='center'><a href=zsk.jsp?list_notice="+ (list_notice+1) +"  height='15'>[下一页]</div></td></a>") ;}                   
if(list_notice > 1)
{out.println("<td class='STYLE22'><div align='center'><a href=zsk.jsp?list_notice="+ (list_notice-1) +"  height='15'>[上一页]</div></td></a>") ;}
out.println("<td class='STYLE22'><div align='center'><a href=zsk.jsp?list_notice="+1+"  height='15'>『首页』</div></td></a>") ;
out.println("<td class='STYLE22'><div align='center'><a href=zsk.jsp?list_notice="+pageCount+"  height='15'>『尾页』</div></td></a>") ;
%>
            <td width="37" class="STYLE22"><div align="center">转到</div></td>
            <td width="22"><div align="center">
              <input type="text" name="textfield" id="textfield"  style="width:20px; height:12px; font-size:12px; border:solid 1px #7aaebd;"/>
            </div></td>
            <td width="22" class="STYLE22"><div align="center">页</div></td>
            <td width="30" class="STYLE22"><input type="button" onClick="rjzd();" value="确定" width="20" height="15" /></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
 </form>
 <%
 String code=request.getParameter("code");
 if(code!=null){
 String[] id=request.getParameterValues("checkboxrj"); 

if(id==null)
{%> <script>alert("请选择要删除的对象！");window.location="zsk.jsp";</script> <%}
else{
for(int j=0;j<id.length;j++)
{
   int rtn=stmt.executeUpdate("delete from knowledge where knowid="+id[j]+"");
}
%> <script>alert("删除成功！");window.location="zsk.jsp";</script> <%
} 
}%>
</body>
