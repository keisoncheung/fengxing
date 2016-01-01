<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changepwd.aspx.cs" Inherits="manager_form_changepwd" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<HEAD>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link href="style.css"　 type="text/css" rel="stylesheet">
	</HEAD>
	<body leftMargin="0" topMargin="0">  
		<!--#include file="daohang.aspx" -->
		<form id="form1" method="post" runat="server">
			<FONT face="宋体">
				<TABLE cellSpacing="1"
					cellPadding="1" width="700" border="0" style="Z-INDEX: 101; LEFT: 72px; POSITION: absolute; TOP: 104px;width:678px;">
					
					<TR>
						<TD bgColor="#507CD1" colSpan="2" style="height: 21px"><FONT face="宋体" color="#ffffff">:: 修改密码 :::::::::::::::::::::::::::::</FONT></TD>
					</TR>
					<TR>
						<TD align=center style="WIDTH: 125px; height: 21px;color:Black;">
                            输入新密码：</TD>
						<TD style="height: 21px; width: 551px;">
                            <asp:TextBox ID="newpwd" runat="server" Width="221px" TextMode="Password"></asp:TextBox></TD>
                            </TR>
					<TR>
						<TD  align=center style="WIDTH: 125px; height: 21px; color:Black;">
                            再输入一遍：</TD>
						<TD style="height: 21px; width: 551px;">
                            <asp:TextBox ID="newpwd2" runat="server" Width="221px" TextMode="Password"></asp:TextBox><font color=black></font></TD>
					</TR>
					
					<TR>
					<td></td>
						<TD  style="height: 26px">
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                            <INPUT class="unnamed5" id="Submit1" type="submit" value=" 确 定 " name="submit" runat="server" onserverclick="Submit1_ServerClick">&nbsp;</TD>
					</TR>
				</TABLE>
				</FONT>
		</form>
	</body>
</html>