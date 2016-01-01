<%@ Page Title="" Language="C#" MasterPageFile="~/mar1.master" AutoEventWireup="true"
    CodeFile="myorder.aspx.cs" Inherits="myorder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="css/member.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="stylesheet" href="css/cart.css" />
    <style type="text/css">
        .place_tab
        {
            overflow: hidden;
            zoom: 1;
            width: 1110px;
            background: #ffffff url(images/al_index_tab_bg.png) bottom repeat-x;
            margin: 0 0 10px 0px;
        }
        .place_tab a
        {
            padding-bottom: 12px;
            display: block;
        }
        .clearfix li
        {
            width: 16%;
            float: left;
            text-align: center;
        }
        .place_tab .current, .place_tab li:hover
        {
            border-bottom: 5px solid #06c;
        }
        .place_tab .current span, .place_tab li:hover span
        {
            color: #06c;
        }
        .place_tab a span
        {
            line-height: 20px;
            border-left: 1px solid #b8b8b8;
            display: block;
            text-align: center;
            font-size: 16px;
            color: #797979;
            font: 500 14px/1 microsoft yahei,hiragino sans gb,wenquanyi micro hei,sans-serif;
        }
        .al_agreement
        {
            border: 5px solid #f2f2f2;
            padding: 10px 25px 50px;
            margin-bottom: 50px;
            line-height: 28px;
        }
        .al_agreement h3
        {
            font-size: 24px;
            font-weight: 500;
            padding: 15px 0;
            border-bottom: 1px solid #ccc;
            margin-bottom: 20px;
        }
        .al_mine .order_data_item
        {
            border: 1px solid #f0f0f0;
            margin-bottom: 30px;
        }
        .order_head
        {
            background-color: #f9f9f9;
            display: block;
            width: 100%;
            height: auto;
            overflow: hidden;
            border-bottom: 1px solid #d3d3d3;
        }
        .order_data table
        {
            width: 100%;
        }
        .order_head .btn_orange
        {
            float: right;
            width: 60px;
            height: 28px;
            line-height: 28px;
            margin: 6px 30px 6px 0;
            clear: both;
        }
        .btn_orange:hover
        {
            background-color: #fa7b00;
            text-decoration: none;
            color: #ffffff;
        }
        .btn_orange
        {
            background-color: #ff9600;
        }
        .btn_grey, .btn_blue, .btn_green, .btn_orange
        {
            display: block;
            color: #fff;
            text-align: center;
        }
        .order_head h4
        {
            float: left;
            font-size: 14px;
            margin-bottom: 0;
            line-height: 40px;
            padding-left: 10px;
        }
        .order_head h4 em
        {
            color: #f90;
        }
        .order_data
        {
            border: 1px solid #d3d3d3;
        }
        .order_data th
        {
            line-height: 39px;
            font-weight: bold;
        }
        .order_data .t3
        {
            width: 220px;
            padding: 0 10px;
            text-align: left;
        }
        .order_data .t4
        {
            width: 120px;
            text-align: center;
        }
        .order_data .t5
        {
            width: 130px;
            text-align: left;
        }
        .order_data .t6
        {
            width: 85px;
        }
        .order_data .t7
        {
            width: 85px;
            text-align: center;
        }
        .order_data .t8
        {
            width: 140px;
        }
        .order_data .t9
        {
            width: 90px;
            text-align: center;
        }
        .order_data .t9 .btn_green
        {
            margin-top: 45px;
        }
        .order_data .t10
        {
            width: 100px;
        }
    </style>
    <div class="cartbox">
        <div class="cartcarb">
        </div>
        <div class="cart_item">
            <!-- -->
            <div class="place_tab">
                <ul class="clearfix">
                    <li class="current"><a href="" class="first"><span style="border: 0px;">我的订单</span>
                    </a></li>
                </ul>
            </div>
            <!-- -->
            <%
                publicclass pbclas = new publicclass();
                string str_ispay = "待付款";
                string sql = "select Orderid,Uid,createtime,ispay from OrderCarMenu where uid=" + UId + ";";
                decimal TotalPrice = 0;
                System.Data.DataTable dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
                foreach (System.Data.DataRow dr in dt.Rows)
                {

                    if (Convert.ToString(dr["ispay"]) == "1")
                        str_ispay = "已付款";
                    sql = "select  iif(isnull(totalprice),0,totalprice)as totalprice from OrderCarPro where Orderid='" + dr["Orderid"] + "';";
                    TotalPrice = Convert.ToDecimal(DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, sql, null));
                    
                
            %>
            <div class="order_data order_data_item">
                <div class="order_head clearfix">
                    <%
                        if (Convert.ToString(dr["ispay"]) == "0")
                        {
                    %>
                    <a class="btn_orange" target="_blank" href="alipay.aspx?oid=<%=dr["Orderid"] %>">付款</a>
                    <%
                        }

                    %>
                    <h4>
                        订单号
                        <%=dr["Orderid"]%>&nbsp;&nbsp;&nbsp;&nbsp;预订时间：<%=Convert.ToDateTime(dr["createtime"]).ToString("yyyy-MM-dd HH:mm:ss")%>
                        &nbsp;&nbsp;&nbsp;&nbsp;总金额： <em><span>￥</span>&nbsp;<span><%=TotalPrice%></span></em>
                        <%--                        &nbsp;&nbsp;&nbsp;&nbsp;已付金额： <em><span>￥</span>&nbsp;<span>0.0</span></em--%>>
                        <%--  &nbsp;&nbsp;&nbsp;&nbsp;还需支付金额：
					        <em><span>￥</span>&nbsp;<span>0.0</span></em>--%>
                    </h4>
                </div>
                <table width="1110">
                    <tbody>
                        <tr>
                            <th class="t3">
                                产品名称
                            </th>
                            <th class="t4">
                                旅游日期
                            </th>
                            <th class="t5">
                                规格/项目名称
                            </th>
                            <th class="t6">
                                预订数量
                            </th>
                            <th class="t7">
                                金额
                            </th>
                            <th class="t8">
                                补充信息
                            </th>
                            <th class="t9">
                                订单状态
                            </th>
                            <th class="t10">
                                订单操作
                            </th>
                        </tr>
                        <%
                
sql = "select Orderid,Proid,Godate,TotalPrice,DQ_QZ,stype from OrderCarPro where Orderid='" + dr["Orderid"] + "';";
System.Data.DataTable dt2 = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
foreach (System.Data.DataRow dr2 in dt2.Rows)
{
    string proname = string.Empty;
    string str_GG = string.Empty;
    if (Convert.ToString(dr2["stype"]) == "0")
        proname = Convert.ToString(DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, "select proname from product where id=" + dr2["proid"] + " ", null));
    else if (Convert.ToString(dr2["stype"]) == "1")
    {
        switch (Convert.ToString(DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, "select yw_country from product where id=" + dr2["proid"] + " ", null)))
        {
            case "0":
                proname = " 澳大利亚";
                break;
            case "1":
                proname = " 新西兰";
                break;
            case "2":
                proname = " 中国";
                break;
        }

        str_GG = DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, "select clsname1 from citytype where id=" + dr2["DQ_QZ"] + ";", null) + "";
        proname += "自由行签证";

    }
    string str_url = pbclas.GetCarProUrl(Convert.ToString(dr2["proid"]));
    sql = "select Proid,Cid,Price,Cnum from CarChild where proid=" + dr2["proid"] + " and orderid='" + dr["Orderid"] + "';";
    System.Data.DataTable dt3 = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
    StringBuilder sbr_gg = new StringBuilder();
    StringBuilder sbr_price = new StringBuilder();
    foreach (System.Data.DataRow dr3 in dt3.Rows)
    {
        if (Convert.ToString(dr2["stype"]) == "0")
        {
            sbr_gg.Append("<li>" + DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, "select title from ProCarInfo where id=" + dr3["cid"] + ";", null) + "</li>");
            sbr_price.Append("<li>" + dr3["Cnum"] + "</li>");
        }
        else if (Convert.ToString(dr2["stype"]) == "1")
        {
            sbr_gg.Append("<li>" + str_GG + "-" + DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, "select content from baoxianjihua where id=" + dr3["cid"] + ";", null) + "</li>");
            sbr_price.Append("<li>" + dr3["Cnum"] + "</li>");
        }
    }
       
                
                        %>
                        <tr data-itemid="" data-orderid="">
                            <td class="t3">
                                <a href='<%=str_url %>' target="_blank">
                                    <%=proname%>
                                </a>
                            </td>
                            <td class="t4">
                                <%=dr2["Godate"]%>
                            </td>
                            <td class="t5">
                                <ul>
                                    <%=sbr_gg %>
                                </ul>
                            </td>
                            <td class="t6">
                                <ul>
                                    <%=sbr_price%>
                                </ul>
                            </td>
                            <td class="t7">
                                <span>￥</span> <span>
                                    <%=dr2["TotalPrice"]%></span>
                            </td>
                            <td class="t8">
                                <!--<a class="btn_green" href="javascript:;">详细&gt;</a>-->
                            </td>
                            <td class="t9">
                                <p>
                                    <%=str_ispay %>
                                </p>
                                <!--<a class="btn_green" href="javascript:;">详细&gt;</a>-->
                            </td>
                            <td class="t10">
                                <!-- <a class="btn_grey" href="javascript:;">修改</a>-->
                            </td>
                        </tr>
                        <%
}
                        %>
                    </tbody>
                </table>
            </div>
            <%
}
            %>
            <!-- -->
        </div>
    </div>
</asp:Content>
