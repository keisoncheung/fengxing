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

public partial class manager_Article2 : System.Web.UI.Page
{
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

        if (Request["lan"] != null && Request["id"]!=null)
        {
            sql = "select id,Title,content1,content2,content3,content4 from Article2";
            dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
            foreach (DataRow dr in dt.Select())
            {
                sbr.Append(" <a href='Article2.aspx?id=" + dr["id"] + "&lan=" + Request["lan"] + "' style='display:block; float:left; margin:0px 20px 10px 0px;'>" + dr["Title"] + "</a>");
            }
            
            tabcont.Visible = true;
            ret.Visible = true;
        }


        else if (Request["lan"] != null)
        {
            sql = "select id,Title from Article2";
            dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
            foreach (DataRow dr in dt.Select())
            {
                sbr.Append(" <a href='Article2.aspx?id=" + dr["id"] + "&lan=" + Request["lan"] + "' style='display:block; float:left; margin:0px 20px 10px 0px;'>" + dr["Title"] + "</a>");
            }
            tabcont.Visible = false;
            ret.Visible = true;
        }
        else
        {
            sql = "select id,ClsName from languageId";
            dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
            foreach (DataRow dr in dt.Select())
            {
                sbr.Append(" <a href='Article2.aspx?lan=" + dr["id"] + "' style='display:block; float:left; margin:0px 20px 10px 0px;'>" + dr["ClsName"] + "</a>");
                
            }
            ret.Visible = false;
            tabcont.Visible = false;
        }
        return sbr.ToString();
    }

    private void csh(int id,string lan)
    {

        try
        {
            string sql = "select canshu,content"+lan+" from Article2 where id=" +id + "";
            DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
            foreach (DataRow or in dt.Select())
            {
                txtcontent2.Value = Convert.ToString(or[1]);
            }
        }
        catch (Exception e)
        {
            e.ToString();
        }
    }

    protected void Submit2_ServerClick(object sender, EventArgs e)
    {

        string sql = "update Article2 set content" + Request["lan"] + "='" + txtcontent2.Value + "' where id=" + Request["id"] + "";
        try
        {
            OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
            Messages.Message("修改成功！");
        }
        catch (Exception ee)
        {
            ee.ToString();
            Messages.Message("修改失败！");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request["lan"] != null && Request["id"] != null)
        {
            Response.Redirect("Article2.aspx");
        }

    }
}
