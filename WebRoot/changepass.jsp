<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
/* formbox */
.wrong{width:200px;height:20px;line-height:20px;padding-left:30px;background:url(images/error_20100904.gif) no-repeat;position:absolute;font-size:12px;}
.right{width:100px;height:20px;position:absolute;background:url(images/ok_20100904.gif) no-repeat;}
#thisform fieldset {
border: 1px solid #ccc;
padding: 0 20px;
}
#thisform legend {
font-family: arial, sans-serif;
font-weight: bold;
font-size: 90%;
color: #666;
background: #eee;
border: 1px solid #ccc;
border-bottom-color: #999;
border-right-color: #999;
padding: 4px 8px;
}
</style>
</head>
<body>&nbsp; 
<br><br><br>
<center>
<form method="post" action="changepass.jsp" id="thisform">
<fieldset>
<legend>change password</legend>
<h2>修改密码</h2>
<table  align="center" width="259" height="127">
<tr><td>用户名：</td><td><input type="text" name="username" id="username" ></td></tr>
<tr><td>原密码：</td><td><input type="password"  name="userPass"></td></tr>
<tr><td>新密码：</td><td><input type="password"  name="userPass1"></td></tr>			
<tr><td>确认密码：</td><td><input type="password"  name="userPass2"></td></tr>
</table>	
<br>
<input type="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置">
</fieldset>	
</form>
<br>
<script type="text/javascript">
// 调用示例
var checkobj={
	chinese:"username",   //验证中文汉字
	userPass:"userPass",    //验证空值
	length1:"userPass1",
	length2:"userPass2"
}
XformCheck(document.forms[0],checkobj);
test();
/*
descript : XformCheck;
author   : popper.w
date     : 2008-6-22
@pram xfromElement 需要检测的form对象
@pram checkobj 设置需要检测的项
默认有mail（邮件地址）、phone（手机或固定电话）、num（数字）、chinese（汉字）、empty（是否为空）、length（长度）、url（url地址合法）等检测
//例如：如果某一项name为"xxx"需要检测email格式，则给checkobj中添加{mail:"xxx"}，如果仅仅是检测是否为空，则直接添加{xxx,"xxx"}即可*/
function XformCheck(xfromElement,checkobj){
	var om={};
	if(checkobj){
		om=checkobj
	}
	if(!xfromElement){
		return false;
	}
		for(var o in checkobj){
			xfromElement[checkobj[o]].onblur=function(e){
				e=window.event||e;
				var eSrc=e.srcElement||e.target;
				var Xvalue=trim(this.value);
				if(isEmpty(Xvalue)){
					ShowMes(eSrc,"此项不能为空","wrong");
				}else{
					switch(this.name){
						case om.chinese:
					if(isChinese(Xvalue)){
						ShowMes(eSrc,"用户名必须不能有汉字","wrong");
					}else{
						ShowMes(eSrc,"","right");
				}
				break;
				case om.length1:
				if(!isProperLen(Xvalue)){
					ShowMes(eSrc,"长度不正确","wrong");
				}else{
					ShowMes(eSrc,"","right");
				}
				break; 
				case om.length2:
				if(!isProperLen(Xvalue)){
					ShowMes(eSrc,"长度不正确","wrong");
				}else{
					ShowMes(eSrc,"","right");
				}
				break;   
				default :
					ShowMes(eSrc,"","right")
			}
			}
	}
}
/*判断为空*/
function isEmpty(o){
	return o==""?true:false;
}
/*判断是否为合适长度 6-32 位*/
function isProperLen(o){
	var len=o.replace(/[^\x00-\xff]/g,"11").length;
	if(len>20||len<6){
		return false;
	}else{
		return true;
	}
}
function isChinese(o){
	var reg=/^[\u4E00-\u9FA5]+$/;
	return reg.test(o);
}
/*去除空白字符*/
function trim(str){
	return str.replace(/(^\s*)|(\s*$)/g, "");
}
function ShowMes(o,mes,type){
	if(!o.ele){
		var Xmes=document.createElement("div");
		document.body.appendChild(Xmes);
		o.ele=Xmes;
	}
	o.ele.className=type;
	o.ele.style.display="block";
	o.ele.style.left=(XgetPosition(o).x+220)+"px";
	o.ele.style.top=XgetPosition(o).y+"px";
	o.ele.innerHTML=mes;
	}
}
function XgetPosition(e){
	var left = 0;
	var top  = 0;
	while(e.offsetParent){
		left += e.offsetLeft;
		top  += e.offsetTop;
		e= e.offsetParent;
	}
	left += e.offsetLeft;
	top  += e.offsetTop;
	return {
		x:left, y:top
	};
}</script>
<%String name=request.getParameter("username");
if(name!=null)
{
String driverClass = "com.mysql.jdbc.Driver" ;
String url="jdbc:mysql://127.0.0.1:3306/ITIL";
String username="root";
String password="";
Class.forName(driverClass);
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt = conn.createStatement();
int i=0;
String pass=request.getParameter("userPass");
String pass1=request.getParameter("userPass1");
String pass2=request.getParameter("userPass2");
ResultSet rs=stmt.executeQuery("select *from user");
if(pass1.equals(pass2)&&pass1!="")
{while(rs.next()) {
if(name.equals(rs.getString("userid"))&&pass.equals(rs.getString("password")))
{int rtn=stmt.executeUpdate("update user set userid='"+name+"',password='"+pass1+"' where userid='"+name+"'");
i=1;
%>
<script language="javascript">window.alert("密码修改成功！");</script><%
break;}
}
}
if(!pass1.equals(pass2)){%><script language="javascript">window.alert("两次密码输入不一样！");</script><%}
if(pass1.equals(pass2)&&pass1!=""&&i==0)
{%><script language="javascript">window.alert("用户名或者密码错误，请核实填写！");</script><%}
stmt.close();
conn.close();
}
%>
</center>
</body>
</html>