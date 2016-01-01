<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yingyongshow.aspx.cs" Inherits="manager_yingyongshow" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <LINK href="style.css" type="text/css" rel="stylesheet/">
    <style>td{FONT-SIZE: 12px;}
</style>
</head>

<body>
<!--#include file="daohang.aspx" -->
    <form id="form1" runat="server">
    <div id="DIV1" style="width:758px; margin:0 auto;">    
    
    <%--<fieldset  style="width:758px; font-size:12px;">
        <legend>类别</legend>
        <div style=" margin:10px 0px 10px 20px;">
        <%=stypename()%><a href='proshow.aspx' id="ret" style='display:block; float:left; margin-right:20px; color:Red;' runat=server>返回</a>
        </div>
        </fieldset>--%>
        <table id="tabcont" border=0 cellSpacing="1" cellPadding="1" style="width:758px;" align=center runat=server>
        
        <tr><td style="width: 100%; height: 170px;">
        <asp:GridView ID="grv1" runat="server" AutoGenerateColumns="False" CellPadding="4" OnPageIndexChanging="grv1_PageIndexChanging"
            DataKeyNames="id" ForeColor="#333333" OnDataBound="grv1_DataBound"
            Width="100%" AllowPaging="True" AllowSorting="True" EnableTheming="False">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"/>
            <Columns>
                <asp:TemplateField HeaderText="请选择">
                    <ItemStyle HorizontalAlign="Center" Width=7% />
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Height="31px" />
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="名称" >
                <ItemTemplate>
                        <asp:Label ID="txtmc" runat="server"  Text='<%# DataBinder.Eval(Container, "DataItem.sprotype") %>' ></asp:Label>
                    </ItemTemplate>
                <ItemStyle  Width=20% HorizontalAlign=Center/>
                </asp:TemplateField>
                <asp:BoundField DataField="CreateDate" HeaderText="添加时间">
                    <ItemStyle HorizontalAlign="Center" Width=20% />
                </asp:BoundField>             
                <asp:TemplateField Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="xzid" runat="server"  Text='<%# DataBinder.Eval(Container, "DataItem.id") %>'  Height="17px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField HeaderText="编辑" Text="【查看】"  DataNavigateUrlFields="id" DataNavigateUrlFormatString="yingyong.aspx?id={0}&amp;ac=产品应用">
                 <ItemStyle   HorizontalAlign="Center"  Width=10% />
                  
                </asp:HyperLinkField>
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle  ForeColor="White"  HorizontalAlign="Center" />
            <PagerTemplate>
                <table width="100%" border=0>
                    <tr>
                        <td align="left" style="width: 45%">
                            <asp:Label ID="MessageLabel" ForeColor="Blue" Text="页码:" runat="server" />
                            <asp:DropDownList ID="PageDropDownList" AutoPostBack="true" OnSelectedIndexChanged="PageDropDownList_SelectedIndexChanged"
                                runat="server" />
                            <asp:LinkButton CommandName="Page" CommandArgument="First" ID="linkBtnFirst" runat="server">首页</asp:LinkButton>
                            <asp:LinkButton CommandName="Page" CommandArgument="Prev" ID="linkBtnPrev" runat="server">上一页</asp:LinkButton>
                            <asp:LinkButton CommandName="Page" CommandArgument="Next" ID="linkBtnNext" runat="server">下一页</asp:LinkButton>
                            <asp:LinkButton CommandName="Page" CommandArgument="Last" ID="linkBtnLast" runat="server">末页</asp:LinkButton>
                        </td><td align="right"><asp:Label ID="tt" runat="server" ForeColor="Black"  BorderColor="Black" ></asp:Label></td>
                        <td align="right">
                            <asp:Label ID="CurrentPageLabel"   runat="server" ForeColor="black"  BorderColor="black"/>
                        </td>
                       
                    </tr>
                </table>
            </PagerTemplate>
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor=White />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
            <asp:Button ID="xuanz" runat="server" OnClick="xuanz_Click" Text="全选" />
            <asp:Button ID="dele" runat="server" OnClick="dele_Click" Text="删除" /></td></tr></table>
        &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
    
    </div>
    </form>
</body>
</html>
