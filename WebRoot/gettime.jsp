<%@ page language="java" import="java.sql.*" pageEncoding="GBK"%>
<html>
<head>
<script language="javascript">
function showtime() {
	var s = new Date();
	var time1 = "";
	time1 +=s.getFullYear()+"-";
        time1 +=s.getMonth()+1;
        time1 +="-"+s.getDate()+"  星期"+s.getDay()+"  "+s.getHours()+":";
	if(s.getMinutes() < 10) {
		time1 += "0" + s.getMinutes() + ":";
	} else {
   	 time1 += s.getMinutes() + ":";
	}
	
	if(s.getSeconds() < 10) {
		time1 += "0" + s.getSeconds();
	} else {
   	 time1 += s.getSeconds();
	}

	document.getElementById("t1").innerHTML=time1;
	window.setTimeout("showtime()",1000);//延时1000ms后调用showtime()方法

}
</script>
</head>

<body onLoad="showtime()">	
    <div>
		<div id="t1"></div>
	</div>
</body>
</html>