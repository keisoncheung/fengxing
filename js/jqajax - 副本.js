/*登录*/
function mlogin()
{
    if($("#txtlname").val() == "")
    {
        alert("用户名不能为空！");
        $("#txtlname").focus();
    }
    else if($("#txtpwd").val() == "")
    {
        alert("密码不能为空！");
         $("#txtpwd").focus();
    }
    else if($("#txtcode").val() == "")
    {
        alert("验证码不能为空！");
         $("#txtcode").focus();
    }
    else
    {
        $("#loginbtn").css("display","none");
        $("#loadimg").css("display","block");
        $.ajax({
                type:"GET",
                url:"jqajax.aspx",
                dataType:"html",
                data:"lname="+$("#txtlname").val()+"&pwd="+$("#txtpwd").val()+"&code="+$("#txtcode").val()+"&ntime="+(new Date()).getTime(),
                beforeSend:function(XMLHttpRequest)
                    {
                    },
                success:function(msg)
                    {   
                         if(msg == "1")
                         {
                            window.location.href = "member.aspx";
                         }
                         else if(msg == "2")
                         {
                            alert("验证码不正确！");
                            $("#txtpwd").val("");
                            $("#txtcode").val("");
                            $("#txtpwd").focus();
                            var str = "./manager/ValidateCode.aspx?time="+(new Date()).getTime();
                            $("#codepic").attr("src",str);
                            $("#loadimg").css("display","none");
                            $("#loginbtn").css("display","block");
                         }
                         else if(msg == "3")
                         {
                            alert("用户名不正确！");
                            $("#txtlname").val("");
                            $("#txtpwd").val("");
                            $("#txtcode").val("");
                             var str2 = "./manager/ValidateCode.aspx?time="+(new Date()).getTime();
                            $("#codepic").attr("src",str2);
                            $("#txtlname").focus();
                            $("#loadimg").css("display","none");
                            $("#loginbtn").css("display","block");
                         }
                         else if(msg == "4")
                         {
                            alert("密码不正确！");
                            $("#txtpwd").val("");                            
                            $("#txtcode").val("");
                            var str3 = "./manager/ValidateCode.aspx?time="+(new Date()).getTime();
                            $("#codepic").attr("src",str3);
                            $("#txtpwd").focus();
                            $("#loadimg").css("display","none");
                           $("#loginbtn").css("display","block");
                         }
                         else
                         {
                            alert("出错啦！！！");
                            $("#loadimg").css("display","none");
                            $("#loginbtn").css("display","block");
                         }
                    },
               complete:function(XMLHttpRequest,textStatus)
                    {
                        //$("#loadimg").css("display","none");
                        //$("#loginbtn").css("display","block");
                    },
              error:function()
                   {
                        alert("出错啦！！！");
                   }
        });
    }
}


/*注册*/
function mreg()
{
    if($("#txtname").val() == "")
    {
        alert("用户名不能为空！");
        $("#txtname").focus();
    }
    else if($("#txtemail").val() == "")
    {
        alert("电子邮箱不能为空！");
         $("#txtemail").focus();
    }
    else if($("#txtpwd").val() == "")
    {
        alert("密码不能为空！");
         $("#txtpwd").focus();
    }
    else if($("#txtpwd2").val() != $("#txtpwd").val())
    {
        alert("两次输入的密码不一致！");
        $("#txtpwd").val("");
         $("#txtpwd").focus();
    }
    else if($("#txttjcode").val() == "")
    {
        alert("推荐码不能为空！");
         $("#txttjcode").focus();
    }
        else if($("#txtcode").val() == "")
    {
        alert("验证码不能为空！");
         $("#txtcode").focus();
    }
    else
    {
        $("#loginbtn").css("display","none");
        $("#loadimg").css("display","block");
        $.ajax({
                type:"GET",
                url:"jqajax.aspx",
                dataType:"html",
                data:"ntype=reg&lname="+$("#txtname").val()+"&pwd="+$("#txtpwd").val()+"&txtemail="+$("#txtemail").val()+"&tjcode="+$("#txttjcode").val()+"&code="+$("#txtcode").val()+"&ntime="+(new Date()).getTime(),
                beforeSend:function(XMLHttpRequest)
                    {
                    },
                success:function(msg)
                    {   
                         if(msg == "1")
                         {
                            alert("注册成功，请登录！");
                            window.location.href = "login.aspx";
                         }
                         else if(msg == "2")
                         {
                            alert("验证码不正确！");
                            $("#txtcode").val("");
                            $("#txtcode").focus();
                            var str = "./manager/ValidateCode.aspx?time="+(new Date()).getTime();
                            $("#codepic").attr("src",str);
                            $("#loadimg").css("display","none");
                            $("#loginbtn").css("display","block");
                         }
                         else if(msg == "3")
                         {
                            alert("该用户名不用使用，请输入新的用户名！");
                            $("#txtname").val("");
                            $("#txtpwd").val("");
                            $("#txtpwd2").val("");
                            $("#txtcode").val("");
                             var str2 = "./manager/ValidateCode.aspx?time="+(new Date()).getTime();
                            $("#codepic").attr("src",str2);
                            $("#txtname").focus();
                            $("#loadimg").css("display","none");
                            $("#loginbtn").css("display","block");
                         }
                         else if(msg == "4")
                         {
                            alert("推荐码不正确，请重新输入！");                            
                            $("#txttjcode").val("");
                            $("#txttjcode").focus();
                             var str2 = "./manager/ValidateCode.aspx?time="+(new Date()).getTime();
                            $("#codepic").attr("src",str2);
                            $("#txtcode").focus();
                            $("#loadimg").css("display","none");
                            $("#loginbtn").css("display","block");
                         }
                         else
                         {
                            alert("注册失败，请重新注册！");
                            window.location.href = "reg.aspx";
                         }
                    },
               complete:function(XMLHttpRequest,textStatus)
                    {
                        //$("#loadimg").css("display","none");
                        //$("#loginbtn").css("display","block");
                    },
              error:function()
                   {
                        alert("出错啦！！！");
                        window.location.href = "reg.aspx";
                   }
        });
    }
}


/*客户留言*/
function addguest()
{
    if(($("#txttitle").val() == "") || ($("#txtname").val() == "")  || ($("#txttel").val() == "")  || ($("#txtC").val() == ""))
    {
        alert("带*号的是必填项！");
    }
    else
    {
        $("#gbtn").css("display","none");
        $("#loadbtn").css("display","block");
        var ns = "1";
        if($("#nsex2").val() == "on")
        {
            ns = "2";
        }
        $.ajax({
                type:"GET",
                url:"jqajax.aspx",
                dataType:"html",
                data:"gtitle="+$("#txttitle").val()+"&gname="+$("#txtname").val()+"&gsex="+ns+"&gtel="+$("#txttel").val()+"&gqq="+$("#txtqq").val()+"&gc="+$("#txtC").val()+"&ntime="+(new Date()).getTime(),
                beforeSend:function(XMLHttpRequest)
                    {
                    },
                success:function(msg)
                    {   
                         if(msg == "1")
                         {
                            alert("留言成功！");
                            $("#gbtn").css("display","block");
                            $("#loadbtn").css("display","none");
                            clearguest();
                         }
                         else if(msg == "2")
                         {
                            alert("留言失败！请重新留言！");
                            window.location.href = "guesbook.aspx";
                            $("#gbtn").css("display","block");
                            $("#loadbtn").css("display","none");
                            clearguest();
                         }
                         
                         
                    },
               complete:function(XMLHttpRequest,textStatus)
                    {
                        $("#gbtn").css("display","block");
                        $("#loadbtn").css("display","none");
                    },
              error:function()
                   {
                        alert("出错啦！！！");
                   }
        });
    }
}
function clearguest()
{
    $("#txttitle").val("");
    $("#txtname").val("");
    $("#txttel").val("");
    $("#txtqq").val("");
    $("#txtC").val("");
    $("#txttitle").focus();
}

/*订购*/
function orderpro(id)
{
    $("#btn_order"+id).css("display","none");
    $("#btn_load"+id).css("display","block");
    $.ajax({
                type:"GET",
                url:"jqajax.aspx",
                dataType:"html",
                data:"ntype=order&proId="+id+"&onum="+$("#onum").val()+"&ntime="+(new Date()).getTime(),
                beforeSend:function(XMLHttpRequest)
                    {
                    },
                success:function(msg)
                    {   
                         if((msg == "1")||(msg == "2"))
                         {
                            window.location.href = "carlist.aspx";
                         }
                         else
                         {
                            alert("订购失败！");
                            $("#btn_order"+id).css("display","block");
                            $("#btn_load"+id).css("display","none");
                         }
                         
                         
                    },
               complete:function(XMLHttpRequest,textStatus)
                    {
                    },
              error:function()
                   {
                        alert("出错啦！！！");
                        $("#btn_order"+id).css("display","block");
                        $("#btn_load"+id).css("display","none");
                   }
        });
}

/*修改商品数量*/
function changenum(id)
{
    var oldprice = $("#price_"+id).html();
    var totalprice = $("#totalPrice").html();
    var num = $("#num_"+id).val();
    if(num=="")
    {
        alert("请输入商品数量！");
        $("#num_"+id).focus();
    }
    else if(checkNum(num))
    {
        alert("商品的数量请输入自然数！");
        $("#num_"+id).val("");
        $("#num_"+id).focus();
    }
    else
    {
        $("#btn_"+id).css("display","none");
        $("#load_"+id).css("display","inline");
        
        $.ajax({
                    type:"GET",
                    url:"jqajax.aspx",
                    dataType:"html",
                    data:"ntype=changenum&OrderId="+id+"&OrderNum="+num+"&ntime="+(new Date()).getTime(),
                    beforeSend:function(XMLHttpRequest)
                        {
                        },
                    success:function(msg)
                        {   
                             if(msg == "00")
                             {
                                $("#num_"+id).val("");
                                alert("修改失败！");
                             }
                             else
                             {
                                $("#price_"+id).html(msg);
                                var gprice = (totalprice-0) - (oldprice-0) + (msg-0)
                                $("#totalPrice").html(gprice);
                             }
                        },
                   complete:function(XMLHttpRequest,textStatus)
                        {
                            $("#btn_"+id).css("display","inline");
                            $("#load_"+id).css("display","none");
                        },
                  error:function()
                       {
                            alert("出错啦！！！");
                            $("#btn_"+id).css("display","inline");
                            $("#load_"+id).css("display","none");
                       }
            });
        }
}

/*删除商品*/
function do_delete(id)
{
var dp = $("#price_"+id).html();
var tp = $("#totalPrice").html();
    $("#delpic_"+id).css("display","inline");
    $("#a_"+id).css("display","none");
    $.ajax({
                type:"GET",
                url:"jqajax.aspx",
                dataType:"html",
                data:"ntype=delpro&OrderId="+id+"&ntime="+(new Date()).getTime(),
                beforeSend:function(XMLHttpRequest)
                    {
                    },
                success:function(msg)
                    {   
                         if(msg == "1")
                         {
                            $("#tr_"+id).remove();
                            var gp = (tp-0) - (dp-0);
                            $("#totalPrice").html(gp);
                         }
                         else
                         {
                            alert("删除失败！");
                         }
                         
                         
                    },
               complete:function(XMLHttpRequest,textStatus)
                    {
                        $("#a_"+id).css("display","inline");
                        $("#delpic_"+id).css("display","none");
                    },
              error:function()
                   {
                        alert("出错啦！！！");
                        $("#a_"+id).css("display","inline");
                        $("#delpic_"+id).css("display","none");
                   }
        });
}

/*清空购物车*/
function do_deleteall()
{
    $(".p_all").css("display","inline");
    $(".a_all").css("display","none");
    $.ajax({
                type:"GET",
                url:"jqajax.aspx",
                dataType:"html",
                data:"ntype=delproall&ntime="+(new Date()).getTime(),
                beforeSend:function(XMLHttpRequest)
                    {
                    },
                success:function(msg)
                    {   
                         if(msg == "1")
                         {
                            alert("您的购物车已经清空了！");
                            window.location.href = "carlist.aspx";
                         }
                         else
                         {
                            alert("清空失败！");
                         }
                         
                         
                    },
               complete:function(XMLHttpRequest,textStatus)
                    {
                        $(".p_all").css("display","none");
                        $(".a_all").css("display","inline");
                    },
              error:function()
                   {
                        alert("出错啦！！！");
                        $(".p_all").css("display","none");
                        $(".a_all").css("display","inline");
                   }
        });
}

/*确定下订单*/
function addorder()
{
    if( ($("#mid").val() == "") || ($("#mAddress").val() == "") || ($("#mZip").val() == "") || ($("#mRelname").val() == "") || ($("#mTel").val() == "") )
    {
        alert("带*号的为必填项！");
    }
    else
    {
        $("#okbtn").css("display","none");
        $("#loadpic").css("display","block");
        var str = "&mid="+$("#mid").val()+"&mAddress="+escape($("#mAddress").val())+"&mZip="+escape($("#mZip").val())+"&mRelname="+escape($("#mRelname").val())+"&mTel="+escape($("#mTel").val())+"&ntime1="+escape($("#ntime1").val())+"&ntime2="+escape($("#ntime2").val())+"&nguest="+escape($("#nguest").val())+"&nPrice="+escape($("#totalPrice").html())+"&nPoints="+escape($("#totalPoints").html());
        $.ajax({
                type:"GET",
                url:"jqajax.aspx",
                dataType:"html",
                data:"ntype=addorder"+str+"&ntime="+(new Date()).getTime(),
                beforeSend:function(XMLHttpRequest)
                    {
                    },
                success:function(msg)
                    {   
                         if(msg == "1")
                         {
                            alert("订购成功！");
                            window.location.href = "member.aspx";
                         }
                         else
                         {
                            alert("订购失败！");                            
                         }
                    },
               complete:function(XMLHttpRequest,textStatus)
                    {
                        $("#okbtn").css("display","block");
                        $("#loadpic").css("display","none");
                    },
              error:function()
                   {
                        alert("出错啦！！！");
                        $("#okbtn").css("display","block");
                        $("#loadpic").css("display","none");
                   }
        });  
    }

}




//判断数字,是返回false
function checkNum(str)
{
	var Expression=/^[1-9]+(\d*$)/; 	
	var objExp=new RegExp(Expression);
	if(objExp.test(str)==false)
	{
		return true;
	}
	    return false;
}

/*
function do_delete(aa)
{
var id=$(aa);
id.parents("tr").remove();
}

$(function() {

$("#picprev").click( function () { pic_ajax("p") });
        
$("#picnext").click( function () {  pic_ajax("n") });

function pic_ajax(pn)
        {
            $("loadpic").css("display","block");
             $.ajax({
                    type:"GET",
                    url:"jqAjax.aspx",
                    dataType:"html",
                    data:"pid="+$("#picId").val()+"&pn="+pn+"&ntime="+(new Date()).getTime(),
                    beforeSend:function(XMLHttpRequest)
                        {
//                            $("loadpic").css("display","block");
        //                    $("#showResult").text("正在查询");
        //                    //Pause(this,100000);
                        },
                    success:function(msg)
                        {   
                              var picarray =new Array();
                              if(msg == "1")
                              {
                                    $("loadpic").css("display","none");
                                   alert("这是第一张图片！！！"); 
                              }
                              else if(msg == "2")
                              {
                                    $("loadpic").css("display","none");
                                    alert("这是最后一张图片！！！");
                              }
                              else if(msg == "0")
                              {
                                    $("loadpic").css("display","none");
                                    window.location.href="product.aspx?id=" + $("#picId").val();
//                                    alert("出错啦！！！");
                              }
                              else
                              {
                                    picarray = msg.split('-');
                                    
                                    window.location.href="product.aspx?id=" + picarray[0];
                                    
//                                    $("#picId").val(picarray[0]);
//                                    
//                                    var pshow  = "upfile3/s" + picarray[1];
//                                    $("#picshow2 img").attr("src",pshow);
                                    $("loadpic").css("display","none");
                                    
                              }
                        },
                   complete:function(XMLHttpRequest,textStatus)
                        {
                            $("loadpic").css("display","none");
                            //隐藏正在查询图片
                        },
                  error:function()
                       {
                            alert("出错啦！！！");
                            //错误处理
                       }
                    });
        }
        
        
        
});

*/

//首页搜索
function gourspid()
{
var web=document.getElementById("indexsear");
if(web.value=="")
{
alert("请输入您要查询的关键字！");
}
else
{
window.location="productlist.aspx?keyname="+escape(web.value);
}
}