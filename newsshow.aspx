<%@ Page Title="" Language="C#" MasterPageFile="~/mar1.master" AutoEventWireup="true" CodeFile="newsshow.aspx.cs" Inherits="newsshow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<link type="text/css" rel="stylesheet" href="css/global.css" />
<link type="text/css" rel="stylesheet" href="css/aozhou.css" />
<div class="plboxshow">

<%
    string sql = "select a.id,a.Title,a.Content,a.canshu,a.CreateDate,a.tjzhishu,a.Picture,a.parid,(select clsname1 from NewType where id=a.parid) as clsname from news a where a.id=" + Request["id"] + " ";
    string new_type = string.Empty, title = string.Empty, content = string.Empty, CreateDate = string.Empty ;
    
    System.Data.DataTable dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];

    foreach (System.Data.DataRow dr in dt.Rows)
    {
        //sql = "select clsname1 from NewType where id="+dr["parid"]+"";
        //System.Data.DataTable dt2 = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
        //foreach (System.Data.DataRow dr2 in dt2.Rows)
        //{
        //    new_type = "<a href='#'>" + dr["clsname"] + "</a>";
        //}
        new_type = "<a href='#'>" + dr["clsname"] + "</a>";
        title = Convert.ToString(dr["title"]);
        content = Convert.ToString(dr["content"]);
        CreateDate = Convert.ToString(dr["CreateDate"]);
        
    }
    
     %>
	<div class="azbox1">
        <a href="index.aspx">风行旅游网</a>><%=new_type%>><span><%=title%></span>
    </div>
	<div class="hahshow">
    	<div class="hahshow_left">
        	<div class="hahshow_left_1">
            <span></span><%=title%>
            </div>
            <div class="hahshow_left_2">
				<div class="hahshow_left_2_1">
                    发布日期：<%=CreateDate%>
                </div>
                <%--<div class="hahshow_left_2_2">
                <table width="200" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td align="right";>5人觉得有用</td>
                    <td width="13"><a href="#"><img src="images/dian3.png" width="13" height="12" /></a></td>
                  </tr>
                </table>
                </div>--%>
            </div>
            <%--<div class="hahshow_left_3">
            <table width="400" border="0" cellspacing="0" cellpadding="0">
              <tr>                            
                <td>评分：9.5分</td>
                <td>返现金额：10</td>
                <td>5人觉得有用</td>
              </tr>
            </table>
            </div>--%>
            <div class="hahshow_left_4">
            	<%=content %>
            </div>
            <%--<div class="hahshow_left_5">
            	<div class="hahshow_left_5_1">
                分享到
                </div>
                <div class="hahshow_left_5_2">
                
                <div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a></div>
<script>
    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "2", "bdMiniList": false, "bdPic": "", "bdStyle": "0", "bdSize": "24" }, "share": {} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];
</script>
                </div>
                            
            	
            </div>--%>
        </div>
        <div class="hahshow_right">
        	<div class="hahshow_right_1">最新文章</div>
            <div class="hahshow_right_2">
             <%
                            System.Data.DataTable dt_new = new System.Data.DataTable();
                            dt_new = new publicclass().GetNews("26", 10);
                            string str_new_title = string.Empty;
                            string xingji = "";
                            foreach (System.Data.DataRow dr in dt_new.Rows)
                            {
                                str_new_title = Convert.ToString(dr["canshu"]);
                                if (str_new_title.Length >= 50)
                                    str_new_title = str_new_title.Substring(0, 50) + "..";

                                //  xingji = GetXingJi(Convert.ToInt16(dr["tjzhishu"]));
                                    
                             %>

            	<div class="hahshowright2box">
                	<div class="hahshowright2box_img">
                    	<a href="newsshow.aspx?id=<%=dr["id"] %>"><img src="pic/<%=dr["Picture"] %>" width="229" height="169" /></a>
                    </div>
                    <div class="hahshowright2box_des">
                    <%=str_new_title%><a href="newsshow.aspx?id=<%=dr["id"] %>">[详细]</a>
                    </div>
                    <div class="hahshowright2box_pin">
                  <%--  erwrw网名 | <span>4.5分</span>--%>
                    </div>
                </div>

                <%
}
                                 %>
            	
            </div>
        </div>
    </div>
    <div class="azheight25"></div>
    <div class="azheight25"></div>
   <div class="xqtjcp">
   	<img src="images/xqcp.png" width="1200" height="80" />
   </div>
    <div class="azheight25"></div>
</div>

</asp:Content>

