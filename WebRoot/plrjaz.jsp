<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="jxl.Sheet" %>
<%@ page import="jxl.Workbook" %>
<%@ page import="com.admin.bean.*" %>
<%@ include file ="conn.jsp"%>
<jsp:directive.page import="org.apache.commons.fileupload.disk.*"/>
<jsp:directive.page import="org.apache.commons.fileupload.*"/>
<jsp:directive.page import="org.apache.commons.fileupload.servlet.*"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    

  </head>
  
  <body>
<%
try{
    boolean isFileUpload = ServletFileUpload.isMultipartContent(request);
    if(isFileUpload){
    FileItemFactory factory = new DiskFileItemFactory();
	//处理文件上传核心类
	ServletFileUpload fileUpload = new ServletFileUpload(factory);
	//设置文件上传类的编码格式
	fileUpload.setHeaderEncoding("UTF-8");
	// 集合数据 :  FileItem对象 注意: 每一个表单域 对应一个 FileItem对象(封装)List<FileItem> fileItemList = fileUpload.parseRequest(request);
	Iterator items; 
	items = fileUpload.parseRequest(request).iterator(); 
	String rootPath = request.getRealPath("/");
	//遍历fileItemList
			//得到文件名
	String fileName="";
	while (items.hasNext()) {
	     FileItem item = (FileItem) items.next();   
		//如果这个文本域是文件类型的
		if(!item.isFormField()){
		//得到文本域的value值，即 路径+文件名
		String value = item.getName();
File file=new File(value);
jxl.Workbook rwb=null;
InputStream is=new FileInputStream(file);
rwb=Workbook.getWorkbook(is);
//String createTime=DateUtil.getDateTime( "yyyy-MM-dd   HH:mm ",new Date()).toString();
Sheet rs=rwb.getSheet(0);
int rsRows=rs.getRows();
for(int i=1;i<rsRows;i++){
String cell1=rs.getCell(0,i).getContents();
String cell2=rs.getCell(1,i).getContents();
String cell3=rs.getCell(2,i).getContents();
String cell4=rs.getCell(3,i).getContents();
String cell5=rs.getCell(4,i).getContents();
if(cell1!=""&&cell2!=""&&cell3!=""&&cell4!=""&&cell5!=""){
        		  int rtn=stmt.executeUpdate("insert into softinstall (hsid,sysid,sid,time,userid) values('"+cell1+"','"+cell2+"','"+cell3+"','"+cell4+"','"+cell5+"')");
        	  }
out.print("<script>alert('导入成功！');window.location='rjazxx.jsp';</script>");
}
}
}
}else{%><script>alert("ERROR!");</script><%}
}catch(Exception e){
out.print(e.getMessage());
}
 %> 
  </body>
</html>
