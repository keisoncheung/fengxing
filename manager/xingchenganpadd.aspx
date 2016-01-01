<%@ Page Language="C#" AutoEventWireup="true" CodeFile="xingchenganpadd.aspx.cs"
    Inherits="manager_xingchenganpadd" %>

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
        <table cellspacing="1" cellpadding="1" width="700" border="0" style="z-index: 101;
            left: 72px; position: absolute; top: 104px; width: 678px;">
            <tr>
                <td bgcolor="#507CD1" colspan="2" style="height: 21px">
                    <font face="宋体" color="#ffffff">:: 行程管理 :::::::::::::::::::::::::::::</font>
                </td>
            </tr>
            <tr  style=" display:none;">
                <td align="center" style="width: 294px; height: 21px; color: Black;">
                    版本：
                </td>
                <td style="height: 21px; width: 551px;">
                    <asp:RadioButtonList ID="rbl" runat="server" RepeatDirection="Horizontal">
                    </asp:RadioButtonList>
                </td>
            </tr>
           
            <tr>
                <td style=" height: 25px" align="center">
                    <font face="宋体">结束城市</font>
                </td>
                <td style="width: 365px; height: 25px" valign="top">
                    <font face="宋体">
                        <asp:DropDownList ID="ddcity" runat="server" Width="147px" AutoPostBack="True" OnSelectedIndexChanged="ddcity_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="-1">请选择</asp:ListItem>
                            <asp:ListItem Value="0">澳大利亚</asp:ListItem>
                            <asp:ListItem Value="1">新西兰</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="sel_city" runat="server" Width="147px" >
                        </asp:DropDownList>
                    </font>
                </td>
            </tr>
            <tr>
                <td align="center" style="width: 204px; height: 21px; color: Black;">
                    排序号（数字越大越靠后，0最大）：
                </td>
                <td style="height: 21px; width: 551px;">
                    &nbsp;<asp:TextBox ID="txtsorid" runat="server" Text="0"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" style="height: 26px">
                   <asp:Button ID="Button2" runat="server" Text="确定" 
                        onclick="Button2_Click" Width="73px" />&nbsp;<asp:Button
                            ID="Button1" runat="server" Text="返回" OnClick="Button1_Click" Width="59px" />
                </td>
            </tr>
        </table>
    </font>
    </form>
</body>
</html>
