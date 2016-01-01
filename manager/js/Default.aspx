<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="manager_js_Default" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

    <script src="jquery.uploadify-v2.1.4/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="jquery.uploadify-v2.1.4/jquery.uploadify.v2.1.4.js" type="text/javascript"></script>

    <script src="jquery.uploadify-v2.1.4/swfobject.js" type="text/javascript"></script>

    <link href="jquery.uploadify-v2.1.4/uploadify.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript"> 
       $(document).ready(function() { 
            $("#uploadify").uploadify({ 
                'uploader': 'jquery.uploadify-v2.1.4/uploadify.swf',//进度条，Uploadify里面含有
                'script': 'UploadifyHandler.ashx',//一般处理程序
                'cancelImg': 'jquery.uploadify-v2.1.4/cancel.png',//取消图片路径
                'folder': 'UploadFile', //上传文件夹名
                'queueID': 'fileQueue',
                'auto': false, 
                'multi': true
           }); 
        });  
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <input type="file" name="uploadify" id="uploadify" />
        
        
        <a href="javascript:$('#uploadify').uploadifyUpload()">上传</a>| <a href="javascript:$('#uploadify').uploadifyClearQueue()">
            取消上传</a>
        <div id="fileQueue">
        </div>
    </div>
    </form>
</body>
</html>
