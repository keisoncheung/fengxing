<%@ Page Language="C#" AutoEventWireup="true" CodeFile="information.aspx.cs" Inherits="manager_form_gszl"
    ValidateRequest="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
    <link href="style.css" type="text/css" rel="stylesheet" />
</head>
<body >
    <!--#include file="daohang.aspx" -->
    <form id="form1" method="post" runat="server">
        <table style="width: 678px;" border="0" align="center">
            <tr>
                <td bgcolor="#507CD1" colspan="2">
                    <font face="宋体" color="#ffffff">::公司资料管理::::::::::::::::::::::::::::::</font></td>
            </tr>
            <tr>
                <td style="width: 116px">
                    网站名称：</td>
                <td>
                    <input id="txtname1" style="width: 305px;" type="text" name="Text2" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 116px; height: 32px;">
                    Copyright：</td>
                <td style="height: 32px">
                    <input id="txtcopyright" style="width: 521px;" type="text" name="Text3" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 116px">
                    关键字：</td>
                <td>
                    <input id="txtkeyword" style="width: 521px;" type="text" name="Text4" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 116px; height: 25px">
                    公司备案：</td>
                <td style="height: 25px">
                    <input id="txtbeian" style="width: 521px;" type="text" name="Text1" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 116px">
                    网站描述：</td>
                <td><textarea   id="txtdes" style="width: 521px; height: 143px;" type="text" 
                        name="Text5" runat="server"></textarea>
                   </td>
            </tr>
            <tr>
                <td style="width: 116px">
                    网站地址：</td>
                <td>
                    <input id="txtweb" style="width: 521px;" type="text" name="Text5" runat="server" /></td>
            </tr>
            <tr>
                <td bgcolor="#507CD1" colspan="2">
                    <font face="宋体" color="#ffffff">::联系方式::::::::::::::::::::::::::::::</font></td>
            </tr>
            <tr>
                <td style="width: 116px; height: 25px">
                    公司名称：</td>
                <td style="height: 25px">
                    <input id="txtname2" style="width: 521px;" type="text" name="Text6" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 116px">
                    <p>
                        客服电话：</p>
                </td>
                <td>
                    <input id="txttel" style="width: 521px;" type="text" name="Text6" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 116px">
                    <p>
                        公司手机：</p>
                </td>
                <td>
                    <input id="txtmobilep" runat="server" style="width: 521px" type="text" /></td>
            </tr>
            <tr>
                <td style="width: 116px; height: 31px;">
                    公司传真：</td>
                <td style="height: 31px">
                    <input id="txtfax" style="width: 521px;" type="text" name="Text7" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 116px; height: 32px;">
                    电子邮件：</td>
                <td style="height: 32px">
                    <input id="txtemail" style="width: 521px;" type="text" name="Text8" runat="server" /></td>
            </tr>
             <tr>
                <td style="width: 116px; height: 32px;">
                    联系QQ：</td>
                <td style="height: 32px">
                    <input id="qq" style="width: 521px;" type="text" name="Text8" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 116px">
                    联&nbsp; 系&nbsp; 人：</td>
                <td>
                    <input id="txtlxr" type="text" name="Text11" runat="server" style="width: 521px" /></td>
            </tr>
            <tr>
                <td style="width: 116px">
                    邮政编码：</td>
                <td>
                    <input id="txtzip" type="text" name="Text13" runat="server" style="width: 521px" /></td>
            </tr>
            <tr>
                <td style="width: 116px">
                    公司地址：</td>
                <td>
                    <input id="txtaddr" style="width: 521px;" type="text" name="Text15" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td valign="bottom" align="center" colspan="2" style="height: 26px">
                    <input class="unnamed5" id="Submit2" type="submit" value=" 确 定 " name="submit" runat="server"
                        onserverclick="Submit2_ServerClick" />&nbsp;<input style="width: 72px; height: 24px"
                            type="button" value="返回" name="Reg" /></td>
            </tr>
        </table>
    </form>
</body>
</html>
