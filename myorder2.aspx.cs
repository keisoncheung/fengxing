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

public partial class myorder2 : System.Web.UI.Page
{
    public int pagemax = 10; //没页个数;
    public string pagelist = "";
    public string cp = "1";
    public int num;
    public string vipuser = "";
    public string pics, links, daohang = string.Empty;

    public string curr_page = string.Empty, tot_page = string.Empty;
    public string UId = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.ViewState["CurrentPg"] = 1;
        }
        MemberInfo cInfo = new MemberInfo();
        cInfo.Load();
        if (string.IsNullOrWhiteSpace(Convert.ToString(cInfo.mId)) || cInfo.mId == "0")
        {
            HttpContext.Current.Session["gocar"] = "myorder2.aspx";
            Response.Redirect("login.aspx");
        }
        else
            UId = cInfo.mId;
    }

    //分页显示
    public void page(int max, int num)
    {
        int maxtitle = 13;//显示多少页;
        int maxindex = Convert.ToInt32(System.Math.Ceiling((max * 1.0) / pagemax));//最大页数;
        int title_index = Convert.ToInt32(System.Math.Ceiling((maxindex * 1.0) / maxtitle));//显示多少个页数;
        int[,] arry = new int[title_index + 1, maxtitle];
        string url = this.Request.Url.Query;
        if (url.IndexOf("&cp") > 0)
        {
            url = url.Substring(0, url.IndexOf("&cp"));
        }
        if (url.IndexOf("?cp") >= 0)
        {
            url = url.Substring(0, url.IndexOf("?cp"));
        }
        if (url.IndexOf("?") >= 0)
        {
            url += "&cp=";
        }
        else
        {
            url = "?cp=";
        }
        for (int i = 1; i <= title_index; i++)
        {
            for (int t = 0; t < maxtitle; t++)
            {
                arry[i, t] = t + 1 + (maxtitle * (i - 1));
            }
        }
        ////<div class='fenyebox'>
        //        <span class='num'><span>1</span><span>/1</span></span><a href='javascript:;' class='btn enable'><i
        //            class='sprint_img triangle_left'></i>上一页</a> <a href='javascript:;' class='btn active'>
        //                1</a> <a href='javascript:;' class='btn enable'>2</a> <a href='javascript:;' class='btn enable'>
        //                    3</a> ... <a href='javascript:;' class='btn enable'>7</a> <a href='javascript:;'
        //                        class='btn enable'>下一页<i class='sprint_img triangle_right'></i></a>
        pagelist += " <div class='fenyebox'><span class='num'><span>" + cp + "</span><span>/" + maxindex + "</span></span><a href='" + url + "1' class='btn enable'><i class='sprint_img triangle_left'></i>首页</a> ";
        if (Convert.ToInt32(cp) == 1)
        { pagelist += "<a href='" + url + "1' class='btn enable'><i class='sprint_img triangle_left'></i>上一页</a>"; }
        else { pagelist += " <a href='" + url + "" + (Convert.ToInt32(cp) - 1) + "' class='btn enable'><i class='sprint_img triangle_left'></i>上一页</a>"; }

        int arry_index = Convert.ToInt32(System.Math.Ceiling(Convert.ToInt32(cp) / ((maxtitle) * 1.0)));

        string className = "btn enable";
        for (int i = 0; i < maxtitle; i++)
        {
            if (maxindex == 0) continue;
            if (arry[arry_index, i] > maxindex) continue;
            className = (arry[arry_index, i] == Convert.ToInt32(cp)) ? "btn active" : "btn enable";
            pagelist += " <a href='" + url + "" + arry[arry_index, i] + "' class='" + className + "'>" + arry[arry_index, i] + "</a>";
        }
        if (Convert.ToInt32(cp) == maxindex)
        {
            pagelist += "<a href='" + url + "" + maxindex + "' class='btn enable'>下一页<i class='sprint_img triangle_right'></i></a> ";
        }
        else { pagelist += "<a href='" + url + "" + (Convert.ToInt32(cp) + 1) + "' class='btn enable'>下一页<i class='sprint_img triangle_right'></i></a>"; }
        pagelist += " <a href='" + url + "" + maxindex + "' class='btn enable'>尾页<i class='sprint_img triangle_right'></i></a>";
        //pagelist += "<SPAN  style='color:black;'>&nbsp;&nbsp;&nbsp;当前<SPAN style='color:black;'>" + cp + "</SPAN>/<SPAN style='color:black;'>" + maxindex + "</SPAN>页&nbsp;&nbsp;&nbsp; 总共<SPAN style='color:black;'>" + max + "</span>记录</span>";
        pagelist += "</div>";
        curr_page = cp;
        tot_page = Convert.ToString(maxindex);
    }
    private string turnQ()
    {
        string urls = Request.Url.Query;
        string url = "";
        if (urls.IndexOf("?") >= 0)
        {
            urls = urls.Replace("?", "");
            foreach (string u in urls.Split('&'))
            {
                if (u.IndexOf("pg") == -1)
                {
                    url += "&" + u;
                }
            }
        }
        return url;
    }
    //获取当前页面绝对网址
    private string turnUrl()
    {
        string url = Request.Url.AbsolutePath;
        url = url.Substring(url.LastIndexOf('/') + 1);
        return url;
    }


    public string getcountry(string id)
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "select clsname1 from citytype where sortid=" + id + " ";
        sbr.Append(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null) + "");
        return sbr.ToString();
    }


    public string getCity(string id)
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "select clsname1 from citytype where id=" + id + " ";
        sbr.Append(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null) + "");
        return sbr.ToString();
    }

    public string getpage
    {
        get
        {

            return pagelist;

        }
    }
}