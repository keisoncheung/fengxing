using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using DLL;

public partial class myinfo : System.Web.UI.Page
{
     public publicclass pbclass = new publicclass();
     public MemberInfo cInfo = new MemberInfo();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        cInfo.Load();
        if (string.IsNullOrWhiteSpace(Convert.ToString(cInfo.mId)) || cInfo.mId == "0")
        {
            HttpContext.Current.Session["gocar"] = "myinfo.aspx";
            Response.Redirect("login.aspx");
            
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       

    }
    
}