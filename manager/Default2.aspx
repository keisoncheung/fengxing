<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="manager_Default2" %>

<%@ Register Assembly="DotNetTextBox" Namespace="DotNetTextBox" TagPrefix="DNTB" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td style="height: 305px" colspan="3" width="1000">
                    <DNTB:WebEditor ID="txt_feiyong" Skin="skin/xp/" systemFolder="system_dntb/" runat="server"
                        AdjustSize="60" UploadFolder="../upfile/images/" Width="100%" LeftAreaAlign="center"
                        Height="350px"></DNTB:WebEditor>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td bgcolor="#507CD1" colspan="3">
                    <font face="宋体" color="#ffffff">::交通::::::::::::::::::::::::::::::::::::::::::::::::::::::</font>
                </td>
            </tr>
            <tr>
                <td style="height: 305px" colspan="3">
                    <DNTB:WebEditor ID="txt_jiaotong" Skin="skin/xp/" systemFolder="system_dntb/" runat="server"
                        AdjustSize="50" UploadFolder="../upfile/images/" Width="100%" LeftAreaAlign="center"
                        Height="350px"></DNTB:WebEditor>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td bgcolor="#507CD1" colspan="3">
                    <font face="宋体" color="#ffffff">::攻略::::::::::::::::::::::::::::::::::::::::::::::::::::::</font>
                </td>
            </tr>
            <tr>
                <td style="height: 305px" colspan="3">
                    <DNTB:WebEditor ID="txt_gonglue" Skin="skin/xp/" systemFolder="system_dntb/" runat="server"
                        AdjustSize="50" UploadFolder="../upfile/images/" Width="100%" LeftAreaAlign="center"
                        Height="350px"></DNTB:WebEditor>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
