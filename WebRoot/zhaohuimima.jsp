<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<%@ page import="com.admin.bean.Tools"%>
<html>
<head>
<LINK href="css/Default.css" type=text/css rel=stylesheet>
<title>找回密码</title>
<style type="text/css">
/* formbox */
.wrong{width:200px;height:20px;line-height:20px;padding-left:30px;background:url(images/error_20100904.gif) no-repeat;position:absolute;font-size:12px;}
.right{width:100px;height:20px;position:absolute;background:url(images/ok_20100904.gif) no-repeat;}
</style>
</head>
<body>
<center><br><br>
<br><h1>找回密码</h1><hr><br>
<a href="login.jsp" ><font color="blue" size="3">返回登陆界面</font></a><br><br>
<form method="post" action="zhaohuimima.jsp">
用&nbsp;户&nbsp;名：<input type="text" name="userName" action-data="text=请输入您登录时的用户名"><br><br>邮&nbsp;&nbsp;&nbsp;&nbsp;箱：<input type="text" name="Mail"><br><br>
姓&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" name="Name"><br>
<br>
<input type="submit" value="提交">
<input type="reset" value="重置">
</form>
<script type="text/javascript">
// 调用示例
var checkobj={
	userName:"userName",   //验证中文汉字
	mail:"Mail" ,    //验证空值
	chinese:"Name",
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
					if(!isChinese(Xvalue)){
						ShowMes(eSrc,"姓名必须为汉字","wrong");
					}else{
						ShowMes(eSrc,"","right");
				}
				break;
				case om.mail:
					if(!isEmail(Xvalue)){
						ShowMes(eSrc,"邮箱地址不正确","wrong");
					}else{
						ShowMes(eSrc,"","right");
				}
				break;
				case om.length :
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
}
</script>
<%
String name=request.getParameter("userName");
if(name!=null)
{%><%@ include file="conn.jsp"%><% 
int i=0;
String h1="";
String h2="";
String h3="";
String mail=request.getParameter("Mail");
String name2=Tools.toChinese(request.getParameter("Name"));
Class.forName(driverClass);
ResultSet rs=stmt.executeQuery("select *from user");
while(rs.next()) {
if(name.equals(rs.getString("userid")))
{
i=1;
h1=rs.getString("email");
h2=rs.getString("username");
if(name2.equals(h2)&&mail.equals(h1))
{
%>
<script language="javascript">window.alert("密码找回成功！密码<%=rs.getString("password")%>");</script>
<a href="login.jsp">返回登陆</a><%
break;}
}
}
if(i==1){
if(!name2.equals(h2)){%>
<script language="javascript">window.alert("姓名与注册时不同！");</script><%}
if(!mail.equals(h1)){%>
<script language="javascript">window.alert("邮箱与注册时不同！");</script><%}
}
if(i==0){%>
<script language="javascript">window.alert("用户名不存在！");</script><%}
stmt.close();
conn.close();
}
%>
</center>
</body>
</html>