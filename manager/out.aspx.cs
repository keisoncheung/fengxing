﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class manager_form_out : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["admin"] != null)
        {
            Response.Cookies["admin"].Expires=DateTime.Now.AddHours(-1);
        }
        Server.Transfer("Login.aspx");
    }
}
