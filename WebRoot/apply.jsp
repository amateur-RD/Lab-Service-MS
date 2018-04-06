<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date,java.text.*"%>
<%@ page import="com.admin.bean.Tools" %>
<%@ include file="conn.jsp" %>
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

  <form class="bs-docs-example form-horizontal" action="apply.jsp">   
  <table class="table table-bordered">
              <tbody>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">1</td>
                  <td width="15%">教室名称</td>
                  <td width="30%"><select type="text" name="locname" required>
                  <option value="A室">A室</option>
                  <option value="B室">B室</option>
                  <option value="D室">D室</option>
                  <option value="M室">M室</option>
                  <option value="电信展览室">电信展览室</option></td>
                </tr>
                 <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">2</td>
                  <td width="15%">申请使用日期</td>
                  <td width="30%"><input type="date" name="time" required/>              
                  </td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">3</td>
                  <td width="15%">课程节次</td>
                  <td width="30%"><select name="jieci">
                  <option value="1,2节">1,2节</option>
                  <option value="1,2,3节">1,2,3节</option>
                  <option value="3,4节">3,4节</option>
                  <option value="3,4,5节">3,4,5节</option>
                  <option value="上午">上午</option>
                  <option value="5,6节">5,6节</option>
                  <option value="7,8节">7,8节</option>
                  <option value="下午">下午</option>
                  <option value="10,11节">10,11节</option>
                  <option value="10,11,12节">10,11,12节</option>                  
                  </td>
                </tr>
               <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">4</td>
                  <td width="15%">课程</td>
                  <td width="30%"><input type="text" name="course" required/>              
                  </td>
                </tr>
                  <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">5</td>
                  <td width="15%">申请人</td>
                  <td width="30%"><input type="text" name="username" required/>              
                  </td>
                </tr>
                  <tr><td colspan="3">
            <ul class="pager">
              <li><input type="submit" value="保存"></li>&nbsp;&nbsp;
              <li><input type="reset" value="重置"></li>
            </ul>
          </td></tr>
              </tbody>
         </table>    
         </form>
         <% 
            Date date = new Date(); 
            SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); 
            String today = df.format(date); 
            String username1=request.getParameter("username");
            if(username1!=null){
            String locname=Tools.toChinese(request.getParameter("locname"));
            String time=Tools.toChinese(request.getParameter("time"));
            String jieci=Tools.toChinese(request.getParameter("jieci"));
            String course=Tools.toChinese(request.getParameter("course"));
            int rtn=stmt.executeUpdate("insert into labuse(locname,time,applytime,jieci,course,username,state) values('"+locname+"','"+time+"','"+today+"','"+jieci+"','"+course+"','"+Tools.toChinese(username1)+"','被预约')");
            out.print("<script>alert('申请成功！');window.location='search.jsp';</script>");
            }
            %>
         </html>
     
