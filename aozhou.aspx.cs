using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using DLL;
using System.Web.UI.HtmlControls;

public partial class aozhou : System.Web.UI.Page
{
    int pagemax = 24; //每页个数;
    string pagelist = "";
    string cp = "1"; 
    int num;
    public string vipuser = "";
    public string pics, links, daohang = string.Empty;
    public string Main_citys = string.Empty, Main_spots = string.Empty, zuheUrl = "aozhou.aspx?gj=0";
    public string curr_page = string.Empty, tot_page = string.Empty;
    public publicclass pclass = new publicclass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.ViewState["CurrentPg"] = 1;
            if (!string.IsNullOrEmpty(Request["gj"]))
            {
                if (Request["gj"] + "" == "0")
                {
                    daohang = "<a href='index.aspx'>风行旅游网</a>><a href='aozhou.aspx?gj=" + Request["gj"] + "'>澳大利亚自由行</a>";
                   
                }
                else
                {
                    daohang = "<a href='index.aspx'>风行旅游网</a>><a href='aozhou.aspx?gj=" + Request["gj"] + "'>新西兰自由行</a>";
                }

            }
        }
        string dti = "";
        if (Request["dti"] != null)
        {
            dti = "&dti=" + Request["dti"];
        }
        if (!string.IsNullOrEmpty(Request["gj"]))
        {
            if (Request["gj"] + "" == "0")
                daohang = "<a href='index.aspx'>风行旅游网</a>><a href='aozhou.aspx?gj="+Request["gj"]+"'>澳大利亚自由行</a>";
            else
                daohang = "<a href='index.aspx'>风行旅游网</a>><a href='aozhou.aspx?gj=" + Request["gj"] + "'>新西兰自由行</a>";
        }
        //SearchMenu();  
        pageTitle();

    }



    public void pageTitle()
    {
        StringBuilder sbr = new StringBuilder();
        if (Request["city"] != null)
            sbr.Append(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, "select clsname1 from citytype where id=" + Request["city"], null) + "");

        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, "select content1,title from article2 where id=2", null).Tables[0];
        foreach (DataRow dr in dt.Select())
        {
            sbr.Append(Convert.ToString(dr[0]));
            Page.Header.Title = sbr.ToString();
            HtmlMeta keywords = new HtmlMeta();
            keywords.Name = "keywords";
            keywords.Content = Convert.ToString(dr[0]);
            Page.Header.Controls.Add(keywords);
            HtmlMeta desc = new HtmlMeta();
            desc.Name = "description";
            desc.Content = Public2.webDescription(1);
            Page.Header.Controls.Add(desc);
        }

    }

    /// <summary>
    /// 单选/组合产品
    /// </summary>
    public string SearchZuheMenu()
    { 
        string className = string.Empty;
        string url = Request.Url.Query;
        if (url.IndexOf("&zuhe") > 0)
        {
            url = url.Substring(0, url.IndexOf("&zuhe"));
        }
        if (url.IndexOf("?zuhe") >= 0)
        {
            url = url.Substring(0, url.IndexOf("?zuhe"));
        }

        StringBuilder sbr = new StringBuilder();
        StringBuilder sbr2 = new StringBuilder();
        string cityNum = string.Empty, sql = string.Empty;
        DataTable dt = new DataTable();
        if (Request["zuhe"] != null)
        {
            cityNum = Convert.ToString(Request["zuhe"]);
            url = url.Replace("&zuhe", "");

            //url += "&zuhe="+Request["zuhe"]+"";
            switch (Request["zuhe"]+"")
            {
                case "0":
                    sbr.Append(" <li><a href='" + url + "&zuhe=0' class='zaxz'>单项产品</a></li><li><a href='" + url + "&zuhe=1'>组合产品</a></li>");
                    break;
                case "1":
                    sbr.Append(" <li><a href='" + url + "&zuhe=0' >单项产品</a></li><li><a href='" + url + "&zuhe=1' class='zaxz'>组合产品</a></li>");
                    break;
                default:
                    break;
            }

        }
        else
        {
            sbr.Append(" <li><a href='" + url + "&zuhe=0' class='zaxz'>单项产品</a></li><li><a href='" + url + "&zuhe=1'>组合产品</a></li>");

        }
        return sbr.ToString();
    }

    /// <summary>
    /// 目的城市
    /// </summary>
    public string SearchCityMenu()
    {
        string className=string.Empty;
        string url = Request.Url.Query;
        if (url.IndexOf("&city") > 0)
        {
            url = url.Substring(0, url.IndexOf("&city"));
        }
        if (url.IndexOf("?city") >= 0)
        {
            url = url.Substring(0, url.IndexOf("?city"));
        }

   
   
        StringBuilder sbr = new StringBuilder();
        StringBuilder sbr2 = new StringBuilder();
        string cityNum = string.Empty,sql=string.Empty;
        DataTable dt = new DataTable();
        if (Request["city"] != null)
        {
            cityNum = Convert.ToString(Request["city"]);
            url = url.Replace("&city", "");
            if (url.IndexOf("?") >= 0)
            {
                //url += "&city=";
            }
            else
            {
                //url = "?city=";
            }


            sbr.Append("<span><a href='aozhou.aspx?gj=" + Request["gj"] + "' >全部</a></span>");
        }
        else
        {
            sbr.Append("<span><a href='" + url + "' class='selected' >全部</a></span>");
            //sql = "select id,clsname1 from jingdian where clsname2='" + Request["gj"] + "' ";
            //dt.Clear();
            //dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
            ////foreach (DataRow dr in dt.Rows)
            ////{
            ////    sbr2.Append();
            ////}
        }

        sql = "select id,ClsName1 from citytype where  (sortid is null) and  clsname2='" + Request["gj"] + "' and id in (select distinct val(iif(isnull(city),0,city)) as city from product  where languageId=1 and sfzyx=0 and yw_country='" + Request["gj"] + "' );";
        dt.Clear();
        dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
        foreach (DataRow dr in dt.Rows)
        {
            if (cityNum == Convert.ToString(dr["id"]))
                className = " class='selected' ";
            else
                className = string.Empty;

            sbr.Append("<span><a href='" + url + "&city=" + dr["id"] + "' " + className + ">" + dr["clsname1"] + "</a></span>");
        }

       

        return sbr.ToString();

    
    }

    /// <summary>
    /// 必玩景点
    /// </summary>
    public string SearchTicketMenu()
    {
        string className = string.Empty;
        string url = Request.Url.Query;
        if (url.IndexOf("&spot") > 0)
        {
            url = url.Substring(0, url.IndexOf("&spot"));
        }
        if (url.IndexOf("?spot") >= 0)
        {
            url = url.Substring(0, url.IndexOf("?spot"));
        }

        StringBuilder sbr = new StringBuilder();
        string cityNum = string.Empty;
        if (Request["spot"] != null)
        {
            cityNum = Convert.ToString(Request["spot"]);
            url = url.Replace("&spot", "");
            if (url.IndexOf("?") >= 0)
            {
                //url += "&city=";
            }
            else
            {
                //url = "?city=";
            }

            sbr.Append("<span><a href='aozhou.aspx?gj=" + Request["gj"] + "' >全部</a></span>");
        }
        else
            sbr.Append("<span><a href='" + url + "' class='selected' >全部</a></span>");

        string sql = "select id,ClsName1 from jingdian where  (sortid is null) and  clsname2='" + Request["gj"] + " ' ";
       
        if (Request["city"] != null )
        {
            sql = "select id,ClsName1 from jingdian where  (sortid is null) and  clsname2='" + Request["gj"] + "' and clsname3='"+Request["city"]+"' ";
        }
        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
        foreach (DataRow dr in dt.Rows)
        {
            if (cityNum == Convert.ToString(dr["id"]))
                className = " class='selected' ";
            else
                className = string.Empty;
            sbr.Append("<span><a href='" + url + "&spot=" + dr["id"] + "' " + className + ">" + dr["clsname1"] + "</a></span>");
        }

        return sbr.ToString();
    }

    /// <summary>
    /// 必玩景点
    /// </summary>
    public string SearchProTypeMenu()
    {
        string className = string.Empty;
        string url = Request.Url.Query;
        if (url.IndexOf("&pid") > 0)
        {
            url = url.Substring(0, url.IndexOf("&pid"));
        }
        if (url.IndexOf("?pid") >= 0)
        {
            url = url.Substring(0, url.IndexOf("?pid"));
        }

        StringBuilder sbr = new StringBuilder();
        string cityNum = string.Empty;
        if (Request["pid"] != null)
        {
            cityNum = Convert.ToString(Request["pid"]);
            url = url.Replace("&pid", "");
            if (url.IndexOf("?") >= 0)
            {
                //url += "&city=";
            }
            else
            {
                //url = "?city=";
            }

            sbr.Append("<span><a href='aozhou.aspx?gj=" + Request["gj"] + "' >全部</a></span>");
        }
        else
            sbr.Append("<span><a href='" + url + "' class='selected' >全部</a></span>");

        string sql = "select id,ClsName from productType where  parid<>0 order by id desc ";
       
        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
        foreach (DataRow dr in dt.Rows)
        {
            if (cityNum == Convert.ToString(dr["id"]))
                className = " class='selected' ";
            else
                className = string.Empty;
            sbr.Append("<span><a href='" + url + "&pid=" + dr["id"] + "' " + className + ">" + dr["clsname"] + "</a></span>");
        }

        return sbr.ToString();
    }

    public string sintro()
    {
        return OleDbHelper.ExecuteScalar(OleDbHelper.Conn, "select content1 from article where id=27", null) + "";
    }

    public string titleintro()
    {
        StringBuilder sbr = new StringBuilder();
        if (Request["id"] != null)
        {
            DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, "select id,clsname,parid from producttype where id=" + Request["id"] + "", null).Tables[0];
            foreach (DataRow dr in dt.Select())
            {
                sbr.Append(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, "select clsname from producttype where id=" + dr["parid"] + "", null) + "> " + Convert.ToString(dr["clsname"]));
            }
        }
        return sbr.ToString();
    }


    public void returnStitle()
    {

    }


    public string stype2()
    {

        string sql = "";
        int i = 0;
        StringBuilder sbr = new StringBuilder();
        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, "select id,ClsName,SortId from productType where parid=333 order by sortid desc", null).Tables[0];

        foreach (DataRow dr2 in dt.Select())
        {
            sbr.Append("<li ><a href='caselist.aspx?id=" + dr2["id"] + "'>" + dr2["clsname"] + "</a></li>");

        }
        return sbr.ToString();

    }
    public string Content
    {
        get
        {
            return content();
        }
    }


    private string content()
    {
        return products();
    }


    #region 所有产品
    public string products()
    {
        string where = " where languageId=1 and sfzyx=0 ";
        StringBuilder Html = new StringBuilder();
        StringBuilder order_by = new StringBuilder();

        order_by.Append("  order by aa.id desc ");
        if (!string.IsNullOrWhiteSpace(Convert.ToString(Request["sell"])))
        {
            order_by.Clear();
            order_by.Append(" order by aa.id desc ");
        }
        else if (!string.IsNullOrWhiteSpace(Convert.ToString(Request["o_price"])))
        {
            order_by.Clear();
            order_by.Append("  order by aa.jiage asc,aa.id desc ");

        }

        
        
            


        cp = Request["cp"] + "";
        int pagenum = 1;
        if (cp.Length < 1)
        {
            cp = "1";
        }

        if (ViewState["CurrentPg"] + "" == "")
        {
            ViewState["CurrentPg"] = 1;
        }
        if (Request["pid"] != null)
        {
            where += "and parid=" + Request["pid"];
        }

        if (Request["gj"] != null)
        {
            where += "and yw_country='" + Request["gj"]+"'";
        }

        if (Request["city"] != null)
            where += " and city='" + Request["city"] + "'";

        if (Request["spot"] != null)
            where += " and jingdian='" + Request["spot"] + "'";

        if (Request["xj"] != null)
            where += " and xingji='" + Request["xj"] + "'";

        if (Request["jiage1"] != null)
            where += " and jiage>=" + Request["jiage1"] + "";

        if (Request["jiage2"] != null)
            where += " and jiage<=" + Request["jiage2"] + "";

        if (Request["proname"] != null)
            where += " and proname like '%" + Server.UrlDecode(Request["proname"]) + "%'";
        

        if (Request["btype"] != null)
        {
            where += "and parid in(select id from producttype where parid=" + Request["btype"] + ")";
        }
        else if (Request["bid"] != null)
        {
            where += " and parid in(select id from productType where parid=" + Request["bid"] + ")";
        }
        else if (Request["keyw"] != null)
        {
            where += " and proname like '%" + Server.UrlDecode(Request["keyw"]) + "%'";
        }

        //StringBuilder html = new StringBuilder();
        //ViewState["max_c"] = osdData.Executescalar("select count(Id) from Product " + where);
        //ViewState["MaxPg"] = Convert.ToString(System.Math.Ceiling(Convert.ToDouble(Convert.ToInt32(Convert.ToString(ViewState["max_c"])) / Convert.ToDouble(this.RecordPerPage))));



        //if (Request["pg"] != null)
        //{
        //    ViewState["CurrentPg"] = Request["pg"] + "";
        //}
        //else
        //{
        //    ViewState["CurrentPg"] = 1;
        //}
        //tpate();

        //int StartNum = Convert.ToInt32(ViewState["CurrentPg"]) * RecordPerPage;
        //int intTemNum = StartNum - RecordPerPage;
        //string sql = "select * from (select top " + StartNum.ToString() + " id,ProName,PictureS,PictureB,ParId,canshu, content,txtsortid from Product " + where + " order by  txtsortid desc) a where a.id not in (Select top " + intTemNum.ToString() + " id from Product " + where + " order by txtsortid desc)";
        //if (intTemNum == 0)
        //{
        //    sql = "select top " + RecordPerPage + " id,ProName,PictureS,PictureB,ParId,canshu,content,txtsortid from Product " + where + " order by  txtsortid desc";

        //}
        //DataTable dt = osdData.DataSet(sql).Tables[0];
        //if (dt.Rows.Count == 0)
        //{
        //    html.Append("暂没这类型产品！");
        //    return html.ToString();
        //}
        //int i =1;
        //string dti = "";
        //if (Request["dti"] != null)
        //{
        //    dti = "&dti=" + Request["dti"];
        //}
        //string title;
        //html.Append("<div class='product_content'>");
        //foreach (DataRow dr in dt.Select())
        //{
        //    title = Convert.ToString(dr["proname"]);
        //    if (title.Length > 8)
        //    {
        //        title = title.Substring(0, 8) + "..";
        //    }

        //    html.Append("<ul><li><a href='productlist.aspx?pid=" + dr["id"] + "' class='jiage'><img src='pic/" + dr["pictures"] + "'alt='" + dr["proname"] + "' /></a></li><li><a href='productlist.aspx?pid=" + dr["id"] + "' class='tit'>" + dr["proname"] + "</a></li></ul>");

        //    if (i % 3 == 0)
        //    {
        //        html.Append("</div><div class='product_content'>");
        //    }
        //    i++;

        //}
        //html.Append("</div>");

        

        int StartNum = Convert.ToInt32(cp) * pagemax;
        int intTemNum = StartNum - pagemax;
       // string sql = "select aa.id,aa.canshu,aa.xingji,aa.pictureb,aa.proname,aa.proname2,aa.city,aa.peoplesNums,aa.jiage,aa.jiage2,aa.address,aa.gj_lan_text,(select sum(Cnum) from CarChild) as cnum from (select top " + StartNum + " * from product " + where + "  order by txtsortid desc,id desc) a where a.id not in (Select top " + intTemNum + "  id from product " + where + "  order by txtsortid desc,id desc)) aa group by aa.id,aa.canshu,aa.xingji,aa.pictureb,aa.proname,aa.proname2,aa.city,aa.peoplesNums,aa.jiage,aa.jiage2,aa.address,aa.gj_lan_text  ";

        string sql = "select aa.id,aa.canshu,aa.xingji,aa.pictureb,aa.proname,aa.proname2,aa.city,aa.peoplesNums,aa.jiage,aa.jiage2,aa.address,aa.gj_lan_text,(select sum(Cnum)  as num from CarChild) as cnum from  (select * from (select top " + StartNum + " * from product " + where + "  order by txtsortid desc,id desc) a where a.id not in (Select top " + intTemNum + "  id from product " + where + "  order by txtsortid desc,id desc)) aa  group by aa.id,aa.canshu,aa.xingji,aa.pictureb,aa.proname,aa.proname2,aa.city,aa.peoplesNums,aa.jiage,aa.jiage2,aa.address,aa.gj_lan_text  " + order_by.ToString() + " ";
        if (intTemNum <= 0)
        {
            sql = "select top " + pagemax + "  aa.id,aa.canshu,aa.xingji,aa.pictureb,aa.proname,aa.proname2,aa.city,aa.peoplesNums,aa.jiage,aa.jiage2,aa.address,aa.gj_lan_text,(select sum(Cnum) as num from CarChild) as cnum from product aa " + where + " group by aa.id,aa.canshu,aa.xingji,aa.pictureb,aa.proname,aa.proname2,aa.city,aa.peoplesNums,aa.jiage,aa.jiage2,aa.address,aa.gj_lan_text " + order_by.ToString() + " ";
        }
        pagenum = Convert.ToInt32(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, "select count(Id) from product " + where, null));
        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];

        string title; 
        if (Convert.ToString(Request["list"]) == "true")
        {

            Html.Append("<ul class='henglist'>");
        }
        else
            Html.Append(@"<div class='section'>
                    <ul class='clearfix'>");
        //Html.Append("<div class='product_content'>");
        //if (dt.Rows.Count > 0)
        //{
        //    int i = 1;
        //    foreach (DataRow dr in dt.Select())
        //    {
        //        title = Convert.ToString(dr["proname"]);
        //        if (title.Length > 8)
        //        {
        //            title = title.Substring(0, 8) + "..";
        //        }

        //        Html.Append("<ul><li><a href='productlist.aspx?pid=" + dr["id"] + "' class='jiage'><img src='pic/" + dr["pictures"] + "'alt='" + dr["proname"] + "' /></a></li><li><a href='productlist.aspx?pid=" + dr["id"] + "' class='tit'>" + dr["proname"] + "</a></li></ul>");

        //        if (i % 4 == 0)
        //        {
        //            Html.Append("</div><div class='product_content'>");
        //        }
        //        i++;
        //    }
        //    Html.Append("</div>");
        //    dt.Dispose();
        //    page(pagenum, i + pagemax * (Convert.ToInt32(cp) - 1));

        //}
        int i = 0, rightindex = 0;
        string str_right = string.Empty,canshu=string.Empty;
        if (dt.Rows.Count > 0)
        {
            string xingji = "";
            foreach (DataRow dr in dt.Rows)
            {

                canshu = Convert.ToString(dr["canshu"]);
                if (canshu.Length > 120)
                    canshu = canshu.Substring(0, 250)+"...";
                xingji = "";
                if (!string.IsNullOrEmpty(Convert.ToString(dr["xingji"])))
                {
                    for (int i_xj = 0; i_xj < Convert.ToInt32(dr["xingji"]); i_xj++)
                    {
                        xingji += "<img src='images/xxdd.png' width='14' height='14'>";
                    }
                }
                else
                    xingji = "暂无级别";
                if ((i + 1) % 4 == 0)
                    str_right = "style='padding-right: 0px;'";
                else
                    str_right = string.Empty;


                if (Convert.ToString(Request["list"]) == "true")
                {
                    Html.Append(@"<li>
                	<div class='henglistbox'>
                    	<div class='henglistbox_left'> <a href='aozhou_show.aspx?pro_id=" + dr["id"] + @"' target='_blank' >
                                        <img src='pic/" + dr["pictureb"] + @"' width='227' height='168' /></a>
                        </div>
                        <div class='henglistbox_cent'>
                        	<div class='henglistbox_cent_1'><a href='aozhou_show.aspx?pro_id=" + dr["id"] + @"' target='_blank'>" + dr["proname"] + "(" + dr["proname2"] + @")" + @"</a></div>
                        	<div class='henglistbox_cent_2'>" + canshu + @"<a href='aozhou_show.aspx?pro_id=" + dr["id"] + @"' target='_blank' >查看更多</a></div>
                        	<div class='henglistbox_cent_3'>
                            已有" + pclass.GetTotalBuyRecord(Convert.ToString(dr["id"])) + @" 人购买 |      城市：" + getCity(dr["city"] + "") + @"      游玩时长：" + dr["peoplesNums"] + @"
                            </div>
                        </div>
                        <div class='henglistbox_righ'>
                        	<div class='headlistbox_righ_1'>
                            	 ￥ " + dr["jiage2"] + @"
                            </div>
                        	<div class='headlistbox_righ_2'> ￥ " + dr["jiage"] + @"&nbsp;</div>
                        	<div class='headlistbox_righ_3'><a href='aozhou_show.aspx?pro_id=" + dr["id"] + @"'>立即购买</a></div>
                        </div>
                    </div>
                </li>");
                }
                else
                {
                    Html.Append(@"   <li " + str_right + @">
                            <div class='clebox'>
                                <div class='photo'>
                                    <a href='aozhou_show.aspx?pro_id=" + dr["id"] + @"' target='_blank' >
                                        <img src='pic/" + dr["pictureb"] + @"' width='272' height='200' /></a></div>
                                <div class='rsp'>
                                </div>
                                <div class='text'>
                                    <div class='text_1'>
                                        <a href='aozhou_show.aspx?pro_id=" + dr["id"] + @"' target='_blank'>" + dr["proname"] + @"</a></div>
                                    <div class='text_2'>
                                        <a href='aozhou_show.aspx?pro_id=" + dr["id"] + @"' target='_blank'>" + dr["proname2"] + @"</a></div>
                                    <div class='text_3'>
                                        <span class='t3span1'>￥ " + dr["jiage"] + @"&nbsp;</span> <span class='t3span2'>￥ " + dr["jiage2"] + @"</span>
                                        <span class='t3span3'></span> <span class='t3span4'></span>
                                    </div>
                                    <div class='text_4'>
                                        <div class='t4span1'>
                                            出发城市：" + getCity(dr["city"] + "") + @"</div>
                                        <div class='t4span2'>
                                            出发时长：" + dr["peoplesNums"] + @"</div>
                                        <div class='t4span3'>
                                            出发时间：" + dr["address"] + @"</div>
                                        <div class='t4span4'>
                                            语 言：" + dr["gj_lan_text"] + @"</div>
                                        <div class='t4span5'>
                                            推荐指数：" + xingji + @"</div>
                                    </div>
                                </div>
                            </div>
                        </li>");
                }
                i++;
               
            }
            if (Convert.ToString(Request["list"]) == "true")
            {

                Html.Append("</ul>");
            }
            else
            {
                Html.Append("<div class='clear'></div></ul></div>");
            }
            dt.Dispose();
            page(pagenum, i + pagemax * (Convert.ToInt32(cp) - 1));

        }

        else
        {
            Html.Append("None！");
        }
        return Html.ToString();
    }
    #endregion

    ////分页显示
    //private void page(int max, int num)
    //{
    //    int maxtitle = 13;//显示多少页;
    //    int maxindex = Convert.ToInt32(System.Math.Ceiling((max * 1.0) / pagemax));//最大页数;
    //    int title_index = Convert.ToInt32(System.Math.Ceiling((maxindex * 1.0) / maxtitle));//显示多少个页数;
    //    int[,] arry = new int[title_index + 1, maxtitle];
    //    string url = this.Request.Url.Query;
    //    if (url.IndexOf("&cp") > 0)
    //    {
    //        url = url.Substring(0, url.IndexOf("&cp"));
    //    }
    //    if (url.IndexOf("?cp") >= 0)
    //    {
    //        url = url.Substring(0, url.IndexOf("?cp"));
    //    }
    //    if (url.IndexOf("?") >= 0)
    //    {
    //        url += "&cp=";
    //    }
    //    else
    //    {
    //        url = "?cp=";
    //    }
    //    for (int i = 1; i <= title_index; i++)
    //    {
    //        for (int t = 0; t < maxtitle; t++)
    //        {
    //            arry[i, t] = t + 1 + (maxtitle * (i - 1));
    //        }
    //    }
    //    ////<div class='fenyebox'>
    //    //        <span class='num'><span>1</span><span>/1</span></span><a href='javascript:;' class='btn enable'><i
    //    //            class='sprint_img triangle_left'></i>上一页</a> <a href='javascript:;' class='btn active'>
    //    //                1</a> <a href='javascript:;' class='btn enable'>2</a> <a href='javascript:;' class='btn enable'>
    //    //                    3</a> ... <a href='javascript:;' class='btn enable'>7</a> <a href='javascript:;'
    //    //                        class='btn enable'>下一页<i class='sprint_img triangle_right'></i></a>
    //    pagelist += " <div class='fenyebox'><span class='num'><span>" + cp + "</span><span>/" + max + "</span></span><a href='" + url + "1' class='btn enable'><i class='sprint_img triangle_left'></i>首页</a> </div><a href='" + url + "1' class='firstBtn'>|<<</a>";
    //    if (Convert.ToInt32(cp) == 1)
    //    { pagelist += " <a href='" + url + "1' class='firstBtn'><<</a>"; }
    //    else { pagelist += " <a href='" + url + "" + (Convert.ToInt32(cp) - 1) + "' class='firstBtn'><<</a>"; }

    //    int arry_index = Convert.ToInt32(System.Math.Ceiling(Convert.ToInt32(cp) / ((maxtitle) * 1.0)));

    //    string className = "pageBtn";
    //    for (int i = 0; i < maxtitle; i++)
    //    {
    //        if (arry[arry_index, i] > maxindex) continue;
    //        className = (arry[arry_index, i] == Convert.ToInt32(cp)) ? "currBtn" : "pageBtn";
    //        pagelist += " <a href='" + url + "" + arry[arry_index, i] + "' class='" + className + "'>" + arry[arry_index, i] + "</a>";
    //    }
    //    if (Convert.ToInt32(cp) == maxindex)
    //    {
    //        pagelist += " <a href='" + url + "" + maxindex + "' class='lastBtn' >>></a>";
    //    }
    //    else { pagelist += " <a href='" + url + "" + (Convert.ToInt32(cp) + 1) + "' class='lastBtn' >>></a>"; }
    //    pagelist += " <a href='" + url + "" + maxindex + "' class='firstBtn'>>>|</a>";
    //    pagelist += "<SPAN  style='color:black;'>&nbsp;&nbsp;&nbsp;当前<SPAN style='color:black;'>" + cp + "</SPAN>/<SPAN style='color:black;'>" + maxindex + "</SPAN>页&nbsp;&nbsp;&nbsp; 总共<SPAN style='color:black;'>" + max + "</span>记录</span>";
    //}


    //分页显示
    private void page(int max, int num)
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


    public string getCity(string id)
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "select clsname1 from citytype where id="+id+" ";
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