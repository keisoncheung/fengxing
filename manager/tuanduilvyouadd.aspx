﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tuanduilvyouadd.aspx.cs"
    Inherits="manager_tuanduilvyouadd" ValidateRequest="false" %>

<%@ Register Assembly="DotNetTextBox" Namespace="DotNetTextBox" TagPrefix="DNTB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="style.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1
        {
            width: 113px;
            height: 25px;
        }
        .style2
        {
            width: 365px;
            height: 25px;
        }
    </style>
</head>
<!--#include file="daohang.aspx" -->
<body>
    <form id="form1" method="post" runat="server">
    <font face="宋体">
        <div style='width: 758px; margin: 0 auto;'>
            <fieldset style="width: 660px; font-size: 12px; display: none;">
                <legend>类别</legend>
                <div style="margin: 10px 0px 10px 20px;">
                    <asp:RadioButtonList ID="rbl" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbl_SelectedIndexChanged"
                        AutoPostBack="True">
                    </asp:RadioButtonList>
                </div>
            </fieldset>
        </div>
        <table border="0" cellspacing="1" cellpadding="1" style="width: 758px;" align="center">
            <tr>
                <td bgcolor="#507CD1" colspan="3">
                    <font face="宋体" color="#ffffff">::资料管理::::::::::::::::::::::::::::::</font>
                </td>
            </tr>
            <tr>
                <td style="width: 113px; height: 30px" align="center">
                    资料名字
                </td>
                <td style="width: 365px; height: 30px">
                    <asp:TextBox ID="name" runat="server" Width="439px"></asp:TextBox>
                </td>
                <td rowspan="4" style="width: 164px;">
                    <%=pic2 %>
                </td>
            </tr>
            <tr>
                <td align="center" class="style1">
                    <font face="宋体">副标题</font>
                </td>
                <td valign="top" class="style2">
                    <font face="宋体">
                        <asp:TextBox ID="tbxname2" runat="server" Width="172px" Text="0"></asp:TextBox>
                    </font>
                </td>
            </tr>
            <tr>
                <td align="center" class="style1">
                    <font face="宋体">产品编码</font>
                </td>
                <td valign="top" class="style2">
                    <font face="宋体">
                        <asp:TextBox ID="tbxname3" runat="server" Width="172px" Text="0"></asp:TextBox>
                    </font>
                </td>
            </tr>
            <tr>
                <td style="width: 113px; height: 25px" align="center">
                    <font face="宋体"></font>
                </td>
                <td style="width: 365px; height: 25px" valign="top">
                    <font face="宋体">
                        <asp:CheckBox ID="sftj" runat="server" Text="是否首页推荐" />
                        &nbsp;&nbsp;
                        <asp:CheckBox ID="cbxzyxtc" Visible="false" runat="server" Text="自由行套餐" />
                    </font>
                </td>
            </tr>
            <tr>
                <td style="width: 113px; height: 25px" align="center">
                    <font face="宋体">资料排序</font>
                </td>
                <td style="width: 365px; height: 25px" valign="top">
                    <font face="宋体">
                        <asp:TextBox ID="txtsort" runat="server" Width="65px" Text="0"></asp:TextBox>(只能填数字)
                    </font>
                </td>
            </tr>
            <tr>
                <td align="center" class="style1">
                    <font face="宋体">游玩时长</font>
                </td>
                <td valign="top" class="style2">
                    <font face="宋体">
                        <asp:TextBox ID="tbxpeople" runat="server" Width="439px" Text="0"></asp:TextBox>
                    </font>
                </td>
            </tr>
            <tr>
                <td style="width: 113px; height: 25px" align="center">
                    <font face="宋体">出发团期</font>
                </td>
                <td style="width: 365px; height: 25px" valign="top">
                    <font face="宋体">
                        <asp:TextBox ID="tbxaddr" runat="server" Width="439px"></asp:TextBox>
                        <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged">
                        </asp:Calendar>
                    </font>
                </td>
            </tr>
            <tr>
                <td style="width: 113px; height: 25px" align="center">
                    <font face="宋体">出发城市</font>
                </td>
                <td style="width: 365px; height: 25px" valign="top">
                    <font face="宋体">
                        <asp:DropDownList ID="ddlcfcity" runat="server" Width="147px" AutoPostBack="True"
                            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="-1">请选择</asp:ListItem>
                            <asp:ListItem Value="0">澳大利亚</asp:ListItem>
                            <asp:ListItem Value="1">新西兰</asp:ListItem>
                            <asp:ListItem Value="2">中国</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlcfcity2" runat="server" Width="147px" AutoPostBack="True">
                        </asp:DropDownList>
                    </font>
                </td>
            </tr>
            <tr>
                <td style="width: 113px; height: 25px" align="center">
                    <font face="宋体">结束城市</font>
                </td>
                <td style="width: 365px; height: 25px" valign="top">
                    <font face="宋体">
                        <asp:DropDownList ID="ddcity" runat="server" Width="147px" AutoPostBack="True" OnSelectedIndexChanged="ddcity_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="-1">请选择</asp:ListItem>
                            <asp:ListItem Value="0">澳大利亚</asp:ListItem>
                            <asp:ListItem Value="1">新西兰</asp:ListItem>
                            <asp:ListItem Value="2">中国</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="sel_city" runat="server" Width="147px" AutoPostBack="True"
                            OnSelectedIndexChanged="sel_city_SelectedIndexChanged">
                        </asp:DropDownList>
                    </font>
                </td>
            </tr>
            <tr style="display: none;">
                <td style="width: 113px; height: 25px" align="center">
                    <font face="宋体">必玩景点</font>
                </td>
                <td style="width: 365px; height: 25px" valign="top">
                    <font face="宋体">
                        <asp:DropDownList ID="ddl_jingdian" runat="server" Width="148px">
                        </asp:DropDownList>
                    </font>
                </td>
            </tr>
            <tr>
                <td align="center" style="width: 294px; height: 21px; color: Black; text-align: center;">
                    语言类型
                </td>
                <td style="height: 21px; width: 551px;">
                    <asp:DropDownList ID="ddl_lan" runat="server" Width="148px">
                        <asp:ListItem Selected="True" Value="-1">请选择</asp:ListItem>
                        <asp:ListItem Value="0">中文</asp:ListItem>
                        <asp:ListItem Value="1">英文</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 113px; height: 25px" align="center">
                    <font face="宋体">推荐指数</font>
                </td>
                <td style="width: 365px; height: 25px" valign="top">
                    <font face="宋体">
                        <select style="width: 148px" runat="server" id="sel_xj">
                            <option value="0">==请选择==</option>
                            <option value="5">==五星==</option>
                            <option value="4">==四星==</option>
                            <option value="3">==三星==</option>
                            <option value="2">==二星==</option>
                            <option value="1">==一星==</option>
                        </select>
                    </font>
                </td>
            </tr>
            <tr style="">
                <td style="width: 113px; height: 25px" align="center">
                    <font face="宋体">价格</font>
                </td>
                <td style="width: 365px; height: 25px" valign="top">
                    <asp:TextBox ID="jiage" runat="server" Width="147px"></asp:TextBox>
                </td>
            </tr>
              <tr style="">
                <td style="width: 113px; height: 25px" align="center">
                    <font face="宋体">原价</font>
                </td>
                <td style="width: 365px; height: 25px" valign="top">
                    <asp:TextBox ID="tbxjiage2" runat="server" Width="147px"></asp:TextBox>
                </td>
            </tr>
            <tr style="">
                <td style="width: 113px; height: 25px" align="center">
                    <font face="宋体">返现</font>
                </td>
                <td style="width: 365px; height: 25px" valign="top">
                    <asp:TextBox ID="tbxfanxian" runat="server" Width="147px"></asp:TextBox>
                </td>
            </tr>
            <tr style="display: none;">
                <td style="width: 113px; height: 25px" align="center">
                    <font face="宋体">产品分类</font>
                </td>
                <td style="width: 365px; height: 25px" valign="top">
                    <font face="宋体">
                        <asp:DropDownList ID="drtype" runat="server" Width="148px" AutoPostBack="True" OnSelectedIndexChanged="drtype_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:DropDownList ID="drtype2" runat="server" Width="148px">
                        </asp:DropDownList>
                    </font>
                </td>
            </tr>
            <tr>
                <td style="width: 113px; height: 25px" align="center">
                    <font face="宋体">资料简介</font>
                </td>
                <td style="width: 365px; height: 25px" valign="top">
                    <font face="宋体">
                        <asp:TextBox ID="canshu" runat="server" Height="144px" TextMode="MultiLine" Width="439px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 113px; height: 14px" align="center" dir="rtl">
                    <font face="宋体">资料图片</font>
                </td>
                <td style="width: 449px; height: 14px">
                    <br />
                    <font face="宋体">
                        <input id="File1" runat="server" style="width: 316px; height: 22px" name="File1"
                            type="file"></font>
                </td>
            </tr>
            <tr>
                <td style="width: 113px; height: 14px" align="center" dir="rtl">
                    <font face="宋体">小图</font>
                </td>
                <td style="width: 449px; height: 14px">
                    <br />
                    <font face="宋体">
                        <input id="File2" runat="server" style="width: 316px; height: 22px" name="File2"
                            type="file"></font>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="121212"></asp:Label><br />
                </td>
            </tr>
         
  
            <tr>
                <td style="width: 464px" align="center" colspan="2">
                    <input class="unnamed5" id="Submit1" type="submit" value=" 确 定 " name="submit" runat="server"
                        onserverclick="Submit1_ServerClick">&nbsp;<input style="width: 72px; height: 24px"
                            onclick="location.href='proshow.aspx'" type="button" value="返回" name="Reg">
                </td>
            </tr>
        </table>
    </font>
    </form>
</body>
</html>
