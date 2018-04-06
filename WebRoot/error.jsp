<%@ page language="java" import="java.util.*" pageEncoding="GBK" %>
<!doctype html> 
<html>
<head>  
<title>长时间页面无请求</title> 
</head> 
<body> 
<script> 
var t=5;//设定跳转的时间 
setInterval("refer()",1000); //启动1秒定时 
function refer(){ 
if(t==0){ 
location="login.jsp"; //#设定跳转的链接地址 
} 
document.getElementById('show').innerHTML="由于页面长时间未操作，"+t+"秒后跳转到登陆页面,"; // 显示倒计时 
t--; // 计数器递减 
//本文转自： 
}
</script> 
<span id="show"></span> 
</body>
</html>
