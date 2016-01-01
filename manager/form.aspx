<%@ Page Language="C#" AutoEventWireup="true" CodeFile="form.aspx.cs" Inherits="manager_form_fy_form" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>后台管理系统</title>
</head>
<body style="margin: 0px; padding: 0px; height: 100%">
    <table style="width: 100%; height: 100%;" cellspacing="0" cellpadding="0">
        <tr>
            <td rowspan="2" style="width: 180px;">
                <iframe style="width: 183px; height: 100%;" src="left.aspx" marginwidth="0" marginheight="0"
                    name="left" border="0"></iframe>
            </td>
            <td style="height: 55px;">
                <iframe style="width: 100%; height: 55px; overflow: hidden;" src="top.aspx" marginwidth="0"
                    marginheight="0" scrolling="no" name="top" border="0" frameborder="0"></iframe>
            </td>
        </tr>
        <tr>
            <td>
                <iframe style="width: 100%; height: 100%;" src="main.aspx" marginwidth="0" marginheight="0"
                    name="main" border="0" frameborder="0"></iframe>
            </td>
        </tr>
    </table>
</body>
</html>
