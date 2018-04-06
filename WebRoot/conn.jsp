<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
String driverClass = "com.mysql.jdbc.Driver" ;
String url="jdbc:mysql://127.0.0.1:3306/ITIL?useUnicode=true&characterEncoding=UTF-8";
String username="root";
String password="";
Class.forName(driverClass);
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt = conn.createStatement();
%>

