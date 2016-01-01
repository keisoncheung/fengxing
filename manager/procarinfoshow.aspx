<%@ Page Language="C#" AutoEventWireup="true" CodeFile="procarinfoshow.aspx.cs" Inherits="manager_procarinfoshow" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="style.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        #Submit1
        {
            width: 87px;
            height: 21px;
        }
    </style>
</head>
<body leftmargin="0" topmargin="0">
    <!--#include file="daohang.aspx" -->
    <form id="form1" method="post" runat="server">
    <font face="宋体">
        <table cellspacing="1" cellpadding="1" width="100%" border="0" style="z-index: 101;
            left: 72px; position: absolute; top: 104px;">
            <tr>
                <td bgcolor="#507CD1" colspan="2" style="height: 21px">
                    <font face="宋体" color="#ffffff">:: 地区管理 :::::::::::::::::::::::::::::</font>
                </td>
            </tr>
            <tr>
                <td align="center" style="width: 194px; height: 21px; color: Black;">
                    版本：
                </td>
                <td style="height: 21px; width: 551px;">
                    <asp:RadioButtonList ID="rbl" runat="server" RepeatDirection="Horizontal">
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="center" style="width: 194px; height: 21px; color: Black;">
                    产品名称：
                </td>
                <td style="height: 21px; width: 551px;">
                    <asp:Label ID="txtproname" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" style="width: 194px; height: 21px; color: Black;">
                    类别：
                </td>
                <td style="height: 21px; width: 551px;">
                    <asp:DropDownList ID="drtype" runat="server" Width="137px" AutoPostBack="True">
                        <asp:ListItem Selected="True" Value="-1">请选择</asp:ListItem>
                        <asp:ListItem Value="1">出行人</asp:ListItem>
                        <asp:ListItem Value="2">套餐</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            
            <tr>
                <td align="center" style="width: 194px; height: 21px; color: Black;">
                    标题：
                </td>
                <td style="height: 21px; width: 551px;">
                    <input id="txttitle" type="text" name="Text1" runat="server" style="width: 400px;">
                </td>
            </tr>
            <tr>
                <td align="center" style="width: 194px; height: 21px; color: Black;">
                    价格：
                </td>
                <td style="height: 21px; width: 551px;">
                    <input id="txtpro_price" type="text" name="txtpro_price" runat="server" style="width: 400px;">
                </td>
            </tr>
           
            <tr>
                <td align="center" colspan="2" style="height: 26px">
                    <input class="unnamed5" id="Submit1" type="submit" value=" 确 定 " name="submit" runat="server"
                        onserverclick="Submit1_ServerClick" onclick="return Submit1_onclick()">&nbsp;<asp:Button
                            ID="Button1" runat="server" Text="返回" OnClick="Button1_Click" Width="59px" />
                </td>
            </tr>
        </table>
    </font>
    </form>
</body>
</html>
