<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="manager_form_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>公司后台管理</title>
   
    <style type="text/css">
    body
    {
        background-color:#fff;
    } 
    </style>
<script type="text/javascript">
<!--
function CheckForm()
{
	if(document.Login.txtname.value=="")
	{
		alert("请输入用户名！");
		document.Login.txtname.focus();
		return false;
	}
	if(document.Login.txtpwd.value == "")
	{
		alert("请输入密码！");
		document.Login.txtpwd.focus();
		return false;
	}
}
var xmlhttp;

function yhm()
{
var txtn=document.getElementById("txtname").value;
xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
xmlhttp.Open("GET","Login.aspx?mz="+txtn,true);
xmlhttp.onreadystatechange=stateChange;
xmlhttp.Send(null);
}
function stateChange()
{

if(xmlhttp.readystate==4 && xmlhttp.status==200)
{
var data=xmlhttp.ResponseText;
document.getElementById("Label1").innerText=data;
}
}
-->
		</script>
	</head>
	<body leftMargin="0" topMargin="0" MS_POSITIONING="GridLayout">
		<table height="43" cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tr>
				<td style="BORDER-RIGHT: #ffffff 1px outset; BORDER-TOP: #ffffff 1px outset; BORDER-LEFT: #ffffff 1px outset; BORDER-BOTTOM: #ffffff 1px outset"
					width="100%" bgColor="#d4d0c8" height="43">
					<div align="center">
						<table cellSpacing="0" cellPadding="0" width="98%" border="0">
							<tr>
								<td width="3%">
									<p><IMG height="22" src="bgpic/anniu3.gif" width="22" border="0"></p>
								</td>
								<td width="87%"><font color="#808080">&nbsp;以共赢为目标．诚信合作，携手前进.....</font></td>
								<td width="10%">
									<p align="right"><IMG src="bgpic/anniu2.gif" border="0"></p>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
		<div align="center">
			<table style="WIDTH: 762px; HEIGHT: 64px" height="64" cellSpacing="0" cellPadding="0" width="762"
				border="0">
				<tr>
					<td width="100%"><FONT face="宋体"></FONT></td>
				</tr>
			</table>
		</div>
		<form id="Login" name="Login" onsubmit="return CheckForm()" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" width="600" align="center" border="0">
				<tr>
					<td colSpan="2"><IMG height="126" src="bgpic/Admin_Login1.jpg" width="600"></td>
				</tr>
				<tr>
					<td vAlign="top" width="508" background="bgpic/Admin_Login2.gif">
						<table style="WIDTH: 503px; HEIGHT: 76px" cellSpacing="0" cellPadding="0" width="503" border="0">
							<tr>
								<td style="HEIGHT: 37px" colSpan="7" height="37">&nbsp;</td>
							</tr>
							<tr>
								<td style="HEIGHT: 40px" width="75" rowSpan="2">&nbsp;</td>
								<td width="126"><font color="#043bc9">用户名称：</font></td>
								<td style="HEIGHT: 40px; width: 39px;" rowSpan="2">&nbsp;</td>
								<td width="131"><font color="#043bc9">用户密码：</font></td>
								<td style="width: 33px">&nbsp;</td>
								<td colSpan="2"><font color="#043bc9">验证码：</font></td>
							</tr>
							<tr>
								<td style="HEIGHT: 21px"><input id="txtname" onmouseover="this.style.background='#ffffff';" style="BORDER-RIGHT: #f7f7f7 0px solid; BORDER-TOP: #f7f7f7 0px solid; FONT-SIZE: 9pt; BORDER-LEFT: #f7f7f7 0px solid; WIDTH: 110px; BORDER-BOTTOM: #c0c0c0 1px solid; HEIGHT: 16px; BACKGROUND-COLOR: #f7f7f7"
										onfocus="this.select(); "  onmouseout="this.style.background='#F7F7F7'" type="text" maxLength="20" name="us"
										runat="server"></td>
								<td style="HEIGHT: 21px"><input id="txtpwd" onmouseover="this.style.background='#ffffff';" style="BORDER-RIGHT: #f7f7f7 0px solid; BORDER-TOP: #f7f7f7 0px solid; FONT-SIZE: 9pt; BORDER-LEFT: #f7f7f7 0px solid; WIDTH: 110px; BORDER-BOTTOM: #c0c0c0 1px solid; HEIGHT: 16px; BACKGROUND-COLOR: #f7f7f7"
										onfocus="this.select(); " onmouseout="this.style.background='#F7F7F7'" type="password" maxLength="20" name="pw"
										runat="server"></td>
								<td style="HEIGHT: 21px; width: 33px;">&nbsp;</td>
								<td style="HEIGHT: 21px" width="53"><input id="txtcode" onmouseover="this.style.background='#ffffff';" style="BORDER-RIGHT: #f7f7f7 0px solid; BORDER-TOP: #f7f7f7 0px solid; FONT-SIZE: 9pt; BORDER-LEFT: #f7f7f7 0px solid; WIDTH: 50px; BORDER-BOTTOM: #c0c0c0 1px solid; HEIGHT: 16px; BACKGROUND-COLOR: #f7f7f7"
										onfocus="this.select(); " onmouseout="this.style.background='#F7F7F7'" maxLength="4" size="6" name="CheckCode" runat="server"></td>
								<td style="HEIGHT: 21px" width="51"><IMG src="ValidateCode.aspx"></td>
							</tr>
						</table>
					</td>
					<td><input id="Image1" style="WIDTH: 92px; HEIGHT: 126px" type="image" src="bgpic/Admin_Login3.gif"
							name="Submit" runat="server" onserverclick="Image1_ServerClick1"></td>
				</tr>
			</table>
		</form>
		<div align="center"><asp:label id="Label1" runat="server" ForeColor="Red" Font-Size="X-Small" Width="560px"></asp:label>
			<table style="WIDTH: 762px; HEIGHT: 149px" height="149" cellSpacing="0" cellPadding="0"
				width="762" border="0">
				<tr>
					<td width="100%"><FONT face="宋体"></FONT></td>
				</tr>
			</table>
		</div>
		<div align="center">
			<table height="49" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr>
					<td style="BORDER-RIGHT: #ffffff 1px outset; BORDER-TOP: #ffffff 1px outset; BORDER-LEFT: #ffffff 1px outset; BORDER-BOTTOM: #ffffff 1px outset"
						width="100%" bgColor="#d4d0c8" height="49">
						<div align="center">
							<table cellSpacing="0" cellPadding="0" width="98%" border="0">
								<tr>
									<td width="6%">
										<p align="center">
                                            &nbsp;</p>
									</td>
									<td width="9%">
										<p align="center"></p>
									</td>
									<td width="46%"></td>
									<td width="39%">
										<p align="center"><font color="#808080">Copyright @ 2008 zhangqixin All Rights 
												Reserved</font></p>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>
