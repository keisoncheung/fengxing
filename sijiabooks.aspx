<%@ Page Title="" Language="C#" MasterPageFile="~/mar1.master" AutoEventWireup="true"
    CodeFile="sijiabooks.aspx.cs" Inherits="sijiabooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link type="text/css" rel="stylesheet" href="css/aozhou.css" />
    <link type="text/css" rel="stylesheet" href="css/ziyouxing.css" />
    <div class="aozhoubox">
        <div class="azbox1">
            <a href="index.html">风行旅游网</a>><a href="#">私家定制</a>
        </div>
        <div class="azbox3">
            <div class="azbox3_top">
                <div class="el_theme">
                    <span>主题：</span>
                    <%=strMenu %>
                </div>
            </div>
            <div class="azbox3_bot">
                <ul class="dingzhilist">
                    <%=firstData %>
                </ul>
            </div>
            <div class="fenyebox">
                <!--
            <span class="num"><span>1</span><span>/1</span></span><a href="javascript:;" class="btn enable"><i class="sprint_img triangle_left"></i>上一页</a>
            <a href="javascript:;" class="btn active">1</a>
            <a href="javascript:;" class="btn enable">2</a>
            <a href="javascript:;" class="btn enable">3</a>
            ...
            <a href="javascript:;" class="btn enable">7</a>
            <a href="javascript:;" class="btn enable">下一页<i class="sprint_img triangle_right"></i></a>      
        -->
            </div>
            <div class="xqtjcp">
                <img src="images/xqcp.png" width="1200" height="80">
            </div>
        </div>
    </div>
</asp:Content>
