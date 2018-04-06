<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<link rel="stylesheet" type="text/css" href="css1/bootstrap-responsive.min.css">
<link rel="stylesheet" type="text/css" href="css1/bootstrap.min.css">
<script src="js1/jquery.js"></script>
<script src="js1/bootstrap.min.js"></script>
<style type="text/css">
/* 公共样式 S */
body{margin:20px 20px 20px 20px}
h1, h2, h3, .masthead p, .subhead p, .marketing h2, .lead {font-family: "Helvetica Neue",Helvetica,Arial,"Microsoft Yahei UI","Microsoft YaHei",SimHei,"宋体",simsun,sans-serif;font-weight: normal;}
/* 公共样式 E */
/* 用于栅格系统示例的样式 S */
.show-grid [class*="span"] {
    background-color: #EEEEEE;
    border-radius: 3px 3px 3px 3px;
    line-height: 40px;
    min-height: 40px;
    text-align: center;
}
.show-grid {
    margin-bottom: 20px;
    margin-top: 10px;
}
.show-grid [class*="span"]:hover {
    background-color: #DDDDDD;
}
.show-grid [class*="span"] [class*="span"] {
    background-color: #CCCCCC;
}
.show-grid .show-grid [class*="span"] {
    margin-top: 5px;
}
.show-grid [class*="span"] [class*="span"] [class*="span"] {
    background-color: #999999;
}
/* 用于栅格系统示例的样式 E */
/* 用于表达的样式 S */
.bs-docs-example:after {
    background-color: #F5F5F5;
    border: 1px solid #DDDDDD;
    border-radius: 4px 0 4px 0;
    color: #9DA0A4;
    content: "软件信息";
    font-size: 12px;
    font-weight: bold;
    left: -1px;
    padding: 3px 7px;
    position: absolute;
    top: -1px;
}
form.bs-docs-example {
    padding-bottom: 19px;
}
.bs-docs-example {
    background-color: #FFFFFF;
    border: 1px solid #DDDDDD;
    border-radius: 4px 4px 4px 4px;
    margin: 15px 0;
    padding: 39px 19px 14px;
    position: relative;
}
.bs-docs-example-submenus .dropup > .dropdown-menu, .bs-docs-example-submenus .dropdown > .dropdown-menu {
    display: block;
    margin-bottom: 5px;
    position: static;
}
.bs-docs-example-submenus {
    min-height: 180px;
}
/* 用于表达的样式 E */
</style>
<%@include file="conn.jsp" %>
<%
 request.setCharacterEncoding("gb2312");
String id=request.getParameter("id");
session.setAttribute("id",id);
String sql="select  * from soft where sid="+id+"";
ResultSet rs=stmt.executeQuery(sql);
rs.next();
String sname=rs.getString("sname");
String stype=rs.getString("stype");
String sinstruction=rs.getString("sinstruction");
%>     
  <form class="bs-docs-example form-horizontal" action="rjbjh.jsp">   
  <table class="table table-bordered">
              <tbody>
                
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">1</td>
                  <td width="15%">软件名称</td>
                  <td width="30%"><input type="text" name="rjmc" value="<%=sname %>"></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">2</td>
                  <td width="15%">软件类型</td>
                  <td width="30%"><select name="rjlx" required>
                  <option value="编程" >编程</option>
                  <option value="数据库" >数据库</option>
                  <option value="图形处理" >图形处理</option>
                  <option value="办公软件" >办公软件</option>                  
                  <option value="视频剪辑" >视频剪辑</option>
                  <option value="游戏娱乐" >游戏娱乐</option>
                  <option value="即时通讯" >即时通讯</option>
                  <option value="系统工具" >系统工具</option>
                  <option value="安全相关" >安全相关</option>              
                  <option value="教学软件" >教学软件</option>
                  <option value="多媒体软件" >多媒体软件</option>
                  </select></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">3</td>
                  <td width="15%" height="78">软件使用说明</td>
                  <td width="30%"><textarea name="rjsysm" rows="10" cols="30" value="<%=sinstruction %>" onclick="this.innerHTML=";"><%= sinstruction%></textarea></td>
                </tr>
                  <tr><td colspan="3">
            <ul class="pager">
                  <input type="hidden" name="code"  value="OK">
              <li><input type="submit" value="保存"></li>&nbsp;&nbsp;
              <li><input type="reset" value="重置"></li>  
            </ul>
          </td></tr>
              </tbody>
         </table>
         </form>
        
         </html>
     
