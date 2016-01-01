<%@ Page Title="" Language="C#" MasterPageFile="~/mar1.master" AutoEventWireup="true"
    CodeFile="menbermycar.aspx.cs" Inherits="menbermycar" %>
    <%@ Register Src="~/menber_menu.ascx" TagName="m_left" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link type="text/css" rel="stylesheet" href="css/huiyuan.css" />
    <div class="huiyuan">
                <uc1:m_left runat="server" ID="left1" />
        <div class="hy_right">
            <div class="hy_rgh_dd_1">
                <ul>
                    <li><a href="#" class="dqdd">我的购物车</a></li>
                </ul>
            </div>
             <%
            decimal order_total_price = 0;
        
        %>
            <div class="hy_rgh_gwc_2">
                <table width="900" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="44" width="330">
                           <%-- <input name="checkbox" type="checkbox" id="checkbox" class="sa" onclick="xuanzhe()" />
                            全选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>产品信息
                        </td>
                        <td width="300">
                            已选规格
                        </td>
                        <td width="90">
                            &nbsp;结算价
                        </td>
                        <td>
                            &nbsp;操作
                        </td>
                    </tr>
                    <%
                        publicclass pbclas = new publicclass();
                        List<CarModel> cookie_models = new List<CarModel>();
                        
                        string sql = string.Empty;
                        if (Session["carinfo"] != null)
                        {
                            List<CarModel> _cookie_models = new List<CarModel>();
                            cookie_models = (List<CarModel>)Session["carinfo"];
                        }
                        if (cookie_models.Count > 0)
                        {
                            foreach (CarModel model in cookie_models)
                            {
                                order_total_price = order_total_price + model.TotalPrice;
                                sql = "select id, proname,pictureb,proname,jiage2 from product where id=" + model.ProId + " ";
                                System.Data.DataTable dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
                                foreach (System.Data.DataRow dr in dt.Rows)
                                {
                                    string str_url = pbclas.GetCarProUrl(Convert.ToString(dr["id"]));
                    %>
                    <tr class="menbercar">
                        <td height="100">
                            <div class="rgh_gwc_2_1">
                                <div class="rhg_gwc_2_1_xx">
                                    <input name="id[]" type="checkbox" id="id[]" value="1" class="sch" /></div>
                                <div class="rgh_gwc_2_1_pic">
                                    <a href='<%=str_url %>' target="_blank"><img src="pic/<%=dr["pictureb"] %>" width="110" height="80" /></a></div>
                                <div class="rgh_gwc_2_1_nr">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td height="80" width="155">
                                                <a href='<%=str_url %>' target="_blank"><%=dr["proname"] %></a>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </td>
                        <td>
                            出行时间：<%=Convert.ToDateTime(model.GoDate).ToString("yyyy-MM-dd") %><br>
                            <%
                            
                                if (model.CarChilds.Count > 0)
                                {
                                    foreach (CarChild child in model.CarChilds)
                                    {
                                        sql = "select id,title from ProCarInfo where id=" + child.CId + ";";
                                        System.Data.DataTable dt2 = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
                                        foreach (System.Data.DataRow dr2 in dt2.Rows)
                                        {
                            %><br>
                            <%=dr2["title"]%>
                            &nbsp;&nbsp;人数：
                            <%=child.Cnum %>
                            <%
                                }
                                    }
                                }
                            %>
                        </td>
                        <td>
                            ￥<%=model.TotalPrice%>
                        </td>
                        <td>
                            <div class="rgh_gwc_2_2">
                                <a href='javascript:myfavorite_add("<%=dr["id"] %>")'>加入收藏</a><br>
                                删除</div>
                        </td>
                    </tr>
                    <%
}
                            }
                        }
                    %>
                </table>
                <div class="gwcjg">
                    <div class="gwcjg_1">
                       <%-- <input name="checkbox2" type="checkbox" class="sa2" onclick="xuanzhe2()" />
                        全选 &nbsp;&nbsp;&nbsp; 删除--%>
                        </div>
                    <div class="gwcjg_2">
                        <div class="gwcjg_2_1">
                            </div>
                        <div class="gwcjg_2_2">
                            合计：<span>￥<%=order_total_price %></span></div>
                        <div class="gwcjg_2_3">
                            <a href="index.aspx" class="jixugw">继续购买</a>
                            <input type="button" class="jiesuan" value="去结算" onclick="javascript:gotocar2();"></div>
                    </div>
                </div>
                <script>
                    function xuanzhe() {
                        var a = $(".sa").attr("checked");
                        $(".sch").attr("checked", a);
                    }
                    function xuanzhe2() {
                        var a = $(".sa2").attr("checked");
                        $(".sch").attr("checked", a);
                    }

                </script>
            </div>
        </div>
    </div>
    <script>
        function myfavorite_add(obj) {
            $.get("ajaxclass.ashx", { "ntype": "AddMyFavorite", "pid": obj }, function (data) {

                //var res = JSON.stringify(data);
                var res = data.data[0];
                if (res.result == "0")
                    alert("您还未登录！");
                else if (res.result == "1") {
                    alert("成功收藏！");
                }
                else if (res.result == "2") {
                    alert("已收藏过！");
                    
                }
                else if (res.result == "-1")
                    alert("收藏失败！");
            }, "json");
        }


        function gotocar2() {
            if ($(".menbercar").length == 0) {
                alert("购物车空空如也，还不能继续下一步！");
                return;
            }
            else
                window.location.href = "cart2.aspx";
        }
    </script>
</asp:Content>
