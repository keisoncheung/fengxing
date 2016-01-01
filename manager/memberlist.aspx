<%@ Page Language="C#" AutoEventWireup="true" CodeFile="memberlist.aspx.cs" Inherits="manager_memberlist" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>会员中心</title>
    <link href="admin_right2.css" rel="stylesheet" type="text/css" />
    <script src="../include/newslist.js" type="text/javascript"></script>
</head>
<body>
<!--#include file="./daohang.aspx" -->
<div style=" width:780px; margin:0px auto;">
<div style="margin-top: 10px; margin-bottom: 2px; width: 780px; text-align: left;">
当前位置：会员中心--会员列表
</div>
<table id="tab" cellpadding="8" cellspacing="0"  >
    <tr class="top_tr">
        <td style="width: 35px;">选择</td>
        <td style="width: 35px;">序号</td>
        <td style="width: 250px;" >会员帐号</td>
        <td style="width: 140px;">注册时间</td>
        <td style="width: 110px;">操作</td>
    </tr>
    <%
        int j = 0;
        if(Request["pg"]+ "" != "")
        {
            j = Convert.ToInt32(Request["pg"].ToString()) -1;
        }
        int i = 0;
        if(output["dt_list"]!=null)
        {            
            System.Data.DataTable dt_list = (System.Data.DataTable)output["dt_list"];
            foreach(System.Data.DataRow dr_list in dt_list.Select())
            {
                i++;
    %>
    <tr>
        <td><input type="checkbox" id='cb<%=i %>' /></td>
        <td><%=i+j*10 %><input type="text" id='newsid<%=i %>' class="dp_none" value='<%=dr_list[0] %>' /></td>
        <td><div  id='txt0<%=i %>' style="width: 250px; overflow: hidden; text-align: left; white-space: nowrap;"><a class="ns" href='membershow.aspx?id=<%=dr_list[0] %>' title='<%=dr_list[1] %>'><%=dr_list[1] %></a></div></td>
        <td><%=DateTime.Parse(dr_list[2].ToString()).ToString("yyyy-MM-dd") %></td>
        <td>
            <div id='btn0<%=i %>' class="dp_show"><a href='./membershow.aspx?<%=newspage() %>id=<%=dr_list[0] %>' class="ns" >【查看】</a><span id='<%=i %>' style="cursor:pointer;" onmouseover="cd(this.id)" onmouseout="cd2(this.id)"  onclick='delnews(<%=i %>)'>【删除】</span></div>
            <div id='btn00<%=i %>' class="dp_none"><img src="../images/ajax1.gif" /></div>
        </td>
    </tr>
    <%     }
       }%>
</table>
<script src="../include/changecolor.js" type="text/javascript"></script>
<div style='padding:10px 0px 50px 0px; width: 655px; text-align:right;  <%=(Page_Text != "")?"":"display:none;" %>'>
    <table border='0' cellspacing='0' cellpadding='0'>
    <tr style='vertical-align:bottom;'>
    <td width='285' align='left'  valign="bottom">
        <input type="button" value="全选" id="btn_choose" class="btn_white" onclick="checkboxall()" />&nbsp;&nbsp;
        <input type="button" value="删除" class="btn_white" onclick="delnewsall(<%=i %>)" />
    </td>
    <%=Page_Text %>
    <td valign="bottom">转到&nbsp;<input id="gopg" type="text" style="width:20px; height:15px; padding:0px;"  onkeypress="gopgEnter()" />&nbsp;页</td>
    <td valign="bottom">&nbsp;&nbsp;&nbsp;<input id="gobtn" value="Go" type="button" class="btn_white" onclick="btn_gopg()"  /></td>
    </tr>
    </table>
</div>
</div>
</body>
</html>
