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
public partial class manager_vedio : System.Web.UI.Page
{
    System.Drawing.Image.GetThumbnailImageAbort callb = null;
    System.Drawing.Image image, newimage;
    public string imagename1, newName, newNamed, newName2, newName3, newName4;
    public string pic2;
    private string id; 
    protected void Page_Load(object sender, EventArgs e)
    {
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
                cstype();
                csh();
            }
            else
            {
                cstype();
            }
        }

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


    private string simage(string file)
    {
        int x = 131;
        int y = 98;
        switch (ddl1.SelectedValue)
        {
            case "26":
                x = 180;
                y = 130;
                break;

            case "54":
            case "56":
            case "72":
            case "77":
                x = 200;
                y = 150;
                break;
            case "61":
                x = 218;
                y = 132;
                break;
            case "65":
                x = 210;
                y = 100;
                break;
            case "67":
                x = 218;
                y = 132;
                break;

            case "68":
            case "69":
                x = 237;
                y = 146;
                break;
            case "73":
                x = 224;
                y = 139;
                break;
            case "74":
                x = 359;
                y = 486;
                break;
            case "75":
                x = 316;
                y = 123;
                break;
            case "76":
                x = 324;
                y = 250;
                break;


        }



        try
        {
            string mPath = Server.MapPath("~") + "\\pic\\";

            System.Drawing.Image image = System.Drawing.Image.FromFile(mPath + "\\" + file);
            int width = image.Width;
            int height = image.Height;
            image.Dispose();

            double FrameworkProportion = x / y;
            double ImgeProportion = Convert.ToDouble(width) / Convert.ToDouble(height);
            if (FrameworkProportion >= ImgeProportion)
            {
                ImageThumbnail.MakeThumbnail(mPath + file, mPath + "s" + file, Convert.ToInt32(x), Convert.ToInt32(y), "H", System.Drawing.Imaging.ImageFormat.Jpeg);
            }
            else
            {
                ImageThumbnail.MakeThumbnail(mPath + file, mPath + "s" + file, Convert.ToInt32(x), Convert.ToInt32(y), "W", System.Drawing.Imaging.ImageFormat.Jpeg);
            }

            string newName = "s" + file;
            return newName;
        }
        catch (Exception ee)
        {
            ee.ToString();
            return "";

        }
    }


    private string simage2(string file)
    {
        int x = 131;
        int y = 98;
        switch (ddl1.SelectedValue)
        {
            case "26":
                x = 180;
                y = 130;
                break;
            case "54":
            case "56":
            case "77":
                x = 200;
                y = 150;
                break;
            case "61":
                x = 218;
                y = 132;
                break;
            case "65":
                x = 210;
                y = 100;
                break;
            case "67":
                x = 218;
                y = 132;
                break;

            case "68":
            case "69":
                x = 237;
                y = 146;
                break;
            case "73":
                x = 224;
                y = 139;
                break;
            case "74":
                x = 324;
                y = 250;
                break;

        }



        try
        {
            string mPath = Server.MapPath("~") + "\\pic\\";

            System.Drawing.Image image = System.Drawing.Image.FromFile(mPath + "\\" + file);
            int width = image.Width;
            int height = image.Height;
            image.Dispose();

            double FrameworkProportion = x / y;
            double ImgeProportion = Convert.ToDouble(width) / Convert.ToDouble(height);
            if (FrameworkProportion >= ImgeProportion)
            {
                ImageThumbnail.MakeThumbnail(mPath + file, mPath + "ss" + file, Convert.ToInt32(x), Convert.ToInt32(y), "H", System.Drawing.Imaging.ImageFormat.Jpeg);
            }
            else
            {
                ImageThumbnail.MakeThumbnail(mPath + file, mPath + "ss" + file, Convert.ToInt32(x), Convert.ToInt32(y), "W", System.Drawing.Imaging.ImageFormat.Jpeg);
            }

            string newName = "ss" + file;
            return newName;
        }
        catch (Exception ee)
        {
            ee.ToString();
            return "";

        }
    }

    //初始化类别
    private void cstype()
    {
        string artbtype = null;
        if (Request["id"] != null)
        {
            artbtype = " where id in(select ParId from News where id=" + Request["id"] + ")";
        }

        else if (Request["type"] != null)
        {
            artbtype = " where id=" + Request["type"] + "";

        }
        else
        {
            artbtype = "";
        }
        DataTable dt = new DataTable();
        dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, "select id, clsname from languageId", null).Tables[0];
        rbl.DataSource = dt;
        rbl.DataTextField = "clsname";
        rbl.DataValueField = "id";
        rbl.DataBind();
        rbl.Items[0].Selected = true;


        string sql = "select ID,ClsName1 from NewType" + artbtype;
        artbtype = OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null).ToString();
        ddl1.DataSource = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null);
        ddl1.DataTextField = "ClsName1";
        ddl1.DataValueField = "ID";
        ddl1.DataBind();
        ddl1.Items.Insert(0, "--请选择--");
        ddl1.Items[0].Value = "0";
    }

    //修改页面
    public void csh()
    {
        string str = null;
        string sql = "select Id,Title,Content,ParId,languageId from News where ID=" + id;
        try
        {
            DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
            foreach (DataRow or in dt.Select())
            {
                rbl.SelectedValue = Convert.ToString(or["languageId"]);
                txttitle.Value = Convert.ToString(or["Title"]);
                FreeTextBox1.Text = Convert.ToString(or["Content"]);
                ddl1.SelectedValue = Convert.ToString(or["ParId"]);
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
        string bpic = upfile(File1);
        string spic = "";
        string ss = FreeTextBox1.Text.Replace("'", "''");
        if (ss.IndexOf("'") > 0)
        {
            ss = ss.Replace("'", "''");
        }


        if (ddl1.SelectedValue != "0")
        {
            if (bpic.Length > 1)
            {
                spic = simage(bpic);

                if (Request["id"] != null)
                {
                    sql = "update News set Title='" + txttitle.Value + "',Content='" + ss + "', ParId ='" + ddl1.SelectedValue + "',LanguageId='" + rbl.SelectedValue + "',picture='" + bpic + "',linkpic='" + spic + "' where ID=" + Request["id"].ToString() + "";

                    //string leib = null;
                    //osdReader or = new osdReader("select parId from news where id=" + Request["id"] + "");
                    //while (or.Read())
                    //{
                    //    leib = Convert.ToString(or["ParId"]);
                    //}
                    //or.Close();
                    if (Igs(sql))
                    {
                        Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"修改成功！\");location.href=\"./newsshow.aspx?type=" + ddl1.SelectedValue + "&lan=" + rbl.SelectedValue + "&ac=新闻管理咨询\";</script>");
                    }
                    else
                    {
                        Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"修改失败！\");</script>");
                    }
                }
                else
                {
                    sql = "insert into News(Title,Content,CreateDate,ParId,IsShow,LanguageId,picture,linkpic) values('" + txttitle.Value + "','" + ss + "','" + DateTime.Now.ToString() + "','" + ddl1.SelectedValue + "',1,'" + rbl.SelectedValue + "','" + bpic + "','" + spic + "')";

                    if (Igs(sql))
                    {
                        Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"添加成功！\");location.href=\"./newsshow.aspx?type=" + ddl1.SelectedValue + "&lan=" + rbl.SelectedValue + "&ac=新闻管理咨询\";</script>");
                    }
                    else
                    {
                        Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"添加失败！\");</script>");

                    }
                }
            }
            else
            {
                if (Request["id"] != null)
                {
                    sql = "update News set Title='" + txttitle.Value + "',Content='" + ss + "', ParId ='" + ddl1.SelectedValue + "',LanguageId='" + rbl.SelectedValue + "' where ID=" + Request["id"].ToString() + "";

                    //string leib = null;
                    //osdReader or = new osdReader("select parId from news where id=" + Request["id"] + "");
                    //while (or.Read())
                    //{
                    //    leib = Convert.ToString(or["ParId"]);
                    //}
                    //or.Close();
                    if (Igs(sql))
                    {
                        Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"修改成功！\");location.href=\"./newsshow.aspx?type=" + ddl1.SelectedValue + "&lan=" + rbl.SelectedValue + "&ac=新闻管理咨询\";</script>");
                    }
                    else
                    {
                        Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"修改失败！\");</script>");
                    }
                }
                else
                {
                    sql = "insert into News(Title,Content,CreateDate,ParId,IsShow,LanguageId) values('" + txttitle.Value + "','" + ss + "','" + DateTime.Now.ToString() + "','" + ddl1.SelectedValue + "',1," + rbl.SelectedValue + ")";

                    if (Igs(sql))
                    {
                        Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"添加成功！\");location.href=\"./newsshow.aspx?type=" + ddl1.SelectedValue + "&lan=" + rbl.SelectedValue + "&ac=新闻管理咨询\";</script>");
                    }
                    else
                    {
                        Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"添加失败！\");</script>");

                    }
                }

            }
        }
        else
        {
            Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"请选择类别！\");</script>");

        }
    }
    protected void ddl1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request["id"] != null)
        {
            Response.Redirect("newsshow.aspx?lan=" + rbl.SelectedValue + "&type=" + ddl1.SelectedValue + "");
        }
        else
        {
            Response.Redirect("newsshow.aspx");
        }

    }
}