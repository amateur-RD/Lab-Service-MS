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
   Date date = new Date(); 
   SimpleDateFormat df = new SimpleDateFormat("yy/MM/dd HH:mm:ss"); 
   String today = df.format(date); 
%>
<%
String eventid=request.getParameter("id");
session.setAttribute("id",eventid);
String sql="select  * from event where eventid='"+eventid+"'";
ResultSet rs=stmt.executeQuery(sql);
rs.next();
String username1=rs.getString("username");
String solution=rs.getString("solution");
String perior=rs.getString("perior");
String state =rs.getString("state");
String time =rs.getString("time");
String type =rs.getString("type");
%>     
  <form class="bs-docs-example form-horizontal" action="sjbjh.jsp">   
  <table class="table table-bordered">
              <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">1</td>
                  <td width="15%">解决办法</td>
                  <td width="30%"><textarea name="jjbf" ><%=solution %></textarea></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">2</td>
                  <td width="15%">优先级</td>
                  <td width="30%"><select type="text" name="yxj" style="width:120px;" required>
                  <option value=" "> </option>
                  <option value="高">高</option>
                  <option value="中">中</option>
                  <option value="低">低</option></select></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">3</td>
                  <td width="15%">事件状态</td>
                  <td width="30%"><select type="text" name="sjzt" style="width:120px;" required>
                  <option value=" "> </option>
                  <option value="未解决">未解决</option>
                  <option value="已解决">已解决</option></select></td>
                </tr> 
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">4</td>
                  <td width="15%">事件类型</td>
                  <td width="30%"><input type="text" name="sjlx" value="<%=type%>"required></td>
                </tr>   
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">5</td>
                  <td width="15%">登记时间</td>
                  <td width="30%"><input type="text" name="djsj" value="<%=today%>"required></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">6</td>
                  <td width="15%">处理人</td>
                  <td width="30%"><input type="text" name="clr" value="<%=username1%>"required></td>
                </tr>               
                  <tr><td colspan="3">
                  <input type="hidden" name="id"  value="<%=eventid %>">
            <ul class="pager">
              <li><input type="submit" value="保存"></li>&nbsp;&nbsp;
              <li><input type="reset" value="重置"></li>
             
            </ul>
          </td></tr>
              </tbody>
         </table>    
         </form>
     </body>
     </html>
