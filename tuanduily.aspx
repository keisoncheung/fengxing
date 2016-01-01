<%@ Page Title="" Language="C#" MasterPageFile="~/mar1.master" AutoEventWireup="true"
    CodeFile="tuanduily.aspx.cs" Inherits="tuanduily" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link type="text/css" rel="stylesheet" href="css/aozhou.css" />
    <link rel="stylesheet" type="text/css" href="css/ziyouxing.css">
    <script type="text/javascript" src="js/show/jquery-1.10.2.min.js"></script>
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


            $('.azb2xx_right').css({ 'height': '27px', 'overflow': 'hidden' });
            $('.selefl').find('.sele_icon').hide();

            $(".sele_most").parent().parent().find(".azb2xx_right").css({ 'height': '66px' });
            /**点击多选**/
            $(".sele_most").click(function () {
                var _thethis = $(this).parent().parent();
                var s = _thethis.find('.azb2xx_right').height();
                if (s == 66) {
                    _thethis.find('.azb2xx_right').css({ 'height': 'auto', 'overflow': 'hidden' });
                }
                _thethis.find('.azb2xx_right').find(".sele_icon").parent().parent().css("display", "inline-block");
                _thethis.find('.azb2xx_right').find(".sele_icon_xz").parent().parent().css("display", "inline-block");
                _thethis.find('.azb2xx_right').find(".sele_icon").parent().removeClass('selected');

                $(this).parent().hide();
                _thethis.find(".JS_expan_nav").hide();
                _thethis.find(".JS_expan_nav_up").hide();
                _thethis.find('.sele_icon').show();
                _thethis.find('.sele_icon_xz').show();
                $('.btn_box').show();
            });
            /**点击取消**/
            $('#JS_sele_cancel').click(function () {
                var _thethis = $(this).parent().parent();
                _thethis.find('.fl i').hide();
                var s = _thethis.find('.azb2xx_right').height();
                if (s > 66) {
                    _thethis.find('.azb2xx_right').css('height', '66px');
                }
                $('.selefl').find('.sele_icon,.sele_icon_xz').hide();
                $(".sele_most_box").show();
                $(".add_icon").show();
                $(".btn_box").hide();
                $(".sele_most_box").parent().find('.expan_btn').children('.JS_expan_nav').show();
                _thethis.find('.selefl a').removeClass('selected');
                _thethis.find('.selefl a').first().addClass('selected');
            });
            /**点击展开**/
            $('.JS_expan_nav').click(function () {
                var _thethis = $(this).parent().parent();
                var s = _thethis.find('.azb2xx_right').height();
                if (s == 27) {
                    _thethis.find('.azb2xx_right').css('height', 'auto');
                }
                $(this).hide();
                $(this).parent().find(".JS_expan_nav_up").show();
            });
            /**点击收起**/
            $('.JS_expan_nav_up').click(function () {
                var _thethis = $(this).parent().parent();
                var s = _thethis.find('.azb2xx_right').height();
                if (s > 27) {
                    _thethis.find('.azb2xx_right').css('height', '27px');
                }
                $(".sele_most").parent().parent().find(".azb2xx_right").css({ 'height': '51px' });
                $(this).hide();
                _thethis.find(".JS_expan_nav").show();
            });
            /**点击多选后的地点选择**/
            $('.selefl>a').click(function () {
                var _thethis = $(this).parent().parent();
                var classname = $(this).find('i').attr("class");
                if (classname != "sele_icon_xz") {
                    $(this).find('i').addClass('sele_icon_xz').removeClass('sele_icon');
                    $(this).addClass('selected');
                    _thethis.find('.selefl a').first().removeClass('selected');
                }
                else {
                    $(this).find('i').removeClass('sele_icon_xz').addClass('sele_icon');
                    $(this).removeClass('selected');
                }
            });
            /**点击确定**/
            $('.submit').click(function () {
                var _thethis = $(this).parent().parent();
                _thethis.find('.azb2xx_right').find(".sele_icon").parent().parent().hide();
                _thethis.find('.azb2xx_right').find(".sele_icon_xz").hide();
                $(".btn_box").hide();
                _thethis.find('.azb2xx_right').find('.fl>a').addClass('selected');
                _thethis.find('.selefl a').first().removeClass('selected');
                $('.sele_most_box').show();
            });

        });
    </script>
    <div class="aozhoubox">
        <div class="azbox1">
            <a href="index.aspx">风行旅游网</a>><a href="tuanduily.aspx?gj=-1">澳新团队旅游</a>
        </div>
        <div class="azbox2">
            <div class="azbox2list">
                <ul>
                   <%=SearchZuheMenu() %>
                </ul>
            </div>
            <div class="azbox2xuanx">
                <script type="text/javascript">
                    $(function () {
                        $(".listIndex a").live("click", function () {
                            var selectedShow = $(".hasBeenSelected").find("div");
                            var textTypeIndex = $(this).parents("dl").index(); //获取a当前的dl索引值
                            var text = $(this).text();
                            $(".listIndex:eq(" + textTypeIndex + ")").find("a").removeClass("selected");
                            $(this).addClass("selected");
                            selectedShow.eq(textTypeIndex).removeClass("none");
                            selectedShow.eq(textTypeIndex).find("label").text(text);
                            var show = $(".hasBeenSelected").find(".none").length;
                            if (show < 5) {
                                $(".eliminateCriteria").show();
                            }
                        })
                        $(".selectedShow em").live("click", function () {
                            $(this).parents(".selectedShow").addClass("none");
                            var textTypeIndex = $(this).parents(".selectedShow").index();
                            $(".listIndex:eq(" + textTypeIndex + ")").find("a").removeClass("selected");
                            var show = $(".hasBeenSelected").find(".none").length;
                            if (show > 4) {
                                $(".eliminateCriteria").hide();
                            }
                        })
                        $(".eliminateCriteria").live("click", function () {
                            $(".hasBeenSelected").find("div").addClass("none");
                            $(this).hide();
                            $(".listIndex").find("a").removeClass("selected");
                        })
                    })
                </script>
                <div class="azb2xx">
                    <dl class="listIndex" style="position: relative;">
                        <dt class="azb2xx_left">出发城市：</dt>
                        <dd class="phoneType azb2xx_right">
                            <%=SearchfCityMenu()%>
                        </dd>
                        <div class="expan expan_btn" style="  display:none;">
                            <a href="javascript:;" class="JS_expan_nav"><span>展开</span> <i class="triangle_d"></i>
                            </a><a href="javascript:;" class="JS_expan_nav_up"><span>收起</span> <i class="triangle_d">
                            </i></a>
                        </div>
                    </dl>
                    <dl class="clearfix listIndex" style="position: relative;">
                        <dt class="azb2xx_left" style="">结束城市：</dt>
                        <dd class="azb2xx_right" >
                           <%=SearchCityMenu()%>
                        </dd>
                        <!------>   
                        <div  class="btn_box" style=" display:none; ">
                            <a href="javascript:;" class="submit" id="JS_sele_submit">确定</a> <a href="javascript:;"
                                class="cancel" id="JS_sele_cancel">取消</a>
                        </div>
                        <!------>
                        <div class="sele_most_box"  style="  display:none;">
                            <a href="javascript:void(0);" class="sele_most"><i class="add_icon"></i>多选</a>
                        </div>
                        <div class="expan_btn"  style="  display:none;">
                            <a href="javascript:;" class="JS_expan_nav"><span>展开</span> <i class="triangle_d"></i>
                            </a><a href="javascript:;" class="JS_expan_nav_up"><span>收起</span> <i class="triangle_d">
                            </i></a>
                        </div>

                        
                    </dl>
                    <script type="text/javascript">
                        function func_caidanDisplay() { 
                        
                        }
                    </script>

                        
                        <dl class="clearfix listIndex" style=" display:none;">
                        <dt class="azb2xx_left">出发月份：</dt>
                        <dd class="azb2xx_right">
                            <span><a href="javascript:void(0)" class="selected">全部</a></span> <span><a href="javascript:void(0)">
                                明年1月份</a></span> <span><a href="javascript:void(0)">明年2月份</a></span> <span><a href="javascript:void(0)">
                                    明年3月份</a></span>
                        </dd>
                    </dl>
                    <dl class="clearfix listIndex">
                        <dt class="azb2xx_left">行程天数：</dt>
                        <dd class="azb2xx_right">
                             <span><a href="tuanduily.aspx?gj=-1" class="selected">全部</a></span><span><a href="tuanduily.aspx?tian=7">7天</a></span>
            <span><a href="tuanduily.aspx?tian=8">8天</a></span>
            <span><a href="tuanduily.aspx?tian=9">9天</a></span>
            <span><a href="tuanduily.aspx?tian=10">10天</a></span>
            <span><a href="tuanduily.aspx?tian=11">11天</a></span>
            <span><a href="tuanduily.aspx?tian=12">12天</a></span>
                        </dd>
                    </dl>
                    <!--    <dl class="clearfix hasBeenSelected">
             <dt class="azb2xx_left">价格范围：</dt>
        <dd class="azb2xx_right">
                        <div class="selectedShow none">
                        <label></label>
                        <em></em>
                        </div>
                        <div class="selectedShow none">
                        <label></label>
                        <em></em>
                        </div>
                        <div class="selectedShow none">
                        <label></label>
                        <em></em>
                        </div>
                        <div class="selectedShow none">
                        <label></label>
                        <em></em>
                        </div>
                        <div class="selectedShow none">
                        <label></label>
                        <em></em>
                        </div>
                        <div class="eliminateCriteria none">清除筛选条件</div>
                    </dd>
                </dl>-->
                </div>
            </div>
        </div>
        <div class="azbox3">
            <div class="azbox3_top">
                <div class="filter_nav clearfix"  style=" position:relative;">
                    <div class="sort fl">
                        <%--<a href="#" class="active">推荐<i class="sprint_img sort_down"></i></a>--%>
                        
                        <a href="javascript:jiage_search_sell();" class="active">销量</a><a href="javascript:jiage_search_price();">价格</a></div>
                    <div class="type fl">
                        <table width="260" border="0" cellspacing="0" cellpadding="0" class="kengy">
                            <tr>
                                <td>
                                    价格：价格区间
                                </td>
                                <td>
                                    <input type="text" class="jjqj" id='jiages' value="0">
                                </td>
                                <td>
                                    -
                                </td>
                                <td>
                                    <input type="text" class="jjqj" id='jiagese' value="0">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="fr clearfix">
                              <%
                        string qiantai_content = Content;
                        string str_page = getpage;
                         %>
                        <div class="fl">
                            <a href="javascript:;" class="enable page_btn">&lt;</a> <span class="page_num"><span
                                class="now"><%=curr_page %></span> <span>/<%=tot_page %></span> </span><a href="#" class="page_btn">&gt;</a>
                        </div>
                        <!--
			<div class="fl show_type">
                <a href="aozhou.html" class=""><i class="sprint_img big_icon"></i>大图</a>
                <a href="aozhou2.html" class="enable active"><i class="sprint_img lie_icon"></i>列表</a>
            </div>
            -->
                    </div>
                    <div style=" position:absolute;right:700px;top:8px; " id="ssss"><a href='javascript:jiage_search()'><img src="images/ss-search.jpg" /></a></div>


                    <script type="text/javascript">

                        function jiage_search() {

                            var jiage1 = $("#jiages").val();
                            var jiage2 = $("#jiagese").val();

                            var url = location.href;
                            if (url.indexOf("&jiage1") > 0)
                                url = location.href.substr(0, url.indexOf("&jiage1"));
                            if (url.indexOf("&jiage2") > 0)
                                url = url.substr(0, url.indexOf("&jiage2"));
                            location.href = url + "&jiage1=" + jiage1 + "&jiage2=" + jiage2;
                        }
                    </script>

                        <script>
                            function jiage_search_sell() {
                                var sell = "true";

                                var url = location.href;

                                if (url.indexOf("&o_price") > 0)
                                    url = location.href.substr(0, url.indexOf("&o_price"));
                                if (url.indexOf("&sell") > 0)
                                    url = location.href.substr(0, url.indexOf("&sell"));

                                location.href = url + "&sell=true";
                            }

                            function jiage_search_price() {
                                var url = location.href;
                                if (url.indexOf("&sell") > 0)
                                    url = location.href.substr(0, url.indexOf("&sell"));
                                if (url.indexOf("&o_price") > 0)
                                    url = location.href.substr(0, url.indexOf("&o_price"));
                                location.href = url + "&o_price=true";
                            }
                    
                </script>
                </div>
            </div>
            <div class="azbox3_bot" style="overflow: visible;">
                <ul class="henglist" style="overflow: visible;">
                    <%=qiantai_content%>
                </ul>
            </div>
            <%=str_page%>
            <div class="xqtjcp">
                <img src="images/xqcp.png" width="1200" height="80">
            </div>
        </div>
    </div>
    <script src="js/show/wq.common.js"></script>
    <script type="text/javascript" src="js/show/detail-localjoin.js"></script>
</asp:Content>
