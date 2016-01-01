using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class guodu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["gocar"] != null)
        {
            string strUrl = Convert.ToString(HttpContext.Current.Session["gocar"]);
            HttpContext.Current.Session["gocar"] = null;
            Response.Redirect(strUrl);
        }
        else
            Response.Redirect("index.aspx");
    }
}