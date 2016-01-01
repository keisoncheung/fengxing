using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using DLL;
using System.Web.UI.HtmlControls;


public partial class qianzheng : System.Web.UI.Page
{
    public string pic_url = string.Empty, proname = string.Empty, proname2 = string.Empty, jiage = string.Empty, city = string.Empty, ywsc = string.Empty, youwanshij = string.Empty, proname3 = string.Empty, content = string.Empty, content2 = string.Empty, content3 = string.Empty, content4 = string.Empty, content5 = string.Empty, xingji = string.Empty, jiage2 = string.Empty, title = string.Empty, country = string.Empty, shoulishij = string.Empty, youjidizhi = string.Empty, goumaibaoxian = string.Empty, baoxian = string.Empty, pro_id=string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Convert.ToString(Request["gj"])))
            showContent();
    }

    public void showContent()
    {
        string sql = "select top 1 * from product where sfzyx=4 and yw_country='" + Request["gj"] + "' order by id desc ";
        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
        foreach (DataRow dr in dt.Rows)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(dr["yw_country"])))
            {
                if (Convert.ToString(dr["yw_country"]) == "0")
                    title = " 澳大利亚";
                if (Convert.ToString(dr["yw_country"]) == "1")
                    title = " 新西兰";
                if (Convert.ToString(dr["yw_country"]) == "2")
                    title = " 中国";

            }
            pro_id = Convert.ToString(dr["id"]);
            pic_url = Convert.ToString(dr["pictureb"]);
            proname = Convert.ToString(dr["proname"]);
            proname2 = Convert.ToString(dr["proname2"]);
            proname3 = Convert.ToString(dr["proname3"]);
            jiage = Convert.ToString(dr["jiage"]);
            jiage2 = Convert.ToString(dr["jiage2"]);
            city = getCity(Convert.ToString(dr["yw_country"]));
            baoxian = getBaoxian(Convert.ToString(dr["yw_country"]));
            ywsc = Convert.ToString(dr["peoplesNums"]);
            youwanshij = Convert.ToString(dr["address"]);
            content = Convert.ToString(dr["Content"]);
            content2 = Convert.ToString(dr["ydxz"]);
            content3 = Convert.ToString(dr["feiyong"]);
            content4 = Convert.ToString(dr["jiaotong"]);
            content5 = Convert.ToString(dr["gonglue"]);
            shoulishij = Convert.ToString(dr["shoulishijian"]);
            youjidizhi = Convert.ToString(dr["youjidizhi"]);
            goumaibaoxian = Convert.ToString(dr["goumaibaoxian"]);
            
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

    public string getCity(string id)
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "select id,clsname1 from citytype where (sortid is null) and clsname2='2' ";
        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
        foreach (DataRow dr in dt.Rows)
        {
            sbr.Append("<dd  name='" + dr["id"] + "'><a id='" + dr["id"] + "' href='javascript:Choose_DQ(\"" + dr["id"] + "\");'>" + dr["clsname1"] + "</a></dd>");
        }
        return sbr.ToString();
    }

    public string getBaoxian(string id)
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "select id,content from baoxianjihua  where country='" + id + "' ";
        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
        foreach (DataRow dr in dt.Rows)
        {
            sbr.Append("<dd name='" + dr["id"] + "'><a id='" + dr["id"] + "'  href='javascript:Choose_BX(\"" + dr["id"] + "\");'>" + dr["content"] + "</a></dd>");
        }
        //sbr.Append(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null) + "");
        return sbr.ToString();
    }
}