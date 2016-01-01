<%@ Page Title="" Language="C#" MasterPageFile="~/mar1.master" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<link type="text/css" rel="stylesheet" href="css/fanxian.css" />
<div class="fanxianbox">
	<div class="fanxian1">
        </div>
    <div class="fanxianbox_box">
    	<div class="fanxianbox_box_1">
        <%=title%>
        </div>
        <div class="fanxianbox_box_2"><%=content %></div>	
    </div>
    <div class="azheight25"></div>
    <div class="azheight25"></div>
    <div class="azheight25"></div>
    <div class="azheight25"></div>
   <div class="xqtjcp">
   	<img src="images/xqcp2.png" width="1200" height="80" />
   </div>
    <div class="azheight25"></div>

</div>
</asp:Content>

