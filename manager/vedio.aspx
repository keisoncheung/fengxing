<%@ Page Language="C#" AutoEventWireup="true" CodeFile="vedio.aspx.cs" Inherits="manager_vedio" %>
<%@ Register Assembly="DotNetTextBox" Namespace="DotNetTextBox" TagPrefix="DNTB" %>

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
						<TD bgColor="#507CD1" colSpan="2" style="height: 21px"><FONT face="宋体" color="#ffffff">:: 文章管理 :::::::::::::::::::::::::::::</FONT></TD>
					</TR>
					<TR>
						<TD align=center style="WIDTH: 294px; height: 21px;color:Black;">文章版本：</TD>
						<TD style="height: 21px; width: 551px;">
                            <asp:RadioButtonList ID="rbl" runat="server" RepeatDirection="Horizontal">
                            
                            </asp:RadioButtonList>
                        </TD>
                            </TR>
					
					<TR>
						<TD align=center style="WIDTH: 294px; height: 21px;color:Black;">文章标题：</TD>
						<TD style="height: 21px; width: 551px;"><INPUT id="txttitle" type="text" name="Text1" runat="server" style="WIDTH: 520px;">
                        </TD>
                            </TR>
					<TR>
						<TD  align=center style="WIDTH: 294px; height: 21px; color:Black;">
                            文章类别：</TD>
						<TD style="height: 21px; width: 551px;">
                            <asp:DropDownList ID="ddl1" runat="server" Width="112px" OnSelectedIndexChanged="ddl1_SelectedIndexChanged">
                            </asp:DropDownList></TD>
					</TR>
					<tr>
                    <td style="width: 113px; height: 14px" align="center" dir="rtl">
        <font face="宋体">
相关图片<font face="宋体">
</font></td>
                    <td style="width: 449px; height: 14px" >
                        <br />
        <font face="宋体">
                        <input id="File1" runat="server" style="width: 316px; height: 22px" 
                            name="File1" type="file"></font>
                    </td>
                </tr>
					<TR>
						<TD  bgColor="#507CD1" colSpan="2" style="height: 21px"><FONT face="宋体" color="#ffffff">:: 文章内容 :::::::::::::::::::::::::::::</FONT></TD>
					</TR>
					<TR>
					<TD colspan=2 align=center>
							
							<DNTB:WebEditor ID="FreeTextBox1" Skin="skin/xp/" systemFolder="system_dntb/" runat="server"
                            AdjustSize="50" UploadFolder="../upfile/images/" Width="100%" LeftAreaAlign="center"
                            Height="350px"></DNTB:WebEditor>
                            &nbsp;
                        </TD>
					</TR>
					<TR>
						<TD align="center" colSpan="2" style="height: 26px"><INPUT class="unnamed5" id="Submit1" type="submit" value=" 确 定 " name="submit" runat="server" onserverclick="Submit1_ServerClick">&nbsp;<asp:Button 
                                ID="Button1" runat="server" Text="返回" onclick="Button1_Click" 
                                Width="59px" />
                        </TD>
					</TR>
				</TABLE>
				</FONT>
		</form>
	</body>
</html>