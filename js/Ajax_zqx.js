//网上报名
function addNum()
{
var ij = "2";
if($F('txtname')=="" || $F('txtTel')=="" || $F('txttime')=="")
{
alert("请填写带星号的项目！");
}
else if(CheckNum($F("txttel")))
{
alert("您输入的联系电话格式不正确！");
$("txttel").value = "";
$("txttel").focus();
}
else
{
if($F('ntype2') != null)
{
ij = "1";
}
var tishi=$('loadpic');
tishi.style.display='';

var url='ms.aspx';
var loginstr='addnumstr='+$F('ntype')+'-'+ij+'-'+$F('txtNum')+'-'+$F('txtName')+'-'+$F('txtTel')+'-'+$F('txtEmail')+'-'+$F('txtAddress')+'-'+$F('txttime')+'-'+$F('txtC')+'&time='+(new Date()).getTime();
var myAjax=new Ajax.Request(
        url,{method:'POST',
        parameters: loginstr,
        onComplete: showms
        });

        function showms(ms)
        {
            if(ms.responseText=="1")
            {
            tishi.style.display="none";
            alert("提交成功！");
            window.location.href="registration.aspx";
            }
        
            else
            {
            tishi.style.display="none";
            alert("提交失败！");            
            }
        }

}
}


//检测电话号码
function CheckNum(InputValue)
{		   
//		   var reg=/^([0-9]|[\-])+$/g ;
		   var reg=/(\d{3}-)?\d{8}|(\d{4}-)(\d{7})/;
		   var isValid
		   isValid=reg.exec(InputValue)
		   if (!isValid) {
		     return true
		   }
		   return false
}

//留言
function addguest()
{
if($F('txtname')=="")
{
alert("请输入您的姓名！");
}
else if($F("txttel")=="")
{
alert("请输入您的联系电话！");
}
else if($F("txttel")!="" && CheckNum($F("txttel")))
{
alert("您输入的联系电话格式不正确！");
}
else if($F("txttitle")=="")
{
alert("请输入留言的标题！");
}
else if($F("txtC")=="")
{
alert("请输入留言的内容！");
}
else
{
var tishi=$('loadpic');
tishi.style.display='';

var url='ms.aspx';
var loginstr='gueststr='+$F('txtname')+'-'+$F('txttel')+'-'+$F('txtemail')+'-'+$F('txtzip')+'-'+$F('txtaddress')+'-'+$F('txttitle')+'-'+$F('txtC')+'&time='+(new Date()).getTime();
var myAjax=new Ajax.Request(
        url,{method:'POST',
        parameters: loginstr,
        onComplete: showms
        });

        function showms(ms)
        {
            if(ms.responseText=="1")
            {
            tishi.style.display="none";
            alert("留言提交成功！");
            clearguest(); 
//            locaton.href="guest.aspx";
            }
        
            else
            {
            tishi.style.display="none";
            alert("出错啦！");            
            }
        }

}
}

//清空留言
function clearguest()
{
$('txtname').value = "";
$('txttel').value = "";
$('txtemail').value = "";
$('txtzip').value = "";
$('txtaddress').value = "";
$('txttitle').value = "";
$('txtC').value = "";
}


function a ()
{
$('left_login').style.display="";
$('name1').value = "";
$('pwd1').value = "";
$('tishi').style.display="none";
}


////登录
//function login()
//{
//if($F('r1')!=null)
//{
//if($F('name1')=="")
//{
//alert("用户名不能为空！");
//}
//else if($F("pwd1")=="")
//{
//alert("密码不能为空！");
//}
//else
//{
//$('left_login').style.display="none";
//var tishi=$('tishi');
//tishi.style.display='';
//tishi.innerHTML="<img src='images/loading.gif'>正在验证信息,请稍候...";

//var url='ms.aspx';
//var loginstr='loginstr='+$F('name1')+'-'+$F('pwd1')+'&time='+(new Date()).getTime();
//var uame=$F('name1');
//var myAjax=new Ajax.Request(
//        url,{method:'POST',
//        parameters: loginstr,
//        onComplete: showms
//        });

//        function showms(ms)
//        {
//        if(ms.responseText=="1")
//        {        
//        $('left_login').style.display="none";
////        tishi.style.display='none';
////        $('left_login').style.display="none";
//        logining(uame);
////        location.href="index.aspx";
//        }
//        
//        else if(ms.responseText=="2")
//        {
//         alert("用户密码错误！");
//        $('left_login').style.display="";
//        $('pwd1').value = "";
//        tishi.style.display='none';
//        }
//        
//        else if(ms.responseText=="0")
//        {
//        alert("用户名不存在！");
//        
//        $('left_login').style.display="";
//        $('name1').value = "";
//        $('pwd1').value = "";
//        tishi.style.display='none';
//        }
//        
//        else if(ms.responseText=="-1")
//        {
//        alert("出错啦！");
//        $('left_login').style.display="";
//        tishi.style.display='none';
//        $('name1').value = "";
//        $('pwd1').value = "";
//        }
//        }
//        
//        function logining(log)
//        {
//        tishi.innerHTML="<div style=\"text-align:left; margin-left:30px; margin-top:30px; font-size:16px; line-height:200%;\">欢迎您，"+log+"<br /><a href=\"javascript:void(0);\" onclick='a();' >注销</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"guest.aspx\">用户信息反馈</a></div>";
////        $('huany').innerHTML="欢迎您，<font style='color:red;font-size:14px;'>"+log+"</font>";
//        }
//}
//}
//else
//{
//location.href="register.aspx";
//}
//}


//退出
function Out()
{
alert("fuck");
var url="outer.aspx?time="+(new Date()).getTime();
var loginstr='loginstr=1';
var myAjax=new Ajax.Request(
        url,{method:'POST',
        parameters: loginstr,
        onComplete: showms
        });
         alert("fuck2");
        function showms(ms)
        {
       
        switch(ms.responseText)
        {
        case "1":

window.location.href='login.aspx';
        break;
        case "2":
        alert("您已经退出！");
        break;
        }
        }
}

//登录
function login()
{
if($F('name1')=="")
{
alert("用户名不能为空！");
}
else if($F("pwd1")=="")
{
alert("密码不能为空！");
}
else
{ 
var tishi=$('tishi');
tishi.innerHTML="<img src='images/ajax1.gif'>正在验证信息,请稍候...";

var url='ms.aspx';
var loginstr='loginstr='+$F('name1')+'-'+$F('pwd1')+'&time='+(new Date()).getTime();
var uame=$F('name1');
var myAjax=new Ajax.Request(
        url,{method:'POST',
        parameters: loginstr,
        onComplete: showms
        });

        function showms(ms)
        {
        if(ms.responseText=="1")
            {        
//            $('login').style.display="none";
//            logining(uame);
            window.location.href='MyQAMSGList.aspx';
            
            }
        
        else if(ms.responseText=="2")
            {
            tishi.innerHTML="<font color=red>用户名密码错误!</font>";
            tishi.style.display='';
            }
        
        else if(ms.responseText=="0")
            {
            tishi.innerHTML="<font color=red>用户名不存在</font>";
            tishi.style.display='';
            }
        
        else if(ms.responseText=="-1")
            {
            alert("出错啦！");
            tishi.style.display="";
            }
            
        }
        
//        function logining(log)
//        {
//        $("logined").style.display="";
//        $('huany').innerHTML="欢迎您，<font style='color:red;font-size:14px;'>"+log+"</font>";
//        tishi.style.display='none';
//        }
}
}

//判断登录状态
function panduan()
{
var url="Judgement.aspx?time="+(new Date()).getTime();
var loginstr='loginstr=1';
var myAjax=new Ajax.Request(
        url,{method:'POST',
        parameters: loginstr,
        onComplete: showms
        });
        
        function showms(ms)
        {
        if(ms.responseText!="2")
        {
        $('login').style.display="none";
        logining(ms.responseText);
        }
        else
        {
         $('login').style.display="";
        }
        }
        
        function logining(log)
        {
        $("logined").style.display="";
        $('huany').innerHTML="欢迎您，尊敬的<font style='color:red;font-size:14px;'>"+log+"</font>";
        }

}


//检测邮箱
function isValidEmail(input) 
{
    var format = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
    return isValidFormat(input,format);
}

function isValidFormat(input,format) {
    if (input.value.search(format) != -1) {
        return true;
    }
    return false;
}

//判断非空函数

function reFeikong(input)
{
    var relabqz=$('l'+input);

    if($F(input)=="")
    {

        relabqz.innerHTML="<font style='color:red'>不能为空</font>";
//         $(input).focus();
        return;
    //   
    }
    else if(input=="reemail" || input=="txtemail")
    {
         if (!isValidEmail($(input)))
          {
            relabqz.innerHTML="<font style='color:red'>请输入正确的电子邮件地址</font>";
		    $(input).focus();
		    return;		 
          }
          else
          {
          relabqz.innerHTML="";
          }
     }
     else
     {
     relabqz.innerHTML="";
     return;
     }
     
}


/*****************会员系统****Start**************************************/
//注册会员
function reZhuce()
{

var sex,utype;

if(document.getElementById('rd1').checked)
{
sex=1;
}
else
{
sex=0;
}

if(document.getElementById('utype1').checked)
{
utype=1;
}
else
{
utype=0;
}


if($F('txtName')=="" || $F('txtPassword')=="" || $F('txtPassword2')=="" || $F('txtQuestion')=="" || $F('txtAnswer')=="" || $F('txtAddress')=="" || $F('txtZip')==""|| $F('txtTel')=="")
{
alert("请填写带星号的项目！");

}
else if($F('txtPassword')!=$F('txtPassword2'))
{
alert("两次密码输入不一致，请重新输入！");
}
//else if(CheckNum($F("txtTel")))
//{
//alert("您输入的联系电话格式不正确！");
//}


else
{
var url="ms.aspx";
var pars='memberstr='+$F('txtName')+'-'+$F('txtPassword')+'-'+$F('txtQuestion')+'-'+$F('txtAnswer')+'-'+sex+'-'+$F('txtEmail')+'-'+$F('comurl')+'-'+$F('company')+'-'+$F('txtAddress')+'-'+$F('tname')+'-'+$F('txtZip')+'-'+$F('txtTel')+'-'+$F('mobile')+'-'+$F('fax')+'-'+utype;
var myAjax=new Ajax.Request(
        url,{method:'POST',
        parameters: pars,
        onComplete: showms
        });

        function showms(ms)
        {
        if(ms.responseText=="1")
        {
           alert("注册成功！");
           window.location.href='login.aspx';
        }
        else if(ms.responseText=="0")
        {
        $('txtName').value="";
        $('txtPassword').value="";
        $('txtPassword2').value=""
        alert("您输入的用户名已存在！\r请输入新的用户名！");
        $('txtName').focus();
        }
        else
        {
        alert("注册失败");
        }
        }
}

}


//修改会员
function reZhuce2()
{

var sex,utype;

if(document.getElementById('rd1').checked)
{
sex=1;
}
else
{
sex=0;
}

if(document.getElementById('utype1').checked)
{
utype=1;
}
else
{
utype=0;
}


if( $F('txtQuestion')=="" || $F('txtAnswer')=="" || $F('txtAddress')=="" || $F('txtZip')==""|| $F('txtTel')=="")
{
alert("请填写带星号的项目！");

}

//else if(CheckNum($F("txtTel")))
//{
//alert("您输入的联系电话格式不正确！");
//}


else
{
var url="ms.aspx";
var pars='edmemberstr='+$F('txtQuestion')+','+$F('txtAnswer')+','+sex+','+$F('txtEmail')+','+$F('comurl')+','+$F('company')+','+$F('txtAddress')+','+$F('tname')+','+$F('txtZip')+','+$F('txtTel')+','+$F('mobile')+','+$F('fax')+','+utype;
var myAjax=new Ajax.Request(
        url,{method:'POST',
        parameters: pars,
        onComplete: showms
        });

        function showms(ms)
        {
        if(ms.responseText=="1")
        {
           alert("修改成功！");
        }
        else if(ms.responseText=="0")
        {
        alert("登录超时，请重新登录！");
        window.location.href='login.aspx';
        }
        else
        {
        alert("修改失败！");
        }
        }
}

}


//会员资料初始化
function reZhuce3()
{
var sex,utype;
var str=new Array();
var str2=new Array();

var str2=[$('txtQuestion'),$('txtAnswer'),$('txtEmail'),$('comurl'),$('company'),$('txtAddress'),$('tname'),$('txtZip'),$('txtTel'),$('mobile'),$('fax')];
var url="ms.aspx";
var pars='edmemberstr2=0';
var myAjax=new Ajax.Request(
        url,{method:'POST',
        parameters: pars,
        onComplete: showms
        });
        function showms(ms)
        {
        str=ms.responseText.split(',');
        //用户名
        $('txtName').innerHTML=str[0];
        
        //性别判断
        if(str[12]=="1")
        {
        document.getElementById('rd1').checked=true;  
        document.getElementById('rd2').checked=false;      
        }
        else
        {
        document.getElementById('rd1').checked=false;  
        document.getElementById('rd2').checked=true;   
        }
        //会员类型判断
         if(str[12]=="1")
        {
        document.getElementById('utype1').checked=true;  
        document.getElementById('utype2').checked=false;      
        }
        else
        {
        document.getElementById('utype1').checked=false;  
        document.getElementById('utype2').checked=true;   
        }
        
        for(var i=1;i<str.length-1;i++)
        {
        str2[i-1].value=str[i];
        }
        
        }
}
/*****************会员系统****End***************************************************/


/*******************************************/
 function setorder(cans)
    {
    
    var can1,can2,can3,can4,url;
    switch(cans)
    {
    case 1:
    can1="请填写相关资料!";
    can2="留言标题不能为空!";
    can3="对不起，订单提交失败!";
    can4="提交成功，感谢您的支持!";
    url='ms.aspx';
    break;
    case 2:
    can1=" Please fill in the relevant project!";
    can2="Title can not be empty!";
    can3="Sorry,Failure!";
    can4="Success,thanks!";
    url='../ms.aspx';
    
    
    case 3:
    can1="Message title and content can not be empty!";
    can2="Title can not be empty!";
    can3="Message content can not be empty!";
    can4="Success,thanks!";
    url='../ms.aspx';
    
    case 4:
    can1="Message title and content can not be empty!";
    can2="Title can not be empty!";
    can3="Message content can not be empty!";
    can4="Success,thanks!";
    url='../ms.aspx';
    
    break;
    default:
    can1="留言标题和内容不能为空!";
    can2="留言标题不能为空!";
    can3="留言内容不能为空!";
    can4="提交成功!";
    url='ms.aspx';
    break;  
    }
//    if(cans==1)
//    {
//    can1="留言标题和内容不能为空!";
//    can2="留言标题不能为空!";
//    can3="留言内容不能为空!";
//    can4="提交成功!";
//    }
//    else 
//    {
//    can1="Message title and content can not be empty!";
//    can2="Title can not be empty!";
//    can3="Message content can not be empty!";
//    can4="Success,thanks!";
//    }
    
      if ($F('Promode') == "" || $F('pronum')=="" || $F('txtName')=="" || $F('tel')=="" || $F('address')=="")
        {
            alert(can1);
        }
//        else if($F('txtTitle')=="")
//        {
//        alert(can2);
//        }
//        else if($F('txtContent')=="")
//        {
//        alert(can3);
//        }
        else
        {
        var inp=$('txtTitle','txtContent','email','txtName','tel','zip','address','mob');
        var pars='setorder='+$F('Promode')+'-'+$F('pronum')+'-'+$F('txtName')+'-'+$F('tel')+'-'+$F('address')+'-'+$F('email')+'-'+$F('txtContent')+'-'+cans;
        var myAjax=new Ajax.Request(
        url,{method:'POST',
        parameters: pars,
        onComplete: showms
        });
        function showms(ms)
            {
            if(ms.responseText=='1')
            {
            alert(can4);
            }
            else
            {
            alert(can3);
            }
                //循环数组清空
//                inp.each(function(va){
//                va.value="";
//                }
//                );
            }
        }  
    }
    

/*******************************************/


/**********二级类别列表菜单，点击产品自动判断展开所属的类别，其他的隐藏**************/
function displaydl(obj) {
        
        
            var dls2 = document.getElementById(obj).parentElement.getElementsByTagName('dd');
            if (dls2.length != 0) 
            {
                for (var i2 = 0;dls2.length; i2++)
                 {
                    if (dls2[i2].style.display == "")
                    {
                        dls2[i2].style.display = "none";
                    }
                    else
                     {
                        dls2[i2].style.display = "";
                    }
                }
            }
        }
/***********************/

/******内页产品搜索******/
  function clearText(source){
        if(source){
            if(source.value=='输入关键词'){
                source.value = '';
            }
        }
    }
    function resetText(source){
        if(source){
            if(source.value==''){
                source.value = '输入关键词';
            }
        }
    }

function neiSearch()
{
var val=document.getElementById("keywords2").value;
if(val=="" || val=="输入关键词")
{
alert("输入关键词！");
return;
}
else 
{
var keyw=document.getElementById("seab");
var seaw=document.getElementById("seaw");
//alert(keyw.options[keyw.selectedIndex].value);
window.location.href='product.aspx?pm='+escape(val)+'&bid='+keyw.options[keyw.selectedIndex].value+'&seaw='+seaw.options[seaw.selectedIndex].value;
}
}
