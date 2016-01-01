using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Collections.Generic;

using DLL;

public partial class manager_proinfo : System.Web.UI.Page
{
    public string content = "";
    int proid = 0;
    public string stttitle = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        proid = Convert.ToInt32(Request["id"]);
        if (!this.IsPostBack)
        {

            if (Request["id"] != null)
            {
                proid = Convert.ToInt32(Request["id"]);
                stypename();
                csh(proid);
            }
        }
         
    }

    public void stypename()
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "", sfzyx = string.Empty;
        List<proinfo.ProInfoContent> list = new List<proinfo.ProInfoContent>();
        DataTable dt = new DataTable();

        if (Request["id"] != null)
        {
            sql = "select sfzyx from product where id=" + Request["id"] + "; ";
            dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
            foreach (DataRow dr in dt.Rows)
            {
                sfzyx = Convert.ToString(dr["sfzyx"]);
                switch (sfzyx)
                {
                    case "1":
                    case "2":
                    case "3":
                        list.Add(new proinfo.ProInfoContent() { Title = "产品详情", Content = "Content" });
                        list.Add(new proinfo.ProInfoContent() { Title = "预订须知", Content = "ydxz" });
                        list.Add(new proinfo.ProInfoContent() { Title = "费用", Content = "feiyong" });
                        list.Add(new proinfo.ProInfoContent() { Title = "交通", Content = "jiaotong" });
                        list.Add(new proinfo.ProInfoContent() { Title = "攻略", Content = "gonglue" });
                        break;
                    case "4":
                        list.Add(new proinfo.ProInfoContent() { Title = "签证信息", Content = "Content" });
                        list.Add(new proinfo.ProInfoContent() { Title = "所需资料", Content = "ydxz" });
                        list.Add(new proinfo.ProInfoContent() { Title = "办理流程", Content = "feiyong" });
                        list.Add(new proinfo.ProInfoContent() { Title = "注意事项", Content = "jiaotong" });
                        list.Add(new proinfo.ProInfoContent() { Title = "温馨提示", Content = "gonglue" });
                        list.Add(new proinfo.ProInfoContent() { Title = "邮寄地址", Content = "youjidizhi" });
                        list.Add(new proinfo.ProInfoContent() { Title = "购买保险", Content = "goumaibaoxian" });
                        break;
                    default:     
                        list.Add(new proinfo.ProInfoContent() { Title = "产品详情", Content = "Content" });
                        list.Add(new proinfo.ProInfoContent() { Title = "预订须知", Content = "ydxz" });
                        list.Add(new proinfo.ProInfoContent() { Title = "费用", Content = "feiyong" });
                        list.Add(new proinfo.ProInfoContent() { Title = "交通", Content = "jiaotong" });
                        list.Add(new proinfo.ProInfoContent() { Title = "攻略", Content = "gonglue" });
                        break;
                }
            }

        }
        ddbtype.Items.Clear();
        ddbtype.DataSource = list;
        ddbtype.DataTextField = "Title";
        ddbtype.DataValueField = "Content";
        ddbtype.DataBind();
    }

    private void csh(int id)
    {

        string str = Convert.ToString(ddbtype.SelectedValue);
        try
        {
            if (!string.IsNullOrWhiteSpace(str))
            {
                string sql = "select id," + str + " from product where id=" + id + "";
                DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
                foreach (DataRow or in dt.Rows)
                {

                    FreeTextBox1.Text = Convert.ToString(or[1]);
                }
                stttitle = ddbtype.SelectedItem.Text;

            }

        }
        catch (Exception e)
        {
            e.ToString();
        }
    }

    protected void Submit2_ServerClick(object sender, EventArgs e)
    {
        string str = Convert.ToString(ddbtype.SelectedValue);
        if (!string.IsNullOrWhiteSpace(str))
        {
            string str_content = FreeTextBox1.Text.Replace("'", "\"") + "";
            string sql = "update product set " + str + "='" + str_content + "' where id=" + Request["id"] + "";
            try
            {
                OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
                Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"修改成功！\");</script>");
            }
            catch (Exception ee)
            {
                ee.ToString();
                Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"修改失败！\");</script>");
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       

    }
    protected void ddbtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        string str = Convert.ToString(ddbtype.SelectedValue);

        if (!string.IsNullOrWhiteSpace(str))
        {
            csh(proid);
        }
    }
}
