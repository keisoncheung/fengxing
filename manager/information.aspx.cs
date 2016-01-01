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

public partial class manager_form_gszl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Request["lanauage"] + "").Length <= 0)
        {
            this.Response.Clear();
            this.Response.Write("");
            this.Response.End();
            return;
        }
        if (!this.IsPostBack)
        {

            csh();
        }
    }

    public void csh()
    {
        try
        {
            string sql = "select * from Information where LanauageId=" + Request["lanauage"];
            DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
            foreach (DataRow or in dt.Select())
            {
                txtname1.Value = Convert.ToString(or["name1"]);
                txtcopyright.Value = Convert.ToString(or["copyright"]);
                txtkeyword.Value = Convert.ToString(or["keyword"]);
                txtname2.Value = Convert.ToString(or["name2"]);
                txtweb.Value = Convert.ToString(or["web"]);
                txtemail.Value = Convert.ToString(or["email"]);
                txtfax.Value = Convert.ToString(or["fax"]);
                txtdes.Value = Convert.ToString(or["Description"]);
                txtlxr.Value = Convert.ToString(or["lxr"]); ;
                txttel.Value = Convert.ToString(or["tel"]);
                txtzip.Value = Convert.ToString(or["zip"]);
                txtaddr.Value = Convert.ToString(or["addr"]);
                txtbeian.Value = Convert.ToString(or["beian"]);
                txtmobilep.Value = Convert.ToString(or["mobilep"]);
                qq.Value = Convert.ToString(or["qq"]);

            }

        }
        catch (Exception e)
        {
            e.ToString();
        }
    }

    protected void Submit2_ServerClick(object sender, EventArgs e)
    {
        string sql = "update Information set name1='" + txtname1.Value + "',name2='" + txtname2.Value + "',web='" + txtweb.Value + "',email='" + txtemail.Value + "',fax='" +
                 txtfax.Value + "',copyright='" + txtcopyright.Value + "',keyword='" + txtkeyword.Value + "',Description='" + txtdes.Value + "',lxr='" + txtlxr.Value + "',tel='" +
                 txttel.Value + "',zip='" + txtzip.Value + "',addr='" + txtaddr.Value + "',beian='" + txtbeian.Value + "',mobilep='" +
                 txtmobilep.Value + "',qq='"+qq.Value+"' where LanauageId=" + Request["lanauage"];
        try
        {
            OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
            Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"修改成功！\")</script>");
        }
        catch (Exception ee)
        {
            ee.ToString();
            Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"修改失败！\")</script>");
        }
    }
}



