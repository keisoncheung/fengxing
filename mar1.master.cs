using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using DLL;
using System.Web.UI.HtmlControls;

public partial class mar1 : System.Web.UI.MasterPage
{
    public string login_prev=string.Empty,login_later=string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        CheckLogStatus();
    }


    public void CheckLogStatus()
    {

        MemberInfo info = new MemberInfo();
        info.Load();
        if (info.mId == "0")
        {
            login_prev = @"";
            login_later = string.Empty;
        }
        else
        {
            login_prev = @" <td> &nbsp; &nbsp; &nbsp; &nbsp;</td>
                <td> &nbsp; &nbsp; &nbsp; &nbsp;</td>";
            string id = info.mId;

            string sql = "select top 1 Name1 from MemberList where Id=" + id;
            login_prev = @" <td> <a href='myinfo.aspx'><font style='color:red;'>" + Convert.ToString(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null)) + @"</font></a>&nbsp;&nbsp; <a href='memberout.aspx'>退出</a></td>";
        }

    }


    protected void Submit1_ServerClick(object sender, EventArgs e)
    {

        string kw = Convert.ToString(tbx_kw.Value);
        if (!string.IsNullOrWhiteSpace(kw))
        {
            InsertKeyWord(kw);
            Response.Redirect("aozhou.aspx?gj=0&proname=" + Server.UrlEncode(kw) + "");
        }
        else
            Response.Redirect("aozhou.aspx?gj=0");

    }


    public void InsertKeyWord(string kw)
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "select  count(id) from SearchKeyWord where title='"+kw+"'  ";
        int num = Convert.ToInt32(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null));
        if (num > 0)
            sql = "update searchkeyword set countnum=countnum+1,modifytime='"+DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")+"' where title='" + kw + "'";
        else
            sql = "insert into searchkeyword(title,createtime,modifytime)values('" + kw + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "');";

        OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
    }

    public string getKeyWord()
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "select  top 8 id,title from SearchKeyWord order by countnum desc";
        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
        foreach (DataRow dr in dt.Rows)
        {
            sbr.Append(@"<a href='aozhou.aspx?gj=0&proname=" + Server.UrlEncode(dr["title"]+"") + "'>" + dr["title"] + "</a> ");
        }
        return sbr.ToString();
    }
}
