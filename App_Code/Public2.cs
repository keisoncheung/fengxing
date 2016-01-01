using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using DLL;

/// <summary>
/// Public 的摘要说明
/// </summary>
public class Public2
{
    public string tel, fax, email, qq, msn, skype, lxr, addr, mobilep, addr2, tel2, beian, name2, zip, content, kefu = "";

    public Public2()
    {
        ContactUs();
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public void ContactUs()//联系我们
    {
        StringBuilder sbr = new StringBuilder();
        StringBuilder sbr2 = new StringBuilder();
        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, "select * from Information where LanauageId=1", null).Tables[0];
        foreach (DataRow dr in dt.Select())
        {
            tel = "" + Convert.ToString(dr["tel"]);
            addr = "" + Convert.ToString(dr["addr"]);
            qq = "" + Convert.ToString(dr["qq"]);
            lxr = Convert.ToString(dr["lxr"]);
            mobilep = "" + Convert.ToString(dr["mobilep"]);
            email = "" + Convert.ToString(dr["email"]);
            beian = Convert.ToString(dr["beian"]);
            name2 = Convert.ToString(dr["name2"]);
            zip = Convert.ToString(dr["zip"]);
            fax = Convert.ToString(dr["fax"]);

        }

    }


    public static DataTable datat(string sql)
    {
        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn,sql,null).Tables[0];
        return dt;
    }



    //文章
    public static string Article(string aid)
    {

        return OleDbHelper.ExecuteScalar(OleDbHelper.Conn,"select content1 from Article where id=" + aid)+"";
    }
    //HTML过滤
    public static string WipeScript(string str)
    {
        str = System.Text.RegularExpressions.Regex.Replace(str, "<[^>]*>", "");
        str = str.Replace("&nbsp;", "");
        return str;
    }
    public static string Hearder(int language)
    {

        StringBuilder sbr = new StringBuilder();
        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn,"select name1,copyright,keyword,Description,author from Information where LanauageId=" + language,null).Tables[0];
        foreach (DataRow or in dt.Select())
        {
            sbr.Append("<title>" + or["name1"].ToString() + "</title>");
            sbr.Append("<meta http-equiv='content-type' content='text/html;charset=gb2312'>\r");
            sbr.Append("<META content=" + or["Description"].ToString() + " name='Description'>\r");
            sbr.Append("<META content=" + or["keyword"].ToString() + " name='keywords'>\r");
            sbr.Append("<META content=" + or["author"].ToString() + " name='author'>\r");
            sbr.Append("<META content=" + or["copyright"].ToString() + " name='Copyright'>\r");
        }
        return sbr.ToString();

    }

    public static string webDescription(int language)
    {

        StringBuilder sbr = new StringBuilder();
        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, "select Description from Information where LanauageId=" + language, null).Tables[0];
        foreach (DataRow or in dt.Select())
        {
            sbr.Append(or["Description"]+"");
        }
        return sbr.ToString();
    }


    public static string webKeyWords(int id, int language)
    {

        StringBuilder sbr = new StringBuilder();
        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, "select content"+language+",title from article2 where id=" + id, null).Tables[0];
        foreach (DataRow or in dt.Select())
        {
            sbr.Append(or[0] + "");
        }
        return sbr.ToString();

    }

    //返回bool类型
    public static bool Igs(string sql)
    {
        bool b = false;
        try
        {
            OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn,sql,null);
            b = true;
        }
        catch (Exception ee)
        {
            ee.ToString();
            b = false;
        }
        return b;
    }


    public static string Title(string stit)//标题
    {
        string strbt = null;
        switch (stit + "")
        {
            case "1":
                strbt = "公司简介";
                break;
            case "2":
                strbt = "技术设备";
                break;
            case "3":
                strbt = "联系我们";
                break;
        }
        return strbt;
    }

    public static string eTitle(string stit)//英文标题
    {
        string strbt = null;
        switch (stit + "")
        {
            case "1":
                strbt = "AboutUs";
                break;
            case "2":
                strbt = "equipment";
                break;
            case "3":
                strbt = "ContactUs";
                break;
        }
        return strbt;
    }

    /// <summary>
    /// 一键转发微博代码
    /// </summary>
    /// <returns></returns>
    public static string shareCode()
    {
        StringBuilder sbr = new StringBuilder();
        sbr.Append(@"<div class='bshare-custom'><div class='bsPromo bsPromo2'></div><a title='分享到新浪微博' class='bshare-sinaminiblog'></a><a title='分享到腾讯微博' class='bshare-qqmb' href='javascript:void(0);'></a><a title='分享到网易微博' class='bshare-neteasemb' href='javascript:void(0);'></a><a title='分享到人人网' class='bshare-renren'></a><a title='分享到豆瓣' class='bshare-douban' href='javascript:void(0);'></a><a title='分享到QQ空间' class='bshare-qzone' href='javascript:void(0);'></a><a title='分享到微信' class='bshare-weixin' href='javascript:void(0);'></a><a title='分享到开心网' class='bshare-kaixin001' href='javascript:void(0);'></a><a title='更多平台' class='bshare-more bshare-more-icon more-style-sharethis'></a><span class='BSHARE_COUNT bshare-share-count' style='float: none;'>20.1K</span></div><script type='text/javascript' charset='utf-8' src='http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=1&amp;lang=zh'></script><script type='text/javascript' charset='utf-8' src='http://static.bshare.cn/b/bshareC0.js'></script>");
        return sbr.ToString();
    }

    public static string shareCode2()
    {
        StringBuilder sbr = new StringBuilder();
        sbr.Append(@"<a class='bshareDiv' href='http://www.bshare.cn/share'>分享按钮</a><script type='text/javascript' charset='utf-8' src='http://static.bshare.cn/b/buttonLite.js#uuid=&amp;style=3&amp;fs=4&amp;textcolor=#fff&amp;bgcolor=#F60&amp;text=分享到&amp;pophcol=3'></script>");
        return sbr.ToString();
    }

}

