<%@ Page Language="C#" AutoEventWireup="true" CodeFile="proinfo.aspx.cs" Inherits="manager_proinfo"     ValidateRequest="false" %>

<%@ Register Assembly="DotNetTextBox" Namespace="DotNetTextBox" TagPrefix="DNTB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="style.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #Submit2
        {
            width: 94px;
        }
    </style>


    <script src="ueditor/ueditor.parse.js" type="text/javascript"></script>

    <script src="ueditor/ueditor.all.js" type="text/javascript"></script>

    <script src="ueditor/ueditor.all.min.js" type="text/javascript"></script>

    <script src="ueditor/ueditor.config.js" type="text/javascript"></script>

</head>
<body>
<!--#include file="daohang.aspx" -->
    <form id="form1" runat="server">
    <div style=" width:100%; margin:0 auto;">
    <fieldset  style="width:100%; font-size:12px;">
        <legend>类别</legend>
        <div style=" margin:10px 0px 10px 20px;">
            <asp:DropDownList ID="ddbtype" runat="server" Width="195px" AutoPostBack="True" 
                onselectedindexchanged="ddbtype_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        </fieldset>
    <table id="tabcont" style="width:100%;" border="0" align="center" runat=server>
   
				<tr>
					<td bgColor="#507CD1" colSpan="2"><font face="宋体" color="#ffffff">::::::::<%=stttitle %>::::::::::::::::::::::::</font></td>
				</tr>
				<tr>
					<td style="HEIGHT: 283px" colspan=2 valign=top>	
					
<%--					<textarea name="mycontent" id="myEditor">
					<%=content %>
					</textarea>
					<script type="text/javascript">

					    UE.getEditor('myEditor');
					</script>--%>
							
					<div style="">
						<DNTB:WebEditor ID="FreeTextBox1" Skin="skin/xp/" systemFolder="system_dntb/" runat="server"
                            AdjustSize="50" UploadFolder="../upfile/images/" Width="100%" LeftAreaAlign="center"
                            Height="350px"></DNTB:WebEditor></div>
                    </td>
				</tr>
	<tr>
					<td vAlign="bottom" align="center" colSpan="2" style="height: 26px"><input class="unnamed5" id="Submit2" type="submit" value=" 确 定 " name="submit" runat="server" onserverclick="Submit2_ServerClick" />&nbsp;<asp:Button 
                            ID="Button1" runat="server" Text="返回" Width="65px" 
                            onclick="Button1_Click" Visible="false" />
                    </td>
				</tr>
</table>
    </div>
    </form>
</body>
</html>

