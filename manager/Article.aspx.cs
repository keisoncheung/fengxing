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
using DLL;

public partial class manager_Article : System.Web.UI.Page
{
    public string content = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (Request["lan"] != null && Request["id"] != null)
            {
                csh(Convert.ToInt32(Request["id"]), Request["lan"]);
            }
        }
    }

    public string stypename()
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "";
        DataTable dt = new DataTable();

        if (Request["lan"] != null && Request["id"] != null)
        {
            sql = "select id,Title,content1,content2,content3,content4 from Article  where id<>40";
            dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
            foreach (DataRow dr in dt.Select())
            {
                sbr.Append(" <a href='Article.aspx?id=" + dr["id"] + "&lan=" + Request["lan"] + "' style='display:block; float:left; margin:0px 20px 10px 0px;'>" + dr["Title"] + "</a>");
            }

            tabcont.Visible = true;
            ret.Visible = true;
        }


        else if (Request["lan"] != null)
        {
            sql = "select id,Title from Article where id<>40";
            dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
            foreach (DataRow dr in dt.Select())
            {
                sbr.Append(" <a href='Article.aspx?id=" + dr["id"] + "&lan=" + Request["lan"] + "' style='display:block; float:left; margin:0px 20px 10px 0px;'>" + dr["Title"] + "</a>");
            }
            tabcont.Visible = false;
            ret.Visible = true;
        }
        else
        {
            sql = "select id,ClsName from languageId ";
            dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
            foreach (DataRow dr in dt.Select())
            {
                sbr.Append(" <a href='Article.aspx?lan=" + dr["id"] + "' style='display:block; float:left; margin:0px 20px 10px 0px;'>" + dr["ClsName"] + "</a>");

            }
            ret.Visible = true;
            tabcont.Visible = false;
        }
        return sbr.ToString();
    }

    private void csh(int id, string lan)
    {

        try
        {
            string sql = "select canshu,content" + lan + " from Article where id=" + id + "";
            DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
            foreach (DataRow or in dt.Rows)
            {

                FreeTextBox1.Text = Convert.ToString(or[1]);
                txtcanshu.Value = Convert.ToString(or[0]);
            }


        }
        catch (Exception e)
        {
            e.ToString();
        }
    }

    protected void Submit2_ServerClick(object sender, EventArgs e)
    {
        string str_content = FreeTextBox1.Text.Replace("'","\"")+"";
        string sql = "update Article set content" + Request["lan"] + "='" + str_content + "',canshu='" + txtcanshu.Value + "' where id=" + Request["id"] + "";
        try
        {
            OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
            Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"修改成功！\");window.location.href=window.location.href;</script>");
        }
        catch (Exception ee)
        {
            ee.ToString();
            Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"修改失败！\");window.location.href=window.location.href;</script>");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request["lan"] != null && Request["id"] != null)
        {
            Response.Redirect("Article.aspx");
        }

    }
}
