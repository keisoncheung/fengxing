<%@ WebHandler Language="C#" Class="ajaxclass" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Web.SessionState;
using DLL;
using System.Text;
using System.Drawing;
using System.IO;



public class ajaxclass : IHttpHandler, IRequiresSessionState
{

    publicclass pbclas = new publicclass();
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/json";
        switch (Convert.ToString(context.Request["ntype"]))
        {
            case "addcar":
                AddCar(context);
                break;
            case "DelCar":
                DelCar(context);
                break;
            case "AddCar_QZ":
                AddCar_QZ(context);
                break;
            case "OrderCar":
                OrderCar(context);
                break;
            case "SaveInfo":
                SaveInfo(context);
                break;
            case "DelOrder":
                DelOrder(context);
                break;
            case "AddMyFavorite":
                AddMyFavorite(context);
                break;
            case "DelMyFavorite":
                DelMyFavorite(context);
                break;

        }
    }


    


    /// <summary>
    /// 删除订单
    /// </summary>
    /// <param name="context"></param>
    public void DelOrder(HttpContext context)
    {
        context.Response.ContentType = "text/json";
        string oid = Convert.ToString(context.Request["oid"]);

        MemberInfo cInfo = new MemberInfo();
        cInfo.Load();

        if (string.IsNullOrWhiteSpace(Convert.ToString(cInfo.mId)) || cInfo.mId == "0")
            HttpContext.Current.Response.Write("{\"data\":[{\"result\":0}]}");//未登录
        else
        {
            if (pbclas.DelOrder(oid, cInfo.mId))
            {
                HttpContext.Current.Response.Write("{\"data\":[{\"result\":1}]}");//提交成功
            }
            else
            {
                HttpContext.Current.Response.Write("{\"data\":[{\"result\":-1}]}");//失败
            }
        }
        
    }
    
    
    /// <summary>
    /// 加入收藏
    /// </summary>
    /// <param name="context"></param>
    public void AddMyFavorite(HttpContext context)
    {
        context.Response.ContentType = "text/json";
        string oid = Convert.ToString(context.Request["pid"]);
        string url = Convert.ToString(context.Request["url"]);
        MemberInfo cInfo = new MemberInfo();
        cInfo.Load();

        if (string.IsNullOrWhiteSpace(Convert.ToString(cInfo.mId)) || cInfo.mId == "0")
        {
            HttpContext.Current.Session["gocar"] = url;
            HttpContext.Current.Response.Write("{\"data\":[{\"result\":0}]}");//未登录
        }
        else
        {
            string result = pbclas.AddMyFavorite(oid, cInfo.mId);
            int totalNums = pbclas.GetTotalFavorite(oid, null);
            if (result == "1")
            {
                HttpContext.Current.Response.Write("{\"data\":[{\"result\":1,\"num\":" + totalNums + "}]}");//提交成功
            }
            else if (result == "2")
            {
                HttpContext.Current.Response.Write("{\"data\":[{\"result\":2,\"num\":" + totalNums + "}]}");//已存在
            }
            else if (result == "-1")
            {
                HttpContext.Current.Response.Write("{\"data\":[{\"result\":-1,\"num\":" + totalNums + "}]}");//失败
            }
        }
    }

    /// <summary>
    /// 删除收藏
    /// </summary>
    /// <param name="context"></param>
    public void DelMyFavorite(HttpContext context)
    {
        context.Response.ContentType = "text/json";
        string oid = Convert.ToString(context.Request["pid"]);
        string url = Convert.ToString(context.Request["url"]);
        MemberInfo cInfo = new MemberInfo();
        cInfo.Load();

        if (string.IsNullOrWhiteSpace(Convert.ToString(cInfo.mId)) || cInfo.mId == "0")
        {
            HttpContext.Current.Session["gocar"] = url;
            HttpContext.Current.Response.Write("{\"data\":[{\"result\":0}]}");//未登录
        }
        else
        {
            string result = pbclas.DelMyFavorite(oid, cInfo.mId);
            int totalNums = pbclas.GetTotalFavorite(oid, null);
            if (result == "1")
            {
                HttpContext.Current.Response.Write("{\"data\":[{\"result\":1,\"num\":" + totalNums + "}]}");//提交成功
            }
            else if (result == "2")
            {
                HttpContext.Current.Response.Write("{\"data\":[{\"result\":2,\"num\":" + totalNums + "}]}");//已存在
            }
            else if (result == "-1")
            {
                HttpContext.Current.Response.Write("{\"data\":[{\"result\":-1,\"num\":" + totalNums + "}]}");//失败
            }
        }
    }


    public void GetTotalFavorite(HttpContext context)
    {
        context.Response.ContentType = "text/json";
        string oid = Convert.ToString(context.Request["getFa"]);
        
         
    }
    
    
    
    
    
    
    public void SaveInfo(HttpContext context)
    {
        context.Response.ContentType = "text/json";
        string str_json = Convert.ToString(context.Request["myinfo"]);
        JavaScriptSerializer jss = new JavaScriptSerializer();
        var menInfo = jss.Deserialize<MemberList>(str_json);
        MemberInfo cInfo = new MemberInfo();
        cInfo.Load();

        if (string.IsNullOrWhiteSpace(Convert.ToString(cInfo.mId)) || cInfo.mId == "0")
            HttpContext.Current.Response.Write("{\"data\":[{\"result\":0}]}");//未登录
        else
        {

       
            //上传成功后显示IMG文件
            //StringBuilder sb = new StringBuilder();
            //sb.Append("<img id=\"imgUpload\" src=\"" + path.Replace("\\", "/") + fileName + "\" />");
            //context.Response.Write(sb.ToString());
            //context.Response.End();
            
            menInfo.UId = cInfo.mId;
            bool bl = pbclas.SaveMemberInfo(menInfo);
            if (bl == true)
            {
                HttpContext.Current.Response.Write("{\"data\":[{\"result\":1}]}");//提交成功
            }
            else
            {
                HttpContext.Current.Response.Write("{\"data\":[{\"result\":-1}]}");//失败
            }

        }


    }



    #region -------订单提交——————————————
    /// <summary>
    /// 
    /// </summary>
    /// <param name="context"></param>
    public void OrderCar(HttpContext context)
    {
        context.Response.ContentType = "text/json";
        string str_json = Convert.ToString(context.Request["carinfo"]);
        JavaScriptSerializer jss = new JavaScriptSerializer();
        var Ocar = jss.Deserialize<OrderCarMenu>(str_json);
        //string Oid2 = pbclas.GexMaxOid();

        MemberInfo cInfo = new MemberInfo();
        cInfo.Load();
        if (string.IsNullOrWhiteSpace(Convert.ToString(cInfo.mId)) || cInfo.mId == "0")
            HttpContext.Current.Response.Write("{\"data\":[{\"result\":0}]}");//未登录
        else
        {
            string Oid = pbclas.GexMaxOid();
            Ocar.Uid = cInfo.mId;
            List<CarModel> _cookie_models = new List<CarModel>();
            _cookie_models = (List<CarModel>)HttpContext.Current.Session["carinfo"];
            if (_cookie_models.Count > 0)
            {
                _cookie_models.ForEach(t => t.Orderid = Oid.ToString());
            }
            Ocar.OModel = _cookie_models;
            Ocar.Orderid = Oid.ToString();
            if (pbclas.SaveOrderList(Ocar) == true)
            {
                HttpContext.Current.Session["carinfo"] = null;
                HttpContext.Current.Response.Write("{\"data\":[{\"result\":1}]}");//提交成功
            }
            else
                HttpContext.Current.Response.Write("{\"data\":[{\"result\":2}]}");//提交失败
        }
    }
    #endregion -------订单提交——————————————




    public void AddCar(HttpContext context)
    {
        context.Response.ContentType = "text/json";
        string str_json = Convert.ToString(context.Request["carinfo"]);
        string sql = string.Empty;
        JavaScriptSerializer jss = new JavaScriptSerializer();
        var cmodel = jss.Deserialize<CarModel>(str_json);
        cmodel.Stype = 0;
        List<CarModel> cookie_models = new List<CarModel>();
        if (HttpContext.Current.Session["carinfo"] != null)
        {
            List<CarModel> _cookie_models = new List<CarModel>();
            _cookie_models = (List<CarModel>)HttpContext.Current.Session["carinfo"];
            if (_cookie_models.Find(t => t.ProId == cmodel.ProId) == null)
            {
                decimal totalprice = 0;

                cmodel.CarChilds.ForEach(t =>
                {
                    sql = "select proprice from ProCarInfo where id=" + t.CId + "";
                    totalprice += Convert.ToDecimal(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null)) * int.Parse(t.Cnum);

                });
                cmodel.TotalPrice = totalprice;
                _cookie_models.Add(cmodel);
                HttpContext.Current.Session["carinfo"] = _cookie_models;
            }
        }
        else
        {
            decimal totalprice = 0;
            cmodel.CarChilds.ForEach(t =>
            {
                sql = "select proprice from ProCarInfo where id=" + t.CId + "";
                totalprice += Convert.ToDecimal(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null)) * int.Parse(t.Cnum);

            });
            cmodel.TotalPrice = totalprice;
            cookie_models.Add(cmodel);
            HttpContext.Current.Session["carinfo"] = cookie_models;
        }
        HttpContext.Current.Response.Write("0");

    }

    public void AddCar_QZ(HttpContext context)
    {
        context.Response.ContentType = "text/json";
        string str_json = Convert.ToString(context.Request["carinfo"]);
        string sql = string.Empty;
        try
        {
            JavaScriptSerializer jss = new JavaScriptSerializer();
            var cmodel = jss.Deserialize<CarModel>(str_json);
            cmodel.Stype = 1;//签证
            List<CarModel> cookie_models = new List<CarModel>();
            if (HttpContext.Current.Session["carinfo"] != null)
            {
                decimal totalprice = 0;
                List<CarModel> _cookie_models = new List<CarModel>();
                _cookie_models = (List<CarModel>)HttpContext.Current.Session["carinfo"];
                if (_cookie_models.Find(t => t.ProId == cmodel.ProId) == null)
                {
                    decimal _totalprice = 0;
                    sql = "select jiage from product where ID=" + cmodel.ProId + "";
                    _totalprice = Convert.ToDecimal(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null));
                    cmodel.CarChilds.ForEach(c =>
                    {
                        c.Price = Convert.ToString(_totalprice * int.Parse(c.Cnum));

                        totalprice = totalprice + Convert.ToDecimal(c.Price);
                    });
                    cmodel.TotalPrice = totalprice;
                    _cookie_models.Add(cmodel);
                    HttpContext.Current.Session["carinfo"] = _cookie_models;
                }
                HttpContext.Current.Response.Write("1");
            }
            else
            {
                decimal totalprice = 0;
                decimal _totalprice = 0;
                sql = "select jiage from product where ID=" + cmodel.ProId + "";
                _totalprice = Convert.ToDecimal(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null));
                cmodel.CarChilds.ForEach(c =>
                {
                    c.Price = Convert.ToString(_totalprice * int.Parse(c.Cnum));

                    totalprice = totalprice + Convert.ToDecimal(c.Price);
                });
                cmodel.TotalPrice = totalprice;
                cookie_models.Add(cmodel);
                HttpContext.Current.Session["carinfo"] = cookie_models;
                HttpContext.Current.Response.Write("1");
            }
        }
        catch (Exception ee)
        {
            HttpContext.Current.Response.Write("0");
        }



    }


    /// <summary>
    /// 移除购物车
    /// </summary>
    /// <param name="context"></param>
    public void DelCar(HttpContext context)
    {
        context.Response.ContentType = "text/json";
        string ProId = Convert.ToString(context.Request["pid"]);
        string sql = string.Empty;
        decimal order_total_price = 0;
         List<CarModel> cookie_models = new List<CarModel>();
         if (HttpContext.Current.Session["carinfo"] != null)
         {
             List<CarModel> _cookie_models = new List<CarModel>();
             _cookie_models = (List<CarModel>)HttpContext.Current.Session["carinfo"];
             var del_car = _cookie_models.Find(t => t.ProId == ProId);
             if (del_car != null)
             {
                 _cookie_models.Remove(del_car);
                 HttpContext.Current.Session["carinfo"] = _cookie_models;
                 foreach (CarModel model in _cookie_models)
                 {
                     order_total_price = order_total_price + model.TotalPrice;
                 }
                 HttpContext.Current.Response.Write("{\"data\":[{\"result\":1,\"num\":" + order_total_price + "}]}");
             }
         }
         else
         {
             HttpContext.Current.Response.Write("{\"data\":[{\"result\":0,\"num\":" + order_total_price + "}]}");
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