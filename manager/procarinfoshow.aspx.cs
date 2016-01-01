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
using DLL;
public partial class manager_procarinfoshow : System.Web.UI.Page
{
    System.Drawing.Image.GetThumbnailImageAbort callb = null;
    System.Drawing.Image image, newimage;
    public string imagename1, newName, newNamed, newName2, newName3, newName4;
    public string pic2;
    private string id;
    string str_pid = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        cstype();
        if (Request["id"] != null)
        {
            id = Request["id"].ToString();

        }
        else if (Request["pid"] != null)
        {
            str_pid = Request["pid"].ToString();

            getproname(str_pid);

        }
        else
        {
            pic2 = "<img src=../pic/nopic.jpg width='130px'>";
        }
        if (!IsPostBack)
        {
            if (Request["id"] != null)
            {
                id = Request["id"].ToString();

                csh();
            }

        }

    }

    public void getproname(string pid)
    {
        string sql = "select proname from product where id="+pid+"";
        txtproname.Text = Convert.ToString(OleDbHelper.ExecuteScalar(OleDbHelper.Conn,sql,null)+"");
    }

    //初始化类别
    private void cstype()
    {
        string artbtype = null;
        DataTable dt = new DataTable();
        dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, "select id, clsname from languageId", null).Tables[0];
        rbl.DataSource = dt;
        rbl.DataTextField = "clsname";
        rbl.DataValueField = "id";
        rbl.DataBind();
        rbl.Items[0].Selected = true;

    }


    //上传图片
    private int shang()
    {
        Random rn = new Random();
        int n = 0;
        n = rn.Next(1000, 9999);
        return n;
    }

    private string upfile(HtmlInputFile file)
    {
        string mPath;
        if ("" != file.PostedFile.FileName)
        {
            string imagePath = file.PostedFile.FileName;
            string imageType = imagePath.Substring(imagePath.LastIndexOf(".") + 1);
            string imageName = imagePath.Substring(imagePath.LastIndexOf("\\") + 1);
            imagename1 = DateTime.Now.ToString("yyyyMMddhhmmss") + shang() + "." + imageType;
            if ("jpg" != imageType && "gif" != imageType && "JPG" != imageType && "GIF" != imageType)
            {
                Response.Write("<script language='javascript'> alert('对不起！请您选择jpg或者gif格式的图片！');</script>");
                return "";
            }
            else
            {
                try
                {
                    mPath = Server.MapPath("~") + "\\pic\\";
                    file.PostedFile.SaveAs(mPath + "\\" + imagename1);
                    //image = System.Drawing.Image.FromFile(mPath + "\\" + imagename1);
                    //int width = image.Width;
                    //int swidth = 230;
                    //int height = image.Height;
                    //int sheight = 157;
                    //newimage = image.GetThumbnailImage(swidth, sheight, callb, new System.IntPtr());
                    //newimage.Save(mPath + "\\s" + imagename1, image.RawFormat);//图片名字－－s+name.jpg
                    //image.Dispose();
                    //newimage.Dispose();
                    //newNamed = imagename1;
                    return imagename1;
                }
                catch (Exception ee)
                {
                    ee.ToString();
                    return "";

                }
            }
        }
        else
        {
            return "";
        }
    }


    //private string simage2(string file)
    //{
    //    int x = 131;
    //    int y = 98;
    //    switch (ddl1.SelectedValue)
    //    {
    //        case "26":
    //            x = 180;
    //            y = 130;
    //            break;
    //        case "54":
    //        case "56":
    //        case "77":
    //            x = 200;
    //            y = 150;
    //            break;
    //        case "61":
    //            x = 218;
    //            y = 132;
    //            break;
    //        case "65":
    //            x = 210;
    //            y = 100;
    //            break;
    //        case "67":
    //            x = 218;
    //            y = 132;
    //            break;

    //        case "68":
    //        case "69":
    //            x = 237;
    //            y = 146;
    //            break;
    //        case "73":
    //            x = 224;
    //            y = 139;
    //            break;
    //        case "74":
    //            x = 324;
    //            y = 250;
    //            break;

    //    }



    //    try
    //    {
    //        string mPath = Server.MapPath("~") + "\\pic\\";

    //        System.Drawing.Image image = System.Drawing.Image.FromFile(mPath + "\\" + file);
    //        int width = image.Width;
    //        int height = image.Height;
    //        image.Dispose();

    //        double FrameworkProportion = x / y;
    //        double ImgeProportion = Convert.ToDouble(width) / Convert.ToDouble(height);
    //        if (FrameworkProportion >= ImgeProportion)
    //        {
    //            ImageThumbnail.MakeThumbnail(mPath + file, mPath + "ss" + file, Convert.ToInt32(x), Convert.ToInt32(y), "H", System.Drawing.Imaging.ImageFormat.Jpeg);
    //        }
    //        else
    //        {
    //            ImageThumbnail.MakeThumbnail(mPath + file, mPath + "ss" + file, Convert.ToInt32(x), Convert.ToInt32(y), "W", System.Drawing.Imaging.ImageFormat.Jpeg);
    //        }

    //        string newName = "ss" + file;
    //        return newName;
    //    }
    //    catch (Exception ee)
    //    {
    //        ee.ToString();
    //        return "";

    //    }
    //}


    //修改页面
    public void csh()
    {
        string str = null;
        string sql = "select Id,proid,stype,proprice,languageId,title from ProCarInfo where ID=" + id;
        try
        {
            DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
            foreach (DataRow or in dt.Select())
            {
                sql = "select proname from product where id=" + or["proid"] + "; ";
                DataTable dt2 = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
                foreach(DataRow dr in dt2.Rows)
                {
                    txtproname.Text = Convert.ToString(dr["proname"]);
                }
                rbl.SelectedValue = Convert.ToString(or["languageId"]);
                txttitle.Value = Convert.ToString(or["title"]);
                drtype.SelectedValue = Convert.ToString(or["stype"]);
                txtpro_price.Value = Convert.ToString(or["proprice"]);

            }
        }
        catch (Exception rr)
        {
            rr.ToString();
        }
    }

    //返回bool类型
    public bool Igs(string sql)
    {
        bool b = false;
        try
        {
            OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
            b = true;
        }
        catch (Exception ee)
        {
            ee.ToString();
            b = false;
        }
        return b;
    }


    protected void Submit1_ServerClick(object sender, EventArgs e)
    {
        string sql = null;
        string pid = string.Empty;
        if (drtype.SelectedValue == "-1")
        {
            Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"请选择国家！\");</script>");
            return;
        }

        if (Request["id"] != null)
        {

            sql = "update ProCarInfo set title='" + txttitle.Value + "',stype='" + drtype.SelectedValue + "',createtime='" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',proprice='"+txtpro_price.Value+"'  where ID=" + Request["id"].ToString() + "";

            
            if (Igs(sql))
            {
                pid=getProId();
                Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"修改成功！\");location.href=\"./procarinfolist.aspx?pid=" + pid + "&ac=新闻管理咨询\";</script>");
            }
            else
            {
                Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"修改失败！\");</script>");
            }
        }
        else
        {

            sql = "insert into ProCarInfo(title,proname,stype,proprice,createtime,proid) values('" + txttitle.Value + "','" + txtproname.Text + "','" + drtype.SelectedValue + "','" + txtpro_price.Value + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "'," + str_pid + ")";
            //pid = Convert.ToString(Request["pid"]);
            if (Igs(sql))
            {
                Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"添加成功！\");location.href=\"./procarinfolist.aspx?pid=" + str_pid + "&ac=新闻管理咨询\";</script>");
            }
            else
            {
                Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"添加失败！\");</script>");

            }
        }



    }

    public string getProId()
    {
        string pid = string.Empty;
        if (Request["id"] != null)
        {
            string sql = "select proid from procarinfo where id=" + Request["id"].ToString() + ";";
            pid= Convert.ToString(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null) + "");
        }
        return pid;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrWhiteSpace(str_pid))

            Response.Redirect("procarinfolist.aspx?pid=" + str_pid + "");
        else if (!string.IsNullOrWhiteSpace(id))
        {
            string pid = getProId();
            Response.Redirect("procarinfolist.aspx?pid=" + pid + "");
        }
    }
}