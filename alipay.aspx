﻿<%@ Page Title="" Language="C#" MasterPageFile="~/mar1.master" AutoEventWireup="true"
    CodeFile="alipay.aspx.cs" Inherits="alipay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        *{
	margin:0;
	padding:0;
}
ul,ol{
	list-style:none;
}
.title{
    color: #ADADAD;
    font-size: 14px;
    font-weight: bold;
    padding: 8px 16px 5px 10px;
}
.hidden{
	display:none;
}

.new-btn-login-sp{
	border:1px solid #D74C00;
	padding:1px;
	display:inline-block;
}

.new-btn-login{
    background-color: #ff8c00;
	color: #FFFFFF;
    font-weight: bold;
	border: medium none;
	width:82px;
	height:28px;
}
.new-btn-login:hover{
    background-color: #ffa300;
	width: 82px;
	color: #FFFFFF;
    font-weight: bold;
    height: 28px;
}
.bank-list{
	overflow:hidden;
	margin-top:5px;
}
.bank-list li{
	float:left;
	width:153px;
	margin-bottom:5px;
}

#main{
	width:750px;
	margin:0 auto;
	font-size:14px;
	font-family:'宋体';
}
#logo{
	background-color: transparent;
    background-image: url("images/new-btn-fixed.png");
    border: medium none;
	background-position:0 0;
	width:166px;
	height:35px;
    float:left;
}
.red-star{
	color:#f00;
	width:10px;
	display:inline-block;
}
.null-star{
	color:#fff;
}
.content{
	margin-top:5px;
}

.content dt{
	width:160px;
	display:inline-block;
	text-align:right;
	float:left;
	
}
.content dd{
	margin-left:100px;
	margin-bottom:5px;
}
#foot{
	margin-top:10px;
}
.foot-ul li {
	text-align:center;
}
.note-help {
    color: #999999;
    font-size: 12px;
    line-height: 130%;
    padding-left: 3px;
}

.cashier-nav {
    font-size: 14px;
    margin: 15px 0 10px;
    text-align: left;
    height:30px;
    border-bottom:solid 2px #CFD2D7;
}
.cashier-nav ol li {
    float: left;
}
.cashier-nav li.current {
    color: #AB4400;
    font-weight: bold;
}
.cashier-nav li.last {
    clear:right;
}
.alipay_link {
    text-align:right;
}
.alipay_link a:link{
    text-decoration:none;
    color:#8D8D8D;
}
.alipay_link a:visited{
    text-decoration:none;
    color:#8D8D8D;
}
</style>
    <script language="JavaScript">
<!--
        //校验输入框  -->
        function CheckForm() {
            if (document.alipayment.aliorder.value.length == 0) {
                alert("请输入商品名称.");
                document.alipayment.aliorder.focus();
                return false;
            }
            if (document.alipayment.alimoney.value.length == 0) {
                alert("请输入付款金额.");
                document.alipayment.alimoney.focus();
                return false;
            }
            var reg = new RegExp(/^\d*\.?\d{0,2}$/);
            if (!reg.test(document.alipayment.alimoney.value)) {
                alert("请正确输入付款金额");
                document.alipayment.alimoney.focus();
                return false;
            }
            if (Number(document.alipayment.alimoney.value) < 0.01) {
                alert("付款金额金额最小是0.01.");
                document.alipayment.alimoney.focus();
                return false;
            }
        }  
    </script>
    <div style="white-space: 1024px; margin: 0px auto;">

        <div id="main">
            <div id="head">
                <dl class="alipay_link">
                    <a target="_blank" href="http://www.alipay.com/"><span>支付宝首页</span></a>| <a target="_blank"
                        href="https://b.alipay.com/home.htm"><span>商家服务</span></a>| <a target="_blank" href="http://help.alipay.com/support/index_sh.htm">
                            <span>帮助中心</span></a>
                </dl>
                <span class="title">支付宝即时到账交易接口快速通道</span>
            </div>
            <div class="cashier-nav">
                <ol>
                    <li class="current">1、确认信息 →</li>
                    <li>2、点击确认 →</li>
                    <li class="last">3、确认完成</li>
                </ol>
            </div>
            <div id="body" style="clear: left">
                <dl class="content">
                    <dt>商户订单号：</dt>
                    <dd>
                        <span class="null-star">*</span>
                        <asp:TextBox ID="tbxoid" name="tbxoid" runat="server" Enabled="False"></asp:TextBox>
                        <span>商户网站订单系统中唯一订单号，必填 </span>
                    </dd>
                    <dt>订单名称：</dt>
                    <dd>
                        <span class="null-star">*</span>
                        <asp:TextBox ID="tbxproname" name="tbxproname" runat="server" Height="24px" 
                            Enabled="False"></asp:TextBox>
                        <span>必填 </span>
                    </dd>
                    <dt>付款金额：</dt>
                    <dd>
                        <span class="null-star">*</span>
                        <asp:TextBox ID="tbxTotalPrice" name="tbxTotalPrice" runat="server" 
                            Enabled="False"></asp:TextBox>
                        <span>必填 </span>
                    </dd>
                    <%--<dt>订单描述 ：</dt>
                    <dd>
                        <span class="null-star">*</span>
                        <asp:TextBox ID="WIDbody" name="WIDbody" runat="server" Enabled="False"></asp:TextBox>
                        <span></span>
                    </dd>
                    <dt>商品展示址：</dt>
                    <dd>
                        <span class="null-star">*</span>
                        <asp:TextBox ID="WIDshow_url" name="WIDshow_url" runat="server" Enabled="False"></asp:TextBox>
                        <span>需以http://开头的完整路径，例如：http://www.商户网址.com/myorder.html </span>
                    </dd>--%>
                    <dt></dt>
                    <dd>
                        <span class="new-btn-login-sp">
                            <asp:Button ID="BtnAlipay" name="BtnAlipay" class="new-btn-login" Text="确 认" Style="text-align: center;"
                                runat="server" OnClick="BtnAlipay_Click"  /></span></dd></dl>
            </div>
            <div id="foot">
                <ul class="foot-ul">
                    <li><font class="note-help">如果您点击“确认”按钮，即表示您同意该次的执行操作。 </font></li>
                    <li>支付宝版权所有 2011-2015 ALIPAY.COM </li>
                </ul>
                <ul>
            </div>
        </div>

    </div>
</asp:Content>
