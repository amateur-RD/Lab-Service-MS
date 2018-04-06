<%@ page language="java" import="java.util.*" pageEncoding="GB2312" errorPage="error.jsp"%>
<%@ page import="java.sql.*"%>
<%@ include file="conn.jsp"%>
<%@ page import="com.admin.bean.Tools"%>
<!DOCTYPE HTML >
<HEAD>
<TITLE>用户登录</TITLE>
<LINK href="css/Default.css" type=text/css rel=stylesheet>
<LINK href="css/xtree.css" type=text/css rel=stylesheet>
<LINK href="css/User_Login.css" type=text/css rel=stylesheet>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.6000.16674" name=GENERATOR>
<link rel="apple-touch-icon" href="/lab/templates/yoo_evolution/apple_touch_icon.png" />
</HEAD>
<html>
<BODY id=userlogin_body>
<DIV></DIV>
<form method="post" action="login.jsp" name="loginForm">
<script language="javascript"> 
function loadimage(){ 
document.getElementById("randImage").src = "image.jsp?"+Math.random(); 
} </script> 
<DIV id=user_login>
<DL>
  <DD id=user_top>
  <UL>
    <LI class=user_top_l></LI>
    <LI class=user_top_c></LI>
    <LI class=user_top_r></LI></UL>
    </DD>
  <DD id=user_main>
  <UL>
    <LI class=user_main_l></LI>
    <LI class=user_main_c>
    <DIV class=user_main_box>
    <UL>
      <LI class=user_main_text>用户名： </LI>
      <LI class=user_main_input><INPUT class=TxtUserNameCssClass id=UserName 
      type="text" name="userName"> </LI></UL>
    <UL>
      <LI class=user_main_text>密 码： </LI>
      <LI class=user_main_input><INPUT class=TxtPasswordCssClass id=Password 
      type="password" name="userPass" > </LI></UL>
    <UL>
     <LI class=user_main_text>验证码： </LI>
     <LI class=user_main_input><input type="text" name="rand" size="6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img alt="code..." name="randImage" id="randImage" src="image.jsp" width="60" height="21" border="1" align="absmiddle">
     <a href="javascript:loadimage();"style="width: 40px; position: relative; line-height: 14px; color: blue; cursor: pointer; "><font size=2;class=pt95>看不清换一张</font></a><br></LI></UL><UL><LI><INPUT TYPE="radio" value="学生" name="type"> 学生</LI><LI><INPUT TYPE="radio" value="教师" name="type"> 教师</LI><LI><INPUT TYPE="radio" value="管理员" name="type" checked> 管理员</LI><LI><INPUT TYPE="radio" value="主任" name="type"> 主任</LI></UL></DIV></LI><LI class=user_main_r><INPUT class=IbtnEnterCssClass id=IbtnEnter 
    style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px" 
    onclick='javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("IbtnEnter", "", true, "", "", false, false))' 
    type=image src="images/user_botton.gif" name=IbtnEnter> </LI></UL>
  <DD id=user_bottom>
  <UL>
    <LI class=user_bottom_l></LI>
    <LI class=user_bottom_c><SPAN style="MARGIN-TOP: 40px">如果您忘记了登陆密码请点此， <A 
    href="zhaohuimima.jsp">找回密码</A> 。</SPAN> </LI>
    <LI class=user_bottom_r></LI></UL></DD></DL></DIV><SPAN id=ValrUserName 
style="DISPLAY: none; COLOR: red"></SPAN><SPAN id=ValrPassword 
style="DISPLAY: none; COLOR: red"></SPAN><SPAN id=ValrValidateCode 
style="DISPLAY: none; COLOR: red"></SPAN>
<DIV id=ValidationSummary1 style="DISPLAY: none; COLOR: red"></DIV>

<DIV>
</DIV>
</FORM>
<%
String name=request.getParameter("userName");
session.setAttribute("userid1",name);
if(name!=null){
int i=0;
String rand = (String)session.getAttribute("rand"); 
String input = request.getParameter("rand");
if(rand.equals(input)){ 
String path=request.getRealPath("");
String pass=request.getParameter("userPass");
String type=Tools.toChinese(request.getParameter("type"));
session.setAttribute("passl",pass);
ResultSet rs = stmt.executeQuery("select *from user");
while(rs.next()){
String mm=rs.getString("userid");
if(name.equals(mm)&&pass.equals(rs.getString("password"))&&type.equals(rs.getString("type")))
{ session.setAttribute("username1",rs.getString("username"));
  session.setAttribute("telephone1",rs.getString("telephone"));
  session.setAttribute("email",rs.getString("email"));
  session.setAttribute("type1",type);
  
  i=1;
  %><jsp:forward page="main.jsp"/><%
break;
}
}
if(i==0)
{%><script language="javascript">window.alert("用户名或密码错误！或者用户类型不符！");</script><%}
rs.close();
stmt.close();
conn.close();
}
else{out.print("<script>alert('请输入正确的验证码！');location.href='login.jsp';</script>");}
}
%>
</center>
</BODY>
</HTML>
