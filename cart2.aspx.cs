using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cart2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MemberInfo cInfo = new MemberInfo();
        cInfo.Load();
        if (string.IsNullOrWhiteSpace(Convert.ToString(cInfo.mId)) || cInfo.mId == "0")
        {
            HttpContext.Current.Session["gocar"] = "cart2.aspx";
            Response.Redirect("login.aspx");
        }
    }
}