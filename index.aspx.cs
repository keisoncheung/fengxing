using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DLL;
using System.Text;
using System.Data;


public partial class index : System.Web.UI.Page
{

    
    protected void Page_Load(object sender, EventArgs e)
    {

       

    }


    /// <summary>
    /// 返回推荐指数
    /// </summary>
    /// <param name="num"></param>
    /// <returns></returns>
    public string GetXingJi(int num)
    {
        StringBuilder sbr = new StringBuilder();
        for (int i = 0; i < num; i++)
        {
            sbr.Append("<img src='images/p.png'  width='15' height='14'>");
        }
        return sbr.ToString();
    }

    /// <summary>
    /// 
    /// </summary>
    /// <returns></returns>
    public string returnHot()
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "select top 4 * from product where grade=1  order by id desc";

        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
        foreach (DataRow dr in dt.Rows)
        {
            sbr.Append(@"<li>
            	<div class='mb1bbox'>
                	<div class='mb1bbox_left'><a href='aozhou_show.aspx?pro_id=" + dr["id"] + "'><img src='pic/" + dr["linkpic"] + @"' width='192' height='144' /></a>
                        <img src='images/cx.png' width='59' height='44' class='cx' />
                    </div>
                    <div class='mb1bbox_right'>
                    	<div class='mb1bbox_right_1'>" +dr["canshu"]+@"</div>
                    	<div class='mb1bbox_right_2'>
                        	<span>￥" + dr["jiage"] + @"&nbsp;</span>起&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>￥" + dr["jiage2"] + @"起</strong><a href='aozhou_show.aspx?pro_id=" + dr["id"] + @"'><img src='images/qg.png' width='102' height='24' /></a>
                        </div>
                    	<div class='mb1bbox_right_3'>" + dr["cuxiao"] + @"</div>
                    </div>
                </div>
            </li>");
        }

        return sbr.ToString();
    }


    /// <summary>
    /// 
    /// </summary>
    /// <returns></returns>
    public string returnArea(int parid)
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "select top 8 id,proname,canshu,pictureb,jiage from product where yw_country='" + parid + "'  and sfzyx not in (1,2,3,4)  order by id desc";

        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
        foreach (DataRow dr in dt.Rows)
        {
            sbr.Append(@"<li>
                	<div class='mb2brightbox'>
                    	<div class='mb2brightbox_1'><a href='aozhou_show.aspx?pro_id="+dr["id"]+"'><img src='pic/" + dr["pictureb"] + @"' width='206' height='151' /></a></div>
                    	<div class='mb2brightbox_2'><a href='aozhou_show.aspx?pro_id=" + dr["id"] + "'>" + dr["proname"] + @"</a></div>
                    	<div class='mb2brightbox_3'><span>￥" + dr["jiage"] + @"</span> 起</div>
                    </div>
                </li>");
        }

        return sbr.ToString();
    }


    public string getcity(string gj)
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "select top 8 id,clsname1 from citytype where clsname2='" + gj + "' and sortid  is null  order by id ";  

        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
        foreach (DataRow dr in dt.Rows)
        {
            sbr.Append(@"<a href='aozhou.aspx?gj=" + gj + "&city="+dr["id"]+"' class='mb2a' style=''>" + dr["clsname1"] + "</a> ");
        }
        return sbr.ToString();
    }

    public string returnTuan()
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "select top 8 id,proname,canshu,pictureb,jiage from product   where sfzyx=3  order by id desc";

        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
        foreach (DataRow dr in dt.Rows)
        {
            sbr.Append(@"<li>
                	<div class='mb2brightbox'>
                    	<div class='mb2brightbox_1'><a href='tuanduily_show.aspx?pro_id=" + dr["id"] + "'><img src='pic/" + dr["pictureb"] + @"' width='206' height='151' /></a></div>
                    	<div class='mb2brightbox_2'><a href='tuanduily_show.aspx?pro_id=" + dr["id"] + "'>" + dr["proname"] + @"</a></div>
                    	<div class='mb2brightbox_3'><span>￥" + dr["jiage"] + @"</span> 起</div>
                    </div>
                </li>");
        }

        return sbr.ToString();
    }
}