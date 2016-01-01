<%@ Page Title="" Language="C#" MasterPageFile="~/mar1.master" AutoEventWireup="true"
    CodeFile="chakangengduo.aspx.cs" Inherits="chakangengduo" %>

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
            <a href="index.aspx">风行旅游网</a>><a href="sijiabooks.aspx">私家定制</a>
        </div>

        <div class="azbox3">
            <div class="azbox3_top">
               <div class="el_theme">
                    <span>主题：</span>
                    <%=strMenu %>
                </div>
            </div>
            <div class="azbox3_bot" style="overflow: visible;">
                <ul class="henglist" style="overflow: visible;">
                    <%=Content %>
                </ul>
            </div>
            <div class="fenyebox">
                <%=getpage %>
            </div>
            <div class="xqtjcp">
                <img src="images/xqcp.png" width="1200" height="80">
            </div>
        </div>
    </div>
    <script src="js/show/wq.common.js"></script>
    <script type="text/javascript" src="js/show/detail-localjoin.js"></script>
</asp:Content>
