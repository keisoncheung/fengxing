<%@ Page Language="C#" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="manager_product"  ValidateRequest="false"%>
<%@ Register Assembly="DotNetTextBox" Namespace="DotNetTextBox" TagPrefix="DNTB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
    <link href="style.css" type="text/css" rel="stylesheet">


</head>
 <!--#include file="daohang.aspx" -->
 <body>
    <form id="form1" method="post" runat="server">
        <font face="宋体">
        <div style='width:758px; margin:0 auto;'>
        <fieldset  style="width:660px; font-size:12px; display:none;">
        <legend>类别</legend>
        <div style=" margin:10px 0px 10px 20px;">
       <asp:RadioButtonList ID="rbl" runat="server" RepeatDirection="Horizontal" 
                onselectedindexchanged="rbl_SelectedIndexChanged" AutoPostBack="True">
                            
                            </asp:RadioButtonList>
        </div>
        </fieldset>
        </div>
            <table border=0 cellSpacing="1" cellPadding="1" style="width:758px;" align=center>
                <tr>
                    <td bgcolor="#507CD1" colspan="3">
                        <font face="宋体" color="#ffffff">::资料管理::::::::::::::::::::::::::::::</font></td>
                </tr>
                <tr>
                    <td style="width: 113px; height: 30px" align="center">
                        资料名字</td>
                    <td style="width: 365px; height: 30px">
                        <asp:TextBox ID="name" runat="server" Width="174px"></asp:TextBox>
                        <asp:CheckBox ID="sftj" runat="server"   Text="是否首页推荐" />
                    &nbsp;&nbsp;&nbsp; 
                    </td>
                    <td rowspan="4" style="width: 164px;">
                        <%=pic2 %>
                    </td>
                </tr>
                
                
                 <tr>
                    <td style="width: 113px; height: 25px" align="center">
        <font face="宋体">
                                                资料排序</font></td>
                    <td style="width: 365px; height: 25px" valign="top">
        <font face="宋体">
            <asp:TextBox ID="txtsort" runat="server" Width="65px" Text="0"></asp:TextBox>(只能填数字)
                        
        </font>
                     </td>
                </tr>
                 <tr>
                    <td style="width: 113px; height: 25px" align="center">
        <font face="宋体">
                                                资料类别</font></td>
                    <td style="width: 365px; height: 25px" valign="top">
        <font face="宋体">
                        <asp:DropDownList ID="drtype" runat="server" Width="137px" AutoPostBack="True" 
                            OnSelectedIndexChanged="drtype_SelectedIndexChanged">
                            </asp:DropDownList><asp:DropDownList ID="drtype2" runat="server" 
                            Width="147px">
                            </asp:DropDownList>
        </font> 
                            
                     </td>
                </tr>
                 
                <tr>
                    <td style="width: 113px; height: 25px" align="center">
        <font face="宋体">
                                                资料简介</font></td>
                    <td style="width: 365px; height: 25px" valign="top">
        <font face="宋体">
                        <asp:TextBox ID="canshu" runat="server" Height="144px" TextMode="MultiLine" 
                            Width="447px"  ></asp:TextBox>
                            
                     </td>
                </tr>
                
                
                 <tr>
                    <td style="width: 113px; height: 14px" align="center" dir="rtl">
        <font face="宋体">
资料图片</font></td>
                    <td style="width: 449px; height: 14px" >
                        <br />
        <font face="宋体">
                        <input id="File1" runat="server" style="width: 316px; height: 22px" 
                            name="File1" type="file"></font>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#507CD1" colspan="3">
                        <font face="宋体" color="#ffffff">::资料介绍::::::::::::::::::::::::::::::::::::::::::::::::::::::</font></td>
                </tr>
                
                <tr>
                    <td style="height: 305px" colspan="3">
                        <DNTB:WebEditor ID="FreeTextBox1" Skin="skin/xp/" systemFolder="system_dntb/" runat="server"
                            AdjustSize="50" UploadFolder="../upfile/images/" Width="100%" LeftAreaAlign="center"
                            Height="350px"></DNTB:WebEditor>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 464px" align="center" colspan="2">
                        <input class="unnamed5" id="Submit1" type="submit" value=" 确 定 " name="submit" runat="server"
                            onserverclick="Submit1_ServerClick">&nbsp;<input style="width: 72px; height: 24px"
                                onclick="location.href='proshow.aspx'" type="button" value="返回" name="Reg"></td>
                </tr>
            </table>
        </font>
    </form>
</body>
</html>
