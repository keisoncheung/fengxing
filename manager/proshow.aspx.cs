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
using System.Text;
using DLL;

public partial class manager_proshow : System.Web.UI.Page
{
    private int readp = 10;
    public string totel = null;
    public string language = null;
    public string s_type="";
    public string str_addbt = "";
    protected void Page_Load(object sender, EventArgs e)
    {
 s_type = Convert.ToString(Request["type"]);
        if (!IsPostBack)
        {
            this.ViewState["currentp"] = 1;
           
            str_addbt = "<a href='product.aspx?type="+s_type+"' style='display:block; float:left; margin-right:20px; color:Red;'>添加资料</a>";
            showsj();
            //cstype();
            intro();
        }
    }


    public string intro()
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "select id,clsname from languageId";
        DataTable dt = new DataTable();
        dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn,sql,null).Tables[0];
        sql = "select id,clsname,languageId,Parid,sortid from productType where parid=0 and languageId=1  order by sortid desc";
        if (!string.IsNullOrEmpty(s_type))
            sql = "select id,clsname,languageId,Parid,sortid from productType where parid=0 and languageId=1 and id="+s_type+"  order by sortid desc";
        dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
        foreach (DataRow dr2 in dt.Select())
        {
            ddprotypelist.Items.Add(new ListItem(dr2["clsname"].ToString(),dr2["id"].ToString()));
            dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, "select id,clsname,languageId,Parid,sortid from productType where parid=" + dr2["id"] + " and languageId=" + dr2["languageId"] + "  order by sortid desc",null).Tables[0];
            foreach (DataRow dr3 in dt.Select())
            {
                ddprotypelist.Items.Add(new ListItem("---"+dr3["clsname"].ToString(), dr3["id"].ToString()));
            }

        }
        return sbr.ToString();
    }



    public string stypename()
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "";
        DataTable dt = new DataTable();

        //if (Request["id"] != null)
        //{
        //    sql = "select id,clsname,languageId,parid from productType where id=" + Request["id"];
        //    dt = osdData.DataSet(sql).Tables[0];
        //    foreach (DataRow dr in dt.Select())
        //    {

        //        sbr.Append("<font style='font-weight:bold;'>" + dr["clsname"] + ":</font>");
        //        sql = "select id,clsname,languageId,parid from productType where languageId=" + dr["id"];
        //        dt = osdData.DataSet(sql).Tables[0];
        //        foreach (DataRow dr2 in dt.Select())
        //        {

        //        }


        //        sbr.Append(" <a href='proshow.aspx?id=" + dr["id"] + "' style='display:block; float:left; margin:0px 20px 10px 0px;'>" + dr["clsname"] + "</a>");
        //    }

        //    tabcont.Visible = true;
        //    ret.Visible = true;

        //}

        if (Request["lan"] != null || Request["id"] != null)
        {
            if (Request["lan"] != null)
            {
                sql = "select id,clsname,languageId,parid from productType where parid<>0 and languageId=" + Request["lan"];

            }
            else
            {
                sql = "select id,clsname,languageId,parid from productType where parid<>0 and languageId in(select languageId from productType where id=" + Request["id"] + ")";
            }
            dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn,sql,null).Tables[0];
            foreach (DataRow dr in dt.Select())
            {
                sbr.Append(" <a href='proshow.aspx?type=" + dr["id"] + "' style='display:block; float:left; margin:0px 20px 10px 0px;'>" + dr["clsname"] + "</a>");

            }
            tabcont.Visible = true;
        }
        else
        {
            sql = "select id,ClsName from languageId";
            dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn,sql,null).Tables[0];
            foreach (DataRow dr in dt.Select())
            {
                sbr.Append(" <a href='proshow.aspx?lan=" + dr["id"] + "' style='display:block; float:left; margin:0px 20px 10px 0px;'>" + dr["ClsName"] + "</a>");
            }
            tabcont.Visible = false;
        }
        return sbr.ToString();
    }


    //绑定数据
    public void showsj()
    {
        string where = "where sortid=0";

        if (Request["lan"] != null)
        {
            where += " and languageId=" + Request["lan"];
        }
        
        if (Request["id"] != null)
        {

            where += " and  parid=" + Request["id"] + " ";
        }
        else if (!string.IsNullOrEmpty(s_type))
        {
            where += "  and parid in(select id  from productType where parid=" + s_type + ")";
        }
        

        string sql = "select * from product " + where + " order by id desc";
        string sql1 = "select count([id]) from product " + where;
        totel = OleDbHelper.ExecuteScalar(OleDbHelper.Conn,sql1,null).ToString();

        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn,sql,null).Tables[0];
        dt.Columns.Add(new DataColumn("spic1", typeof(string)));
        dt.Columns.Add(new DataColumn("sprotype", typeof(string)));
        //dt.Columns.Add(new DataColumn("xs", typeof(string)));
        foreach (DataRowView ott in dt.DefaultView)
        {
            string lb1 = null;
            string lb2 = null;
            string sfshow = "";
            if (Convert.ToString(ott["grade"]) == "1")
            {
                sfshow = "【首页推荐】";
            }
            sql = "select ClsName from productType where id=" + ott["ParId"] + "";
            lb1 = Convert.ToString(OleDbHelper.ExecuteScalar(OleDbHelper.Conn,sql,null)+"");
            ott["sprotype"] = "【" + lb1 + "】<br>" + sfshow;
            ott["spic1"] = "<img src='../pic/" + ott["PictureS"] + "' width=80px;height=70px;>";
        }
        this.grv1.DataSource = dt.DefaultView;
        this.grv1.DataBind();
    }

    //页面跳转
    public void PageDropDownList_SelectedIndexChanged(Object sender, EventArgs e)
    {
        GridViewRow pagerRow = grv1.BottomPagerRow;
        DropDownList pageList = (DropDownList)pagerRow.Cells[0].FindControl("PageDropDownList");
        grv1.PageIndex = pageList.SelectedIndex;
        showsj();
    }

    //分页
    public void grv1_DataBound(Object sender, EventArgs e)
    {
        if (grv1.PageCount > 1)
        {
            GridViewRow pagerRow = grv1.BottomPagerRow;
            LinkButton linkBtnFirst = (LinkButton)pagerRow.Cells[0].FindControl("linkBtnFirst");
            LinkButton linkBtnPrev = (LinkButton)pagerRow.Cells[0].FindControl("linkBtnPrev");
            LinkButton linkBtnNext = (LinkButton)pagerRow.Cells[0].FindControl("linkBtnNext");
            LinkButton linkBtnLast = (LinkButton)pagerRow.Cells[0].FindControl("linkBtnLast");
            if (grv1.PageIndex == 0)
            {
                linkBtnFirst.Enabled = false;
                linkBtnPrev.Enabled = false;
            }
            else if (grv1.PageIndex == grv1.PageCount - 1)
            {
                linkBtnLast.Enabled = false;
                linkBtnNext.Enabled = false;
            }
            else if (grv1.PageCount <= 0)
            {
                linkBtnFirst.Enabled = false;
                linkBtnPrev.Enabled = false;
                linkBtnNext.Enabled = false;
                linkBtnLast.Enabled = false;
            }

            DropDownList pageList = (DropDownList)pagerRow.Cells[0].FindControl("PageDropDownList");

            Label pageLabel = (Label)pagerRow.Cells[0].FindControl("CurrentPageLabel");
            Label tot = (Label)pagerRow.Cells[0].FindControl("tt");

            if (pageList != null)
            {
                for (int i = 0; i < grv1.PageCount; i++)
                {
                    int pageNumber = i + 1;
                    ListItem item = new ListItem(pageNumber.ToString() + "/" + grv1.PageCount.ToString(), pageNumber.ToString());
                    if (i == grv1.PageIndex)
                    {
                        item.Selected = true;
                    }
                    pageList.Items.Add(item);
                }

            }
            if (pageLabel != null)
            {
                int currentPage = grv1.PageIndex + 1;
                pageLabel.Text = "当前页： " + currentPage.ToString() +
                  " / " + grv1.PageCount.ToString();
                tot.Text = "总共有" + totel.ToString() + "记录";
            }
        }

    }

    protected int getIndex(GridViewRow i)
    {
        GridView dg = i.Parent.Parent as GridView;
        return ((int)ViewState["CurrentP"] - 1) * grv1.PageSize + i.RowIndex + 1;
    }

    protected void grv1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grv1.PageIndex = e.NewPageIndex;
        showsj();
    }

    //删除
    protected void dele_Click(object sender, EventArgs e)
    {
        System.Web.UI.WebControls.CheckBox chkExport;
        string sID;
        foreach (GridViewRow oDataGridItem in grv1.Rows)
        {
            chkExport = (CheckBox)oDataGridItem.FindControl("CheckBox1");
            if (chkExport.Checked)
            {
                sID = ((Label)(oDataGridItem.FindControl("xzid"))).Text;
                int id = Convert.ToInt32(sID);
                string sql = "delete from product where id=" + id;
                OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn,sql,null);
            }

        }
        Response.Write("<script>alert('删除成功!')</script>");
        showsj();
    }
    //全选／全消
    protected void xuanz_Click(object sender, EventArgs e)
    {
        System.Web.UI.WebControls.CheckBox chkExport;
        if (xuanz.Text == "全选")
        {
            foreach (GridViewRow oDataGridItem in grv1.Rows)
            {
                chkExport = (CheckBox)oDataGridItem.FindControl("CheckBox1");
                chkExport.Checked = true;
            }
            xuanz.Text = "全消";
        }
        else
        {
            foreach (GridViewRow oDataGridItem in grv1.Rows)
            {
                chkExport = (CheckBox)oDataGridItem.FindControl("CheckBox1");
                chkExport.Checked = false;
            }
            xuanz.Text = "全选";
        }
    }
    //protected void drtype_SelectedIndexChanged(object sender, EventArgs e)
    //{

    //    Response.Redirect("proshow.aspx?type=" + drtype.SelectedValue);
    //}
    protected void ddprotypelist_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddprotypelist.SelectedItem.Text.Contains("---"))
            Response.Redirect("proshow.aspx?type=" + s_type+"&id=" + ddprotypelist.SelectedValue);
        else
            Response.Redirect("proshow.aspx?type=" + s_type);
    }
}
