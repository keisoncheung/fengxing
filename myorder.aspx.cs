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

public partial class myorder : System.Web.UI.Page
{

    public string UId = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        MemberInfo cInfo = new MemberInfo();
        cInfo.Load();
        if (string.IsNullOrWhiteSpace(Convert.ToString(cInfo.mId)) || cInfo.mId == "0")
        {
            HttpContext.Current.Session["gocar"] = "myorder.aspx";
            Response.Redirect("login.aspx");
        }
        else
            UId=cInfo.mId;
    }


   
}