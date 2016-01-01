<%@ Page Language="C#" AutoEventWireup="true" CodeFile="uploadBigFile.aspx.cs" Inherits="manager_uploadBigFile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Uploadify</title>
    <link href="JS/jquery.uploadify-v2.1.0/example/css/default.css" rel="stylesheet"
        type="text/css" />
    <link href="JS/jquery.uploadify-v2.1.0/uploadify.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="JS/jquery.uploadify-v2.1.0/jquery-1.3.2.min.js"></script>

    <script type="text/javascript" src="JS/jquery.uploadify-v2.1.0/swfobject.js"></script>

    <script type="text/javascript" src="JS/jquery.uploadify-v2.1.0/jquery.uploadify.v2.1.0.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#uploadify").uploadify({
                'uploader': 'JS/jquery.uploadify-v2.1.0/uploadify.swf',
                'script': '../UploadHandler.ashx',
                'cancelImg': 'JS/jquery.uploadify-v2.1.0/cancel.png',
                'folder': '../UploadFile',
                'queueID': 'fileQueue',
                'auto': false,
                'multi': true
            });
        });  
        
    </script>
    <script>
        function gourl() {
            window.location.href = "newsshow.aspx?type=73";
        }
    
    </script>

    <style type="text/css">
        #bt_upload
        {
            width: 74px;
        }
    </style>

</head>
<body>
    <div id="fileQueue">
    </div>
   <div style=" margin:5px 10px; float:left;"> <input type="file" name="uploadify" id="uploadify" /></div>
    <div style=" margin:5px 10px; float:left;"><button id="bt_upload" onclick="javascript:$('#uploadify').uploadifyUpload()">上传</button></div>
     <div style=" margin:5px 10px; float:left;"><button id="Button1" onclick="javascript:$('#uploadify').uploadifyClearQueue()">取消上传</button></div> <div style=" margin:5px 10px; float:left;"><button id="Button2" onclick="javascript:gourl()">返回列表</button></div>
  
</body>
</html>
