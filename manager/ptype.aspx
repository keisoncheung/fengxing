<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ptype.aspx.cs" Inherits="manager_ptype"
    ValidateRequest="false" %>

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
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
    <font face="宋体">
        <div style="width: 758px; margin: 0 auto;">
            <fieldset style="width: 660px; font-size: 12px;">
                <legend>类别名称</legend>
                <div style="margin: 10px 0px 10px 20px;">
                    名称：
                    <asp:TextBox ID="tb1" runat="server" Width="248px"></asp:TextBox>
                    排序：<asp:TextBox ID="txtsorid" runat="server" Width="248px" Text="0"></asp:TextBox>
                    <div>
                        <table style=" margin:10px 0px;">
                            <td>
                                <font face="宋体">选择图片</font>
                            </td>
                            <td style="width: 449px; height: 14px">
                                <input id="File1" runat="server" style="width: 206px; height: 22px" name="File1"
                                    type="file">
                                <font face="宋体"></font>
                            </td>
                            </tr>
                        </table>
                    </div>
                    <font face="宋体">&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Text="确定" OnClick="Button2_Click"
                        Width="73px" />
                        <asp:Button ID="Button1" runat="server" Text="返回" OnClick="Button1_Click" /></div>
    </font></fieldset> </div> </font>
    </form>
</body>
</html>
