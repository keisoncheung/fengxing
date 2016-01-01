<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="manager_form_fy_main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="Admin_STYLE.CSS" type="text/css" rel="stylesheet" />
</head>
<body style="text-align: left;">
    <form id="form1" runat="server">
    <div>
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td valign="top" width="100%" background="bgpic/admin_main_0001.gif" height="87">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td width="100%" height="160">
                    <div style="text-align: center;">
                        <table border="0" cellpadding="0" cellspacing="0" width="95%" style="text-align: left;">
                            <tr>
                                <td width="100%">
                                    &nbsp;&nbsp;&nbsp; 欢迎您进入网站管理系统后台！
                                </td>
                            </tr>
                            <tr>
                                <td width="100%">
                                </td>
                            </tr>
                        </table>
                        <div style="width: 95%; margin: 30px auto; font-size: 18px; font-weight: bold; display:none;">
                            <div align="left">
                                <%=sbr.ToString()%></div>
                            <div align="left">
                                <div align="left" style="height: 30px; line-height: 30px;">
                                    <div style="width: 500px; background-color: Green; position: relative; top: 0px; left: 22px;">
                                        <div style="position: absolute; z-index: 100; top: 1px; left: 200px; color: White;">
                                            已使用：<%=baifenbi%>
                                        </div>
                                        <asp:Image ID="img2" Height="30" runat="server" /></div>
                                </div>
                                <div align="left" style="height: 30px; line-height: 30px;">
                                    <%=overTishi%></div>
                            </div>
                        </div>
                        <div align="left" style="width: 95%; margin: 50px auto; line-height: 30px; font-weight: bold;
                            font-size: 14px;display:none;">
                           <%-- 增值服务：<a href="javascript:func_zzfw();"><font style=" color:Red;">短信服务</font></a>  &nbsp;&nbsp;&nbsp;&nbsp;   <a href="javascript:func_zzfw();"><font style=" color:Red;">全国统一400电话</font></a> <br />
                            --%>
                            技术支持：Tel: 15913149196&nbsp;&nbsp;张先生&nbsp;&nbsp;QQ:372707575</div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">
        function func_zzfw() {
            alert("此为增值服务，您目前还未开通该功能！如有需要请联系技术人员！");
        }
    </script>
    </form>
</body>
</html>
