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

public partial class manager_form_changepwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Submit1_ServerClick(object sender, EventArgs e)
    {
        string sql=null;
        if (newpwd.Text == "")
        {
            Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"请输入新密码！\");</script>");
        }
        else if (!newpwd.Text.Equals(newpwd2.Text))
        {
            Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"两次输入密码不一致，请重新输入！\");</script>");
            newpwd2.Text = "";
        }
        else
        {
            sql = "update admin set [password]='"+newpwd.Text+"' where [id]=1";

            if (Igs(sql))
            {
                Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"密码修改成功，请记住新密码！\");</script>");
            }
            else
            {
                Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"密码修改失败，请返回！\");</script>");

            }
        }
    }
    //返回bool类型
    public bool Igs(string sql)
    {
        bool b = false;
        try
        {
            OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
            b = true;
        }
        catch (Exception ee)
        {
            ee.ToString();
            b = false;
        }
        return b;
    }
    
}
