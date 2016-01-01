<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>风行旅游</title>
<meta name="keywords" content="风行旅游">
<meta name="description" content="风行旅游">
<link type="text/css" rel="stylesheet" href="css/global.css" />
<link type="text/css" rel="stylesheet" href="css/aozhou.css" />
<link rel="stylesheet" type="text/css" href="css/member.css">
    <script src="js/show/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="js/jqajax.js" type="text/javascript"></script>

</head>
<body>
<div class="el_toper">
	<div class="top">
   	  	<div style="width: 100%;height:2px;overflow: hidden;"></div>
        <div class="top2">
        	<div class="top2_logo"><a href="index.aspx"><img src="images/logo.png" height="108" /></a></div>
            <div class="top2_ss">
            </div>
            <div class="top2_dh">
            	<img src="images/dh.png" width="170" height="55" />
            </div>
        </div>
    </div>
</div>
<!---------------------------------------------->
<div>
<div class="dengluwrap">
		<div class="wrap clearfix">
			<div class="show">
				<img alt="login" src="images/20130916015244-863.jpg">
            </div>
			<div class="operate signup">
                <ul>
                    <li class="tips-wrap">
                        <label for="username">邮箱</label>
                        <span class="rule">为了能收到我们的邮件，建议使用通用邮箱</span>
                        <input style="ime-mode:disabled" type="text" id="txtname" value="" class="mod_ipt email-complete" placeholder="邮箱">
                        <p id="unt" class="tips"></p>
                        <ul class="user-tips"></ul>
                    </li>
                    <li>
                        <label for="setpwd">设置密码</label>
                        <span class="rule">6-20位数字、字母或符号的组合</span>
                        <input type="password" id="txtpwd" class="mod_ipt">
                       <%-- <span class="rule">密码强度<span id="strong"></span></span>--%>
                        <p id="pwt" class="tips"></p>
                    </li>
                    <li>
                        <label for="repeatpwd">确认密码</label>
                        <input type="password" id="txtpwd2" class="mod_ipt" >
                        <p id="rpwt" class="tips"></p>
                    </li>
                </ul>
                <form id="signupForm" action="" method="post" style="display:none" "="">
                    <input type="text" name="email" id="em" value="">
                    <input type="text" name="password" id="pw" value="">
                    <input type="text" name="url" id="url" value="">
                </form>
                <a id="sign" href="javascript:mreg();" class="btn_blue">同意协议并注册</a>
                <a href="#" class="agreement" >《风行网用户注册协议》</a>
            </div>
		</div>
        <div class="login">
            <span>已有账号?
                <a class="btn_green" href="login.aspx">马上登录</a>
            </span>
        </div>
	</div>
</div>





</div>
<!---------------------------------------------->
<div class="footer" style="background-color:#ffffff;">
<div style="width:100%; height:auto; overflow:hidden;padding-top: 20px;line-height: 20px;border-top: 1px solid #bcbcbc;color: #808080;text-align:center;">
Copyright（C）2006-2014 ALL Rights Reserved  广东风行国际旅行社有限公司版权所有 许可证号：00201 粤ICP备11082266号-1
</div>
</div>
	
</body>
</html>
