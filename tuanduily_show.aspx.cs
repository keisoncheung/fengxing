using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using DLL;
using System.Web.UI.HtmlControls;
using System.Web.Script.Serialization;


public partial class tuanduily_show : System.Web.UI.Page
{
    public string pic_url = string.Empty, proname = string.Empty, proname2 = string.Empty, jiage = string.Empty, city = string.Empty, ywsc = string.Empty, youwanshij = string.Empty, proname3 = string.Empty, content = string.Empty, content2 = string.Empty, content3 = string.Empty, content4 = string.Empty, content5 = string.Empty,xingji=string.Empty,jiage2=string.Empty,title=string.Empty,pro_id=string.Empty;
    public string chuxingrPrice = string.Empty, taocanPrice = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Convert.ToString(Request["pro_id"])))
        {
            pro_id = Convert.ToString(Request["pro_id"]);
            showContent();
            GetProInfo(Convert.ToString(Request["pro_id"]));
        }
    }

    public void showContent()
    {
        string sql = "select * from product where id=" + Request["pro_id"] + "";
        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
        foreach (DataRow dr in dt.Rows)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(dr["yw_country"])))
            {
                if (Convert.ToString(dr["yw_country"]) == "0")
                    title = " <a href='index.aspx'>风行旅游网</a>><a href='tuanduily_show.aspx?pro_id=" + dr["parid"] + "'>澳新团队旅游</a>><span>" + Convert.ToString(dr["proname"]) + "</span>";
                if (Convert.ToString(dr["yw_country"]) == "1")
                    title = " <a href='index.aspx'>风行旅游网</a>><a href='tuanduily_show.aspx?pro_id=" + dr["parid"] + "'>澳新团队旅游</a>><span>" + Convert.ToString(dr["proname"]) + "</span>";

            }
            pic_url = Convert.ToString(dr["pictureb"]);
            proname = Convert.ToString(dr["proname"]);
            proname2 = Convert.ToString(dr["proname2"]);
            proname3 = Convert.ToString(dr["proname3"]);
            jiage = Convert.ToString(dr["jiage"]);
            jiage2 = Convert.ToString(dr["jiage2"]);
            city = getCity(Convert.ToString(dr["city"]));
            ywsc = Convert.ToString(dr["peoplesNums"]);
            youwanshij = Convert.ToString(dr["address"]);
            content = Convert.ToString(dr["Content"]);
            content2 = Convert.ToString(dr["ydxz"]);
            content3 = Convert.ToString(dr["feiyong"]);
            content4 = Convert.ToString(dr["jiaotong"]);
            content5 = Convert.ToString(dr["gonglue"]);
            if (!string.IsNullOrEmpty(Convert.ToString(dr["xingji"])))
            {
                for (int i_xj = 0; i_xj < Convert.ToInt32(dr["xingji"]); i_xj++)
                {
                    xingji += "<img src='images/xxdd2.png' width='30' height='22'>";
                }
            }
            else
                xingji = "暂无级别";

        }

    }

    #region 规格——————————
    /// <summary>
    /// 规格
    /// </summary>
    /// <param name="proid"></param>
    public void GetProInfo(string proid)
    {
        StringBuilder sbr1 = new StringBuilder();
        StringBuilder sbr2 = new StringBuilder();
        string pid = Convert.ToString(proid) + "";
        string sql=string.Empty;
        if (!string.IsNullOrWhiteSpace(pid))
        {
            int i = 0;
            string id = string.Empty;
            sql = "select title,id,proprice,proid,stype,proid,fx_price from procarinfo where proid=" + pid + " ";
             DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
             foreach (DataRow dr in dt.Rows)
             {
                 i++;
                 id = Convert.ToString(dr["id"]);
                 if (Convert.ToString(dr["stype"]) == "1")
                 {
                     sbr1.Append(@"<tr class='ggpro" + i + @"'>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                " + dr["title"] + @"
                            </td>
                            <td height='40' valign='middle' style='text-align: left;'>
                                <a href='javascript:void(0)' class='dtdjjian' onclick='down(" + i + @")'>-</a>
                                <input  id='t" + i + @"' name='" + id + @"' class='dtdjzhong' type='txt' value='0' oninput='change(" + i + @")'>
                                <a href='javascript:void(0)' class='dtdjjian' onclick='up(" + i + @")'>+</a>
                            </td>
                            <td>
                                <span class='ddt_fzjg'><span id='fxjg" + i + @"'>" + Convert.ToString(dr["fx_price"]) + @"</span></span>
                            </td>
                            <td>
                                <span class='ddt_xzjg'><span id='xzjg" + i + @"' name='xzjg" + id + @"'>" + dr["proprice"] + @"</span></span>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>");
                 }
                 else if (Convert.ToString(dr["stype"]) == "2")
                 {
                     sbr2.Append(@"<tr class='ggpro" + i + @"'>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                " + dr["title"] + @"
                            </td>
                            <td height='40' valign='middle' style='text-align: left;'>
                                <a href='javascript:void(0)' class='dtdjjian' onclick='down(" + i + @")'>-</a>
                                <input  id='t" + i + @"' name='"+id+@"' class='dtdjzhong' type='txt' value='0' oninput='change(" + i + @")'>
                                <a href='javascript:void(0)' class='dtdjjian' onclick='up(" + i + @")'>+</a>
                            </td>
                            <td>
                                <span class='ddt_fzjg'><span id='fxjg" + i + @"'>" + Convert.ToString(dr["fx_price"]) + @"</span></span>
                            </td>
                            <td>
                                <span class='ddt_xzjg'><span id='xzjg" + i + @"' name='xzjg"+id+@"'>" + dr["proprice"] + @"</span></span>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>");
                 }
             }

             chuxingrPrice = sbr1.ToString();
             taocanPrice = sbr2.ToString();

        }
    }

    #endregion 规格————————————————————

    public string getCity(string id)
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "select clsname1 from citytype where id=" + id + " ";
        sbr.Append(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null) + "");
        return sbr.ToString();
    }
}