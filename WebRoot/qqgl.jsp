<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.admin.bean.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date,java.text.*"%>
<script src="layer/jquery-1.11.1.min.js"></script>
<script language="javascript" >
function openLogin(id)
{document.getElementById("bbb").value=id;
document.getElementById("win").style.display="";
//document.write(id); 

}
function closeLogin()
{document.getElementById("win").style.display="none";}
</script>
<script src="layer/layer.min.js"></script>
<%  
   Date date = new Date(); 
   SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); 
   String today = df.format(date); 
  %>
<%String name1=(String)session.getAttribute("username1"); 
%>
    
<script language="javascript" >
function qqglss()
{ document.form1.action="qqglss.jsp";
document.form1.submit();}
function qqtj()
{ document.form1.action="qqtj.jsp";
document.form1.submit();}
function qqsc()
{ document.form1.action="qqgl.jsp";
document.form1.submit();}
function qqzd()
{ document.form1.action="qqgl.jsp";
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


<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css1/info.css"/>
</head>
<body>
<form name="form1" method="post" ><%@include file="conn.jsp" %>
<% 

String sql1="select  count(*) as total from request";
ResultSet rs1=stmt.executeQuery(sql1);
rs1.next();
int total=rs1.getInt("total"); 
String sql="select  * from request";
ResultSet rs=stmt.executeQuery(sql);
rs.last();
String type1=(String)session.getAttribute("type1");
if(type1!=null){
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
                <td width="94%" valign="bottom"><span class="STYLE1">请求管理</span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
              <input type="hidden" name="code" value="OK">
              <input type="checkbox" name="checkboxall" onclick=sel('checkboxrj') >
              全选      &nbsp;&nbsp;
              <input type="image" src="images/add.gif" width="10" height="10" onClick="qqtj()"> 添加   &nbsp; 
              <input type="image" src="images/del.gif" width="10" height="10" onClick="qqsc()" > 删除  &nbsp;&nbsp;</span><span class="STYLE1"> &nbsp;</span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce"  style="table-layout:fixed">
    <tr><td class="STYLE23">&nbsp;&nbsp;&nbsp;紧急程度:<select name="jjcd" style="width:60px;"><option value=""></option><option value="普通">普通</option><option value="紧急">紧急</option></select>&nbsp;&nbsp;请求人：<input name="qqr" type="text" style="width:90px;"/>&nbsp;&nbsp;请求时间段：<input name="starttime" type="date"/>—<input name="endtime" type="date"/>&nbsp;<input type="button" onClick="qqglss();" value="筛选" width="20" height="15" /></td></tr>
    </table>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce"  style="table-layout:fixed">
      <tr>
        <td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">
          <input type="checkbox" name="checkboxall2" onclick=sel('checkboxrj') />
        </div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >请求编号</div></td>
        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >请求描述</div></td>
        <td width="14%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >紧急程度</div></td>
        <td width="14%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >请求人</div></td>
        <td width="16%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >请求时间</div></td>
        <td width="16%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >请求状态</div></td>
        <td width="16%" height="20" bgcolor="d3eaef" class="STYLE7"><div  align='center' >操作</div></td>
      </tr>
      <tr>

        
<% 
if(total!=0){
 while (i<pageSize &&!rs.isAfterLast())
{
        String reqid=rs.getString("reqid");
        String reqdescribe=rs.getString("reqdescribe");
        String emergency=rs.getString("emergency");
        String username1=rs.getString("reqname");
        String reqtime=rs.getString("reqtime");
        String state =rs.getString("state");        
        String hsnumber=rs.getString("hsnumber");
        String locname=rs.getString("locname");
        String reqdetail=rs.getString("reqdetail");
        String sysname=rs.getString("sysname");
        String softname=rs.getString("softname");
        if(state.equals((String)"已解决"))
        {
        state="<font color=#F80000><strong>"+state+"</strong></font>";
        }
        if(emergency.equals((String)"紧急")&&state.equals((String)"已登记"))
        {
        emergency="<font color=#00C800>"+emergency+"</font>";
        }
        
 
%>
<tr><td height="20" bgcolor="#FFFFFF">
<div  align="center"><input type="checkbox" name="checkboxrj"  value=<%=reqid%>></div></td>
<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> 
<a href="javascript:openLogin(<%=reqid %>);"><%=reqid %></a></div></td> 
<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;'  onmouseover='changeTitle(this)'><font title=" <%=reqdescribe%>"><%=reqdescribe%></font>  </div></td>
<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> <%=emergency%></div></td>
<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> <%=username1%></div></td>
<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> <%=reqtime%></div></td>
<td height='20' bgcolor='#FFFFFF' class='STYLE7'><div align='center' style='white-space:nowrap;' title='' onmouseover='changeTitle(this)'> <%=state%></div></td>
<td height='20' bgcolor='#FFFFFF' class='STYLE6'><div align='center'><span class='STYLE21'><%if(type1.equals("管理员")||type1.equals("主任")) {%><a href="qqbj.jsp?id=<%=reqid%>">编辑</a><%}else{ %>编辑<%} %></span></div></td></tr>
<% 
rs.next();
i++;
}
}
//rs.close();
 %>
  </table></td>
  </tr>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="33%"><div align="left"><span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共有<strong><%=total%> </strong> 条记录，当前第<strong> <%=list_notice

%></strong> 页，共 <strong><%=pageCount%></strong> 页</span></div></td>
        <td width="67%"><table width="312" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
<% 
if(list_notice < pageCount)
{out.println("<td class='STYLE22'><div align='center'><a href=qqgl.jsp?list_notice="+ (list_notice+1) +"  height='15'>[下一页]</div></td></a>") ;}                   
if(list_notice > 1)
{out.println("<td class='STYLE22'><div align='center'><a href=qqgl.jsp?list_notice="+ (list_notice-1) +"  height='15'>[上一页]</div></td></a>") ;}
out.println("<td class='STYLE22'><div align='center'><a href=qqgl.jsp?list_notice="+1+"  height='15'>『首页』</div></td></a>") ;
out.println("<td class='STYLE22'><div align='center'><a href=qqgl.jsp?list_notice="+pageCount+"  height='15'>『尾页』</div></td></a>") ;
%>
            <td width="37" class="STYLE22"><div align="center">转到</div></td>
            <td width="22"><div align="center">
              <input type="text" name="list_notice" id="list_notice"  style="width:20px; height:12px; font-size:12px; border:solid 1px #7aaebd;"/>
            </div></td>
            <td width="22" class="STYLE22"><div align="center">页</div></td>
            <td width="30" class="STYLE22"><input type="button" onClick="qqzd();" value="确定" width="20" height="15" /></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
 </form>

 <div id=win style="display:none; POSITION:absolute; left:50%; top:50%; width:300px; height:200px; margin-left:-300px; margin-top:-200px; border:1px solid #888; background-color:#E9F3FC;">
<input type="image" src="images/fanhui.gif" width="20" height="20" onClick="closeLogin()"  class="btns" style="right:0px;">
<form  name="form" action="qqgl.jsp" method="post">
<table>
<tr><td width="15%"><input id=bbb type="hidden" name="qqid" value="aaa" style="background-color:#E9F3FC;">优先级别</td>
                  <td width="30%"><select name="perior" required>
                  <option value="高" >高</option>
                  <option value="中" >中</option>
                  <option value="低" >低</option>
                  </select></td></tr>
     <tr><td width="15%">分&nbsp;&nbsp;&nbsp;&nbsp;类</td>
                  <td width="30%"><select name="type" required>
                  <option value="办公设备 " >办公设备 </option>
                  <option value="办公软件 " >办公软件 </option>
                  <option value="网络相关 " >网络相关 </option>
                  </select></td>  </tr> 
 <tr><td width="15%" >登记时间</td>
                  <td width="30%"><input type="text" name="evedate" value="<%=today%>" required></td></tr>             
    <tr><td colspan="3" align="center">  
                      
<input type="submit" value="转为事件"></td></tr>
</table>
</form>
 <%
 String sb=request.getParameter("sb");
 if(sb==null){
   String evedate=request.getParameter("evedate");
   String reqid=request.getParameter("qqid");
   String perior=Tools.toChinese(request.getParameter("perior"));
   String type=Tools.toChinese(request.getParameter("type"));
 String code=request.getParameter("code");
 if(code!=null)
 {
 String[] id=request.getParameterValues("checkboxrj"); 

   if(id==null)
   {%> <script>alert("请选择要删除的对象！");window.location="qqgl.jsp";</script> <%}
   else{
       for(int j=0;j<id.length;j++)
       {
   int rtn=stmt.executeUpdate("delete from request where reqid="+id[j]+"");
       }
%> <script>alert("删除成功！");window.location="qqgl.jsp";</script> 
<%    } 
}
if(reqid!=null)
{
int rtn1=stmt.executeUpdate("update request set state='已登记' where reqid="+reqid+"");
int rtn2=stmt.executeUpdate("insert into event(reqid,username,solution,perior,state,time,type) values('"+reqid+"','"+name1+"','...','"+perior+"','未解决','"+evedate+"','"+type+"')");
//int rtn3=stmt.executeUpdate("insert into event(describe) select reqdescribe from request where reqid="+reqid+"");

%> <script>alert("处理成功！");window.location="qqgl.jsp";</script> <%}
}
else{%>

            <div class="bs-docs-example">
            <div class="alert alert-info">
              <button data-dismiss="alert" class="close" type="button">×</button>
              <strong>无效信息!</strong> 查无此条，请重新输入。
            </div>
          </div>  
<%}}else{%><script>alert("身份验证操作过时，请重新登陆！");</script>请点击退出系统！<%}
%>
</body>

 </html>

