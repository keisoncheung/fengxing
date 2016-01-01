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

public partial class manager_guessbookshow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.ViewState["currentp"] = 1;
            showsj();
        }
    }

    public string stypename()
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "";
        DataTable dt = new DataTable();

        sql = "select id,ClsName from languageId";
        dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn,sql,null).Tables[0];
        foreach (DataRow dr in dt.Select())
        {
            sbr.Append(" <a href='guessbookshow.aspx?lan=" + dr["id"] + "' style='display:block; float:left; margin-right:20px;'>" + dr["ClsName"] + "</a>");
        }
        return sbr.ToString();
    }



    //绑定数据
    public void showsj()
    {
        string where = "";
        if (Request["lan"] != null)
        {
            where = "where LanguageId=" + Request["lan"];
        }
        string sql = "select *from GuessBook "+where+" order by id desc";
        string sql1 = "select count(id) from GuessBook "+where;

        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn,sql,null).Tables[0];
        dt.Columns.Add(new DataColumn("stype", typeof(string)));
        dt.Columns.Add(new DataColumn("datetime", typeof(string)));
        foreach (DataRowView ott in dt.DefaultView)
        {
            ott["stype"] = "【" + OleDbHelper.ExecuteScalar(OleDbHelper.Conn,"select clsname from languageId where id=" + ott["languageId"],null) + "】";
            ott["datetime"]=DateTime.Parse(Convert.ToString(ott["createDate"])).ToString("yy-MM-dd");
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
                string sql = "delete from GuessBook  where id=" + id;
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
}
