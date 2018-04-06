<%@ page language="java" import="java.util.*" pageEncoding="GBK" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style>
 a:link {    color:#0033FF;    text-decoration:none;    }   
 a:visited {    color:#0033FF;    text-decoration:none;    }    
 a:hover {    color:#0033FF;    text-decoration:none;    }    
 a:active {    color:#0033FF;    text-decoration:none;    }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/chili-1.7.pack.js"></script>
<script type="text/javascript" src="js/jquery.easing.js"></script>
<script type="text/javascript" src="js/jquery.dimensions.js"></script>
<script type="text/javascript" src="js/jquery.accordion.js"></script>
<script language="javascript">
	jQuery().ready(function(){
		jQuery('#navigation').accordion({
			header: '.head',
			navigation1: true, 
			event: 'click',
			fillSpace: true,
			animated: 'bounceslide'
		});
	});
</script>
<style type="text/css">
<!--
body {
	margin:0px;
	padding:0px;
	font-size: 12px;
}
#navigation {
	margin:0px;
	padding:0px;
	width:147px;
}
#navigation a.head {
	cursor:pointer;
	background:url(images/main_34.gif) no-repeat scroll;
	display:block;
	font-weight:bold;
	margin:0px;
	padding:5px 0 5px;
	text-align:center;
	font-size:12px;
	text-decoration:none;
}
#navigation ul {
	border-width:0px;
	margin:0px;
	padding:0px;
	text-indent:0px;
}
#navigation li {
	list-style:none; display:inline;
}
#navigation li li a {
	display:block;
	font-size:12px;
	text-decoration: none;
	text-align:center;
	padding:3px;
}
#navigation li li a:hover {
	background:url(images/tab_bg.gif) repeat-x;
		border:solid 1px #adb9c2;
}
-->
</style>
</head>
<body>
<div  style="height:100%;">
  <ul id="navigation">
    <li> <a class="head">设备管理</a>
      <ul>
        <li><a href="1rjxx.jsp" target="rightFrame">软件信息</a></li>
        <li><a href="1yjxx.jsp" target="rightFrame">硬件信息</a></li>
        <li><a href="1xtxx.jsp" target="rightFrame">系统信息</a></li>
        <li><a href="1sbxx.jsp" target="rightFrame">设备信息</a></li>
        <li><a href="wzxx.jsp" target="rightFrame">位置信息</a></li>
        <li><a href="rjazxx.jsp" target="rightFrame">软件安装信息</a></li>
      </ul>
    </li>
    <li> 
    <a class="head">事件管理</a>
      <ul>
        <li><a href="wttj.jsp" target="rightFrame">事件请求</a></li>
        <li><a href="wtxx.jsp" target="rightFrame">查看/修改问题</a></li>       
      </ul>
    </li>
    <li> 
    <a class="head">问题（知识库）管理</a>
      <ul>
        <li><a href="jltj.jsp" target="rightFrame">添加问题</a></li>
        <li><a href="jlxx.jsp" target="rightFrame">查看/修改问题</a></li>
      </ul>
    </li>
    <li> <a class="head">实验室使用管理</a>
      <ul>
        <li><a href="apply.jsp" target="rightFrame">实验室申请</a></li>
        <li><a href="search.jsp" target="rightFrame">查看实验室使用情况</a></li>
      </ul>
    </li>
    <li> <a class="head">用户反馈</a>
      <ul>
        <li><a href="return.jsp" target="rightFrame">我要提意见</a></li>
      </ul>
    </li>
  </ul>
</div>
</body>
</html>
</html>
