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
using System.IO;
using System.Drawing;
using System.Text;

public partial class manager_form_fy_main : System.Web.UI.Page
{
    public float ss;
    public int tt;
    public StringBuilder sbr = new StringBuilder();
    public string baifenbi ="",overTishi="";
    protected void Page_Load(object sender, EventArgs e)
    {
        
        string username = "";
        try
        {
            if (Request.Cookies["admin"] == null)
                username = Convert.ToString(Request.Cookies["admin"].Value);
        }
        catch
        {
            Response.Redirect("login.aspx");
            return;
        }
        string path = Server.MapPath("~");
        float cc = GetDirectoryLength(path);
        cc = cc / 1024000;
        sbr.Append("网站已用空间大小:<font color='red'>" + Math.Round(Convert.ToDecimal(cc), 2) + "&nbsp;M&nbsp;&nbsp;&nbsp;</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
        string size = ConfigurationSettings.AppSettings["roomsize"];
        sbr.Append("网站总空间大小：<font color='red'>" + size.ToString() + "&nbsp;M</font>");
        int dd = Convert.ToInt32(size);
        img2.ImageUrl = "bgpic/loadingmid.gif";
        ss = (cc*1000 / (dd * 1024));
        tt = Convert.ToInt32(ss * 500);
        img2.Width = tt;
        baifenbi = Math.Round(Convert.ToDecimal(ss * 100), 2) + "%";
        if (Math.Round(Convert.ToDecimal(ss * 100), 2) > 95)
            overTishi = "温馨提醒：尊敬的客户，您好，您的空间即将用完，可能会影响到您日后网站的后台操作。具体事宜请联系技术支持。";

    }

    public long GetDirectoryLength(string dirPath)
    {
        if (!Directory.Exists(dirPath))
            return 0;
        long len = 0;
        DirectoryInfo di = new DirectoryInfo(dirPath);
        foreach (FileInfo fi in di.GetFiles())
        {
            len += fi.Length;
        }
        DirectoryInfo[] dis = di.GetDirectories();
        if (dis.Length > 0)
        {
            for (int i = 0; i < dis.Length; i++)
            {
                len += GetDirectoryLength(dis[i].FullName);
            }
        }
        return len;
    }
}
