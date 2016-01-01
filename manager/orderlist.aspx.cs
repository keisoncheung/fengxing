using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DLL;

public partial class manager_orderlist : System.Web.UI.Page
{
    public Hashtable output = new Hashtable();
    private string page_text = "";
    private int RecordPerPage = 10;//每页显示行数

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //txthtmlpage();
            news_del();
            news_pg();
            newlist();

        }
    }

    //删除新闻
    private void news_del()
    {
        string pg = "";
        if (Request["pg"] + "" != "")
        {
            pg = "&pg=" + Request["pg"].ToString();
        }
        if ((Request["ntype"] + "" == "d") && (Request["id"] + "" != ""))
        {
            string sql = "delete from  OrderCarMenu where Orderid='" + Request["id"]+"';";
            if (Public2.Igs(sql))
            {
                Response.Write("<script>alert('删除成功！');location.href=\"./orderlist.aspx?news=0" + pg + "\";</script>");
            }
            else
            {
                Response.Write("<script>alert('删除失败！');location.href=\"./orderlist.aspx?news=0" + pg + "\";</script>");
            }
        }
        if ((Request["ntype"] + "" == "delall") && (Request["id"] + "" != ""))
        {
            string idlist = Request["id"].Replace('-', ',');
            string sql2 = "delete from OrderCarMenu where Orderid in (" + idlist + ")";
            if (Public2.Igs(sql2))
            {
                Response.Write("<script>alert('删除成功！');location.href=\"./orderlist.aspx?news=0" + pg + "\";</script>");
            }
            else
            {
                Response.Write("<script>alert('删除失败！');location.href=\"./orderlist.aspx?news=0" + pg + "\";</script>");
            }

        }
    }

    //判断状态
    public string mzt(string nshow)
    {
        string temp = "未处理";
        if(nshow == "1")
        {
            temp = "正在处理";
        }
        if(nshow == "2")
        {
            temp = "已处理";
        }
        return temp;
    }

    //新闻列表
    private void newlist()
    {
        string sql = "";
        DataTable dt_list = null;
        try
        {
            ViewState["max_c"] = OleDbHelper.ExecuteScalar(OleDbHelper.Conn, "select count(Orderid) from OrderCarMenu", null) + "";
            ViewState["MaxPg"] = Convert.ToString(System.Math.Ceiling(Convert.ToDouble(Convert.ToInt32(Convert.ToString(ViewState["max_c"])) / Convert.ToDouble(this.RecordPerPage))));
            tpate();
            int StartNum = Convert.ToInt32(ViewState["CurrentPg"]) * RecordPerPage;
            int intTemNum = StartNum - RecordPerPage;
            sql = "select * from (select top " + StartNum + " Orderid,Uid,Cname,Cxing,Ename,Email,Mobile,Mobile2,Remark,IsPay,Createtime,style  from OrderCarMenu a  order by Createtime desc) b where b.Orderid not in (select top " + intTemNum + " Orderid from OrderCarMenu  order by Createtime desc);";
            if (intTemNum <= 0)
            {
                sql = "select top " + RecordPerPage + "   Orderid,Uid,Cname,Cxing,Ename,Email,Mobile,Mobile2,Remark,IsPay,Createtime,style  from OrderCarMenu order by  Createtime desc";
            }
            dt_list = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
        }
        catch { }
        output.Add("dt_list", dt_list);
    }

    #region 分页显示

    private void tpate()
    {
        string control = Convert.ToString(this.Request["pg"]);
        ViewState["CurrentPg"] = control;
        int pg, p, n = 0;
        if (Convert.ToInt32(ViewState["CurrentPg"]) < 1)
        {
            ViewState["CurrentPg"] = 1;
        }
        if (Convert.ToInt32(ViewState["CurrentPg"]) > Convert.ToInt32(ViewState["MaxPg"]))
        {
            ViewState["CurrentPg"] = ViewState["MaxPg"];
        }
        string urlq = turnQ();
        if (Convert.ToInt32(ViewState["MaxPg"]) > 1)
        {
            pg = Convert.ToInt32(ViewState["CurrentPg"]);
            p = ((pg - 1) >= 1) ? (pg - 1) : 1;
            n = ((pg + 1) <= Convert.ToInt32(ViewState["MaxPg"])) ? (pg + 1) : Convert.ToInt32(ViewState["MaxPg"]);
            page_text = "<td><a  href='" + urlq + "&pg=1'>首页</a>&nbsp;&nbsp;&nbsp;&nbsp;</td> " +
                "<td><a  href='" + urlq + "&pg=" + p + "'>上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;</td> " +
                "<td><a  href='" + urlq + "&pg=" + n + "'>下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;</td> " +
                "<td><a  href='" + urlq + "&pg=" + ViewState["MaxPg"] + "'>尾页&nbsp;&nbsp;&nbsp;&nbsp;</a></td> " +
                "<td>页次：<span style='color:#ff0000; font-weight:bold;'>" + ViewState["CurrentPg"] + "/" + ViewState["MaxPg"] + "</span>页&nbsp;&nbsp;&nbsp;&nbsp;</td>";
        }
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
            url = Request.Url.AbsolutePath + "?" + url.Substring(1);
        }
        else
        {
            url = Request.Url.AbsolutePath + "?news=0";
        }
        return url;
    }

    public string Page_Text
    {
        get
        {
            return (page_text != null) ? page_text : "";
        }
    }

    #endregion

    //页面跳转
    private void news_pg()
    {
        if (Request["gopg"] + "" != "")
        {
            ViewState["max_c"] = OleDbHelper.ExecuteScalar(OleDbHelper.Conn, "select count(Orderid) from OrderCarMenu", null) + ""; 
            ViewState["MaxPg"] = Convert.ToString(System.Math.Ceiling(Convert.ToDouble(Convert.ToInt32(Convert.ToString(ViewState["max_c"])) / Convert.ToDouble(this.RecordPerPage))));

            if (1 <= Convert.ToInt32(Request["gopg"].ToString()) && Convert.ToInt32(Request["gopg"].ToString()) <= Convert.ToInt32(ViewState["MaxPg"]))
            {
                Response.Redirect(turnQ() + "&pg=" + Request["gopg"].ToString());
            }
            else
            {
                Response.Redirect(turnQ());
            }
        }
    }

    public string newspage()
    {
        string temp = "news=0&";
        if (Request["pg"] + "" != "")
        {
            temp += "pg=" + Request["pg"].ToString() + "&";
        }
        else
        {
            temp += "pg=1&";
        }
        return temp;
    }

    //判断是否为数字

    private bool protf(string pn)
    {
        bool tf = true;
        if (System.Text.RegularExpressions.Regex.IsMatch(pn, "^[1-9]+(\\d*$)"))
        {
            tf = true;
        }
        else
        {
            tf = false;
        }

        return tf;
    }
}
