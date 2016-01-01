<%@ Page Title="" Language="C#" MasterPageFile="~/mar1.master" AutoEventWireup="true" CodeFile="cart_qz.aspx.cs" Inherits="cart_qz" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link type="text/css" rel="stylesheet" href="css/cart.css" />
    <script>
        $(document).ready(function () {
            $('.nav>li').mousemove(function () {
                $(this).addClass('on');
                $(this).find('dl').slideDown(); //you can give it a speed
            });
            $('.nav>li').mouseleave(function () {
                $(this).removeClass('on');
                $(this).find('dl').slideUp("fast");
            });

        });

        function gotocar2() {
            if ($(".cart_item").length == 0) {
                alert("购物车空空如也，还不能继续下一步！");
                return;
            }
            else
                window.location.href = "cart2.aspx";
        }

    </script>
    <div class="cartbox">
    <%
        decimal order_total_price = 0;
        
         %>
        <div class="cartcarb">
            <div class="cart_step">
                <div class="left_round">
                </div>
                <div class="center_bar">
                    <div class="step1 current">
                        <strong>1</strong> <span style="text-align: center">购物车</span>
                    </div>
                    <div class="step2">
                        <strong>2</strong> <span style="text-align: center">提交订单</span>
                    </div>
                    <div class="step3">
                        <strong>3</strong> <span style="text-align: center">支付</span>
                    </div>
                </div>
                <div class="right_round">
                </div>
            </div>
        </div>
        <%
            List<CarModel> cookie_models = new List<CarModel>();
            publicclass pblas = new publicclass();
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
                    sql = "select id, proname,pictureb,proname from product where id=" + model.ProId + " ";
                    System.Data.DataTable dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
                    foreach (System.Data.DataRow dr in dt.Rows)
                    {
                        string str_url = pblas.GetCarProUrl(model.ProId);
        %>
        <div class="cart_item" data-time="1421376449">
            <div class="item_link">
                <a href="<%=str_url %>" target="_blank">
                    <img src="pic/<%=dr["pictureb"] %>" style="width: 300px; height: 200px" alt="sc"></a><a
                        href="/p4578" target="_blank">
                        <%=dr["proname"]%></a>
            </div>
            <div class="item_details">
                <table>
                    <tbody>
                        <tr>
                            <td width="105">
                                <strong>选择地区</strong>
                            </td>
                            <td width="345">
                                <%=Convert.ToDateTime(model.GoDate).ToString("yyyy-MM-dd") %>
                            </td>
                            <td width="150">
                            </td>
                            <td width="120" class="showMoney showSaleMoney" precision="2" cny="254.39999999999998">
                                <em class="showSymbol">￥</em> <em class="showPrice">
                                    <%=model.TotalPrice%></em>
                            </td>
                        </tr>
                        <%
                            
                            if (model.CarChilds.Count > 0)
                            {
                                foreach (CarChild child in model.CarChilds)
                                {
                                    sql = "select id,title from ProCarInfo where id=" + child.CId + ";";
                                    System.Data.DataTable dt2 = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
                                    foreach (System.Data.DataRow dr2 in dt2.Rows)
                                    {
                        %>
                        <tr>
                            <td rowspan="1">
                                <strong>保险计划</strong>
                            </td>
                            <td>
                                <%=dr2["title"]%>
                            </td>
                            <td>
                                <!--<span>1</span>-->
                            </td>
                            <!--
							<td>AUD 53.0</td>
							-->
                            <td>
                                <%=child.Cnum %>
                            </td>
                        </tr>
                        <!--
					
					-->
                        <%--<tr>
                            <td rowspan="1">
                                <strong>补充信息</strong>
                            </td>
                            <td colspan="3">
                                用餐时间&nbsp;&nbsp;&nbsp;17:45-18:30（19:45前清座）
                            </td>
                        </tr> --%>
                        <%
                            }
                                }
                            }
                        %>
                    </tbody>
                </table>
                <div class="item_btn">
                    <a href="javascript:;" class="btn_grey collect" id="fav_4578" onclick="Collect.collectProduct(4578, 1);">
                        收藏</a> <a class="btn_fav fav_already" href="javascript:;" id="cfav_4578" style="display: none"
                            onclick="Collect.cancelCollectProduct(4578, 1)">已收藏</a> <a href="javascript:;" class="btn_grey del">
                                删除</a>
                </div>
            </div>
        </div>
        <%
}
                }
            }
        %>
        <div class="cart_total">
            <div class="total_num">
                <strong>订单总计 </strong><em class="showMoney showSaleMoney" precision="2" cny="254.4">
                    <label class="showSymbol">
                        ￥</label>
                    <label class="showPrice">
                        <%=order_total_price%></label></em></div>
            <div class="total_btn">
                <a href="index.aspx" class="btn_grey">继续购物</a> <a href="javascript:gotocar2();"
                    class="btn_red">下订单</a>
            </div>
        </div>
    </div>
</asp:Content>

