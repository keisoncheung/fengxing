function mana_search(obj)
{   
    var menus=document.getElementById("pro_search");
    var tinput=menus.getElementsByTagName("input")[0];
    if(tinput.value=="")
    {
      alert("请输入您要查询的案例名称！");
    }
    else 
    {
        var values=escape(tinput.value);
        var url=document.location.href;
        switch(obj)
        {
             case 1:
                 if(url.indexOf('?')>-1)
                 {
                     window.location.href=url.substring(0,url.indexOf('?'))+"?pron="+values;
                 }
                 else
                 {
                     window.location.href=url+"?pron="+values;
                 }
                 break;
             
             case 2:
                 if(url.indexOf('?')>-1)
                 {
                     window.location.href=url+"&tname="+values;
                 }
                 else
                 {
                     window.location.href=url+"?tname="+values;
                 }
                 break;
        }
    }
}