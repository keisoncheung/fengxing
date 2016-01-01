<%@ Page Title="" Language="C#" MasterPageFile="~/mar1.master" AutoEventWireup="true"
    CodeFile="cart2.aspx.cs" Inherits="cart2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link type="text/css" rel="stylesheet" href="css/cart.css" />
    <script src="js/json2.js" type="text/javascript"></script>
    <script type="text/javascript">


        $(function () {


        });
        function gopay() {

            if ($("#chty").attr("checked") == false) {
                alert("请勾选 同意风行网预订协议方可继续！");
                return;
            }

            var CarModel = { "Orderid": "", "Uid": "", "Cxing": "", "Cname": "", "Exing": "",
                "Ename": "", "Email": "", "Mobile": "", "Mobile2": "", "Remark": ""
            };
            CarModel.Cxing = $("#txtCxing").val();
            CarModel.Cname = $("#txtCname").val();
            CarModel.Exing = $("#txtExing").val();
            CarModel.Ename = $("#txtEname").val();
            CarModel.Email = $("#txtEmail").val();
            CarModel.Mobile = $("#txtMobile").val();
            CarModel.Mobile2 = $("#txtMobile2").val();
            CarModel.Remark = $("#userTips").val();

            if (CarModel.Cxing == "" || CarModel.Cname == "" || CarModel.Exing == "" || CarModel.Ename == "" || CarModel.Email == "" || CarModel.Mobile == "") {
                alert("请填写完整联系人信息！");
                return;
            }
            else {
                $.get("ajaxclass.ashx", { "ntype": "OrderCar", "carinfo": JSON.stringify(CarModel) }, function (data) {

                    //var res = JSON.stringify(data);
                    var res = data.data[0];
                    if (res.result == "0")
                        alert("未登录！");
                    else if (res.result == "1") {
                        alert("提交成功！");
                        window.location.href = "myorder2.aspx";
                    }
                    else if (res.result == "2")
                        alert("提交失败！");
                }, "json");
            }
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
                    <div class="step1 ">
                        <strong>1</strong> <span style="text-align: center">购物车</span>
                    </div>
                    <div class="step2 current">
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
        <div class="cart_check">
            <div data-type="contact">
                <h4>
                    联系人信息 <span>您在网站注册的 email 将用于接收电子票。个别用户的邮件系统会将电子票误作为垃圾邮件，如果连续多天未收到电子票，请注意检查垃圾箱。
                    </span>
                </h4>
                <div class="cart_item">
                    <dl class="cart_contact">
                        <dt>联系人（需成人）姓名<span>请与护照保持一致，姓名请填写英文名。</span>
                            <!--<a href="javascript:;">护照姓名图解</a>-->
                        </dt>
                        <dd>
                            <div>
                                <div class="mod_ipt">
                                    <label for="">
                                        <font color="red">*</font>英文姓：</label>
                                    <input type="text" class="ipt_small" id="txtExing" data-cellname="familyNameEn" value="">
                                </div>
                                <div class="mod_ipt">
                                    <label for="">
                                        <font color="red">*</font>英文名：</label>
                                    <input type="text" class="ipt_small" id="txtEname" data-cellname="givenNameEn" value="">
                                </div>
                                <div class="mod_ipt">
                                    <label for="">
                                        中文姓：</label>
                                    <input type="text" class="ipt_small" id="txtCxing" data-cellname="familyNameZh" value="">
                                </div>
                                <div class="mod_ipt">
                                    <label for="">
                                        中文名：</label>
                                    <input type="text" class="ipt_small" id="txtCname" data-cellname="givenNameZh" value="">
                                </div>
                            </div>
                            <div>
                                <div class="mod_ipt">
                                    <label for="">
                                        <font color="red">*</font>联系邮箱：</label>
                                    <input type="text" class="ipt_medium" id="txtEmail" data-cellname="recvEmail" value="">&nbsp;(重要，用于接收电子票)
                                </div>
                            </div>
                            <div>
                                <div class="mod_ipt">
                                    <label for="">
                                        <font color="red">*</font>手机号码(含国家代码):</label>
                                    <input type="text" class="ipt_medium" id="txtMobile" data-cellname="localPhoneNo"
                                        value="">
                                    <p>
                                        (此电话将用于行前预定相关事宜的紧急联系)</p>
                                </div>
                                <div class="mod_ipt">
                                    <label for="">
                                        旅途电话(含国家代码):</label>
                                    <input type="text" class="ipt_medium" id="txtMobile2" data-cellname="foreignPhoneNo"
                                        value="">
                                    <p>
                                        (此电话将用于旅途行进中的紧急联系；没有则不填)</p>
                                </div>
                            </div>
                        </dd>
                    </dl>
                </div>
            </div>
            <div data-type="cart_list">
                <h4 id="productListH4">
                    产品预定清单</h4>
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
                            string str_url = string.Empty;

                            order_total_price = order_total_price + model.TotalPrice;
                            sql = "select id, proname,pictureb,proname from product where id=" + model.ProId + " ";
                            System.Data.DataTable dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
                            foreach (System.Data.DataRow dr in dt.Rows)
                            {
                                str_url = pblas.GetCarProUrl(model.ProId);
                %>
                <div class="cart_item" data-time="1421376449" id="cart_item<%=model.ProId %>">
                    <div class="item_title">
                        <h3>
                            <a href="<%=str_url %>" target="_blank">
                                <%=dr["proname"]%></a>
                        </h3>
                        <%--  <div class="item_btn">
                            <a href="javascript:;" class="btn_grey" data-op="remove">取消</a> <a href="javascript:;"
                                class="btn_grey" data-op="update">修改</a>
                        </div>--%>
                    </div>
                    <%
                        if (model.Stype == 0)
                        {
                        
                    %>
                    <div class="item_details">
                        <table>
                            <tbody>
                                <tr>
                                    <td width="105">
                                        <strong>旅游日期</strong>
                                    </td>
                                    <td width="345">
                                        <%=Convert.ToDateTime(model.GoDate).ToString("yyyy-MM-dd")%>
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
                                        <strong>预定规格</strong>
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
                                        <%=child.Cnum%>
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
                            <a href="javascript:AddFavorite('<%=model.ProId %>');" class="btn_grey collect" id="f<%=model.ProId %>">
                                收藏</a> <a class="btn_fav fav_already" href="javascript:DelFavorite('<%=model.ProId %>');"
                                    id="fd<%=model.ProId %>" style="display: none">已收藏</a> <a href="javascript:DelCar(<%=model.ProId %>);"
                                        class="btn_grey del">删除</a>
                        </div>
                    </div>
                    <%
                        }
                        else if (model.Stype == 1)
                        {

                    %>
                    <div class="item_details">
                        <table>
                            <tbody>
                                <tr>
                                    <td width="105">
                                        <strong>地区</strong>
                                    </td>
                                    <td width="345">
                                        <%=Convert.ToString(DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn,"select clsname1 from citytype where id="+model.DQ_QZ+";",null))%>
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
                                            sql = "select id,content from baoxianjihua where id=" + child.CId + ";";
                                            System.Data.DataTable dt2 = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
                                            foreach (System.Data.DataRow dr2 in dt2.Rows)
                                            {
                                %>
                                <tr>
                                    <td rowspan="1">
                                        <strong>保险计划</strong>
                                    </td>
                                    <td>
                                        <%=dr2["content"]%>
                                    </td>
                                    <td>
                                        <!--<span>1</span>-->
                                    </td>
                                    <!--
							<td>AUD 53.0</td>
							-->
                                    <td>
                                        <%=child.Cnum%>
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
                            <a href="javascript:AddFavorite('<%=model.ProId %>');" class="btn_grey collect" id="f<%=model.ProId %>">
                                收藏</a> <a class="btn_fav fav_already" href="javascript:DelFavorite('<%=model.ProId %>');"
                                    id="fd<%=model.ProId %>" style="display: none">已收藏</a> <a href="javascript:DelCar(<%=model.ProId %>);"
                                        class="btn_grey del">删除</a>
                        </div>
                    </div>
                    <%
                        }         
                    %>
                </div>
                <%
}


                        }
                    }
                %>
            </div>
            <div data-type="user_tips">
                <h4>
                    订单备注：</h4>
                <textarea id="userTips" rows="5s" cols="80" name="" maxlength="500" placeholder="选填：为了我们更好的了解您的需求，请在此留言说明您希望获取的信息，包括：订单相关细节，酒店延住选择，房间安排或者其他您需要我们知道, 并有助于您行程安排的咨询。您提出的特殊需求我们都会尽量满足，但不排除因客观条件限制而未能达到您预期。"></textarea>
            </div>
            <div class="total_num" data-exchange="{17=4.7, 16=2.0, 9=5.2, 10=4.8, 11=3.2, 12=1.0, 13=6.2, 14=0.2, 15=5.3E-4}"
                data-discount="100" selectcurrencyid="">
                <p class="activity_discount" style="display: none;">
                    <span style="font-size: 16px; font-weight: bold; color: #000000; margin-left: 0;">
                    </span><span class="activity_discount_price" style="margin-left: 0;"></span>
                </p>
                <strong>应付金额 </strong><span><em class="showMoney" precision="2" cny="676.2">
                    <label class="showSymbol">
                        ￥</label>
                    <label class="showPrice" id="total_num">
                        <%=order_total_price%></label></em></span>
                <p id="feeTip">
                </p>
            </div>
            <div class="cart_ensure">
                <div class="btn_grey">
                    <input type="checkbox" id="chty" checked="">
                    <a target="_blank" href="/static/agreement" style="color: #fff">同意风行网预订协议 </a>
                </div>
                <a href="javascript:gopay();" class="btn_blue" id="confirmBookBtn">提交订单</a>
            </div>
        </div>
    </div>
    <script>
        function AddFavorite(pid) {
            var url = window.location.href;
            $.get("ajaxclass.ashx", { "ntype": "AddMyFavorite", "pid": pid, "url": url }, function (data) {

                var res = data.data[0];
                if (res.result == "0") {
                    alert("未登录！");
                    window.location.href = "login.aspx";
                }
                else if (res.result == "1") {
                    $("#f" + pid).css("display", "none");
                    $("#fd" + pid).css("display", "block");
                }
                else if (res.result == "2") {
                    $("#f" + pid).css("display", "none");
                    $("#fd" + pid).css("display", "");
                }
                else if (res.result == "-1")
                    alert("收藏失败！");
            }, "json");
        }

        function DelFavorite(pid) {
            var url = window.location.href;
            $.get("ajaxclass.ashx", { "ntype": "DelMyFavorite", "pid": pid, "url": url }, function (data) {

                var res = data.data[0];
                if (res.result == "0") {
                    alert("未登录！");
                    window.location.href = "login.aspx";
                }
                else if (res.result == "1") {
                    $("#f" + pid).css("display", "");
                    $("#fd" + pid).css("display", "none");
                }
                else if (res.result == "2") {
                    $("#f" + pid).css("display", "");
                    $("#fd" + pid).css("display", "none");
                }
                else if (res.result == "-1")
                    alert("删除收藏失败！");
            }, "json");
        }

        //移除购物车
        function DelCar(pid) {
            var url = window.location.href;
            if (confirm("确定要移除该商品吗？")) {
                $.get("ajaxclass.ashx", { "ntype": "DelCar", "pid": pid }, function (data) {

                    var res = data.data[0];
                    if (res.result == "0") {
                        alert("无效请求，请刷新再试！");
                    }
                    else if (res.result == "1") {
                        $("#cart_item" + pid).remove();
                        $("#total_num").text(res.num);
                    }
                }, "json");
            }
        }

    </script>
</asp:Content>
