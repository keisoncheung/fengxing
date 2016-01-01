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
using System.Text;
using DLL;

public partial class manager_xingchenganpshow : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["parid"] != null)
        {
            dele(Convert.ToInt32(Request["id"]), Convert.ToInt32(Request["parid"]));
        }
       

    }


    public void dele(int id, int parid)
    {
        string sql = "";
        DataTable dt = new DataTable();
        if (parid == 0)
        {
            sql = "select id,clsname,languageId,Parid from pro_xingcheng where parid=" + id;
        }
        else
        {
            sql = "select id,clsname,languageId,Parid from pro_xingcheng where id=" + id;

        }

        dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
        foreach (DataRow dr in dt.Select())
        {
            OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, "delete from product where parid=" + dr["id"], null);
            OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, "delete from pro_xingcheng where id=" + dr["id"], null);
        }
        if (parid == 0)
        {
            OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, "delete from pro_xingcheng where id=" + id, null);
        }
        Messages.Message("删除成功！");
    }

    public string intro()
    {
        StringBuilder sbr = new StringBuilder();
        string where=" where  1=1   and (sfzyx=2 or sfzyx=3) ";
        if(!string.IsNullOrEmpty(Convert.ToString(Request["proid"])))
            where =where + " and id="+Convert.ToString(Request["proid"])+" ";
        string sql = "select id,proname from product  " + where + " ";
        DataTable dt = new DataTable();
        dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
        int i = 0;
        foreach (DataRow dr in dt.Select())
        {
            sbr.Append("<fieldset  style='width:660px; font-size:12px;'>");
            sbr.Append("<legend><font style='font-weight:bold;'><a href='xingchengriqi.aspx?proid=" + dr["id"] + "'><img style='margin-left:5px; border:0px;' src='bgpic/open.gif' alt='添加行程日期'></a></font></legend>");
            sbr.Append("<legend><font style='font-weight:bold;'>"+dr["proname"]+"</legend>");
            //sbr.Append("<legend><font style='font-weight:bold;'></font></legend>");
            sbr.Append("<legend><font style='font-weight:bold;'></font></legend>");
            sbr.Append("<div style=' margin:10px 0px 10px 20px;'>");
            dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, "select id,clsname,languageId,Parid,sortid,proid from pro_xingcheng where parid=0 and proid=" + dr["id"] + "  order by sortid desc", null).Tables[0];
            foreach (DataRow dr2 in dt.Select())
            {

                sbr.Append("<ul style='width:660px; font-size:14px; margin:0 auto;list-style-type:none; '>");
                // sbr.Append("<li style='margin:0px;'><img src='bgpic/leftpic01.gif' style='margin-right:10px;'>" + dr2["clsname"] + "<a href='ptype.aspx?id=" + dr2["id"] + "'><img src='bgpic/yes.gif' alt='编辑该类' style='margin:0px 5px 0px 40px; border:0px;' ></a><a href='ptype.aspx?lan=" + dr["id"] + "&id=" + dr2["id"] + "' ><img src='bgpic/open.gif' alt='添加小类' style='margin-left:5px; border:0px;' ></a><a href='protype.aspx?parid=" + dr2["parid"] + "&id=" + dr2["id"] + "' onclick='return(confirm(\"删除此类将导致与其相关联的类别与数据一并删除，并无法恢复，确定要删除吗？\"));'><img src='bgpic/no.gif' alt='删除此类'  style='margin-left:5px; border:0px;' ></a></li>");

                sbr.Append("<li style='margin:0px;'><img src='bgpic/leftpic01.gif' style='margin-right:10px;'>" + dr2["clsname"] + "<a href='xingchengriqi.aspx?id=" + dr2["id"] + "'><img src='bgpic/yes.gif' alt='编辑该日期' style='margin:0px 5px 0px 40px; border:0px;' ></a><a href='xingchenganpadd.aspx?proid=" + dr2["proid"] + "&id=" + dr2["id"] + "' ><img src='bgpic/open.gif' alt='添加行程地点' style='margin-left:5px; border:0px;' ></a></li>");

                //sbr.Append("<ul style='width:660px; font-size:14px; margin:0 auto;list-style-type:none; ' ><li id='bigli" + i + "' style='margin:0px;'><img src='bgpic/leftpic01.gif' style='margin-right:10px;'><a href='javascript:displayli(\"" + i + "\")'>" + dr2["clsname"] + "</a><a href='ptype.aspx?id=" + dr2["id"] + "'><img src='bgpic/yes.gif' alt='编辑该类' style='margin:0px 5px 0px 40px; border:0px;' ></a><a href='ptype.aspx?lan=" + dr["id"] + "&id=" + dr2["id"] + "' ><img src='bgpic/open.gif' alt='添加小类' style='margin-left:5px; border:0px;' ></a><a href='protype.aspx?parid=" + dr2["parid"] + "&id=" + dr2["id"] + "' onclick='return(confirm(\"删除此类将导致与其相关联的类别与数据一并删除，并无法恢复，确定要删除吗？\"));'><img src='bgpic/no.gif' alt='删除此类'  style='margin-left:5px; border:0px;' ></a> &nbsp;&nbsp;序列：" + dr2["sortid"] + " </li></ul> ");

                //sbr.Append("<ul style='width:660px; font-size:14px; margin:0 auto;list-style-type:none; ' ><li id='bigli" + i + "' style='margin:0px;'><img src='bgpic/leftpic01.gif' style='margin-right:10px;'><a href='javascript:displayli(\"" + i + "\")'>" + dr2["clsname"] + "</a><a href='ptype.aspx?id=" + dr2["id"] + "'><img src='bgpic/yes.gif' alt='编辑该类' style='margin:0px 5px 0px 40px; border:0px;' ></a><a href='ptype.aspx?lan=" + dr["id"] + "&id=" + dr2["id"] + "' ><img src='bgpic/open.gif' alt='添加小类' style='margin-left:5px; border:0px;' ></a>&nbsp;&nbsp;序列：" + dr2["sortid"] + " </li></ul> ");

                dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, "select id,clsname,languageId,Parid,sortid from pro_xingcheng where parid=" + dr2["id"] + " and languageId=" + dr2["languageId"] + "  order by sortid desc", null).Tables[0];
                sbr.Append("<div  id='div" + i + "'>");

                foreach (DataRow dr3 in dt.Select())
                {
                    sbr.Append("<ul style='width:660px; font-size:14px; margin:0 auto;list-style-type:none; ' ><li style='margin:0px;'><img src='bgpic/open2.gif' style='margin-right:10px;'>" + dr3["clsname"] + "<a href='xingchenganpadd.aspx?id=" + dr3["id"] + "'><img src='bgpic/yes.gif' alt='编辑行程地点' style='margin:0px 5px 0px 40px; border:0px;' ></a><a href='xingchenganpshow.aspx?parid=" + dr3["parid"] + "&id=" + dr3["id"] + "' onclick='return(confirm(\"删除行程地点将导致与其相关联数据一并删除，并无法恢复，确定要删除吗？\"));'><img src='bgpic/no.gif' alt='删除行程地点' style='margin-left:5px; border:0px;' ></a> &nbsp;&nbsp;序列：" + dr3["sortid"] + " </li></ul>");
                }
                sbr.Append("</div>");
                i++;
                sbr.Append("</ul>");
            }
            sbr.Append("</div></fieldset>");
        }
        return sbr.ToString();
    }
}
