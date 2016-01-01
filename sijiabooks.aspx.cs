using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using DLL;
using System.Web.UI.HtmlControls;

public partial class sijiabooks : System.Web.UI.Page
{

    public string strMenu=string.Empty, firstData = string.Empty, secondData = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        getstype();
    }

    public void getstype()
    {
        StringBuilder sbr1 = new StringBuilder();
        StringBuilder sbr2 = new StringBuilder();
        StringBuilder sbr3 = new StringBuilder();
        string sql = "select id,clsname,picb from productType where parid=374;";
        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
        foreach (DataRow dr in dt.Rows)
        {
            int i = 0;
            sbr1.Append("<a href='chakangengduo.aspx?pid="+dr["id"]+@"'>" + dr["clsname"] + @"</a>");
            sbr2.Append(@"<li><div class='dzlistbox'><div class='dzlistbox_left'>
                        	<a href='chakangengduo.aspx?pid="+dr["id"]+@"'>
                            	<img src='pic/"+dr["picb"]+@"' width='250' height='184' />
                            	<span>" + dr["clsname"] + @"</span>
                            </a>
                        </div> <div class='dzlistbox_right'>");

            sql = "select id,proname,canshu from product where parid=" + dr["id"] + "  order by id desc;";
             DataTable dt2 = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
             int j = 0;
             foreach (DataRow dr2 in dt2.Rows)
             {
                 if (j == 0)
                 {
                     sbr2.Append(@"<div class='dzlistbot_rig_1'>
                            	<a href='dingzhishow.aspx?pro_id=" + dr2["id"] + "'>" + dr2["proname"] + @"</a>
                            </div>
                            <div class='dzlistbot_rig_2'>
                            	&nbsp;&nbsp;&nbsp;&nbsp;" +dr2["canshu"]+@"
                            </div>
                            ");
                 }
                 else if (j == 1)
                 {
                     sbr2.Append("<div class='dzlistbot_rig_3'>");
                     sbr2.Append("<div class='dzlistart'><a href='dingzhishow.aspx?pro_id=" + dr2["id"] + "'>" + dr2["proname"] + @"</a></div>");
                 }

                 if (j >1)
                 {
                     sbr2.Append("<div class='dzlistart'><a href='dingzhishow.aspx?pro_id=" + dr2["id"] + "'>" + dr2["proname"] + @"</a></div>");
                 }
                 j++;
             }
             if (j>=2)
             {
                 sbr2.Append(@"</div>");
             }

             sbr2.Append(@"</div>");
             sbr2.Append(@"</div></li>");
        }
        strMenu = sbr1.ToString();
        firstData = sbr2.ToString();
       // return sbr1.ToString();
    }

    public string getdata()
    {
        StringBuilder sbr = new StringBuilder();
        int i = 0;
        string sql = "select * from product where parid in (select id from productType where parid=374 ) order by id desc;";
        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
        foreach (DataRow dr in dt.Rows)
        {
            if (i == 0)
            {
                sbr.Append("<a href='#'>" + dr["clsname"] + "</a>");
            }
            else
            {
 
            }
        }
        return sbr.ToString();
    }
}