<%@ Page Title="" Language="C#" MasterPageFile="~/mar1.master" AutoEventWireup="true"
    CodeFile="aozhou.aspx.cs" Inherits="aozhou" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link type="text/css" rel="stylesheet" href="css/aozhou.css" />
    <div class="aozhoubox">
        <div class="azbox1">
            <%=daohang%> 
        </div>
        <div class="azbox2">
            <div class="azbox2list">
                <ul>
                    <%=SearchZuheMenu()%>
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
                    <dl class="listIndex">
                        <dt class="azb2xx_left">目的城市：</dt>
                        <dd class="phoneType azb2xx_right">
                            <%= SearchCityMenu()%>
                        </dd>
                    </dl>
                    <dl class="clearfix listIndex">
                        <dt class="azb2xx_left">必玩景点：</dt>
                        <dd class="azb2xx_right">
                            <%=SearchTicketMenu()%>
                        </dd>
                    </dl>
                    <dl class="clearfix listIndex" style=" display:none;">
                        <dt class="azb2xx_left">产品分类：</dt>
                        <dd class="azb2xx_right">
                            <%=SearchProTypeMenu() %>
                        </dd>
                    </dl>
                    <dl class="clearfix listIndex" style=" display:none;">
                        <dt class="azb2xx_left">语言类型：</dt>
                        <dd class="azb2xx_right">
                            <span><a href="javascript:void(0)" class="selected">全部</a></span> <span><a href="javascript:void(0)">
                                中文</a></span>
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
                <div class="filter_nav clearfix" style="position: relative;">
                    <div class="sort fl">
                        <a href="javascript:jiage_search_sell();" class="active">销量<i class="sprint_img sort_down"></i></a>
                        
                        <a href="javascript:jiage_search_price();" class="active" >价格</a></div>
                    <div class="type fl">
                        <table width="260" border="0" cellspacing="0" cellpadding="0" class="kengy">
                            <tr>
                                <td>
                                    价格：价格区间
                                </td>
                                <td>
                                    <input type="text" class="jjqj" id="jiages" value="0">
                                </td>
                                <td>
                                    -
                                </td>
                                <td>
                                    <input type="text" class="jjqj" id="jiagese" value="0">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="position: absolute; right: 630px; top: 8px;" id="ssss">
                        <a href='javascript:jiage_search()'>
                            <img src="images/ss-search.jpg" /></a>
                    </div>
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

                    <div class="fr clearfix">
                    <%
                        string qiantai_content = Content;
                        string str_page = getpage;
                         %>

                        <div class="fl">
                            <a href="javascript:;" class="enable page_btn">&lt;</a> <span class="page_num"><span
                                class="now"><%=curr_page %></span> <span>/<%=tot_page %></span> </span><a href="#" class="page_btn">&gt;</a>
                        </div>
                        <div class="fl show_type">
                            <a href="aozhou.aspx" class="enable active"><i class="sprint_img big_icon"></i>大图</a>
                            <a href="aozhou.aspx?list=true" class=""><i class="sprint_img lie_icon"></i>列表</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="azbox3_bot">
       
            
                        <%=qiantai_content%>
                  
            
                <script type="text/javascript">
                    $(document).ready(function () {

                        $(".section ul li .rsp").hide();

                        $(".section	 ul li").hover(function () {
                            $(this).find(".rsp").stop().fadeTo(500, 0.5)
                            $(this).find(".text").stop().animate({ top: '0' }, { duration: 500 })
                        }, function () {
                            $(this).find(".rsp").stop().fadeTo(500, 0)
                            $(this).find(".text").stop().animate({ top: '0' }, { duration: "fast" })
                            $(this).find(".text").animate({ top: '130' }, { duration: 300 })
                        });

                    });
                </script>
            </div>
            <div class='fenyebox'>
                <%=str_page%>
            </div>
        </div>
    </div>
</asp:Content>
