<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.admin.bean.Tools"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.io.*"%>
<%@ include file="conn.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:directive.page import="org.apache.commons.fileupload.disk.*"/>
<jsp:directive.page import="org.apache.commons.fileupload.*"/>
<jsp:directive.page import="org.apache.commons.fileupload.servlet.*"/>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<script language="javascript">
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BootStrap  Demo</title>
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
</head>
<body>
  <form class="bs-docs-example form-horizontal" action="rjtj.jsp" method="post" enctype="multipart/form-data" >   
  <table class="table table-bordered">
              <tbody>            
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">1</td>
                  <td width="15%">软件名称</td>
                  <td width="30%"><input type="text" name="rjmc" required/></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">2</td>
                  <td width="15%">软件类型</td>
                  <td width="30%"><select name="rjlx" required>
                  <option value="编程" selected>编程</option>
                  <option value="数据库" selected>数据库</option>
                  <option value="图形处理" selected>图形处理</option>
                  <option value="办公软件" selected>办公软件</option>                  
                  <option value="视频剪辑" selected>视频剪辑</option>
                  <option value="游戏娱乐" selected>游戏娱乐</option>
                  <option value="即时通讯" selected>即时通讯</option>
                  <option value="系统工具" selected>系统工具</option>
                  <option value="安全相关" selected>安全相关</option>              
                  <option value="教学软件" selected>教学软件</option>
                  <option value="多媒体软件" selected>多媒体软件</option></select>
                  </td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">3</td>
                  <td width="15%" height="78">软件使用说明</td>
                  <td width="30%"><textarea name="rjsysm" rows="10" cols="30" required></textarea></td>
                </tr>
                <tr onMouseOver="this.style.background='E7F1FA'" onMouseOut="this.style.background=''">
                  <td width="4%">4</td>
                  <td width="15%">上传使用教程文档</td>
                  <td width="30%"><input type="file" name="upfile" border=“1”/></td>
                </tr>
                 <tr><td colspan="3">
            <ul class="pager">
              <li><input type="submit" value="保存"></li>&nbsp;&nbsp;<li><input type="reset" value="重置"></li>
            </ul>
          </td></tr>
              </tbody>
         </table>    
     <%
     response.setCharacterEncoding("UTF-8");
     request.setCharacterEncoding("UTF-8");
     //先判断是否是文件上传类型enctype="multipart/form-data"
     boolean isFileUpload = ServletFileUpload.isMultipartContent(request);
//如果是文件上传类型
     if(isFileUpload){
//得到文件上传工厂
	FileItemFactory factory = new DiskFileItemFactory();
	//处理文件上传核心类
	ServletFileUpload fileUpload = new ServletFileUpload(factory);
	//设置文件上传类的编码格式
	fileUpload.setHeaderEncoding("UTF-8");
	// 集合数据 :  FileItem对象 注意: 每一个表单域 对应一个 FileItem对象(封装)List<FileItem> fileItemList = fileUpload.parseRequest(request);
	Iterator items; 
	items = fileUpload.parseRequest(request).iterator();   
	//得到服务器的根路径
	String rootPath = request.getRealPath("/");
	//遍历fileItemList
			//得到文件名
	String fileName =null;
	String a="3",b="3",c="3";
	while (items.hasNext()) {
	     FileItem item = (FileItem) items.next();   
		//如果这个文本域是文件类型的
		if(!item.isFormField()){
		//得到文本域的value值，即 路径+文件名
		String value = item.getName();
		//得到上传的文件类型
        //String fileType = fileName.substring(fileName.lastIndexOf("."));
        fileName = new java.util.Date().getTime()+"";
		//指定文件存放路径
		String realPath = rootPath+"/"+"upload";
		//定义文件存放的目录，注意 目录也是文件
		File file = new File(realPath);
		//如果目录不存在
		if(!file.isDirectory()){
			//创建文件上传目录
			file.mkdirs();
		}
		File newFile = new File(realPath+"/"+fileName);
		//向newFile文件中写入数据
		item.write(newFile);
		}else{
		if("rjmc".equals(item.getFieldName())){
		    a=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8").trim();
		    }
		if("rjlx".equals(item.getFieldName())){
		    b=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8").trim();
		   }
		if("rjsysm".equals(item.getFieldName())){
		    c=new String(item.getString().getBytes("ISO-8859-1"),"UTF-8").trim();
		 }
      }
      }
      int rtn=stmt.executeUpdate("insert into soft(sname,stype,sinstruction,sfile) values('"+a+"','"+b+"','"+c+"','"+fileName+"')");
      out.print("<script>alert('添加成功！');window.location='1rjxx.jsp';</script>");
      }
     %>
     </body>
     </html>
