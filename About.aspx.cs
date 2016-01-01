using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using DLL;
using System.Web.UI.HtmlControls;

public partial class about : System.Web.UI.Page
{

    public string title = string.Empty,content=string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrWhiteSpace(Convert.ToString(Request["id"])))
            getContent();
    }

    public void getContent()
    {
        title = string.Empty;
        content = string.Empty;
        string sql = "select title,content1 from Article where id="+Request["id"]+" ";
        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
        foreach (DataRow dr in dt.Rows)
        {
            title = Convert.ToString(dr["title"]);
            content = Convert.ToString(dr["content1"]);
        }

    }
}