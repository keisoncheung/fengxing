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

public partial class manager_xingchengriqi : System.Web.UI.Page
{
    public Public2 pc = new Public2();
    private int readp = 10;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.ViewState["currentp"] = 1;
            if (Request["id"] != null)
            {
                csh();
            }
        }
    }

    ////初始化类别
    //private void cstype()
    //{
    //    string sql = null;
    //    sql = "select * from pro_xingcheng where id=" + Request["id"];
    //    drtype.DataSource = osdData.DataSet(sql);
    //    drtype.DataTextField = "ClsName";
    //    drtype.DataValueField = "id";
    //    drtype.DataBind();
    //}


    //修改页面
    public void csh()
    {
        string str = null;
        string sql = "select id,clsname,sortid,content from pro_xingcheng where id=" + Request["id"];
        try
        {

            DataTable dt = new DataTable();
            dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
            foreach (DataRow or in dt.Select())
            {
                tb1.Text = Convert.ToString(or["clsname"]);
                txtsorid.Text = Convert.ToString(or["sortid"]);
                txt_xiangqing.Text = Convert.ToString(or["content"]);
            }
            dt.Dispose();
        }
        catch (Exception rr)
        {
            this.Response.Write(rr.ToString());
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request["id"] != null)
        {
            string str_proid = OleDbHelper.ExecuteScalar(OleDbHelper.Conn, "select proid from pro_xingcheng where id=" + Request["id"] + "", null) + ""; ;

            Messages.ConfirmMessageBox("xingchenganpshow.aspx?proid=" + str_proid + "", "添加成功");
        }
        else if (Request["proid"] != null)

        Response.Redirect("xingchenganpshow.aspx?proid=" + Request["proid"] + "");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "";
        string content = Convert.ToString(txt_xiangqing.Text.Replace("'","''"));
        if (Request["proid"] != null)
        {
            sql = "select * from product where id=" + Request["proid"] + "";
            DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
            foreach (DataRow dr in dt.Rows)
            {
                sql = "insert into pro_xingcheng(languageId,parid,sfzyx,proid,clsname,content)values(1,0,'" + dr["sfzyx"] + "','" + Request["proid"] + "','" + tb1.Text + "','"+content+"')";
                try
                {
                    OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
                    Messages.ConfirmMessageBox("xingchenganpshow.aspx?proid=" + Request["proid"] + "", "添加成功");
                }
                catch (Exception ee)
                {
                    Messages.Message("添加失败");
                }

            }

        }
        else
        {
            sql = "update pro_xingcheng set clsname='" + tb1.Text + "',content='"+content+"',sortid='" + txtsorid.Text.Trim() + "' where id=" + Request["id"];
            try
            {
                OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);

                string str_proid = OleDbHelper.ExecuteScalar(OleDbHelper.Conn, "select proid from pro_xingcheng where id=" + Request["id"] + "", null) + ""; ;

                Messages.ConfirmMessageBox("xingchenganpshow.aspx?proid=" + str_proid + "", "添加成功");
            }
            catch (Exception ee)
            {
                Messages.Message("修改失败");
            }

        }
    }
}
