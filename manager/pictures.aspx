<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pictures.aspx.cs" Inherits="manager_pictures" %>

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
            <table border=0 cellSpacing="1" cellPadding="1" style="width:758px;" align=center>
                <tr>
                    <td bgcolor="#507CD1" colspan="3">
                        <font face="宋体" color="#ffffff">::宣传图::::::::::::::::::::::::::::::</font></td>
                </tr>
                <tr>
                    <td style="width: 113px; height: 14px" align="center" dir="rtl">
        <font face="宋体">
标题</font></td>
                    <td style="width: 449px; height: 14px" >
                        <br />
        <font face="宋体">
                        <input id="txt_stitle"  runat="server" style="width: 426px; height: 22px" 
                            name="File1"></font>
                    </td>
                </tr>
                 <tr>
                    <td style="width: 113px; height: 14px" align="center" dir="rtl">
        <font face="宋体">
类别</font></td>
                    <td style="width: 449px; height: 14px" >
                       <select style="width: 151px" runat="server" id="sel_type">
                                        <option value="0">==首页滚动大图==</option>
                                        <option  value="2">==客户合作==</option>
                                        <option  value="1">==友情链接==</option>
                                        
                                          <%--<option value="3">==首页顶部大图==</option>--%>
                                    </select>
        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 113px; height: 14px" align="center" dir="rtl">
        <font face="宋体">
链接地址</font></td>
                    <td style="width: 449px; height: 14px" >
                        <br />
        <font face="宋体">
                        <input id="tbx_url"  runat="server" style="width: 425px; height: 22px" 
                            name="File1"></font>
                    </td>
                </tr>
                
                
                 <tr>
                    <td style="width: 113px; height: 14px" align="center" dir="rtl">
        <font face="宋体">
选择图片</font></td>
                    <td style="width: 449px; height: 14px" >
                        <br />
       
                        <input id="File1" runat="server" style="width: 206px; height: 22px" 
                            name="File1" type="file"> <font face="宋体"></font>
                    </td>
                </tr>
                <tr>
                    <td style="width: 464px" align="center" colspan="2">
                        <input class="unnamed5" id="Submit1" type="submit" value=" 确 定 " name="submit" runat="server"
                            onserverclick="Submit1_ServerClick">&nbsp;</td>
                </tr>
            </table>
        </font>
    </form>
</body>
</html>

