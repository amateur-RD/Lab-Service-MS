package com.admin.bean;

import java.io.UnsupportedEncodingException;
public class Tools{
public static String toChinese(String str){
if(str==null) str="";
try{
str=new String(str.getBytes("ISO-8859-1"),"gb2312");
}catch (UnsupportedEncodingException e){
str="";
e.printStackTrace();
}
return str;
}
}