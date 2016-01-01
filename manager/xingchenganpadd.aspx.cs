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

public partial class manager_xingchenganpadd : System.Web.UI.Page
{
    public Public2 pc = new Public2();
    private int readp = 10;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.ViewState["currentp"] = 1;
            if (Request["lan"] != null && Request["id"] != null)
            {

            }
            else if (Request["id"] != null)
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
        string sql = "select id,clsname,sortid,proid,yw_country,yw_city from pro_xingcheng where id=" + Request["id"] + "";
        try
        {

            DataTable dt = new DataTable();
            dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
            foreach (DataRow or in dt.Select())
            {
                ddcity.SelectedValue = Convert.ToString(or["yw_country"]);
                ddcity_SelectedIndexChanged(null, null);
                sel_city.SelectedValue = Convert.ToString(or["yw_city"]);
                txtsorid.Text = Convert.ToString(or["sortid"]);
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
        

        if (Request["proid"] != null)
        {
            sql = "select * from product where id="+Request["proid"]+" ";
            DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
            foreach (DataRow dr in dt.Rows)
            {
                if (Request["id"] != null)
                {
                    sql = "insert into pro_xingcheng(languageId,parid,sfzyx,yw_country,yw_city,proid,clsname)values(1,'" + Request["id"] + "','" + dr["sfzyx"] + "','" + ddcity.SelectedValue + "','" + sel_city.SelectedValue + "','" + Request["proid"] + "','" + sel_city.SelectedItem.Text + "')";
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

        }
        
        else
        {
            sql = "update pro_xingcheng set yw_country='" + ddcity.SelectedValue + "',yw_city='" + sel_city.SelectedValue + "',sortid='" + txtsorid.Text.Trim() + "' where id=" + Request["id"];
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
    protected void ddcity_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sql = "select id,clsname1 from citytype where clsname2='" + ddcity.SelectedValue + "' order by id";
        sel_city.DataSource = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null);
        sel_city.DataTextField = "ClsName1";
        sel_city.DataValueField = "id";
        sel_city.DataBind();
        sel_city.Items.Insert(0, "--请选择--");
        sel_city.Items[0].Value = "0";
    }

    public string getcountry(string id)
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "select clsname1 from citytype where sortid=" + id + " ";
        sbr.Append(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null) + "");
        return sbr.ToString();
    }


    public string getCity(string id)
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "select clsname1 from citytype where id=" + id + " ";
        sbr.Append(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null) + "");
        return sbr.ToString();
    }
}
