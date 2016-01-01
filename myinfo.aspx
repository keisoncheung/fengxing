<%@ Page Title="" Language="C#" MasterPageFile="~/mar1.master" AutoEventWireup="true"
    CodeFile="myinfo.aspx.cs" Inherits="myinfo" %>

<%@ Register Src="~/menber_menu.ascx" TagName="m_left" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link type="text/css" rel="stylesheet" href="css/huiyuan.css" />
    <link href="uploadify/uploadify.css" rel="stylesheet" type="text/css" />
    <link href="uploadify/default.css" rel="stylesheet" type="text/css" />
    <script src="uploadify/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="uploadify/swfobject.js" type="text/javascript"></script>
    <script src="uploadify/jquery.uploadify.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
//            alert($("#imghead").attr("src"));
//            return;

            $("#file_upload").uploadify({
                //开启调试
                'debug': false,
                //是否自动上传
                'auto': true,
                'buttonText': '选择照片',
                //flash
                'swf': "uploadify/uploadify.swf",
                //文件选择后的容器ID
                'queueID': 'uploadfileQueue',
                'uploader': 'uploadify/jqueryUploadHandler.ashx',
                'width': '75',
                'height': '24',
                'multi': false,
                'fileTypeDesc': '支持的格式：',
                'fileTypeExts': '*.jpg;*.jpge;*.gif;*.png',
                'fileSizeLimit': '1MB',
                'removeTimeout': 1,

                //返回一个错误，选择文件的时候触发
                'onSelectError': function (file, errorCode, errorMsg) {
                    switch (errorCode) {
                        case -100:
                            alert("上传的文件数量已经超出系统限制的" + $('#file_upload').uploadify('settings', 'queueSizeLimit') + "个文件！");
                            break;
                        case -110:
                            alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#file_upload').uploadify('settings', 'fileSizeLimit') + "大小！");
                            break;
                        case -120:
                            alert("文件 [" + file.name + "] 大小异常！");
                            break;
                        case -130:
                            alert("文件 [" + file.name + "] 类型不正确！");
                            break;
                    }
                },
                //检测FLASH失败调用
                'onFallback': function () {
                    alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
                },
                //上传到服务器，服务器返回相应信息到data里
                'onUploadSuccess': function (file, data, response) {
                    if (data == "-1") {
                        window.location.href = "myinfo.aspx";
                    }
                    else if (data == "0") {
                        alert("上传失败！");
                    }
                    else {
                        $("#imghead").attr("src", "uploads/" + data);
                    }


                }
            });
        });

        function doUplaod() {
            $('#file_upload').uploadify('upload', '*');
        }

        function closeLoad() {
            $('#file_upload').uploadify('cancel', '*');
        }


    </script>
    <%--  <div> 
          <table width="704" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
        <tr>
            <td align="center" valign="middle">
                <div id="uploadfileQueue" style="padding: 3px;">
                </div>
                <div id="file_upload">
                </div>
            </td>
        </tr>
        <tr>
            <td height="50" align="center" valign="middle">
                <img alt="" src="images/BeginUpload.gif" width="77" height="23" onclick="doUplaod()" style="cursor: hand" />
                <img alt="" src="images/CancelUpload.gif" width="77" height="23" onclick="closeLoad()" style="cursor: hand" />
            </td>
        </tr>
    </table>

    </div> --%>
    <div class="huiyuan">
        <uc1:m_left runat="server" ID="left1" />
        <div class="hy_right">
            <div class="hy_rgh_gr_1">
                <ul>
                    <li><a href="#" class="dqxx">请填写个人资料</a></li>
                    <li><a href="#">密码修改</a></li>
                </ul>
            </div>
            <div class="hy_rgh_gr_2">
                <%

                    MemberList men = new MemberList();
                    men = pbclass.GetMenberInfo(cInfo.mId);
                    string str_sex = string.Empty;
                    if (men != null)
                    {


                    }

                %>
                <div class="hy_rgh_gr_2_1">
                    <ul>
                        <li><span>您的昵称：</span><input type="text" id="Name2" value="<%=men.Name2 %>"></li>
                        <li><span>您的性别：</span>
                            <select id="sex">
                                <option value="">请选择</option>
                                <%
                                    if (!string.IsNullOrWhiteSpace(men.nSex) && men.nSex == "1")
                                    {
                                %>
                                <option value="1" selected="selected">男</option>
                                <option value="2">女</option>
                                <%
                                    }
                                    else
                                    { %>
                                <option value="1">男</option>
                                <option value="2" selected="selected">女</option>
                                <%
                                        
                                    } %>
                            </select>
                        </li>
                        <li><span>真实姓名：</span><input type="text" id="chinesename" value="<%=men.Chinesename %>"></li>
                        <li><span>身份证号：</span><input type="text" id="zhengjian" value="<%=men.zhengjian %>"></li>
                        <li><span>手机号码：</span><input type="text" id="Tel" value="<%=men.tel %>"></li>
                        <li><span>电子邮件：</span><input type="text" id="email" value="<%=men.nEmail %>"></li>
                    </ul>
                </div>
                <div class="hy_rgh_gr_2_2">
                    <div class="touxiangshangchuan">
                        <script type="text/javascript">
                            //图片上传预览    IE是用了滤镜。
                            function previewImage(file) {
                                var MAXWIDTH = 180;
                                var MAXHEIGHT = 180;
                                var div = document.getElementById('preview');
                                if (file.files && file.files[0]) {
                                    div.innerHTML = '<img id=imghead>';
                                    var img = document.getElementById('imghead');
                                    img.onload = function () {
                                        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                                        img.width = rect.width;
                                        img.height = rect.height;
                                        //                 img.style.marginLeft = rect.left+'px';
                                        img.style.marginTop = rect.top + 'px';
                                    }
                                    var reader = new FileReader();
                                    reader.onload = function (evt) { img.src = evt.target.result; }
                                    reader.readAsDataURL(file.files[0]);
                                }
                                else //兼容IE
                                {
                                    var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
                                    file.select();
                                    var src = document.selection.createRange().text;
                                    div.innerHTML = '<img id=imghead>';
                                    var img = document.getElementById('imghead');
                                    img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
                                    var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                                    status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
                                    div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
                                }
                            }
                            function clacImgZoomParam(maxWidth, maxHeight, width, height) {
                                var param = { top: 0, left: 0, width: width, height: height };
                                if (width > maxWidth || height > maxHeight) {
                                    rateWidth = width / maxWidth;
                                    rateHeight = height / maxHeight;

                                    if (rateWidth > rateHeight) {
                                        param.width = maxWidth;
                                        param.height = Math.round(height / rateWidth);
                                    } else {
                                        param.width = Math.round(width / rateHeight);
                                        param.height = maxHeight;
                                    }
                                }

                                param.left = Math.round((maxWidth - param.width) / 2);
                                param.top = Math.round((maxHeight - param.height) / 2);
                                return param;
                            }
                            function openBrowse() {
                                var ie = navigator.appName == "Microsoft Internet Explorer" ? true : false;
                                if (ie) {
                                    document.getElementById("file").click();
                                    document.getElementById("filename").value = document.getElementById("file").value;
                                } else {
                                    var a = document.createEvent("MouseEvents"); //FF的处理   
                                    a.initEvent("click", true, true);
                                    document.getElementById("file").dispatchEvent(a);
                                }
                            }   
                        </script>
                        <div class="touxiang">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td valign="middle" align="center" id="preview">
                                        <img id="imghead" border="0" src="uploads/<%=men.Bpic %>" width="180" height="180" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="touxiangwai">
                            <%--<input type="hidden" value="" id="touxiang" name="touxiang" />
                            <input type="file" id="file" name="file" onchange="previewImage(this)" style="display: none"
                                runat="server" />
                            <input name="button" class="txschuan" type="button" onclick="openBrowse()" value="添加图片或视频" />--%>
                            <div id="uploadfileQueue" style="padding: 3px;">
                            </div>
                            <div id="file_upload">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hy_rgh_gr_2_3">
                    <span>风行旅游郑重承诺：</span>我们将尊重您的个人隐私，您的个人信息不会被公开。我们会为您量身定制个性化的服务，让您享受更优质的出行体验。</div>
            </div>
            <div class="hy_rgh_gr_3">
                <input type="button" class="hy_rgh_gr_3_tjiao" onclick="save()" value="提交">
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function save() {
 
            var name2 = $("#Name2").val();
            var nSex = $("#sex").val();
            var Chinesename = $("#chinesename").val();
            var zhengjian = $("#zhengjian").val();
            var Tel = $("#Tel").val();
            var nEmail = $("#email").val();
            //var Bpic = $("#imghead").attr("src");
            //            alert(Bpic);
            //            return;

            var myinfo = { "name2": "", "nSex": "", "Chinesename": "", "zhengjian": "", "Tel": "",
                "nEmail": "", "Bpic": ""
            };

            myinfo.name2 = name2;
            myinfo.nSex = nSex;
            myinfo.Chinesename = Chinesename;
            myinfo.zhengjian = zhengjian;
            myinfo.Tel = Tel;
            myinfo.nEmail = nEmail;
       

            $.get("ajaxclass.ashx", { "ntype": "SaveInfo", "myinfo": JSON.stringify(myinfo) }, function (data) {

                var res = data.data[0];
                if (res.result == "0")
                    alert("未登录！");
                else if (res.result == "1") {
                    alert("提交成功！");
                    window.location.href = "myinfo.aspx";
                }
                else if (res.result == "-1")
                    alert("提交失败！");

            }, "json");

        }
    
    </script>
</asp:Content>
