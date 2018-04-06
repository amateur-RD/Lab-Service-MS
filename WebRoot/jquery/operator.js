function rjss()
{ document.form1.action="rjss.jsp";
document.form1.submit();}
function rjsc()
{ document.form1.action="1rjxx.jsp";
document.form1.submit();}
function rjzd()
{ document.form1.action="rjzd.jsp";
document.form1.submit();} 
function rjtj()
{ document.form1.action="rjtj.jsp";
document.form1.submit();} 
function sel(a)
{
  o=document.getElementsByName(a)
  for(i=0;i<o.length;i++)
  o[i].checked=event.srcElement.checked
 }
 function changeTitle(obj){
 if(obj.offsetWidth>obj.parentElement.offsetWidth){
  obj.title=obj.innerText;
 }else{
  obj.title="";
 }
}