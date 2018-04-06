<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</head>

<body>

<%
String content=request.getParameter("editor1");
if(content!=null&&!content.equals("")){
out.println(content);
}
%>

<form name="testForm" method="post" action="">
<textarea cols="80" id="editor1" name="editor1" rows="10">
在此添加内容
</textarea>
<script type="text/javascript"> 
var editor = CKEDITOR.replace('editor1'); 
</script>
<input type="submit" value="提交"/>
</form>

</body>
</html>

