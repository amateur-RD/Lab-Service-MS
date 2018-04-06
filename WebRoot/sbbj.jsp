<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="conn.jsp"%>
<%@ page import="java.util.Date,java.text.*"%>
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

<body>
<%
String eqid=request.getParameter("id");
session.setAttribute("id",eqid);
String sql="select  * from equipment where eqid='"+eqid+"'";
ResultSet rs=stmt.executeQuery(sql);
rs.next();
String eqname=rs.getString("eqname");
String eqtype=rs.getString("eqtype");
String eqdetail=rs.getString("eqdetail");
String eqtime=rs.getString("eqtime");
String eqnum=rs.getString("eqnum");
%>     
  <form class="bs-docs-example form-horizontal" action="sbbjh.jsp">   
  <table class="table table-bordered">
              <tbody>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">1</td>
                  <td width="15%">设备ＩＤ</td>
                  <td width="30%"><input type="text" name="sbid" value="<%=eqid%>" required></td>
                </tr>
                
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">2</td>
                  <td width="15%">设备名称</td>
                  <td width="30%"><input type="text" name="sbmc" value="<%=eqname %>"></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">3</td>
                  <td width="15%">设备类型</td>
                  <td width="30%"><select type="text" name="sblx" style="width:120px;" required>
                  <option value="PC">PC</option>
                  <option value="服务器">服务器</option>
                  <option value="交换机">交换机</option>
                  <option value="投影仪">投影仪</option>
                  <option value="其他实验零件">其他实验零件</option>
                  </select></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">4</td>
                  <td width="15%" height="78">设备细节</td>
                  <td width="30%"><textarea name="sbxj" ><%=eqdetail %></textarea></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">5</td>
                  <td width="15%" >时间</td>
                  <td width="30%"><input type="time" name="sj" value="<%=eqtime %>"></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">6</td>
                  <td width="15%">设备数量</td>
                  <td width="30%"><input type="number" name="sbsl" value="<%=eqnum %>"></td>
                </tr>
                  <tr><td colspan="3">
                  <input type="hidden" name="id"  value="<%=eqid %>">
            <ul class="pager">
              <li><input type="submit" value="保存"></li>&nbsp;&nbsp;
              <li><input type="reset" value="重置"></li>
             
            </ul>
          </td></tr>
              </tbody>
         </table>    
         </form>
     </body>
