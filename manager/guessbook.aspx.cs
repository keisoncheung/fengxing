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
using DLL;

public partial class manager_guessbook : System.Web.UI.Page
{
    private string gid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (Request["id"] != null)
            {
                gid = Request["id"].ToString();
                BindInfo();
            }
        }

    }
    private void BindInfo()
    {
        string sql = null;

        try
        {
            sql = "select RealName,zip,Tel,Company,email,Address,Title,Content,feedback from GuessBook where id=" + gid + "";
            DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn,sql,null).Tables[0];
            foreach (DataRow or in dt.Select())
            {
                realname.Value = Convert.ToString(or["RealName"]);
                email.Value = Convert.ToString(or["email"]);
                txtTel.Value = Convert.ToString(or["Tel"]);
                zip.Value = Convert.ToString(or["zip"]);
                txtAddress.Value = Convert.ToString(or["Address"]);
                txtTitle.Value = Convert.ToString(or["Title"]);
                txtContent.Value = Convert.ToString(or["Content"]);
                feedback.Value = Convert.ToString(or["feedback"]);

            }
        }
        catch (Exception ee)
        {
            ee.ToString();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request["id"] != null)
        {
            Response.Redirect("guessbookshow.aspx?lan=" +OleDbHelper.ExecuteScalar(OleDbHelper.Conn,"select languageId from GuessBook where id="+Request["id"],null));
        }
        else
        {
            Response.Redirect("guessbookshow.aspx");
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string sql = "update GuessBook set FeedBack='" + feedback.Value + "' where id=" + Request["id"];
        OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn,sql,null);
        Response.Write("<script>alert(\"回复成功！\");location.href=\"guessbookshow.aspx\";</script>");

    }
}
