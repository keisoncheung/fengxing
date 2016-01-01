<%@ Page Title="" Language="C#" MasterPageFile="~/mar1.master" AutoEventWireup="true"
    CodeFile="qianzheng.aspx.cs" Inherits="qianzheng" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link type="text/css" rel="stylesheet" href="css/qianzheng.css" />
    <script src="js/json2.js" type="text/javascript"></script>
    <script src="js/qianzheng.js"></script>
    <script type="text/javascript">

        $(function () {
            //            var str = '{"name":"jack"}'; 
            //            var json = JSON.parse(str); 
            //            alert(json.name); 

            //            var ss = { "q": "ww", "s": "e" };
            //            var json = JSON.stringify(ss);
            //            alert(json); 


            // goCar();
        });

        function goCar() {
            //         $("#" + obj).parent().parent().parent(".qzbgr3diqu").find(".qzactive")
            //         $("#" + obj).parent().parent().parent(".qzbgr3jihua").find(".qzactive")
            var dq = $(".qzbgr3diqu").find(".qzactive");
            var bx = $(".qzbgr3jihua").find(".qzactive");

//            alert(dq.attr("name"));
//            return;
            if (dq.length == 0) {
                alert("请选择地区！");
                return;
            }
            if (bx.length == 0) {
                alert("请选择保险计划！");
                return;
            }


            //var godate=$("#calOneResult").val();

          //  var qz_obj = { "ProId": ""+<%=pro_id %>+"", "DQ_QZ": ""+dq.attr("name")+"", "TotalPrice": "", "BX_QZ": ""+bx.attr("name")+"" };

           // alert(JSON.stringify(qz_obj));

           

                        var str_child1 = '{"ProId":"' + <%=pro_id %> + '","DQ_QZ":"'+dq.attr("name")+'","CarChilds":[';
                        var str_child2 = "";
                        var _child="";
                                _child = _child + '{';
                                _child = _child + '"CId":"' + bx.attr("name") + '",';
                                _child = _child + '"Cnum":"'+$(".qznum").val()+'",';
                                _child = _child + '"Price":"0"';
                                _child = _child + '}';

                        str_child1 = str_child1 + _child + ']}';
            var js_obj = JSON.parse(str_child1);

            

            $.get("ajaxclass.ashx", { "ntype": "AddCar_QZ", "carinfo": str_child1 }, function (data) {

               if(data=="1")
                window.location.href = "cart.aspx";
                else
                alert("购买失败！");
            }, "json");
        }


      
    </script>
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
    </script>
    <div class="qianzheng">
        <div class="qianzhengbox">
            <div class="qianzhengbox_wz">
                <a rel="index.aspx">风行旅游网</a>>签证><span><%=title %></span></div>
            <div class="qianzhengbox_good">
                <div class="qianzhengbox_good_left">
                    <a href="#">
                        <img src="images/qz.png" width="565" height="419" /></a>
                </div>
                <div class="qianzhengbox_good_right">
                    <div class="qzbgr_1">
                        <ul class="qzbgr_1_shuxing">
                            <li><span>签证类型：&nbsp;&nbsp;</span><%=title %>自由行签证</li>
                            <li><span>有效时间：&nbsp;&nbsp;</span><%=ywsc%></li>
                            <li><span>是否邀请：&nbsp;&nbsp;</span><%=proname%></li>
                            <li><span>最多停留：&nbsp;&nbsp;</span><%=youwanshij%></li>
                            <li><span>是否面试：&nbsp;&nbsp;</span><%=proname2%></li>
                            <li><span>受理时间：&nbsp;&nbsp;</span><%=shoulishij %></li>
                        </ul>
                    </div>
                    <div class="qzbgr_2">
                        价格：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="qzbgr_2_1">￥&nbsp;</span><span class="qzbgr_2_2"><%=jiage%></span>
                    </div>
                    <div class="qzbgr_3">
                        <script type="text/javascript">

                            function Choose_DQ(obj) {
                                $("#" + obj).parent().parent().parent(".qzbgr3diqu").find("dd").each(function () {
                                    if ($(this).attr("name") == obj)
                                        $(this).addClass("qzactive");
                                    else
                                        $(this).removeClass("qzactive");
                                });

                            }

                            function Choose_BX(obj) {
                                $("#" + obj).parent().parent().parent(".qzbgr3jihua").find("dd").each(function () {
                                    if ($(this).attr("name") == obj)
                                        $(this).addClass("qzactive");
                                    else
                                        $(this).removeClass("qzactive");
                                });

                            }
                        </script>
                        <div class="qzbgr3diqu">
                            <dl>
                                <dt>选择地区：</dt>
                                <%=city%>
                            </dl>
                        </div>
                        <div class="qzbgr3jihua">
                            <dl>
                                <dt>保险计划：</dt>
                                <%=baoxian%>
                            </dl>
                        </div>
                    </div>

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
                    <div class="qzbgr_4">
                        <div class="qzbgr_4_1">
                            数量：</div>
                        <div class="qzbgr_4_2">
                         <a href='javascript:void(0)' class='qzjian' onclick='down(1)'>-</a>
                           
                            <input id="t1" class="qznum" value="1" />
                            <a href='javascript:void(0)' class='qzjia' onclick='up(1)'>+</a>
                        </div>
                    </div>
                    <div class="qzbgr_5">
                        <input class="qzgoumai" onclick="goCar() " />
                    </div>
                </div>
            </div>
            <div class="qianzhengbox_list">
                <ul class="qzlist fixed_bar">
                    <li class="status_on xqactive"><a href="#status1" class="xqactive">签证信息</a></li>
                    <li class="status_on"><a href="#status2">所需资料</a></li>
                    <li class="status_on"><a href="#status3">办理流程</a></li>
                    <li class="status_on"><a href="#status4">注意事项</a></li>
                    <li class="status_on"><a href="#status5">温馨提示</a></li>
                    <li class="status_on"><a href="#status6">邮寄地址</a></li>
                    <li class="status_on"><a href="#status7">购买保险</a></li>
                    <li class="status_on" style="width: 155px"><a href="#status8">团友评价</a></li>
                </ul>
            </div>
            <div class="qianzhengbox_des">
                <div class="qianzhengbox_des_box_1">
                    <a href="#" id="status1"></a>
                    <%=title %>签证信息
                </div>
                <%=content %>
                <div class="qianzhengbox_des_box_3">
                    <a href="#" id="status2"></a>
                    <%=title %>
                    600 旅游/探亲/商务签证清单
                </div>
                <%=content2 %>
                <div class="qzheight10">
                </div>
                <div class="qianzhengbox_des_box_5">
                    <a href="#" id="status3"></a>
                    <img src="images/q11.png" width="1200" height="433" />
                </div>
                <%=content3 %>
                <div class="qzheight10">
                </div>
                <%=content4 %>
                <div class="qzheight10">
                </div>
                <%=content5 %>
                <div class="qzheight10">
                </div>
                <%=youjidizhi %>
                <div class="qzheight10">
                </div>
                <%=goumaibaoxian %>
                <div class="qzheight10">
                    <a href="#" id="status8"></a>
                </div>
              <%--  <div class="qianzhengbox_des_box_14">
                    <script>
                        //使用说明：1,加载在函数$(document).ready(function(){……});里面写或者windows.onload里面也可以-------目的就是加载函数
                        //		   2,函数参数  第一个：ul的class{只要是里面套着相应的对应列表，任何标签都可以}  第二个：需要显示隐藏的外面套着的DIV的class
                        //         3,效果：就是第一个li显示第一个div，其他隐藏   第二个li显示第二个div，其他隐藏   以此类推
                        $(document).ready(function () {
                            //feilong("jypli","jypdiv");
                            jyp("qzpingjia_t_y", "qzpingjia_n", "qzpingjia_t_k");
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
                    <div class="qzpingjia_t">
                        <ul class="qzpingjia_t_y">
                            <li class="qzpingjia_t_k"><a href="javascript:void(0);" class="">全部评价（5）</a></li>
                            <li class=""><a href="javascript:void(0);" class="">好评（5）</a></li>
                            <li class=""><a href="javascript:void(0);" class="">中评（0）</a></li>
                            <li class=""><a href="javascript:void(0);" class="">差评（0）</a></li>
                        </ul>
                    </div>
                    <div class="qzpingjia_n">
                        <div class="qzpingjia_n_1">
                            <ul class="qzpingjia_n_list">
                                <li>
                                    <div class="qzpingjia_n_list_left">
                                        <div class="qznlr_img">
                                            <a href="#">
                                                <img src="images/qzpl.png" width="107" height="80" /></a></div>
                                        <div class="qznlr_tit">
                                            <a href="#">agent</a></div>
                                    </div>
                                    <div class="qzpingjia_n_list_right">
                                        <div class="qzpingjia_n_list_right_1">
                                            <img src="images/dian7.png" width="16" height="15" /><img src="images/dian7.png"
                                                width="16" height="15" /><img src="images/dian7.png" width="16" height="15" /><img
                                                    src="images/dian7.png" width="16" height="15" /></div>
                                        <div class="qzpingjia_n_list_right_2">
                                            评论内容</div>
                                        <div class="qzpingjia_n_list_right_3">
                                            评论时间：2015-1-12</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="qzpingjia_n_list_left">
                                        <div class="qznlr_img">
                                            <a href="#">
                                                <img src="images/qzpl.png" width="107" height="80" /></a></div>
                                        <div class="qznlr_tit">
                                            <a href="#">agent</a></div>
                                    </div>
                                    <div class="qzpingjia_n_list_right">
                                        <div class="qzpingjia_n_list_right_1">
                                            <img src="images/dian7.png" width="16" height="15" /><img src="images/dian7.png"
                                                width="16" height="15" /></div>
                                        <div class="qzpingjia_n_list_right_2">
                                            评论内容</div>
                                        <div class="qzpingjia_n_list_right_3">
                                            评论时间：2015-1-12</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="qzpingjia_n_list_left">
                                        <div class="qznlr_img">
                                            <a href="#">
                                                <img src="images/qzpl.png" width="107" height="80" /></a></div>
                                        <div class="qznlr_tit">
                                            <a href="#">agent</a></div>
                                    </div>
                                    <div class="qzpingjia_n_list_right">
                                        <div class="qzpingjia_n_list_right_1">
                                            <img src="images/dian7.png" width="16" height="15" /><img src="images/dian7.png"
                                                width="16" height="15" /><img src="images/dian7.png" width="16" height="15" /><img
                                                    src="images/dian7.png" width="16" height="15" /></div>
                                        <div class="qzpingjia_n_list_right_2">
                                            评论内容</div>
                                        <div class="qzpingjia_n_list_right_3">
                                            评论时间：2015-1-12</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="qzpingjia_n_list_left">
                                        <div class="qznlr_img">
                                            <a href="#">
                                                <img src="images/qzpl.png" width="107" height="80" /></a></div>
                                        <div class="qznlr_tit">
                                            <a href="#">agent</a></div>
                                    </div>
                                    <div class="qzpingjia_n_list_right">
                                        <div class="qzpingjia_n_list_right_1">
                                            <img src="images/dian7.png" width="16" height="15" /><img src="images/dian7.png"
                                                width="16" height="15" /><img src="images/dian7.png" width="16" height="15" /></div>
                                        <div class="qzpingjia_n_list_right_2">
                                            评论内容</div>
                                        <div class="qzpingjia_n_list_right_3">
                                            评论时间：2015-1-12</div>
                                    </div>
                                </li>
                            </ul>
                            <div class="qzfenye">
                                [ <span>1</span> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> ]
                            </div>
                        </div>
                        <div class="qzpingjia_n_1">
                            <ul class="qzpingjia_n_list">
                                <li>
                                    <div class="qzpingjia_n_list_left">
                                        <div class="qznlr_img">
                                            <a href="#">
                                                <img src="images/qzpl.png" width="107" height="80" /></a></div>
                                        <div class="qznlr_tit">
                                            <a href="#">agent</a></div>
                                    </div>
                                    <div class="qzpingjia_n_list_right">
                                        <div class="qzpingjia_n_list_right_1">
                                            <img src="images/dian7.png" width="16" height="15" /><img src="images/dian7.png"
                                                width="16" height="15" /><img src="images/dian7.png" width="16" height="15" /><img
                                                    src="images/dian7.png" width="16" height="15" /></div>
                                        <div class="qzpingjia_n_list_right_2">
                                            评论内容</div>
                                        <div class="qzpingjia_n_list_right_3">
                                            评论时间：2015-1-12</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="qzpingjia_n_list_left">
                                        <div class="qznlr_img">
                                            <a href="#">
                                                <img src="images/qzpl.png" width="107" height="80" /></a></div>
                                        <div class="qznlr_tit">
                                            <a href="#">agent</a></div>
                                    </div>
                                    <div class="qzpingjia_n_list_right">
                                        <div class="qzpingjia_n_list_right_1">
                                            <img src="images/dian7.png" width="16" height="15" /><img src="images/dian7.png"
                                                width="16" height="15" /><img src="images/dian7.png" width="16" height="15" /><img
                                                    src="images/dian7.png" width="16" height="15" /></div>
                                        <div class="qzpingjia_n_list_right_2">
                                            评论内容</div>
                                        <div class="qzpingjia_n_list_right_3">
                                            评论时间：2015-1-12</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="qzpingjia_n_list_left">
                                        <div class="qznlr_img">
                                            <a href="#">
                                                <img src="images/qzpl.png" width="107" height="80" /></a></div>
                                        <div class="qznlr_tit">
                                            <a href="#">agent</a></div>
                                    </div>
                                    <div class="qzpingjia_n_list_right">
                                        <div class="qzpingjia_n_list_right_1">
                                            <img src="images/dian7.png" width="16" height="15" /><img src="images/dian7.png"
                                                width="16" height="15" /><img src="images/dian7.png" width="16" height="15" /><img
                                                    src="images/dian7.png" alt="" width="16" height="15" /></div>
                                        <div class="qzpingjia_n_list_right_2">
                                            评论内容</div>
                                        <div class="qzpingjia_n_list_right_3">
                                            评论时间：2015-1-12</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="qzpingjia_n_list_left">
                                        <div class="qznlr_img">
                                            <a href="#">
                                                <img src="images/qzpl.png" width="107" height="80" /></a></div>
                                        <div class="qznlr_tit">
                                            <a href="#">agent</a></div>
                                    </div>
                                    <div class="qzpingjia_n_list_right">
                                        <div class="qzpingjia_n_list_right_1">
                                            <img src="images/dian7.png" width="16" height="15" /><img src="images/dian7.png"
                                                width="16" height="15" /><img src="images/dian7.png" width="16" height="15" /><img
                                                    src="images/dian7.png" width="16" height="15" /></div>
                                        <div class="qzpingjia_n_list_right_2">
                                            评论内容</div>
                                        <div class="qzpingjia_n_list_right_3">
                                            评论时间：2015-1-12</div>
                                    </div>
                                </li>
                            </ul>
                            <div class="qzfenye">
                                [ <span>1</span> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> ]
                            </div>
                        </div>
                        <div class="qzpingjia_n_1">
                            <ul class="qzpingjia_n_list">
                                <li>
                                    <div class="qzpingjia_n_list_left">
                                        <div class="qznlr_img">
                                            <a href="#">
                                                <img src="images/qzpl.png" width="107" height="80" /></a></div>
                                        <div class="qznlr_tit">
                                            <a href="#">agent</a></div>
                                    </div>
                                    <div class="qzpingjia_n_list_right">
                                        <div class="qzpingjia_n_list_right_1">
                                            <img src="images/dian7.png" width="16" height="15" /><img src="images/dian7.png"
                                                width="16" height="15" /><img src="images/dian7.png" width="16" height="15" /></div>
                                        <div class="qzpingjia_n_list_right_2">
                                            评论内容</div>
                                        <div class="qzpingjia_n_list_right_3">
                                            评论时间：2015-1-12</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="qzpingjia_n_list_left">
                                        <div class="qznlr_img">
                                            <a href="#">
                                                <img src="images/qzpl.png" width="107" height="80" /></a></div>
                                        <div class="qznlr_tit">
                                            <a href="#">agent</a></div>
                                    </div>
                                    <div class="qzpingjia_n_list_right">
                                        <div class="qzpingjia_n_list_right_1">
                                            <img src="images/dian7.png" width="16" height="15" /><img src="images/dian7.png"
                                                width="16" height="15" /></div>
                                        <div class="qzpingjia_n_list_right_2">
                                            评论内容</div>
                                        <div class="qzpingjia_n_list_right_3">
                                            评论时间：2015-1-12</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="qzpingjia_n_list_left">
                                        <div class="qznlr_img">
                                            <a href="#">
                                                <img src="images/qzpl.png" width="107" height="80" /></a></div>
                                        <div class="qznlr_tit">
                                            <a href="#">agent</a></div>
                                    </div>
                                    <div class="qzpingjia_n_list_right">
                                        <div class="qzpingjia_n_list_right_1">
                                            <img src="images/dian7.png" width="16" height="15" /><img src="images/dian7.png"
                                                width="16" height="15" /><img src="images/dian7.png" width="16" height="15" /></div>
                                        <div class="qzpingjia_n_list_right_2">
                                            评论内容</div>
                                        <div class="qzpingjia_n_list_right_3">
                                            评论时间：2015-1-12</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="qzpingjia_n_list_left">
                                        <div class="qznlr_img">
                                            <a href="#">
                                                <img src="images/qzpl.png" width="107" height="80" /></a></div>
                                        <div class="qznlr_tit">
                                            <a href="#">agent</a></div>
                                    </div>
                                    <div class="qzpingjia_n_list_right">
                                        <div class="qzpingjia_n_list_right_1">
                                            <img src="images/dian7.png" width="16" height="15" /><img src="images/dian7.png"
                                                width="16" height="15" /><img src="images/dian7.png" width="16" height="15" /></div>
                                        <div class="qzpingjia_n_list_right_2">
                                            评论内容</div>
                                        <div class="qzpingjia_n_list_right_3">
                                            评论时间：2015-1-12</div>
                                    </div>
                                </li>
                            </ul>
                            <div class="qzfenye">
                                [ <span>1</span> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> ]
                            </div>
                        </div>
                        <div class="qzpingjia_n_1">
                            <ul class="qzpingjia_n_list">
                                <li>
                                    <div class="qzpingjia_n_list_left">
                                        <div class="qznlr_img">
                                            <a href="#">
                                                <img src="images/qzpl.png" width="107" height="80" /></a></div>
                                        <div class="qznlr_tit">
                                            <a href="#">agent</a></div>
                                    </div>
                                    <div class="qzpingjia_n_list_right">
                                        <div class="qzpingjia_n_list_right_1">
                                            <img src="images/dian7.png" width="16" height="15" /></div>
                                        <div class="qzpingjia_n_list_right_2">
                                            评论内容</div>
                                        <div class="qzpingjia_n_list_right_3">
                                            评论时间：2015-1-12</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="qzpingjia_n_list_left">
                                        <div class="qznlr_img">
                                            <a href="#">
                                                <img src="images/qzpl.png" width="107" height="80" /></a></div>
                                        <div class="qznlr_tit">
                                            <a href="#">agent</a></div>
                                    </div>
                                    <div class="qzpingjia_n_list_right">
                                        <div class="qzpingjia_n_list_right_1">
                                            <img src="images/dian7.png" width="16" height="15" /></div>
                                        <div class="qzpingjia_n_list_right_2">
                                            评论内容</div>
                                        <div class="qzpingjia_n_list_right_3">
                                            评论时间：2015-1-12</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="qzpingjia_n_list_left">
                                        <div class="qznlr_img">
                                            <a href="#">
                                                <img src="images/qzpl.png" width="107" height="80" /></a></div>
                                        <div class="qznlr_tit">
                                            <a href="#">agent</a></div>
                                    </div>
                                    <div class="qzpingjia_n_list_right">
                                        <div class="qzpingjia_n_list_right_1">
                                            <img src="images/dian7.png" width="16" height="15" /></div>
                                        <div class="qzpingjia_n_list_right_2">
                                            评论内容</div>
                                        <div class="qzpingjia_n_list_right_3">
                                            评论时间：2015-1-12</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="qzpingjia_n_list_left">
                                        <div class="qznlr_img">
                                            <a href="#">
                                                <img src="images/qzpl.png" width="107" height="80" /></a></div>
                                        <div class="qznlr_tit">
                                            <a href="#">agent</a></div>
                                    </div>
                                    <div class="qzpingjia_n_list_right">
                                        <div class="qzpingjia_n_list_right_1">
                                            <img src="images/dian7.png" width="16" height="15" /></div>
                                        <div class="qzpingjia_n_list_right_2">
                                            评论内容</div>
                                        <div class="qzpingjia_n_list_right_3">
                                            评论时间：2015-1-12</div>
                                    </div>
                                </li>
                            </ul>
                            <div class="qzfenye">
                                [ <span>1</span> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> ]
                            </div>
                        </div>
                    </div>
                </div>--%>
            </div>
        </div>
    </div>
</asp:Content>
