<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Article2.aspx.cs" Inherits="manager_Article2"  ValidateRequest="false"%>
<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link href="style.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        #Submit2
        {
            width: 94px;
        }
        .style1
        {
            height: 23px;
        }
    </style>
</head>
<body>
<!--#include file="daohang.aspx" -->
    <form id="form1" runat="server">
    <div style=" width:660px; margin:0 auto;">
    <fieldset  style="width:660px; font-size:12px;">
        <legend>类别</legend>
        <div style=" margin:10px 0px 10px 20px;">
        <%=stypename()%><a href='Article2.aspx' id="ret" style='display:block; float:left; margin-right:20px; color:Red;' runat=server>返回</a>
        </div>
        </fieldset>
    <table id="tabcont" style="width:660px;" border="0" align="center" runat=server>
				<TR>
						<TD align=center style="WIDTH: 294px; height: 21px;color:Black;">关键字：</TD>
						<TD style="height: 21px; width: 551px;"><textarea   id="txtcontent2" name="Text1" 
                                runat="server" style="WIDTH: 520px; height: 98px;"></textarea>
                        </TD>
                            </TR>
                            
	<tr>
					<td vAlign="bottom" align="center" colSpan="2" class="style1"><input class="unnamed5" id="Submit2" type="submit" value=" 确 定 " name="submit" runat="server" onserverclick="Submit2_ServerClick" />&nbsp;<asp:Button 
                            ID="Button1" runat="server" Text="返回" Width="65px" 
                            onclick="Button1_Click" />
                    </td>
				</tr>
</table>
    </div>
    </form>
</body>
</html>
