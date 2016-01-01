﻿<%@ Page Title="" Language="C#" MasterPageFile="~/mar1.master" AutoEventWireup="true" CodeFile="dingzhishow.aspx.cs" Inherits="dingzhishow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link type="text/css" rel="stylesheet" href="css/aozhou.css" />
<script src="js/azshow.js"></script>
<div class="azshowbox">
<div class="aozhouboxshow">
	<div class="azboxshow1">
        <%=title%>
    </div>
    <div class="azboxshow2">
    	<div class="azboxshow2_left">
        	<div class="azboxshow2_left_box">
            	<img src="pic/<%=pic_url %>" width="540" height="400" />
            </div>
        </div>
        <div class="azboxshow2_right">
        	<div class="azboxshow2_right_1">
            	<div class="azboxshow2_right_1_left">
                	<h1><%=proname %></h1>
                    <h2>（<%=proname2 %>）</h2>
                    <h3><span class="abs2r1">￥ <%=jiage%>&nbsp;&nbsp;&nbsp;</span><span class="abs2r2">￥ <%=jiage2 %></span></h3>
                </div>
            	<div class="azboxshow2_right_1_right">
                	<div class="azboxshow2_right_1_right_1">
                    	<a href="#"><img src="images/sc.png" width="110" height="34" /></a>
                    </div>
                	<div class="azboxshow2_right_1_right_2">已有1人收藏</div>
                	<div class="azboxshow2_right_1_right_3">
						<span class="abs2r1r3_1">评价</span>
						<span class="abs2r1r3_2">返现</span>
						<span class="abs2r1r3_3">￥ 10</span>
                    </div>
                </div>
            </div>
        	<div class="azboxshow2_right_2">
            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="17%" height="31" align="left" valign="middle">游玩城市：</td>
                    <td width="83%" height="31" align="left" valign="middle"><%=city%></td>
                  </tr>
                  <tr>
                    <td height="31" align="left" valign="middle">游玩时长：</td>
                    <td height="31" align="left" valign="middle"><%=ywsc %></td>
                  </tr>
                  <tr>
                    <td height="31" align="left" valign="middle">游玩时间：</td>
                    <td height="31" align="left" valign="middle"><%=youwanshij%></td>
                  </tr>
                  <tr>
                    <td height="31" align="left" valign="middle">推荐指数：</td>
                    <td height="31" align="left" valign="middle"><%=xingji %></td>
                  </tr>
                  <tr>
                    <td height="31" align="left" valign="middle">产品编号：</td>
                    <td height="31" align="left" valign="middle"><%=proname3 %></td>
                  </tr>
                  <tr>
                    <td height="31" align="left" valign="middle">一键分享：</td>
                    <td height="31" align="left" valign="middle">
                    <style>
                    	.bds_more{ display:none !important;}
                    </style>
                    <div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a></div>
<script>
    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "2", "bdMiniList": false, "bdPic": "", "bdStyle": "0", "bdSize": "24" }, "share": {} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];
</script>
                    </td>
                  </tr>
                </table>
            </div>
        </div>
    </div>
	            <div class="azheight25">
            </div>
            <script language="JavaScript" type="text/javascript" src="js/jquery.color.js"></script>
            <script language="JavaScript" type="text/javascript" src="js/jquery.animate.clip.js"></script>
            <script language="JavaScript" type="text/javascript" src="js/jCal.js"></script>
            <link rel="stylesheet" type="text/css" href="css/jCal.css">
            <script>
                function sjyinchang() {
                    $('#calOne').css('display', 'none');
                }
                function shijian() {
                    $('#calOne').css('display', 'block');
                    $('#calOne').jCal({
                        day: new Date(),
                        days: 1,
                        showMonths: 2,
                        monthSelect: true,
                        dCheck: function (day) {
                            if (day.getTime() == (new Date('8/7/2008')).getTime()) return false;
                            return (day.getDate()); //day.getDate() != 3);
                        },
                        callback: function (day, days) {
                            $('#calOneDays').val(days);
                            $(this._target).find('.dInfo').remove();
                            var dCursor = new Date(day.getTime());
                            for (var di = 0; di < days; di++) {
                                var currDay = $(this._target).find('[id*=d_' + (dCursor.getMonth() + 1) + '_' + dCursor.getDate() + '_' + dCursor.getFullYear() + ']');
                                if (currDay.length) currDay.append('<div class="dInfo"><span style="color:#ccc">$</span>1231</div>');
                                dCursor.setDate(dCursor.getDate() + 1);
                            }
                            // if calling the function on already selected day(s)
                            if (typeof $(this._target).data('day') == 'object' &&
							 $(this._target).data('day').getTime() == day.getTime() &&
							 $(this._target).data('days') == days) {
                                $('#calOneResult').val((day.getMonth() + 1) + '/' + day.getDate() + '/' + day.getFullYear() + ' RECLICKED');
                            } else {
                                $('#calOneResult').val((day.getMonth() + 1) + '/' + day.getDate() + '/' + day.getFullYear());
                                sjyinchang()
                            }
                            return true;
                        }
                    });
                };
            </script>
            <script type="text/javascript">

                function up(abc) {
                    var value = document.getElementById('t' + abc).value;
                    //alert(isNaN(value));
                    var a = eval(value) + 1;
                    if (a > 20) {
                        alert("您输入的数字超过限时数量。最多20！")
                        document.getElementById('t' + abc).value = 0;
                        return;
                    }
                    if (value != '' && !isNaN(value)) {
                        document.getElementById('t' + abc).value = value * 1 + 1;
                        change(abc)
                        return;
                    }
                }
                function down(abc) {
                    var value = document.getElementById('t' + abc).value;
                    //alert(isNaN(value));
                    if (value - 1 < 0) {
                        document.getElementById('t' + abc).value = 0;
                        return;
                    }
                    if (value != '' && !isNaN(value)) {
                        document.getElementById('t' + abc).value = value * 1 - 1;
                        change(abc)
                        return;
                    }
                    change()
                }

                function change(abc) {
                    var value = document.getElementById('t' + abc).value;
                    var v1 = document.getElementById('t1').value;
                    var v2 = document.getElementById('t2').value;
                    var v3 = document.getElementById('t3').value;
                    var jg1 = document.getElementById('xzjg1').innerHTML;
                    var jg2 = document.getElementById('xzjg2').innerHTML;
                    var jg3 = document.getElementById('xzjg3').innerHTML;
                    var fl1 = document.getElementById('fxjg1').innerHTML;
                    var fl2 = document.getElementById('fxjg2').innerHTML;
                    var fl3 = document.getElementById('fxjg3').innerHTML;
                    var zj1 = v1 * jg1;
                    var zj2 = v2 * jg2;
                    var zj3 = v3 * jg3;
                    var spzjg = zj3 + zj2 + zj1;
                    if (value > 20) {
                        alert("您输入的数字超过限时数量。最多20！")
                        document.getElementById('t' + abc).value = 1;
                    } else {
                        document.getElementById('t' + abc).value = value;
                        document.getElementById('zjiage').innerHTML = spzjg;
                    }
                }
            </script>
            <style>
                .azboxshow3
                {
                    overflow: visible;
                    height: 278px;
                }
                .abbox_ddt_1
                {
                    float: left;
                    height: 28px;
                    width: 100%;
                }
                .abbox_ddt_11
                {
                    float: left;
                    background: #5a9ced;
                    width: 116px;
                    text-align: center;
                    font-size: 16px;
                    color: #fff;
                    line-height: 28px;
                    height: 28px;
                }
                .abbox_ddt_12
                {
                    position: relative;
                    padding-left: 11px;
                    float: left;
                    z-index: 1000;
                }
                .ddt_shijiantc
                {
                    background: #E3E3E3;
                    position: absolute;
                    top: 28px;
                    left: 10px;
                    width: 456px;
                    display: none;
                    z-index: 1000;
                }
                .abbox_ddt_13
                {
                    float: right;
                    color: #030303;
                    font-size: 14px;
                    line-height: 28px;
                }
                .abbox_ddt_13 a
                {
                    height: 28px;
                    position: relative;
                    width: 80px;
                    text-align: right;
                    color: #030303;
                    display: block;
                }
                .abbox_ddt_13 a .abox_ddt_131
                {
                    position: absolute;
                    top: 28px;
                    right: 0;
                    width: 322px;
                    background: #ebf7fd url(images/bg_abox_ddt_131.jpg) left top no-repeat;
                    padding-top: 9px;
                    display: none;
                }
                .abbox_ddt_13 a:hover .abox_ddt_131
                {
                    display: block;
                }
                .abox_ddt_1311
                {
                    width: 290px;
                    border: 1px solid #b4e1ff;
                    border-top: none;
                    padding: 16px;
                    line-height: 24px;
                    font-size: 12px;
                    color: 333333;
                    text-align: left;
                }
                .abbox_ddt_2
                {
                    float: left;
                    width: 100%;
                    color: #333333;
                    padding-top: 17px;
                    line-height: 28px;
                }
                .ddt_xzdiyipai
                {
                    font-size: 16px;
                    line-height: 30px;
                }
                .ddt_xzdiyipai span
                {
                    font-size: 16px;
                    padding-left: 22px;
                }
                .ddt_xzlmp
                {
                    font-size: 14px;
                    color: #0e64cd;
                    background: #cde9f7;
                }
                .dtdjjian
                {
                    float: left;
                    border: 1px solid #c9c9c9;
                    width: 22px;
                    height: 22px;
                    text-align: center;
                    line-height: 22px;
                    display: inline-block;
                }
                .dtdjzhong
                {
                    float: left;
                    border: 1px solid #c9c9c9;
                    width: 26px;
                    border-left: none;
                    border-right: none;
                    height: 22px;
                    text-align: center;
                    line-height: 22px;
                }
                .ddt_fzjg
                {
                    color: #0e64cd;
                    font-size: 14px;
                    padding-left: 6px;
                }
                .ddt_xzjg
                {
                    color: #ff6600;
                    font-size: 16px;
                    padding-left: 4px;
                }
                
                .abbox_ddt_3
                {
                    float: left;
                    height: 28px;
                    width: 100%;
                    background: #cde9f7;
                }
                .abox_ddt_3jg
                {
                    padding-left: 740px;
                    width: 210px;
                    height: 28px;
                    line-height: 28px;
                    float: left;
                    color: #ff0000;
                    font-size: 16px;
                }
                .abox_ddt_3gm
                {
                    font-size: 12px;
                    color: #333333;
                    float: left;
                    width: 90px;
                    height: 28px;
                    line-height: 28px;
                }
                .abox_ddt_3gwc
                {
                    width: 118px;
                    height: 28px;
                    line-height: 28px;
                    text-align: center;
                    font-size: 18px;
                    float: left;
                }
                .abox_ddt_3gwc a
                {
                    width: 118px;
                    background: #ff6600;
                    height: 28px;
                    display: inline-block;
                    color: #fff;
                }
                .abox_ddt_3gwc a:hover
                {
                    background: #0066ff;
                }
            </style>
            <div class="azboxshow3">
                <div class="abbox_ddt_1">
                    <div class="abbox_ddt_11">
                        可出行日期</div>
                    <div class="abbox_ddt_12">
                        <select id="calOneDays" style="display: none;" onchange="$('#calOne').data('days', $('#calOneDays').val());">
                            <option value="1" selected>1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                        <input type="text" id="calOneResult" value="" onclick="shijian()" style="height: 24px;
                            line-height: 24px; padding: 1px; overflow: hidden; padding-left: 30px; background: url(images/ddt_bjsj.gif) 4px 5px no-repeat;
                            border: 1px solid #ccc;">
                        <div id="calOne" class="ddt_shijiantc">
                            loading calendar one...</div>
                    </div>
                    <div class="abbox_ddt_13">
                        <a href="about.aspx?id=41">预订流程
                            <div class="abox_ddt_131">
                                <div class="abox_ddt_1311">
                                    支付成功后，风行网即开始处理订单；1-3个工作日内便会有emali你电子票；电子票上有换票check in 的相关信息；打印并携带电子票
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="abbox_ddt_2">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr class="ddt_xzdiyipai">
                            <td width="30">
                            </td>
                            <td width="250">
                                选择规格
                            </td>
                            <td width="260">
                                <span>数量</span>
                            </td>
                            <td width="250">
                                返现金额
                            </td>
                            <td>
                                <span>价格</span>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr class="ddt_xzlmp">
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                出行人
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <%=chuxingrPrice%>
                        <tr class="ddt_xzlmp">
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                套餐
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <%=taocanPrice %>
                    </table>
                </div>
                <div class="abbox_ddt_3">
                    <div class="abox_ddt_3jg">
                        总共：<span id="zjiage">0</span></div>
                    <div class="abox_ddt_3gm">
                        </div>
                    <div class="abox_ddt_3gwc">
                        <a href="javascript:goCar();">加入购物车</a></div>
                </div>
            </div>
    
    <div class="azheight25"></div>
    <div class="azboxshow4">
    	<ul class="xqlist fixed_bar">
        	<li class="status_on xqactive"><a href="#status1" class="xqactive">产品详情</a></li>
        	<li class="status_on"><a href="#status2">预订须知</a></li>
        	<li class="status_on"><a href="#status3">费用</a></li>
        	<li class="status_on"><a href="#status4">交通</a></li>
        	<li class="status_on"><a href="#status5">攻略</a></li>
        	<li class="status_on"><a href="#status6">点评</a></li>
        	<li class="status_on"><a href="#status7">推荐产品</a></li>
        </ul>
    </div>
    <div class="azboxshow5">
    	<div class="azboxshow5_1"><a href="#"  id="status1">产品详情</a></div>
        <div class="azboxshow5_2">
                    　<%=content%>
        
        </div>
    </div>
    <div class="azboxshow5">
    	<div class="azboxshow5_1"><a href="#"  id="status2">预订须知</a></div>
        <div class="azboxshow5_2">
            <%=content2%>
        </div>
    </div>
    <div class="azboxshow5">
    	<div class="azboxshow5_1"><a href="#"  id="status3">费用</a></div>
        <div class="azboxshow5_2">
           <%=content3%>
        </div>
    </div>
    <div class="azboxshow5">
    	<div class="azboxshow5_1"><a href="#"  id="status4">交通</a></div>
        <div class="azboxshow5_2">
            <%=content4%>
        </div>
    </div>
    <div class="azboxshow5">
    	<div class="azboxshow5_1"><a href="#"  id="status5">攻略</a></div>
        <div class="azboxshow5_2">
            <%=content5%>

        </div>
    </div>
    <div class="azboxshow5">
    	<div class="azboxshow5_1">
        <script>
            //使用说明：1,加载在函数$(document).ready(function(){……});里面写或者windows.onload里面也可以-------目的就是加载函数
            //		   2,函数参数  第一个：ul的class{只要是里面套着相应的对应列表，任何标签都可以}  第二个：需要显示隐藏的外面套着的DIV的class
            //         3,效果：就是第一个li显示第一个div，其他隐藏   第二个li显示第二个div，其他隐藏   以此类推
            $(document).ready(function () {
                //feilong("jypli","jypdiv");
                jyp("nekk", "nekkbox", "nekkhow");
            });
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

        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="100"><a href="#"  id="status6">用户点评</a></td>
            <td width="100">
            <ul class="nekk">
                    	<li class="nekkhow"><a href="javascript:void(0);" class="">最新</a></li>
                    	<li class=""><a href="javascript:void(0);" class="">最热</a></li>
                    </ul>
            </td>
            <td align="right"><span class="liaojie"><a href="faxian.html">了解返现规则</a></span></td>
          </tr>
        </table>
</div>
        <div class="azboxshow5_2" style="border-top:solid 2px #ff7e28;">
            <div class="nekkbox">
				
                </div>

            </div>
        </div>
    </div>
   <div class="azheight25">
   	<a href="aozhou_pinglun.html">查看更多评价>></a>
   </div> 
    <div class="azboxshow5">
    	<div class="azboxshow5_1"><a href="#"  id="status7">您可能会喜欢下面这些产品</a></div>
        <div class="azboxshow5_2">
            <ul class="tuijiancp">
            	<li>
                	<div class="tjcp_img">
                    	<a href="#"><img src="images/tj.png" width="262" height="193" /></a>
                    </div>
                    <div class="tjcp_tit">
                    	<a href="#">悉尼观光巴士48小时通票（悉尼市区+邦迪海滩）</a>
                    </div>
                    <div class="tjcp_pri">
                    <span class="tjcp_pri_1" >￥&nbsp;610&nbsp;&nbsp;</span><span class="tjcp_pri_2">￥&nbsp;650</span><span class="tjcp_pri_3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    </div>
                </li>
            	<li>
                	<div class="tjcp_img">
                    	<a href="#"><img src="images/tj.png" width="262" height="193" /></a>
                    </div>
                    <div class="tjcp_tit">
                    	<a href="#">悉尼观光巴士48小时通票（悉尼市区+邦迪海滩）</a>
                    </div>
                    <div class="tjcp_pri">
                    <span class="tjcp_pri_1" >￥&nbsp;610&nbsp;&nbsp;</span><span class="tjcp_pri_2">￥&nbsp;650</span><span class="tjcp_pri_3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    </div>
                </li>
            	<li>
                	<div class="tjcp_img">
                    	<a href="#"><img src="images/tj.png" width="262" height="193" /></a>
                    </div>
                    <div class="tjcp_tit">
                    	<a href="#">悉尼观光巴士48小时通票（悉尼市区+邦迪海滩）</a>
                    </div>
                    <div class="tjcp_pri">
                    <span class="tjcp_pri_1" >￥&nbsp;610&nbsp;&nbsp;</span><span class="tjcp_pri_2">￥&nbsp;650</span><span class="tjcp_pri_3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    </div>
                </li>
            	<li>
                	<div class="tjcp_img">
                    	<a href="#"><img src="images/tj.png" width="262" height="193" /></a>
                    </div>
                    <div class="tjcp_tit">
                    	<a href="#">悉尼观光巴士48小时通票（悉尼市区+邦迪海滩）</a>
                    </div>
                    <div class="tjcp_pri">
                    <span class="tjcp_pri_1" >￥&nbsp;610&nbsp;&nbsp;</span><span class="tjcp_pri_2">￥&nbsp;650</span><span class="tjcp_pri_3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    </div>
                </li>
            </ul>
            
        </div>
    </div>
   <div class="azheight25">
   	<a href="aozhou_tuijian.html">查看更多产品>></a>
   </div> 
   <div class="azheight25"></div> 
   <div class="azheight25"></div> 
   <div class="xqtjcp">
   	<img src="images/xqcp.png" width="1200" height="80" />
   </div>
   <div class="azheight25"></div> 
    
    
    
</div>

</asp:Content>





