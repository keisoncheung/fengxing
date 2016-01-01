<%@ Page Language="C#" AutoEventWireup="true" CodeFile="xingchengriqi.aspx.cs" Inherits="manager_xingchengriqi" %>

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
<%@ Register Assembly="DotNetTextBox" Namespace="DotNetTextBox" TagPrefix="DNTB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="style.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        #Submit1
        {
            width: 90px;
        }
    </style>
</head>
<!--#include file="daohang.aspx" -->
<body>
    <form id="form1" method="post" runat="server">
    <div style="width: 660px; margin: 0 auto;">
        <fieldset style="width: 660px; font-size: 12px;">
            <legend>类别名称</legend>
            <div style="margin: 10px 0px 10px 20px;">
                名称：
                <asp:TextBox ID="tb1" runat="server" Width="248px"></asp:TextBox>
                <asp:TextBox ID="txtsorid" runat="server" Width="248px" Text="0"></asp:TextBox>
                <br />
            </div>
        </fieldset>
        <div><br />行程内容</div>
        <div>
            <DNTB:WebEditor ID="txt_xiangqing" Skin="skin/xp/" systemFolder="system_dntb/" runat="server"
                AdjustSize="50" UploadFolder="../upfile/images/" Width="660px" LeftAreaAlign="center"
                Height="350px"></DNTB:WebEditor>
        </div>
        <div> <br /><div>
                    &nbsp; <font face="宋体">&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Text="确定"
                        OnClick="Button2_Click" Width="73px" />
                        <asp:Button ID="Button1" runat="server" Text="返回" OnClick="Button1_Click" /></div></div>
    </div>
    </form>
</body>
</html>
