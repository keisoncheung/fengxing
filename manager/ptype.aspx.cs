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

public partial class manager_ptype : System.Web.UI.Page
{
    System.Drawing.Image.GetThumbnailImageAbort callb = null;
    System.Drawing.Image image, newimage;
    public string imagename1, newName, newNamed, newName2;
    public string pic2;
    public Public2 pc = new Public2();
    private int readp = 10;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.ViewState["currentp"] = 1;
            if (Request["lan"] != null && Request["id"] != null)
            {
 
            }
            else if (Request["id"] != null)
            {
                csh();
            }
        }
    }

    ////初始化类别
    //private void cstype()
    //{
    //    string sql = null;
    //    sql = "select * from productType where id=" + Request["id"];
    //    drtype.DataSource = osdData.DataSet(sql);
    //    drtype.DataTextField = "ClsName";
    //    drtype.DataValueField = "id";
    //    drtype.DataBind();
    //}
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
            if ("jpg" != imageType && "gif" != imageType && "JPG" != imageType && "GIF" != imageType && "bmp" != imageType && "PNG" != imageType && "png" != imageType)
            {
                Response.Write("<script language='javascript'> alert('对不起！请您选择jpg或者gif或者bmp或者png格式的图片！');</script>");
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

            double x = 938;
            double y = 190;

           

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
            newName2 = "s" + file;
            return newName2;
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
        string sql = "select id,clsname,sortid from productType where id=" + Request["id"];
        try
        {

            DataTable dt = new DataTable();
            dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn,sql,null).Tables[0];
            foreach (DataRow or in dt.Select())
            {
                tb1.Text = Convert.ToString(or["clsname"]);
                txtsorid.Text = Convert.ToString(or["sortid"]);
            }
            dt.Dispose();
        }
        catch (Exception rr)
        {
            this.Response.Write(rr.ToString());
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("protype.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        StringBuilder sbr = new StringBuilder();
        string sql = "";
        DataTable dt = new DataTable();
         string bpic = upfile(File1);
        string spic = "";
        if (bpic.Length > 1)
        {
            spic = simage(bpic);

            if (Request["lan"] != null && Request["id"] != null)
            {
                sql = "insert into productType(clsname,languageId,parid,SortId,picb,pics)values('" + tb1.Text + "','" + Request["lan"] + "','" + Request["id"] + "','" + txtsorid.Text.Trim() + "','" + bpic + "','" + spic + "')";
                try
                {
                    OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
                    Messages.ConfirmMessageBox("protype.aspx", "添加成功");
                }
                catch (Exception ee)
                {
                    Messages.Message("添加失败");
                }
            }
            else if (Request["lan"] != null)
            {
                sql = "insert into productType(clsname,languageId,parid,sortid,picb,pics)values('" + tb1.Text + "','" + Request["lan"] + "',0,'" + txtsorid.Text.Trim() + "','" + bpic + "','" + spic + "')";
                try
                {
                    OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
                    Messages.ConfirmMessageBox("protype.aspx", "添加成功");
                }
                catch (Exception ee)
                {
                    Messages.Message("添加失败");
                }

            }
            else
            {
                sql = "update productType set clsname='" + tb1.Text + "',sortid='" + txtsorid.Text.Trim() + "',picb='"+bpic+"',pics='"+spic+"' where id=" + Request["id"];
                try
                {
                    OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
                    Messages.ConfirmMessageBox("protype.aspx", "添加成功");
                }
                catch (Exception ee)
                {
                    Messages.Message("修改失败");
                }

            }
        }
        else
        {
            if (Request["lan"] != null && Request["id"] != null)
            {
                sql = "insert into productType(clsname,languageId,parid,SortId,picb,pics)values('" + tb1.Text + "','" + Request["lan"] + "','" + Request["id"] + "','" + txtsorid.Text.Trim() + "','','')";
                try
                {
                    OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
                    Messages.ConfirmMessageBox("protype.aspx", "添加成功");
                }
                catch (Exception ee)
                {
                    Messages.Message("添加失败");
                }
            }
            else if (Request["lan"] != null)
            {
                sql = "insert into productType(clsname,languageId,parid,sortid,picb,pics)values('" + tb1.Text + "','" + Request["lan"] + "',0,'" + txtsorid.Text.Trim() + "','','')";
                try
                {
                    OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
                    Messages.ConfirmMessageBox("protype.aspx", "添加成功");
                }
                catch (Exception ee)
                {
                    Messages.Message("添加失败");
                }

            }
            else
            {
                sql = "update productType set clsname='" + tb1.Text + "',sortid='" + txtsorid.Text.Trim() + "'  where id=" + Request["id"];
                try
                {
                    OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
                    Messages.ConfirmMessageBox("protype.aspx", "添加成功");
                }
                catch (Exception ee)
                {
                    Messages.Message("修改失败");
                }

            }
        }

    }
}
