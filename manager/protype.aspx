<%@ Page Language="C#" AutoEventWireup="true" CodeFile="protype.aspx.cs" Inherits="manager_protype" %>

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="style.css" type="text/css" rel="stylesheet">

    <script src="jquery.js" type="text/javascript"></script>

    <style type="text/css">
        #Submit1
        {
            width: 109px;
        }
    </style>

    <script>
        function displayli(obj) {
            $("#div" + obj).toggle();

        }
    </script>

</head>
<!--#include file="daohang.aspx" -->
<body>
    <form id="form1" method="post" runat="server">
    <font face="宋体">
        <table border="0" cellspacing="1" cellpadding="1" style="width: 758px;" align="center">
            <tr>
                <td bgcolor="#507CD1" colspan="2">
                    <font face="宋体" color="#ffffff">:::类别管理::::::::::::::::::::::::::::::</font>
                </td>
            </tr>
            <tr>
                <td style="height: 305px;" width="660" colspan="2" valign="top">
                    <%=intro()%>
                </td>
            </tr>
            <tr>
                <td style="width: 464px" align="center" colspan="2">
                    <%-- <input class="unnamed5" id="Submit1" type="submit" value=" 确 定 " name="submit" runat="server"
                            onserverclick="Submit1_ServerClick" onclick="return Submit1_onclick()">&nbsp;--%>
                </td>
            </tr>
        </table>
    </font>
    </form>
</body>
</html>
