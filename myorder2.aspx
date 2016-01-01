<%@ Page Title="" Language="C#" MasterPageFile="~/mar1.master" AutoEventWireup="true"
    CodeFile="myorder2.aspx.cs" Inherits="myorder2" %>

<%@ Register Src="~/menber_menu.ascx" TagName="m_left" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link type="text/css" rel="stylesheet" href="css/huiyuan.css" />
    <div class="huiyuan">
        <uc1:m_left runat="server" ID="left1" />
        <div class="hy_right">
            <%
     
                string where = " where uid=" + UId + " and style=0 ";
                StringBuilder Html = new StringBuilder();
                publicclass pbclas = new publicclass();
                string str_ispay = "待付款";
                int totalNums = 0, preNums = 0, afnums = 0;
                string sql = "select a.uid,(select count(orderid) from OrderCarMenu where uid=a.uid and style=0 ) as totalNums,(select count(orderid) from OrderCarMenu where uid=a.uid and ispay=0  and style=0)  as preNums,(select count(orderid) from OrderCarMenu where uid=a.uid and ispay=1 and style=0) as afnums  from OrderCarMenu a where a.uid=" + UId + ";";
                System.Data.DataTable dt1 = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
                foreach (System.Data.DataRow dr1 in dt1.Rows)
                {
                    totalNums = Convert.ToInt32(dr1["totalNums"]);
                    preNums = Convert.ToInt32(dr1["preNums"]);
                    afnums = Convert.ToInt32(dr1["afnums"]);
                }
                
            %>
            <div class="hy_rgh_dd_1">
                <ul>
                    <li><a href="#" class="dqdd">全部订单<span><%=totalNums%></span></a></li>
                    <li><a href="#">待付款订单<span><%=preNums %></span></a></li>
                    <li><a href="#">已付款订单<span><%=afnums %></span></a></li>
                    <%-- <li><a href="#">待评价订单<span>0</span></a></li>--%>
                </ul>
            </div>
            <div class="hy_rgh_dd_2">
                <table width="900" border="0" cellspacing="0" cellpadding="0">
                    <tr class="hy_rgh_dd_2_tle">
                        <td height="35" width="400">
                            订单信息
                        </td>
                        <td width="125">
                            出行时间
                        </td>
                        <td width="300">
                            规格
                        </td>
                        <td width="70">
                            数量
                        </td>
                        <td width="150">
                            订单金额
                        </td>
                        <td width="130">
                            状态
                        </td>
                        <td>
                            操作
                        </td>
                    </tr>
                    <%
                        decimal TotalPrice = 0;
                        //System.Data.DataTable dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
                        //foreach (System.Data.DataRow dr in dt.Rows)
                        //{

                        //    if (Convert.ToString(dr["ispay"]) == "1")
                        //        str_ispay = "已付款";
                        //    sql = "select  iif(isnull(totalprice),0,totalprice)as totalprice from OrderCarPro where Orderid='" + dr["Orderid"] + "';";
                        //    TotalPrice = Convert.ToDecimal(DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, sql, null));
                        //}

                        int pagenum = 10;
                        cp = Request["cp"] + "";
                        if (cp.Length < 1)
                        {
                            cp = "1";
                        }
                        int StartNum = Convert.ToInt32(cp) * pagemax;
                        int intTemNum = StartNum - pagemax;

                        sql = "select * from (select top " + StartNum + " * from OrderCarMenu " + where + "  order by createtime desc) a where a.orderid not in (Select top " + intTemNum + "  orderid from OrderCarMenu " + where + "  order by createtime desc)";
                        if (intTemNum <= 0)
                        {
                            sql = "select top " + pagemax + " *   from OrderCarMenu " + where + " order by createtime desc";
                        }
                        pagenum = Convert.ToInt32(DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, "select count(orderid) from OrderCarMenu " + where, null));
                        System.Data.DataTable dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
                        int i = 0, rightindex = 0;
                        string str_right = string.Empty;
                        foreach (System.Data.DataRow dr in dt.Rows)
                        {

                            if (Convert.ToString(dr["ispay"]) == "1")
                                str_ispay = "已付款";
                            //sql = "select  iif(isnull(totalprice),0,totalprice)as totalprice from OrderCarPro where Orderid='" + dr["Orderid"] + "';";
                            //TotalPrice = Convert.ToDecimal(DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, sql, null));
                            i++;
                    
                    %>
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
    string picb = Convert.ToString(DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, "select pictureb from product where id=" + dr2["Proid"] + ";", null));
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
                    <tr>
                        <td height="100">
                            <div class="rgh_dd_2_1">
                                <div class="rgh_dd_2_1_pic">
                                    <a href='<%=str_url %>' target="_blank">
                                        <img src="pic/<%=picb %>" width="110" height="80" /></a></div>
                                <div class="rgh_dd_2_1_nr">
                                    订单时间：<%=Convert.ToDateTime(dr["createtime"]).ToString("yyyy-MM-dd HH:mm:ss") %><br>
                                    订单号：<%=dr["orderid"] %><br />
                                    <a href='<%=str_url %>' target="_blank">
                                        <%=proname%></a></div>
                            </div>
                        </td>
                        <td>
                            <%=dr2["Godate"]%>
                        </td>
                        <td>
                            <ul>
                                <%=sbr_gg.ToString() %>
                            </ul>
                        </td>
                        <td class="t6">
                            <ul>
                                <%=sbr_price%>
                            </ul>
                        </td>
                        <td>
                            <%=dr2["TotalPrice"]%>
                        </td>
                        <td>
                            <%=str_ispay %>
                        </td>
                        <td>
                            <div class="rgh_dd_2_2">
                                <a href='<%=str_url %>' target="_blank">再次购买</a><br>
                                <%
                                    if (Convert.ToString(dr["ispay"]) == "0")
                                    {
                                %>
                                <a class="btn_orange" target="_blank" href="alipay.aspx?oid=<%=dr["Orderid"] %>">付款</a><br>
                                <%
                                    }

                                %>
                                <a href='javascript:order_del("<%=dr["orderid"] %>")'>删除订单</a></div>
                        </td>
                    </tr>
                    <%
                        }
                        }
                        page(pagenum, i + pagemax * (Convert.ToInt32(cp) - 1));
                    %>
                </table>
                <%=getpage%>
            </div>
        </div>
    </div>
    <script>

        function order_del(obj) {

            if (confirm("确定要删除该订单吗？")) {

                $.get("ajaxclass.ashx", { "ntype": "DelOrder", "oid": obj }, function (data) {

                    //var res = JSON.stringify(data);
                    var res = data.data[0];
                    if (res.result == "0")
                        alert("您还未登录！");
                    else if (res.result == "1") {
                        alert("删除成功！");
                        window.location.href = window.location.href;
                    }
                    else if (res.result == "-1")
                        alert("删除失败！");
                }, "json");


            }



        }
    
    </script>
</asp:Content>
