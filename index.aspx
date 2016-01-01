<%@ Page Title="" Language="C#" MasterPageFile="~/mar1.master" AutoEventWireup="true"
    CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link type="text/css" rel="stylesheet" href="css/index.css" />
    <div class="flasher">
        <!--<img src="images/fl.jpg" height="412" />-->
        <div class="flexslider">
            <ul class="slides">
                <%
                
                    string pic_url = string.Empty;
                    string sql = "select top 5 id,stitle,bpic,weburl from MainPic where parid=0 order by id desc;";
                    System.Data.DataTable dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
                    foreach (System.Data.DataRow dr in dt.Rows)
                    {

                        pic_url = "style='background: url(pic/" + dr["bpic"] + " ) 50% 0 no-repeat;cursor:pointer;'  ";
                %>
                <li <%=pic_url %> onclick="MainPicGoUrl('<%=dr["weburl"] %>')"></li>
                <%
}
                %>
            </ul>
        </div>
        <script src="js/jquery.flexslider-min.js"></script>
        <script>

            function MainPicGoUrl(weburl) {
                window.location.href = weburl;
            }

            $(function () {
                $('.flexslider').flexslider({
                    directionNav: true,
                    pauseOnAction: false
                });
            });
        </script>
    </div>
    <div class="mainerbox1">
        <div class="mainerbox1_top">
            <img src="images/b11.png" />
        </div>
        <div class="mainerbox1_bot">
            <ul>
                <%=returnHot()%>
            </ul>
        </div>
    </div>
    <div class="mainerbox2">
        <div class="mainerbox2box">
            <div class="mainerbox2boxleft">
                <div class="mb2bleft_1">
                    <img src="images/b22.png" /></div>
                <div class="mb2bleft_2">
                    <%=getcity("0")%>
                </div>
            </div>
            <div class="mainerbox2boxright">
                <ul>
                    <%=returnArea(0) %>
                </ul>
            </div>
        </div>
    </div>
    <div class="mainerbox3">
        <div class="mainerbox2box">
            <div class="mainerbox2boxleft">
                <div class="mb2bleft_1">
                    <img src="images/b33.png" /></div>
                <div class="mb2bleft_2">
                    <%=getcity("1")%>
                </div>
            </div>
            <div class="mainerbox2boxright">
                <ul>
                    <%=returnArea(1) %>
                </ul>
            </div>
        </div>
    </div>
    <div class="mainerbox4">
        <div class="mainerbox2box">
        <%
            string sql_sj = "select  id,clsname,picb from productType  where parid=374 order by id desc; ";
            StringBuilder sbr_sj_lb = new StringBuilder();
            string sj_type1 = string.Empty, sj_type2 = string.Empty, sj_type3 = string.Empty, sj_type4 = string.Empty, sj_type5 = string.Empty, sj_type6 = string.Empty;
            System.Data.DataTable dt_sj = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql_sj, null).Tables[0];
            foreach (System.Data.DataRow dr in dt_sj.Rows)
            {
                sbr_sj_lb.Append("<a href='chakangengduo.aspx?pid=" + dr["id"] + "' class='mb2a'>" + dr["clsname"] + "</a>");
                if (Convert.ToString(dr["id"])=="375")
                {
                    sj_type1 = @" <div class='mb4brightbox1'>
                                <a href='chakangengduo.aspx?pid="+dr["id"]+@"'>
                                    <img src='pic/"+dr["picb"]+@"' width='233' height='151' alt=''></a><p>
                                        <a href='chakangengduo.aspx?pid=" + dr["id"] + @"'>" + dr["clsname"] + @"</a></p>
                            </div>";
                }
                else if (Convert.ToString(dr["id"]) == "376")
                {
                    sj_type2 = @"   <div class='mb4brightbox1'>
                                <a href='chakangengduo.aspx?pid=" + dr["id"] + @"'>
                                    <img src='pic/" + dr["picb"] + @"' width='233' height='151' alt='" + dr["clsname"] + @"'></a><p>
                                        <a href='chakangengduo.aspx?pid=" + dr["id"] + @"'>" + dr["clsname"] + @"</a></p>
                            </div>";
                }
                else if (Convert.ToString(dr["id"]) == "377")
                {
                    sj_type3 = @"   <div class='mb4brightbox1' style='width:456px;'><a href='chakangengduo.aspx?pid=" + dr["id"] + @"'><img src='pic/" + dr["picb"] + @"' width='456' height='151' alt='" + dr["clsname"] + @"'></a><p><a href='chakangengduo.aspx?pid=" + dr["id"] + @"'>" + dr["clsname"] + @"</a></p></div>";
                }
                else if (Convert.ToString(dr["id"]) == "378")
                {
                    sj_type4 = @"  <div class='mb4brightbox1' style='width:694px;'>
                            <a href='chakangengduo.aspx?pid=" + dr["id"] + @"'><img src='pic/" + dr["picb"] + @"' width='694' height='151' alt=''></a><p><a href='chakangengduo.aspx?pid=" + dr["id"] + @"'>" + dr["clsname"] + @"</a></p>
                            </div>";
                }
                else if (Convert.ToString(dr["id"]) == "379")
                {
                    sj_type5 = @" <div class='mb4brightbox1' style='width: 269px;'>
                                        <a href='chakangengduo.aspx?pid=" + dr["id"] + @"'>
                                            <img src='pic/" + dr["picb"] + @"' width='269' height='151' alt='" + dr["clsname"] + @"'></a><p>
                                                 <a href='chakangengduo.aspx?pid=" + dr["id"] + @"'>" + dr["clsname"] + @"</a></p>
                                    </div>";
                }
                else if (Convert.ToString(dr["id"]) == "380")
                {
                    sj_type6 = @"   <div class='mb4brightbox1' style='width: 233px; height: 307px;'>
                                <a href='chakangengduo.aspx?pid=" + dr["id"] + @"'>
                                    <img src='pic/" + dr["picb"] + @"' width='233' height='307' alt=''></a><p style='width: 151px;'>
                                        <a href='chakangengduo.aspx?pid=" + dr["id"] + @"'>" + dr["clsname"] + @"</a></p>
                            </div>";
                }
            }
            
             %>
            <div class="mainerbox2boxleft">
                <div class="mb5bleft_1">
                    <img src="images/b44.png" /></div>
                <div class="mb5bleft_2" style="padding-left: 30px; width: 220px;">
                    <img src="images/y1.png" />
                </div>
                <div class="mb2bleft_2">
                <%=sbr_sj_lb.ToString() %>
                    <%--<a href="chakangengduo.aspx?pid=375" class="mb2a">美酒</a> <a href="chakangengduo.aspx?pid=376">
                        高尔夫</a> <a href="chakangengduo.aspx?pid=377">自驾</a> <a href="chakangengduo.aspx?pid=379">
                            考察</a> <a href="chakangengduo.aspx?pid=380">海岛</a> <a href="chakangengduo.aspx?pid=378">
                                节庆</a>--%>
                </div>
            </div>
            <div class="mainerbox4boxright">
                <div class="mb4brightbox">
                    <div class="xx_01">
                        <div class="xx_01_1">
                            <%=sj_type1 %>
                        </div>
                        <div class="xx_01_2">
                            <img src="images/xx_02.gif" width="5" height="151" alt=""></div>
                        <div class="xx_01_3">
                            <%=sj_type2 %>
                        </div>
                        <div class="xx_01_4">
                            <img src="images/xx_04.gif" width="5" height="151" alt="">
                        </div>
                        <div class="xx_01_5">
                            <%=sj_type3%>
                        </div>
                    </div>
                    <div class="xx_06">
                        <img src="images/xx_06.gif" width="932" height="5" alt="">
                    </div>
                    <div class="xx_07">
                        <div class="xx_07_left">
                            <%=sj_type6 %>
                        </div>
                        <div class="xx_07_right">
                            <div class="xx_07_right_1">
                                <div class='xx_07_right_1_1'>
                                    <div class='mb4brightbox1' style='width: 430px;'>
                                        <a href='chakangengduo.aspx?pid=379'>
                                            <img src='images/xx_08.gif' width='430' height='151' alt=''></a>
                                    </div>
                                </div>
                                <div class="xx_07_right_1_2">
                                    <img src="images/xx_11.gif" width="5" height="151" alt="">
                                </div>
                                <div class="xx_07_right_1_3">
                                    <%=sj_type5 %>
                                </div>
                            </div>
                            <div class="xx_07_right_2">
                                <img src="images/xx_10.gif" width="699" height="5" alt="">
                            </div>
                            <div class="xx_07_right_3">
                                <div class="xx_07_right_3_1">
                                    <img src="images/xx_11.gif" width="5" height="151" />
                                </div>
                                <div class="xx_07_right_3_2">
                                    <%=sj_type4%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- <table  width="918" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="172" height="151">
                        	<div class="mb4brightbox1"><a href="#"><img src="images/b4_01.png" width="172" height="151" alt=""></a><p><a href="#">风行旅游景点</a></p></div>
                            </td>
                        <td width="6" height="151">
                            <img src="images/b4_02.png" width="6" height="151" alt=""></td>
                        <td width="172" height="151">
                        	<div class="mb4brightbox1"><a href="#"><img src="images/b4_03.png" width="172" height="151" alt=""></a><p><a href="#">风行旅游景点</a></p></div>
                            </td>
                        <td width="6" height="151">
                            <img src="images/b4_04.png" width="6" height="151" alt=""></td>
                        <td colspan="3" width="384" height="151">
                        	<div class="mb4brightbox1" style="width:384px;"><a href="#"><img src="images/b4_05.png" width="384" height="151" alt=""></a><p><a href="#">风行旅游景点</a></p></div>
                            </td>
                        <td width="6" height="151">
                            <img src="images/b4_06.png" width="6" height="151" alt=""></td>
                        <td width="172" height="151">
                        	<div class="mb4brightbox1"><a href="#"><img src="images/b4_07.png" width="172" height="151" alt=""></a><p><a href="#">风行旅游景点</a></p></div>
                            </td>
                    </tr>
                </table>
                <div class="kongxi6"></div>
                <table  width="918" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td colspan="5" width="385" height="151">
                        	<div class="mb4brightbox1" style="width:385px;"><a href="#"><img src="images/15_09.png" width="385" height="151" alt=""></a><p><a href="#">风行旅游景点</a></p></div>
                            </td>
                        <td width="183" height="151">
                            <a href="#"><img src="images/b4_10.png" width="183" height="151" alt=""></a></td>
                        <td width="172" height="151">
                        	<div class="mb4brightbox1"><a href="#"><img src="images/b4_11.png" width="172" height="151" alt=""></a><p><a href="#">风行旅游景点</a></p></div>
                            </td>
                        <td width="6" height="151">
                            <img src="images/b4_12.png" width="6" height="151" alt=""></td>
                        <td width="172" height="151">
                        	<div class="mb4brightbox1"><a href="#"><img src="images/b4_13.png" width="172" height="151" alt=""></a><p><a href="#">风行旅游景点</a></p></div>
                            </td>
                    </tr>
                </table>
                <div class="kongxi6"></div>
                <table  width="918" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="172" height="151">
                        	<div class="mb4brightbox1"><a href="#"><img src="images/b4_15.png" width="172" height="151" alt=""></a><p><a href="#">风行旅游景点</a></p></div>
                            </td>
                        <td width="6" height="151">
                            <img src="images/b4_16.png" width="6" height="151" alt=""></td>
                        <td colspan="7" width="740" height="151">
                        	<div class="mb4brightbox1" style="width:740px;"><a href="#"><img src="images/b4_17.png" width="740" height="151" alt=""></a><p><a href="#">风行旅游景点</a></p></div>
                            </td>
                    </tr>
                    <tr>
                        <td width="172" height="1">
                            <img src="images/fgf.gif" width="172" height="1" alt=""></td>
                        <td width="6" height="1">
                            <img src="images/fgf.gif" width="6" height="1" alt=""></td>
                        <td width="172" height="1">
                            <img src="images/fgf.gif" width="172" height="1" alt=""></td>
                        <td width="6" height="1">
                            <img src="images/fgf.gif" width="6" height="1" alt=""></td>
                        <td width="29" height="1">
                            <img src="images/fgf.gif" width="29" height="1" alt=""></td>
                        <td width="183" height="1">
                            <img src="images/fgf.gif" width="183" height="1" alt=""></td>
                        <td width="172" height="1">
                            <img src="images/fgf.gif" width="172" height="1" alt=""></td>
                        <td width="6" height="1">
                            <img src="images/fgf.gif" width="6" height="1" alt=""></td>
                        <td width="172" height="1">
                            <img src="images/fgf.gif" width="172" height="1" alt=""></td>
                    </tr>
                </table>-->
                </div>
            </div>
        </div>
    </div>
    <div class="mainerbox5">
        <div class="mainerbox2box">
            <div class="mainerbox2boxleft">
                <div class="mb5bleft_1">
                    <img src="images/b55.png" width="238" height="63" /></div>
                <div class="mb5bleft_2">
                    <img src="images/y2.png" />
                </div>
                <div class="mb2bleft_2">
                    <a href="tuanduily.aspx?tian=7" class="mb2a">7天</a> <a href="tuanduily.aspx?tian=8">
                        8天</a> <a href="tuanduily.aspx?tian=9">9天</a> <a href="tuanduily.aspx?tian=10">10天</a>
                    <a href="tuanduily.aspx?tian=11">11天</a> <a href="tuanduily.aspx?tian=12">12天</a>
                </div>
            </div>
            <div class="mainerbox2boxright">
                <ul>
                    <%=returnTuan()%>
                </ul>
            </div>
        </div>
    </div>
    <div class="mainerbox7">
        <div class="mainerbox7box">
            <a href="#">
                <img src="images/ck.jpg" width="1200" height="200" usemap="#Map" />
                <map name="Map">
                    <area shape="rect" coords="4,44,346,155" href="qianzheng.aspx?gj=0" title="澳大利亚签证办理">
                    <area shape="rect" coords="552,153,682,189" href="qianzheng.aspx?gj=0" title="400联系电话">
                    <area shape="rect" coords="885,43,1199,154" href="qianzheng.aspx?gj=1" title="新西兰签证办理">
                </map>
            </a>
        </div>
    </div>
    <div class="mainerbox6">
        <div class="mainerbox6box">
            <div class="mainerbox6box2">
                <div class="mainerbox6box2_left">
                    <script>
                        //使用说明：1,加载在函数$(document).ready(function(){……});里面写或者windows.onload里面也可以-------目的就是加载函数
                        //		   2,函数参数  第一个：ul的class{只要是里面套着相应的对应列表，任何标签都可以}  第二个：需要显示隐藏的外面套着的DIV的class
                        //         3,效果：就是第一个li显示第一个div，其他隐藏   第二个li显示第二个div，其他隐藏   以此类推
                        $(document).ready(function () {
                            //feilong("jypli","jypdiv");
                            jyp("nekk", "fucka", "nekkhow");
                            jyp("zyxtop", "zyxbot", "zyxtopover");
                            jyp("mainerb6b4_top", "mainerb6b4_bot", "mainerb6b4_tophover");
                            //	jyp("hdlist","huodong_left","hdon","hdabc");
                        });
                        //以下函数是点击显示的，参数一样
                        function feilong(dian_class, show_class, liclass) {
                            $("." + show_class).children().hide();
                            $("." + show_class).children().eq(0).show();
                            $("." + dian_class).children().removeClass(liclass);
                            $("." + dian_class).children().eq(0).addClass(liclass);
                            $("." + dian_class).children().each(function (e) {
                                $(this).click(function () {
                                    $("." + show_class).children().hide();
                                    $("." + show_class).children().eq(e).show();
                                    $("." + dian_class).children().removeClass(liclass);
                                    $("." + dian_class).children().eq(e).addClass(liclass);
                                });
                            });
                        }
                        //以下函数是鼠标悬浮到上面显示的,参数一样
                        function jyp(dian_class, show_class, liclass, sunziclass) {
                            $("." + show_class).children().hide();
                            $("." + show_class).children().eq(0).show();
                            $("." + dian_class).children().removeClass(liclass);
                            $("." + dian_class).children().eq(0).addClass(liclass);
                            $("." + dian_class).children().children().removeClass(sunziclass);
                            $("." + dian_class).children().eq(0).children().addClass(sunziclass);
                            $("." + dian_class).children().each(function (e) {
                                $(this).mouseover(function () {
                                    $("." + show_class).children().hide();
                                    $("." + show_class).children().eq(e).show();
                                    $("." + dian_class).children().removeClass(liclass);
                                    $("." + dian_class).children().eq(e).addClass(liclass);
                                    $("." + dian_class).children().children().removeClass(sunziclass);
                                    $("." + dian_class).children().eq(e).children().addClass(sunziclass);
                                });
                            });
                        }
                    </script>
                    <ul class="nekk">
                        <li class="nekkhow"><a href="ziyouxing.aspx?gj=-1" class="">酒店+机票</a></li>
                        <li class=""><a href="#" class="">机场接送车</a></li>
                        <li class=""><a href="#" class="">酒店</a></li>
                        <li class=""><a href="#" class="">租车</a></li>
                    </ul>
                    <div class="fucka">
                        <div class="nekkbox">
                            <div class="nekkbox1">
                                <a href="#">
                                    <img src="images/ko1.jpg" width="1178" height="172" /></a>
                            </div>
                            <ul class="nekkimglist">
                                <%
                                    string str_pic = string.Empty, div_class = string.Empty; ;
                                    int zyx_index = 0;
                                    string sql2 = "select top 4 id,ProName,proname2,jiage,jiage2,PictureB from product where  sfzyx=1 and grade=1 order by id desc";
                                    System.Data.DataTable dt2 = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql2, null).Tables[0];

                                    foreach (System.Data.DataRow dr2 in dt2.Rows)
                                    {
                                        zyx_index++;
                                        str_pic = "pic/" + Convert.ToString(dr2["PictureB"]);
                                        if (zyx_index == 4)
                                            div_class = "class='nkilboxpadd' ";
                                %>
                                <li <%=div_class %>>
                                    <div class="nkilbox">
                                        <div class="nkilbox1">
                                            <a href="ziyouxing_show.aspx?pro_id=<%=dr2["id"] %>">
                                                <img src="<%=str_pic %>" width="273" height="202" /></a></div>
                                        <div class="nkilbox2">
                                            <a href="ziyouxing_show.aspx?pro_id=<%=dr2["id"] %>">
                                                <%=dr2["ProName"]%>(<%=dr2["ProName2"]%>)</a></div>
                                        <div class="nkilbox3">
                                            <strong>￥</strong><span><%=dr2["jiage"] %></span> 起</div>
                                    </div>
                                </li>
                                <%
                                   
}
                                %>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--<div class="mainerbox6box2_right">
            	<ul class="zyxtop">
                	<li class="zyxtopover"><a href="#">自由行</a></li>
                    <li><a href="#">游轮</a></li>
                </ul>
                <div class="zyxbot">
                	<div class="zyxbotlist" style="display:block;">
                    	<div class="zyxbotlist1">
                        	<a href="#"><img src="images/g4.png" width="259" height="158" /></a>
                        </div>
                        <div class="zyxbotlist2">
                        	<div class="zyxbotlist2box ">
                            	<div class="zyxbotlist2box1 zyxbotlist2box1bai">1</div>
                                <div class="zyxbotlist2box2"><span class="nkilbox2">&lt;韩国首尔4天3晚自由行&gt;上海出发，首尔AVENTREE酒店住宿</span></div>
                            </div>
                        	<div class="zyxbotlist2box">
                            	<div class="zyxbotlist2box1">2</div>
                                <div class="zyxbotlist2box2"><span class="nkilbox2">&lt;韩国首尔4日自由行&gt;上海往返，南方航空直飞，仅为单机票价格</span></div>
                            </div>
                        	<div class="zyxbotlist2box">
                            	<div class="zyxbotlist2box1">3</div>
                                <div class="zyxbotlist2box2">&lt;韩国首尔自由行&gt;韩国个人旅游签证</div>
                            </div>
                        	<div class="zyxbotlist2box">
                            	<div class="zyxbotlist2box1">4</div>
                                <div class="zyxbotlist2box2"><span class="nkilbox2">&lt;韩国首尔4天3晚自由行&gt;上海出发，首尔AVENTREE酒店住宿</span></div>
                            </div>
                        	<div class="zyxbotlist2box">
                            	<div class="zyxbotlist2box1">5</div>
                                <div class="zyxbotlist2box2"><span class="nkilbox2">&lt;韩国首尔4日自由行&gt;上海往返，南方航空直飞，仅为单机票价格</span></div>
                            </div>
                        	<div class="zyxbotlist2box">
                            	<div class="zyxbotlist2box1">6</div>
                                <div class="zyxbotlist2box2">&lt;韩国首尔自由行&gt;韩国个人旅游签证</div>
                            </div>
                        </div>
                        <div class="zyxbotlist3">
                        	<a href="#">更多&gt;&gt;</a>
                        </div>
                    </div>
                	<div class="zyxbotlist" style="display:none;">
                    	<div class="zyxbotlist1">
                        	<a href="#"><img src="images/g4.png" width="259" height="158" /></a>
                        </div>
                        <div class="zyxbotlist2">
                        	<div class="zyxbotlist2box ">
                            	<div class="zyxbotlist2box1 zyxbotlist2box1bai">1</div>
                                <div class="zyxbotlist2box2"><a href="#">美国西海岸一号公路自驾九日游（当地游，不含机票）</a></div>
                            </div>
                        	<div class="zyxbotlist2box">
                            	<div class="zyxbotlist2box1">2</div>
                                <div class="zyxbotlist2box2"><a href="#">美国西海岸一号公路自驾九日游（当地游，不含机票）</a></div>
                            </div>
                        	<div class="zyxbotlist2box">
                            	<div class="zyxbotlist2box1">3</div>
                                <div class="zyxbotlist2box2"><a href="#">美国西海岸一号公路自驾九日游（当地游，不含机票）</a></div>
                            </div>
                        	<div class="zyxbotlist2box">
                            	<div class="zyxbotlist2box1">4</div>
                                <div class="zyxbotlist2box2"><a href="#">美国西海岸一号公路自驾九日游（当地游，不含机票）</a></div>
                            </div>
                        	<div class="zyxbotlist2box">
                            	<div class="zyxbotlist2box1">5</div>
                                <div class="zyxbotlist2box2"><a href="#">美国西海岸一号公路自驾九日游（当地游，不含机票）</a></div>
                            </div>
                        	<div class="zyxbotlist2box">
                            	<div class="zyxbotlist2box1">6</div>
                                <div class="zyxbotlist2box2"><a href="#">美国西海岸一号公路自驾九日游（当地游，不含机票）</a></div>
                            </div>
                        </div>
                        <div class="zyxbotlist3">
                        	<a href="#">更多&gt;&gt;</a>
                        </div>
                    </div>
                </div>
            </div>-->
            </div>
            <div class="mainerbox6box3">
            </div>
            <div class="mainerbox6box6">
                <div class="mainerbox6box6_1_1">
                    澳新美食餐厅推荐
                </div>
                <div class="mainerbox6box6_1_2">
                    <%-- 更多>>--%>
                </div>
            </div>
            <div class="mainerbox6box7">
                <div id="demo">
                    <div id="indemo">
                        <div id="demo1">
                            <%
                                System.Data.DataTable dt_new = new System.Data.DataTable();
                                dt_new = new publicclass().GetNews("26", 10);
                                string str_new_title = string.Empty;
                                string xingji = "";
                                foreach (System.Data.DataRow dr in dt_new.Rows)
                                {
                                    str_new_title = Convert.ToString(dr["canshu"]);
                                    if (str_new_title.Length >= 60)
                                        str_new_title = str_new_title.Substring(0, 60);

                                    xingji = GetXingJi(Convert.ToInt16(dr["tjzhishu"]));
                                    
                            %>
                            <div class="nmbox">
                                <p class="nmbox1">
                                    <a href="newsshow.aspx?id=<%=dr["id"] %>">
                                        <img src="pic/<%=dr["Picture"] %>" border="0" width="373" height="277" /></a></p>
                                <p class="nmbox2">
                                    <a href="newsshow.aspx?id=<%=dr["id"] %>">
                                        <%=dr["title"] %></a></p>
                                <p class="nmbox3">
                                    <%=str_new_title%></p>
                                <p class="nmbox4">
                                    推荐指数：<%=xingji%></p>
                            </div>
                            <%
} %>
                        </div>
                        <div id="demo2">
                        </div>
                    </div>
                </div>
                <script>
                <!--
                    var speed = 30;
                    var tab = document.getElementById("demo");
                    var tab1 = document.getElementById("demo1");
                    var tab2 = document.getElementById("demo2");
                    tab2.innerHTML = tab1.innerHTML;
                    function Marquee() {
                        if (tab2.offsetWidth - tab.scrollLeft <= 0)
                            tab.scrollLeft -= tab1.offsetWidth
                        else {
                            tab.scrollLeft++;
                        }
                    }
                    var MyMar = setInterval(Marquee, speed);
                    tab.onmouseover = function () { clearInterval(MyMar) };
                    tab.onmouseout = function () { MyMar = setInterval(Marquee, speed) };
                -->
                </script>
            </div>
            <div class="mainerbox6box8" style="height: 40px;">
            </div>
            <div class="mainerbox6box4">
                <div class="mainerbox6box4_left">
                    <ul class="mainerb6b4_top">
                        <li class="mainerb6b4_tophover"><a href="#">澳新自由行攻略</a></li>
                        <li><a href="#">澳新达人游记</a></li>
                        <li><a href="#">澳新旅游专家指南</a></li>
                    </ul>
                    <div class="mainerb6b4_bot">
                        <div class="mainerb6b4_botbox" style="display: block;">
                            <%
                                System.Data.DataTable dt_new2 = new System.Data.DataTable();
                                dt_new2 = new publicclass().GetNews("54", 4);
                                string str_new_title2 = string.Empty;
                                string xingji2 = "";
                                foreach (System.Data.DataRow dr in dt_new2.Rows)
                                {
                                    str_new_title2 = Convert.ToString(dr["canshu"]);
                                    if (str_new_title2.Length >= 60)
                                        str_new_title2 = str_new_title2.Substring(0, 60);

                                    xingji2 = GetXingJi(Convert.ToInt16(dr["tjzhishu"]));
                                    
                            %>
                            <div class="mainerb6b4_botbox_box">
                                <div class="mainerb6b4_botbox_box_1">
                                    <a href="newsshow.aspx?id=<%=dr["id"] %>">
                                        <img src="pic/<%=dr["picture"] %>" width="224" height="165" /></a>
                                </div>
                                <div class="mainerb6b4_botbox_box_2">
                                    <div class="mainerb6b4_botbox_box_2_tit">
                                        <a href="newsshow.aspx?id=<%=dr["id"] %>">
                                            <%=dr["title"] %></a></div>
                                    <div class="mainerb6b4_botbox_box_2_aut">
                                        时间：<%=Convert.ToDateTime(dr["createdate"]).ToString("yyyy-MM-dd HH:mm:ss")%></div>
                                    <div class="mainerb6b4_botbox_box_2_con">
                                        <%=str_new_title2%></div>
                                    <div class="mainerb6b4_botbox_box_2_zan">
                                        <%-- <a href="#">
                                            <img src="images/zan.jpg" width="15" height="15" /></a>赞（24）--%></div>
                                </div>
                            </div>
                            <%
                                
} %>
                        </div>
                        <div class="mainerb6b4_botbox" style="display: none;">
                        <%
                                System.Data.DataTable dt_new3 = new System.Data.DataTable();
                                dt_new3 = new publicclass().GetNews("79", 4);
                                string str_new_title3 = string.Empty;
                                string xingji3 = "";
                                foreach (System.Data.DataRow dr in dt_new3.Rows)
                                {
                                    str_new_title3 = Convert.ToString(dr["canshu"]);
                                    if (str_new_title3.Length >= 60)
                                        str_new_title3 = str_new_title3.Substring(0, 60);

                                    xingji3 = GetXingJi(Convert.ToInt16(dr["tjzhishu"]));
                                    
                            %>
                            <div class="mainerb6b4_botbox_box">
                                <div class="mainerb6b4_botbox_box_1">
                                    <a href="newsshow.aspx?id=<%=dr["id"] %>">
                                        <img src="pic/<%=dr["picture"] %>" width="224" height="165" /></a>
                                </div>
                                <div class="mainerb6b4_botbox_box_2">
                                    <div class="mainerb6b4_botbox_box_2_tit">
                                        <a href="newsshow.aspx?id=<%=dr["id"] %>">
                                            <%=dr["title"] %></a></div>
                                    <div class="mainerb6b4_botbox_box_2_aut">
                                        时间：<%=Convert.ToDateTime(dr["createdate"]).ToString("yyyy-MM-dd HH:mm:ss")%></div>
                                    <div class="mainerb6b4_botbox_box_2_con">
                                        <%=str_new_title3%></div>
                                    <div class="mainerb6b4_botbox_box_2_zan">
                                        <%-- <a href="#">
                                            <img src="images/zan.jpg" width="15" height="15" /></a>赞（24）--%></div>
                                </div>
                            </div>
                            <%
                                
} %>
                           
                        </div>
                        <div class="mainerb6b4_botbox" style="display: none;">
                        <%
                                System.Data.DataTable dt_new4 = new System.Data.DataTable();
                                dt_new4 = new publicclass().GetNews("80", 4);
                                string str_new_title4 = string.Empty;
                                string xingji4 = "";
                                foreach (System.Data.DataRow dr in dt_new4.Rows)
                                {
                                    str_new_title4 = Convert.ToString(dr["canshu"]);
                                    if (str_new_title4.Length >= 60)
                                        str_new_title4 = str_new_title4.Substring(0, 60);

                                    xingji4 = GetXingJi(Convert.ToInt16(dr["tjzhishu"]));
                                    
                            %>
                            <div class="mainerb6b4_botbox_box">
                                <div class="mainerb6b4_botbox_box_1">
                                    <a href="newsshow.aspx?id=<%=dr["id"] %>">
                                        <img src="pic/<%=dr["picture"] %>" width="224" height="165" /></a>
                                </div>
                                <div class="mainerb6b4_botbox_box_2">
                                    <div class="mainerb6b4_botbox_box_2_tit">
                                        <a href="newsshow.aspx?id=<%=dr["id"] %>">
                                            <%=dr["title"] %></a></div>
                                    <div class="mainerb6b4_botbox_box_2_aut">
                                        时间：<%=Convert.ToDateTime(dr["createdate"]).ToString("yyyy-MM-dd HH:mm:ss")%></div>
                                    <div class="mainerb6b4_botbox_box_2_con">
                                        <%=str_new_title4%></div>
                                    <div class="mainerb6b4_botbox_box_2_zan">
                                        <%-- <a href="#">
                                            <img src="images/zan.jpg" width="15" height="15" /></a>赞（24）--%></div>
                                </div>
                            </div>
                            <%
                                
} %>
                       
                        </div>
                    </div>
                </div>
                <!--            <div class="mainerbox6box4_right">
            	<div class="mainerb6b4right_top"></div>
                <div class="mainerb6b4right_bot">
                	<div class="mainerb6b4right_bot_box">
                    	<div class="mainerb6b4right_bot_box_cont">
                        	<div class="mainerb6b4right_bot_box_cont_f">
                            	<div class="mainerb6b4right_bot_box_cont_f_l">
                                	<img src="images/qavatar.png" width="30" height="30" />
                                </div>
                                <div class="mainerb6b4right_bot_box_cont_f_r">
                                	<div class="mainerb6b4right_bot_box_cont_f_r_box">
                                    您好，我是一名大一学生，寒假想去美国看朋友，不想报跟团的，但是我英文水平一般，如果报自由行会不会被拒签？
                                    	<p class="kengy">2014-10-12 13:53 旅行网游客</p>
                                    </div>
                               </div>     
                            </div>
                            <div class="mainerb6b4right_bot_box_cont_q">
                            	<div class="mainerb6b4right_bot_box_cont_f_l">
                                	<img src="images/aavatar.png" width="30" height="30" />
                                </div>
                                <div class="mainerb6b4right_bot_box_cont_f_r mainerb6b4right_bot_box_cont_f_q">
                                	<div class="mainerb6b4right_bot_box_cont_f_r_box mainerb6b4right_bot_box_cont_f_q_box">
                                    您好，我是一名大一学生，寒假想去美国看朋友，不想报跟团的，但是我英文水平一般，如果报自由行会不会被拒签？
                                    </div>
                               </div>     
                          </div>
                        </div>
                    	<div class="mainerb6b4right_bot_box_cont">
                        	<div class="mainerb6b4right_bot_box_cont_f">
                            	<div class="mainerb6b4right_bot_box_cont_f_l">
                                	<img src="images/qavatar.png" width="30" height="30" />
                                </div>
                                <div class="mainerb6b4right_bot_box_cont_f_r">
                                	<div class="mainerb6b4right_bot_box_cont_f_r_box">
                                    您好，我是一名大一学生，寒假想去美国看朋友，不想报跟团的，但是我英文水平一般，如果报自由行会不会被拒签？
                                    	<p class="kengy">2014-10-12 13:53 旅行网游客</p>
                                    </div>
                               </div>     
                            </div>
                            <div class="mainerb6b4right_bot_box_cont_q">
                            	<div class="mainerb6b4right_bot_box_cont_f_l">
                                	<img src="images/aavatar.png" width="30" height="30" />
                                </div>
                                <div class="mainerb6b4right_bot_box_cont_f_r mainerb6b4right_bot_box_cont_f_q">
                                	<div class="mainerb6b4right_bot_box_cont_f_r_box mainerb6b4right_bot_box_cont_f_q_box">
                                    您好，我是一名大一学生，寒假想去美国看朋友，不想报跟团的，但是我英文水平一般，如果报自由行会不会被拒签？
                                    </div>
                               </div>     
                          </div>
                        </div>
                    	<div class="mainerb6b4right_bot_box_cont">
                        	<div class="mainerb6b4right_bot_box_cont_f">
                            	<div class="mainerb6b4right_bot_box_cont_f_l">
                                	<img src="images/qavatar.png" width="30" height="30" />
                                </div>
                                <div class="mainerb6b4right_bot_box_cont_f_r">
                                	<div class="mainerb6b4right_bot_box_cont_f_r_box">
                                    您好，我是一名大一学生，寒假想去美国看朋友，不想报跟团的，但是我英文水平一般，如果报自由行会不会被拒签？
                                    	<p class="kengy">2014-10-12 13:53 旅行网游客</p>
                                    </div>
                               </div>     
                            </div>
                            <div class="mainerb6b4right_bot_box_cont_q">
                            	<div class="mainerb6b4right_bot_box_cont_f_l">
                                	<img src="images/aavatar.png" width="30" height="30" />
                                </div>
                                <div class="mainerb6b4right_bot_box_cont_f_r mainerb6b4right_bot_box_cont_f_q">
                                	<div class="mainerb6b4right_bot_box_cont_f_r_box mainerb6b4right_bot_box_cont_f_q_box">
                                    您好，我是一名大一学生，寒假想去美国看朋友，不想报跟团的，但是我英文水平一般，如果报自由行会不会被拒签？
                                    </div>
                               </div>     
                          </div>
                        </div>
                    	<div class="mainerb6b4right_bot_box_cont">
                        	<div class="mainerb6b4right_bot_box_cont_f">
                            	<div class="mainerb6b4right_bot_box_cont_f_l">
                                	<img src="images/qavatar.png" width="30" height="30" />
                                </div>
                                <div class="mainerb6b4right_bot_box_cont_f_r">
                                	<div class="mainerb6b4right_bot_box_cont_f_r_box">
                                    您好，我是一名大一学生，寒假想去美国看朋友，不想报跟团的，但是我英文水平一般，如果报自由行会不会被拒签？
                                    	<p class="kengy">2014-10-12 13:53 旅行网游客</p>
                                    </div>
                               </div>     
                            </div>
                            <div class="mainerb6b4right_bot_box_cont_q">
                            	<div class="mainerb6b4right_bot_box_cont_f_l">
                                	<img src="images/aavatar.png" width="30" height="30" />
                                </div>
                                <div class="mainerb6b4right_bot_box_cont_f_r mainerb6b4right_bot_box_cont_f_q">
                                	<div class="mainerb6b4right_bot_box_cont_f_r_box mainerb6b4right_bot_box_cont_f_q_box">
                                    您好，我是一名大一学生，寒假想去美国看朋友，不想报跟团的，但是我英文水平一般，如果报自由行会不会被拒签？
                                    </div>
                               </div>     
                          </div>
                        </div>
                    </div>
                
                
                </div>
                <div class="mainerb6b4right_more">
                	<a href="#">更多</a>
                </div>
            </div>
-->
            </div>
            <div class="mainerbox6box5">
                <img src="images/bz2.png" width="1200" height="80" />
            </div>
        </div>
    </div>
    <div class="youqinglink">
        <div class="youqinglinkbox">
            <div class="rollBox">
                <div class="LeftBotton" onmousedown="ISL_GoUp()" onmouseup="ISL_StopUp()" onmouseout="ISL_StopUp()">
                </div>
                <div class="Cont" id="ISL_Cont">
                    <div class="ScrCont">
                        <div id="List1">
                            <%
                                string pic_url2 = string.Empty;
                                string sql3 = "select top 16 id,stitle,bpic,weburl from MainPic where parid=1 order by id desc;";
                                System.Data.DataTable dt3 = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql3, null).Tables[0];
                                foreach (System.Data.DataRow dr in dt3.Rows)
                                {

                                    //  pic_url2 = "style='background: url(pic/" + dr["bpic"] + " ) 50% 0 no-repeat;cursor:pointer;'  ";
                            %>
                            <!-- 图片列表 begin -->
                            <div class="pic">
                                <a href="<%=dr["weburl"] %>" target="_blank">
                                    <img src="pic/<%=dr["bpic"] %>" width="140" height="70" alt="<%=dr["stitle"] %>"></a>
                            </div>
                            <%
                    
} %>
                            <!-- 图片列表 end -->
                        </div>
                        <div id="List2">
                        </div>
                    </div>
                </div>
                <div class="RightBotton" onmousedown="ISL_GoDown()" onmouseup="ISL_StopDown()" onmouseout="ISL_StopDown()">
                </div>
            </div>
            <script language="javascript" type="text/javascript">
<!--                //--><![CDATA[//><!--
                //图片滚动列表 mengjia 070816
                var Speed = 2; //速度(毫秒)
                var Space = 15; //每次移动(px)
                var PageWidth = 1124; //翻页宽度
                var fill = 0; //整体移位
                var MoveLock = false;
                var MoveTimeObj;
                var Comp = 0;
                var AutoPlayObj = null;
                GetObj("List2").innerHTML = GetObj("List1").innerHTML;
                GetObj('ISL_Cont').scrollLeft = fill;
                GetObj("ISL_Cont").onmouseover = function () { clearInterval(AutoPlayObj); }
                GetObj("ISL_Cont").onmouseout = function () { AutoPlay(); }
                AutoPlay();
                function GetObj(objName) { if (document.getElementById) { return eval('document.getElementById("' + objName + '")') } else { return eval('document.all.' + objName) } }
                function AutoPlay() { //自动滚动
                    clearInterval(AutoPlayObj);
                    AutoPlayObj = setInterval('ISL_GoDown();ISL_StopDown();', 4000); //间隔时间
                }
                function ISL_GoUp() { //上翻开始
                    if (MoveLock) return;
                    clearInterval(AutoPlayObj);
                    MoveLock = true;
                    MoveTimeObj = setInterval('ISL_ScrUp();', Speed);
                }
                function ISL_StopUp() { //上翻停止
                    clearInterval(MoveTimeObj);
                    if (GetObj('ISL_Cont').scrollLeft % PageWidth - fill != 0) {
                        Comp = fill - (GetObj('ISL_Cont').scrollLeft % PageWidth);
                        CompScr();
                    } else {
                        MoveLock = false;
                    }
                    AutoPlay();
                }
                function ISL_ScrUp() { //上翻动作
                    if (GetObj('ISL_Cont').scrollLeft <= 0) { GetObj('ISL_Cont').scrollLeft = GetObj('ISL_Cont').scrollLeft + GetObj('List1').offsetWidth }
                    GetObj('ISL_Cont').scrollLeft -= Space;
                }
                function ISL_GoDown() { //下翻
                    clearInterval(MoveTimeObj);
                    if (MoveLock) return;
                    clearInterval(AutoPlayObj);
                    MoveLock = true;
                    ISL_ScrDown();
                    MoveTimeObj = setInterval('ISL_ScrDown()', Speed);
                }
                function ISL_StopDown() { //下翻停止
                    clearInterval(MoveTimeObj);
                    if (GetObj('ISL_Cont').scrollLeft % PageWidth - fill != 0) {
                        Comp = PageWidth - GetObj('ISL_Cont').scrollLeft % PageWidth + fill;
                        CompScr();
                    } else {
                        MoveLock = false;
                    }
                    AutoPlay();
                }
                function ISL_ScrDown() { //下翻动作
                    if (GetObj('ISL_Cont').scrollLeft >= GetObj('List1').scrollWidth) { GetObj('ISL_Cont').scrollLeft = GetObj('ISL_Cont').scrollLeft - GetObj('List1').scrollWidth; }
                    GetObj('ISL_Cont').scrollLeft += Space;
                }
                function CompScr() {
                    var num;
                    if (Comp == 0) { MoveLock = false; return; }
                    if (Comp < 0) { //上翻
                        if (Comp < -Space) {
                            Comp += Space;
                            num = Space;
                        } else {
                            num = -Comp;
                            Comp = 0;
                        }
                        GetObj('ISL_Cont').scrollLeft -= num;
                        setTimeout('CompScr()', Speed);
                    } else { //下翻
                        if (Comp > Space) {
                            Comp -= Space;
                            num = Space;
                        } else {
                            num = Comp;
                            Comp = 0;
                        }
                        GetObj('ISL_Cont').scrollLeft += num;
                        setTimeout('CompScr()', Speed);
                    }
                }
                //--><!]]>
            </script>
        </div>
    </div>
</asp:Content>
