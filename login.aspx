<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <title>风行旅游</title>
    <meta name="keywords" content="风行旅游">
    <meta name="description" content="风行旅游">
    <link type="text/css" rel="stylesheet" href="css/global.css" />
    <link type="text/css" rel="stylesheet" href="css/aozhou.css" />
    <link rel="stylesheet" type="text/css" href="css/member.css">
    <script type="text/javascript" src="js/show/jquery-1.10.2.min.js"></script>
    <script src="js/jqajax.js" type="text/javascript"></script>
</head>
<body>
    <div class="el_toper">
        <div class="top">
            <div style="width: 100%; height: 2px; overflow: hidden;">
            </div>
            <div class="top2">
                <div class="top2_logo">
                    <a href="index.aspx">
                        <img src="images/logo.png" height="108" /></a></div>
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
                    <img alt="login" src="images/20130916015244-863.jpg"></div>
                <div class="operate signin">
                    <ul>
                        <li class="tips-wrap">
                            <label for="username">
                                邮箱</label>
                            <input style="ime-mode: disabled" type="text" placeholder="邮箱" class="mod_ipt email-complete"
                                id="txtlname" autocomplete="off" value="">
                            <p id="unt" class="tips">
                            </p>
                            <ul class="user-tips">
                            </ul>
                        </li>
                        <li>
                            <label for="setpwd">
                                密码</label>
                            <input type="password" class="mod_ipt" id="txtpwd">
                            <p id="pwt" class="tips">
                            </p>
                        </li>
                        <li>
                           
                        </li>
                    </ul>
                    <form id="loginForm" action="/main/login" method="post" style="display: none;">
                    <input type="text" name="email" id="em" value="">
                    <input type="text" name="password" id="pw" value="">
                    <input type="text" name="url" id="url" value="">
                    <input type="text" name="autologin" id="al" value="">
                    </form>
                    <a class="btn_blue" href="javascript:;" onclick="mlogin();">登 录</a>

                     <div class="help">
                                <input type="checkbox" class="mod_chk" id="autologin" checked="true">
                                <label for="autologin">
                                    自动登录</label>
                                <a class="btn_forget" href="#">忘记密码?</a>
                            </div>
                    <%-- <span id="qqLoginBtn">--%>
                     <%--   <a href="Default2.aspx" onclick="">
                            <img src="http://qzonestyle.gtimg.cn/qzone/vas/opensns/res/img/Connect_logo_3.png"
                                alt="QQ登录" border="0"></a></span> <span id="weiboLoginBtn">
                                    <div class="WB_loginButton WB_widgets">
                                        <a href="javascript:void(0);">
                                            <img src="http://timg.sjs.sinajs.cn/t4/appstyle/widget/images/loginButton/loginButton_24.png"></a></div>
                                </span>--%>
                </div>
                <div class="login">
                    <span><a class="btn_green" href="registration.aspx">立即注册</a> </span>
                </div>
            </div>
        </div>
    </div>
    <!---------------------------------------------->
    <div class="footer" style="background-color: #ffffff;">
        <div style="width: 100%; height: auto; overflow: hidden; padding-top: 20px; line-height: 20px;
            border-top: 1px solid #bcbcbc; color: #808080; text-align: center;">
            Copyright（C）2006-2014 ALL Rights Reserved 广东风行国际旅行社有限公司版权所有 许可证号：00201 粤ICP备11082266号-1
        </div>
    </div>
</body>
</html>
