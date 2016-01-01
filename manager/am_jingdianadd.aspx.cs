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
public partial class manager_am_jingdianadd : System.Web.UI.Page
{
    System.Drawing.Image.GetThumbnailImageAbort callb = null;
    System.Drawing.Image image, newimage;
    public string imagename1, newName, newNamed, newName2, newName3, newName4;
    public string pic2;
    private string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        cstype();
        if (Request["id"] != null)
        {
            id = Request["id"].ToString();

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
        string sql = "select Id,clsname1,clsname2,clsname3,clsname4,languageId from jingdian where ID=" + id;
        try
        {
            DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
            foreach (DataRow or in dt.Select())
            {
                rbl.SelectedValue = Convert.ToString(or["languageId"]);
                txttitle.Value = Convert.ToString(or["clsname1"]);
                drtype.SelectedValue = Convert.ToString(or["clsname2"]);
                DropDownList1_SelectedIndexChanged(null, null);
                sel_city.SelectedValue = Convert.ToString(or["clsname3"]);
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
        if (drtype.SelectedValue == "-1")
        {
            Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"请选择国家！\");</script>");
            return;
        }
        if (sel_city.SelectedValue == "0")
        {
            Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"请选择城市！\");</script>");
            return;
        }

        if (Request["id"] != null)
        {


            sql = "update jingdian set clsname1='" + txttitle.Value + "',clsname2='" + drtype.SelectedValue + "',clsname3='" + sel_city.SelectedValue + "',clsname4='" + sel_city.SelectedItem.Text + "' where ID=" + Request["id"].ToString() + "";

            //string leib = null;
            //osdReader or = new osdReader("select parId from news where id=" + Request["id"] + "");
            //while (or.Read())
            //{
            //    leib = Convert.ToString(or["ParId"]);
            //}
            //or.Close();
            if (Igs(sql))
            {
                Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"修改成功！\");location.href=\"./am_jingdianshow.aspx?lan=" + rbl.SelectedValue + "&ac=新闻管理咨询\";</script>");
            }
            else
            {
                Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"修改失败！\");</script>");
            }
        }
        else
        {

            sql = "insert into jingdian(clsname1,LanguageId,clsname2,clsname3,clsname4) values('" + txttitle.Value + "','" + rbl.SelectedValue + "','" + drtype.SelectedValue + "','" + sel_city.SelectedValue + "','" + sel_city.SelectedItem.Text + "')";

            if (Igs(sql))
            {
                Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"添加成功！\");location.href=\"./am_jingdianshow.aspx?lan=" + rbl.SelectedValue + "&ac=新闻管理咨询\";</script>");
            }
            else
            {
                Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"添加失败！\");</script>");

            }
        }



    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        Response.Redirect("am_jingdianshow.aspx");

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sql = "select id,clsname1 from citytype where clsname2='" + drtype.SelectedValue + "' order by id";
        sel_city.DataSource = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null);
        sel_city.DataTextField = "ClsName1";
        sel_city.DataValueField = "id";
        sel_city.DataBind();
        sel_city.Items.Insert(0, "--请选择--");
        sel_city.Items[0].Value = "0";
    }
}