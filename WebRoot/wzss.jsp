<%@ page contentType="text/html; charset=gb2312"%>
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
<div class="bs-docs-example">
            <form class="bs-docs-example form-horizontal" action="wzssh.jsp">
            <div class="control-group error">
              <label for="inputError" class="control-label">位置ＩＤ</label>
              <div class="controls">
                <input type="text" name="wzid">
              </div>
            </div>
            <div class="control-group info">
              <label for="inputInfo" class="control-label">实验室名称</label>
              <div class="controls">
                <input type="text" name="sysmc">
              </div>
            </div>
            <div class="control-group success">
              <label for="inputSuccess" class="control-label">实验室空间</label>
              <div class="controls">
                <input type="text" name="syskj">
               
              </div>
              </div>
              <div class="control-group error">
              <label for="inputError" class="control-label">实验室描述</label>
              <div class="controls">
                <input type="text" name="sysms">
              <br>
            </div>
            <br>
          
            
           
              <div class="control-group success">
              <label for="inputSuccess" class="control-label"></label>
            <div class="controls">
              <button  style="max-width: 217px; " class="btn btn-large btn-block btn-info" type="submit">查询</button>
              </div>
               </div>
           </form>
</div>
<%String sb=request.getParameter("sb");
if(sb!=null)
{
%>

            <div class="bs-docs-example">
            <div class="alert alert-info">
              <button data-dismiss="alert" class="close" type="button">×</button>
              <strong>无效信息!</strong> 查无此条，请重新输入。
            </div>
          </div>  
          
<%}%>