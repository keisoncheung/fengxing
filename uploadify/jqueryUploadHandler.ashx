﻿<%@ WebHandler Language="C#" Class="jqueryUploadifyHandler" %>
using System;
using System.Web;
using System.IO;

[System.Web.Services.WebService(Namespace = "http://tempuri.org/")]
[System.Web.Services.WebServiceBinding(ConformsTo = System.Web.Services.WsiProfiles.BasicProfile1_1)]
    public class jqueryUploadifyHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Charset = "utf-8";

            
            MemberInfo cInfo = new MemberInfo();
            cInfo.Load();

            if (string.IsNullOrWhiteSpace(Convert.ToString(cInfo.mId)) || cInfo.mId == "0")
            {
                context.Response.Write("-1");
            }
            else
            {
                HttpPostedFile file = context.Request.Files["Filedata"];
                string uploadPath = context.Server.MapPath("..\\uploads\\");

                if (file != null)
                {
                    if (!Directory.Exists(uploadPath))
                    {
                        Directory.CreateDirectory(uploadPath);
                    }
                    file.SaveAs(uploadPath + file.FileName);
                    //生成缩略图
                    MakeThumbnail(uploadPath + file.FileName, uploadPath + "\\s\\" + file.FileName, 80, 80);
                }

                MemberList men = new MemberList();
                men.Bpic = file.FileName;
                men.UId = cInfo.mId;
                if(new publicclass().SaveMemberInfo(men)==true)
                    context.Response.Write(file.FileName);
                else
                    context.Response.Write("0");
            }
        }
        private void MakeThumbnail(string sourcePath, string newPath, int width, int height)
        {
            System.Drawing.Image ig = System.Drawing.Image.FromFile(sourcePath);
            int towidth = width;
            int toheight = height;
            int x = 0;
            int y = 0;
            int ow = ig.Width;
            int oh = ig.Height;
            if ((double)ig.Width / (double)ig.Height > (double)towidth / (double)toheight)
            {
                oh = ig.Height;
                ow = ig.Height * towidth / toheight;
                y = 0;
                x = (ig.Width - ow) / 2;

            }
            else
            {
                ow = ig.Width;
                oh = ig.Width * height / towidth;
                x = 0;
                y = (ig.Height - oh) / 2;
            }
            System.Drawing.Image bitmap = new System.Drawing.Bitmap(towidth, toheight);
            System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(bitmap);
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;
            g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
            g.Clear(System.Drawing.Color.Transparent);
            g.DrawImage(ig, new System.Drawing.Rectangle(0, 0, towidth, toheight), new System.Drawing.Rectangle(x, y, ow, oh), System.Drawing.GraphicsUnit.Pixel);
            try
            {
                bitmap.Save(newPath, System.Drawing.Imaging.ImageFormat.Jpeg);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ig.Dispose();
                bitmap.Dispose();
                g.Dispose();
            }

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }