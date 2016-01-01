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

public partial class manager_mettingadd : System.Web.UI.Page
{
    System.Drawing.Image.GetThumbnailImageAbort callb = null;
    System.Drawing.Image image, newimage;
    public string imagename1, newName, newNamed, newName2, newName3;
    public string pic2;
    private string id;
    public int xswz;
    public string lan = null;
    public string r_type = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            r_type = Convert.ToString(Request["type"]);
            cstype(r_type);

            if (Request["id"] != null)
            {
                id = Request["id"].ToString();
                csh();

            }
            else
            {
                pic2 = "<img src=../images/nopic.gif width='130px'>";

            }
        }
    }


    //初始化类别
    private void cstype(string rtype)
    {
        //if (Request["id"] != null)
        //{
        //    artbtype = "where id in(select ParId from News where id=" + Request["id"] + ")";
        //}

        //else if (Request["type"] != null)
        //{
        //    artbtype = "where id=" + Request["type"] + "";

        //}
        //else
        //{
        //    artbtype = "";
        //}
        DataTable dt = new DataTable();
        dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, "select id, clsname from languageId", null).Tables[0];
        rbl.DataSource = dt;
        rbl.DataTextField = "clsname";
        rbl.DataValueField = "id";
        rbl.DataBind();
        rbl.Items[0].Selected = true;


        string sql = null;
        sql = "select * from productType where ParId=0 and LanguageId=" + rbl.SelectedValue;
        if (!string.IsNullOrEmpty(r_type))
            sql = "select * from productType where ParId=0 and id=" + rtype + " and LanguageId=" + rbl.SelectedValue;
        drtype.DataSource = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null);
        drtype.DataTextField = "ClsName";
        drtype.DataValueField = "id";
        drtype.DataBind();
        drtype.Items.Insert(0, "--请选择--");
        drtype.Items[0].Value = "0";





        sql = "select * from productType where ParId=" + drtype.SelectedValue + "";
        drtype2.DataSource = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null);
        drtype2.DataTextField = "ClsName";
        drtype2.DataValueField = "id";
        drtype2.DataBind();
        drtype2.Items.Insert(0, "--请选择--");
        drtype2.Items[0].Value = "0";
        drtype2.Enabled = false;



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

        try
        {
            string mPath = Server.MapPath("~") + "\\pic\\";

            System.Drawing.Image image = System.Drawing.Image.FromFile(mPath + "\\" + file);
            int width = image.Width;
            int height = image.Height;
            image.Dispose();
            double x = 180;
            double y = 80;

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

            //newimage.Save(mPath + "\\s" + file, image.RawFormat);//图片名字－－s+name.jpg
            //image.Dispose();
            //newimage.Dispose();
            //newNamed = file;
            newName = "s" + file;
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

        try
        {
            string mPath = Server.MapPath("~") + "\\pic\\";

            System.Drawing.Image image = System.Drawing.Image.FromFile(mPath + "\\" + file);
            int width = image.Width;
            int height = image.Height;
            image.Dispose();

            double x = 246;
            double y = 134;

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
            newName2 = "ss" + file;
            return newName2;
        }
        catch (Exception ee)
        {
            ee.ToString();
            return "";

        }
    }

    private string simage3(string file)
    {

        try
        {
            string mPath = Server.MapPath("~") + "\\pic\\";

            System.Drawing.Image image = System.Drawing.Image.FromFile(mPath + "\\" + file);
            int width = image.Width;
            int height = image.Height;
            image.Dispose();

            double x = 275;
            double y = 185;

            double FrameworkProportion = x / y;
            double ImgeProportion = Convert.ToDouble(width) / Convert.ToDouble(height);
            if (FrameworkProportion >= ImgeProportion)
            {
                ImageThumbnail.MakeThumbnail(mPath + file, mPath + "sss" + file, Convert.ToInt32(x), Convert.ToInt32(y), "H", System.Drawing.Imaging.ImageFormat.Jpeg);
            }
            else
            {
                ImageThumbnail.MakeThumbnail(mPath + file, mPath + "sss" + file, Convert.ToInt32(x), Convert.ToInt32(y), "W", System.Drawing.Imaging.ImageFormat.Jpeg);
            }
            newName2 = "ss" + file;
            newName3 = "sss" + file;
            return newName3;
        }
        catch (Exception ee)
        {
            ee.ToString();
            return "";

        }
    }

    //修改页面
    public void csh()
    {
        string str = null;
        string sql = "select id,ProName,PictureB,PictureS,Content,parid,languageId,grade,canshu,txtsortid,prokeyword,Promode,Procolor,ProSize,peoplesnums,address from product where id=" + id;
        try
        {
            DataTable dt = new DataTable();
            dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
            foreach (DataRow or in dt.Select())
            {
                name.Text = Convert.ToString(or["ProName"]);
                rbl.SelectedValue = Convert.ToString(or["languageId"]);
                pic2 = "<img src='../pic/" + or["PictureS"].ToString() + "' border=0 width=100 height=100>";
                drty11(Convert.ToString(or["ParId"]));
                string dlid = OleDbHelper.ExecuteScalar(OleDbHelper.Conn, "select ParId from productType where id=" + or["ParId"], null).ToString();
                drtype.SelectedValue = Convert.ToString(dlid);
                drty12();
                drtype2.SelectedValue = Convert.ToString(or["parid"]);

                FreeTextBox1.Text = Convert.ToString(or["Content"]);
                if (Convert.ToString(or["grade"]) == "1")
                {
                    sftj.Checked = true;
                }
                else
                {
                    sftj.Checked = false;
                }
                canshu.Text = Convert.ToString(or["canshu"]);
                txtsort.Text = Convert.ToString(or["txtsortid"]);
                tbxpeople.Text = Convert.ToString(or["peoplesnums"]);
                tbxaddr.Text = Convert.ToString(or["address"]);
            }
            dt.Dispose();
        }
        catch (Exception rr)
        {
            this.Response.Write(rr.ToString());
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
        int scp1;
        string type = null;
        string bpic = upfile(File1);
        string spic = "";
        int sfshow;
        if (sftj.Checked == true)
        {
            sfshow = 1;
        }
        else
        {
            sfshow = 0;
        }
        if (drtype.SelectedValue != "0")
        {
            if (bpic.Length > 1)
            {
                spic = simage(bpic);
                simage2(bpic);
                simage3(bpic);
                if (Request["id"] != null)
                {
                    sql = "update product set ProName='" + name.Text + "', PictureB='" +
                        bpic + "',PictureS='" + spic + "',Content='" +
                        FreeTextBox1.Text.Replace("'", "''") + "',grade='" + sfshow + "',parid='" + drtype2.SelectedValue + "',languageId='" + rbl.SelectedValue + "',CreateDate='" + DateTime.Now.ToString() + "',canshu='" + canshu.Text + "',txtsortid='" + txtsort.Text.Trim() + "',peoplesNums='" + tbxpeople.Text + "',address='" + tbxaddr.Text + "' where id=" + Request["id"] + "";
                    if (Igs(sql))
                    {
                        Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"资料修改成功！\");location.href=\"./mettingshow.aspx?lan=" + rbl.SelectedValue + "&type=" + drtype.SelectedValue + "\";</script>");
                    }
                    else
                    {
                        Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"资料修改失败！\");</script>");
                    }
                }
                else
                {
                    sql = "insert into product(ProName,PictureB,PictureS,Content,CreateDate,parid,languageId,grade,canshu,txtsortid,peoplesNums,address) values('" + name.Text + "','" + bpic + "','" + spic + "','" +
                        FreeTextBox1.Text.Replace("'", "''") + "','" + DateTime.Now.ToString() + "','" + drtype2.SelectedValue + "','" + rbl.SelectedValue + "','" + sfshow + "','" + canshu.Text + "','" + txtsort.Text.Trim() + "','" + tbxpeople.Text + "','" + tbxaddr.Text + "')";

                    if (Igs(sql))
                    {
                        Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"资料添加成功！\");location.href=\"./mettingshow.aspx?lan=" + rbl.SelectedValue + "&type=" + drtype.SelectedValue + "\";</script>");
                    }
                    else
                    {
                        Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"资料修改失败！\");</script>");
                    }
                }
            }
            else
            {
                if (Request["id"] != null)
                {
                    sql = "update product set ProName='" + name.Text + "', Content='" +
                        FreeTextBox1.Text.Replace("'", "''") + "',grade='" + sfshow + "',languageId='" + rbl.SelectedValue + "',parid='" + drtype2.SelectedValue + "',CreateDate='" + DateTime.Now.ToString() + "',canshu='" + canshu.Text + "',txtsortid='" + txtsort.Text.Trim() + "',prokeyword='',peoplesNums='" + tbxpeople.Text + "',address='" + tbxaddr.Text + "' where id=" + Request["id"] + "";
                    if (Igs(sql))
                    {
                        Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"资料修改成功！\");location.href=\"./mettingshow.aspx?lan=" + rbl.SelectedValue + "&type=" + drtype.SelectedValue + "\";</script>");
                    }
                    else
                    {
                        Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"资料修改失败！\");</script>");
                    }
                }
                else
                {
                    sql = "insert into product(ProName,PictureB,PictureS,Content,CreateDate,parid,languageId,grade,canshu,txtsortid,prokeyword,peoplesNums,address) values('" + name.Text + "','nopic.gif ','nopic.gif ','" +
                        FreeTextBox1.Text.Replace("'", "''") + "','" + DateTime.Now.ToString() + "','" + drtype2.SelectedValue + "','" + rbl.SelectedValue + "','" + sfshow + "','" + canshu.Text + "','" + txtsort.Text.Trim() + "','','" + tbxpeople.Text + "','" + tbxaddr.Text + "')";

                    if (Igs(sql))
                    {
                        Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"资料添加成功！\");location.href=\"./mettingshow.aspx?lan=" + rbl.SelectedValue + "&type=" + drtype.SelectedValue + "\";</script>");
                    }
                    else
                    {
                        Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"资料修改失败！\");</script>");
                    }
                }

            }
        }
        else
        {
            Response.Write("<script LANGUAGE=\"JavaScript\">alert(\"请选择类别！\");</script>");
        }

    }
    //protected void drtype_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string sql = null;
    //    drtype2.Visible = true;
    //    sql = "select * from productType where ParId=" + drtype.SelectedValue + "";
    //    drtype2.DataSource = osdData.DataSet(sql);
    //    drtype2.DataTextField = "ClsName";
    //    drtype2.DataValueField = "id";
    //    drtype2.DataBind();
    //    drtype2.Items.Insert(0, "--请选择--");
    //    drtype2.Items[0].Value = "0";
    //    drtype2.Enabled = true;
    //}
    protected void rbl_SelectedIndexChanged(object sender, EventArgs e)
    {
        drty11("");
    }
    protected void drtype_SelectedIndexChanged(object sender, EventArgs e)
    {
        drty12();
    }

    private void drty11(string stype)
    {
        string sql = null;
        sql = "select * from productType where ParId=0 and LanguageId=" + rbl.SelectedValue;
        if (!string.IsNullOrEmpty(stype))
            sql = "select * from productType where id in(select parid from productType where id=" + stype + ")";

        drtype.DataSource = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null);
        drtype.DataTextField = "ClsName";
        drtype.DataValueField = "id";
        drtype.DataBind();
        drtype.Items.Insert(0, "--请选择--");
        drtype.Items[0].Value = "0";



        sql = "select * from productType where ParId=" + drtype.SelectedValue + "";
        drtype2.DataSource = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null);
        drtype2.DataTextField = "ClsName";
        drtype2.DataValueField = "id";
        drtype2.DataBind();
        drtype2.Items.Insert(0, "--请选择--");
        drtype2.Items[0].Value = "0";
        drtype2.Enabled = false;

    }

    private void drty12()
    {
        string sql = "select * from productType where ParId=" + drtype.SelectedValue + "";
        drtype2.DataSource = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null);
        drtype2.DataTextField = "ClsName";
        drtype2.DataValueField = "id";
        drtype2.DataBind();
        drtype2.Items.Insert(0, "--请选择--");
        drtype2.Items[0].Value = "0";
        drtype2.Enabled = true;

    }

    public string getBtype(string id)
    {
        string sql = "select parid from productType where id=" + id + "";

        return Convert.ToString(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null));
    }
}
