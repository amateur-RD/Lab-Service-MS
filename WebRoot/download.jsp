<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="com.sun.xml.internal.messaging.saaj.util.ByteOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%
//得到你要下载的文件名（由前一个页面传过来）
String fileName = request.getParameter("id");
if(!fileName.equals("null")){
//得到项目在tomcat 中的更路径
String realPath = request.getRealPath("/"); 
//得到文件在服务器中的路径
String path = realPath+ "upload/" + fileName;// 这就是文件所在完整路径
//清空response 所有信息
response.reset(); 
//设置IE浏览器内容类型 表示为 下载
response.setContentType("application/x-download;charset=UTF-8");
//设置IE浏览器的 头
response.setHeader("Content-Disposition","attachment;filename="+ fileName);      
//从服务器上 读取文件
File file=new File(path);    
response.setContentLength(Integer.valueOf(((Long)file.length()).toString()));
//输入流   读取目标文件
FileInputStream  fis=new FileInputStream(file);
int len=-1;
byte[] data=new byte[1024];
ByteOutputStream bos=new ByteOutputStream(1024);
// 文件读到最末尾 返回 -1
while((len=fis.read(data))!=-1) 
{
//将服务器中的数据 转换成二进制数组 放入内存中
bos.write(data,0,len); 
}
//将 服务器上的文件转换成 二进制数组   OutPutStream 输出流 写入对应文件中
OutputStream os= response.getOutputStream();
//从服务器 拿到数据 向客户端进行写入
os.write(bos.getBytes());
//清空内存文件 向客户端写入
os.flush(); 
//关闭输出流
os.close();
//关闭输入流
fis.close();}else{out.print("<script>alert('无使用教程文档！');window.location='javascript:history.go(-1);';</script>");}
 %>