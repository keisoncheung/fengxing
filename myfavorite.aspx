<%@ Page Title="" Language="C#" MasterPageFile="~/mar1.master" AutoEventWireup="true"
    CodeFile="myfavorite.aspx.cs" Inherits="myfavorite" %>

<%@ Register Src="~/menber_menu.ascx" TagName="m_left" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link type="text/css" rel="stylesheet" href="css/huiyuan.css" />
    <div class="huiyuan">
         <uc1:m_left runat="server" ID="left1" />
        <div class="hy_right">
            <div class="hy_rgh_dd_1">
                <ul>
                    <li><a href="#" class="dqdd">我的收藏</a></li>
                </ul>
            </div>
            <div class="hy_rgh_sc_2">
                <%
                    StringBuilder Html = new StringBuilder();
                    publicclass pbclas = new publicclass();
                    string where = " where uid=" + UId + " ";
                    string sql = string.Empty;
                    int pagenum = 1;
                    cp = Request["cp"] + "";
                    if (cp.Length < 1)
                    {
                        cp = "1";
                    }
                    int StartNum = Convert.ToInt32(cp) * pagemax;
                    int intTemNum = StartNum - pagemax;

                    sql = "select * from (select top " + StartNum + " * from tblMyFavorite " + where + "  order by id desc) a where a.id not in (Select top " + intTemNum + "  id from tblMyFavorite " + where + "  order by id desc)";
                    if (intTemNum <= 0)
                    {
                        sql = "select top " + pagemax + " *   from tblMyFavorite " + where + " order by id desc";
                    }
                    pagenum = Convert.ToInt32(DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, "select count(id) from tblMyFavorite " + where, null));
                    System.Data.DataTable dt = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
                    int i = 0, rightindex = 0, j = 0;
                    string str_right = string.Empty;
                    foreach (System.Data.DataRow dr in dt.Rows)
                    {

                        //if (Convert.ToString(dr["ispay"]) == "1")

                        //sql = "select  iif(isnull(totalprice),0,totalprice)as totalprice from OrderCarPro where Orderid='" + dr["Orderid"] + "';";
                        //TotalPrice = Convert.ToDecimal(DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, sql, null));
                %>
                <%
                
sql = "select id,proname,pictureb,yw_country,sfzyx from product where id=" + dr["proid"] + ";";
System.Data.DataTable dt2 = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
foreach (System.Data.DataRow dr2 in dt2.Rows)
{
    string proname = string.Empty;
    string str_GG = string.Empty;
    if (Convert.ToString(dr2["sfzyx"]) != "4")
        proname = Convert.ToString(dr2["proname"]);
    else if (Convert.ToString(dr2["sfzyx"]) == "4")
    {
        switch (Convert.ToString(dr2["yw_country"]))
        {
            case "0":
                proname = " 澳大利亚";
                break;
            case "1":
                proname = " 新西兰";
                break;
            case "2":
                proname = " 中国";
                break;
        }

        // str_GG = DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, "select clsname1 from citytype where id=" + dr2["DQ_QZ"] + ";", null) + "";
        proname += "自由行签证";

    }
    string str_url = pbclas.GetCarProUrl(Convert.ToString(dr2["id"]));
    //sql = "select Proid,Cid,Price,Cnum from CarChild where proid=" + dr2["proid"] + " and orderid='" + dr["Orderid"] + "';";
    //System.Data.DataTable dt3 = DLL.OleDbHelper.ExecuteDataSet(DLL.OleDbHelper.Conn, sql, null).Tables[0];
    //StringBuilder sbr_gg = new StringBuilder();
    //StringBuilder sbr_price = new StringBuilder();
    //foreach (System.Data.DataRow dr3 in dt3.Rows)
    //{
    //    if (Convert.ToString(dr2["stype"]) == "0")
    //    {
    //        sbr_gg.Append("<li>" + DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, "select title from ProCarInfo where id=" + dr3["cid"] + ";", null) + "</li>");
    //        sbr_price.Append("<li>" + dr3["Cnum"] + "</li>");
    //    }
    //    else if (Convert.ToString(dr2["stype"]) == "1")
    //    {
    //        sbr_gg.Append("<li>" + str_GG + "-" + DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, "select content from baoxianjihua where id=" + dr3["cid"] + ";", null) + "</li>");
    //        sbr_price.Append("<li>" + dr3["Cnum"] + "</li>");
    //    }
    //}
       
                
                %>
                <%
                        
                    if ((i + 1) % 4 == 0)
                    {    
                            
                %>
                <div class="hy_rgh_sc_2_sc" style="padding: 0;">
                    <div class="hy_rgh_sc_2_sc_pic">
                        <a href="<%=str_url %>" target="_blank">
                            <img src="pic/<%=dr2["pictureb"] %>" width="226" height="150" /></a></div>
                    <div class="hy_rgh_sc_2_sc_name">
                        <a href="<%=str_url %>" target="_blank">
                            <%=proname%></a></div>
                </div>
                <%
                    }
else
{
                %>
                <div class="hy_rgh_sc_2_sc">
                    <div class="hy_rgh_sc_2_sc_pic">
                        <a href="<%=str_url %>" target="_blank">
                            <img src="pic/<%=dr2["pictureb"] %>" width="226" height="150" /></a></div>
                    <div class="hy_rgh_sc_2_sc_name">
                        <a href="<%=str_url %>" target="_blank">
                            <%=proname%></a></div>
                </div>
                <%
}
i++;
}
                    }
                %>

              <%=getpage%>
            </div>
        </div>
    </div>
</asp:Content>
