<%@ Page Language="C#" AutoEventWireup="true" CodeFile="am_jingdianadd.aspx.cs" Inherits="manager_am_jingdianadd" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<HEAD>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link href="style.css"　 type="text/css" rel="stylesheet">
	    <style type="text/css">
            #Submit1
            {
                width: 87px;
                height: 21px;
            }
        </style>
	

</HEAD>
	<body leftMargin="0" topMargin="0">  
		<!--#include file="daohang.aspx" -->
		<form id="form1" method="post" runat="server">
			<FONT face="宋体">
				<TABLE cellSpacing="1"
					cellPadding="1" width="700" border="0" style="Z-INDEX: 101; LEFT: 72px; POSITION: absolute; TOP: 104px;width:678px;">
					
					<TR>
						<TD bgColor="#507CD1" colSpan="2" style="height: 21px"><FONT face="宋体" color="#ffffff">:: 地区管理 :::::::::::::::::::::::::::::</FONT></TD>
					</TR>
					<TR>
						<TD align=center style="WIDTH: 294px; height: 21px;color:Black;">版本：</TD>
						<TD style="height: 21px; width: 551px;">
                            <asp:RadioButtonList ID="rbl" runat="server" RepeatDirection="Horizontal">
                            
                            </asp:RadioButtonList>
                        </TD>
                            </TR>
						 <tr>
                    <td style="width: 113px; height: 25px" align="center">
        <font face="宋体">
                                                游玩城市</font></td>
                    <td style="width: 365px; height: 25px" valign="top">
        <font face="宋体">
         <asp:DropDownList ID="drtype" runat="server" Width="137px" AutoPostBack="True" 
                            onselectedindexchanged="DropDownList1_SelectedIndexChanged" >
                            <asp:ListItem Selected="True" Value="-1">请选择</asp:ListItem>
                            <asp:ListItem Value="0">澳大利亚</asp:ListItem>
                            <asp:ListItem Value="1">新西兰</asp:ListItem>
                            </asp:DropDownList>
                        <asp:DropDownList ID="sel_city" runat="server" Width="147px">
                            </asp:DropDownList>
        </font>
                     </td>
                </tr>

					<TR>
						<TD align=center style="WIDTH: 294px; height: 21px;color:Black;">必玩景点：</TD>
						<TD style="height: 21px; width: 551px;"><INPUT id="txttitle" type="text" name="Text1" runat="server" style="WIDTH: 400px;">
                        </TD>
                            </TR>

					
					<TR>
						<TD align="center" colSpan="2" style="height: 26px"><INPUT class="unnamed5" id="Submit1" type="submit" value=" 确 定 " name="submit" runat="server" onserverclick="Submit1_ServerClick" onclick="return Submit1_onclick()">&nbsp;<asp:Button 
                                ID="Button1" runat="server" Text="返回" onclick="Button1_Click" 
                                Width="59px" />
                        </TD>
					</TR>
				</TABLE>
				</FONT>
		</form>
	</body>
</html>