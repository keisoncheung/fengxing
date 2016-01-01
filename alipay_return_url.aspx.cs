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
using System.Collections.Specialized;
using System.Collections.Generic;
using Com.Alipay;
using System.Text;
using DLL;


/// <summary>
/// 功能：页面跳转同步通知页面
/// 版本：3.3
/// 日期：2012-07-10
/// 说明：
/// 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
/// 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
/// 
/// ///////////////////////页面功能说明///////////////////////
/// 该页面可在本机电脑测试
/// 可放入HTML等美化页面的代码、商户业务逻辑程序代码
/// 该页面可以使用ASP.NET开发工具调试，也可以使用写文本函数LogResult进行调试
/// </summary>
public partial class alipay_return_url : System.Web.UI.Page
{
    public StringBuilder sbr = new StringBuilder();
    protected void Page_Load(object sender, EventArgs e)
    {
        sbr.Clear();
        SortedDictionary<string, string> sPara = GetRequestGet();

        if (sPara.Count > 0)//判断是否有带返回参数
        {
            Notify aliNotify = new Notify();
            bool verifyResult = aliNotify.Verify(sPara, Request.QueryString["notify_id"], Request.QueryString["sign"]);

            if (verifyResult)//验证成功
            {
                /////////////////////////////////////////////////////////////////////////////////////////////////////////////
                //请在这里加上商户的业务逻辑程序代码


                //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
                //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表

                //商户订单号

                string out_trade_no = Request.QueryString["out_trade_no"];

                //支付宝交易号

                string trade_no = Request.QueryString["trade_no"];

                //交易状态
                string trade_status = Request.QueryString["trade_status"];


                if (Request.QueryString["trade_status"] == "TRADE_FINISHED" || Request.QueryString["trade_status"] == "TRADE_SUCCESS")
                {
                    //判断该笔订单是否在商户网站中已经做过处理
                    //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                    //如果有做过处理，不执行商户的业务程序
                   // Response.Write("支付成功！<br />订单号：" + out_trade_no + "<br />");
                    sbr.Append("支付成功！<br />订单号：" + out_trade_no + "<br />");
                    isPayUpdateLoc(out_trade_no);
                }
                else
                {
                    //Response.Write("支付失败！trade_status=" + Request.QueryString["trade_status"]);
                    sbr.Append("支付失败！trade_status=" + Request.QueryString["trade_status"]);
                }

                //打印页面
                //Response.Write("验证成功<br />");
                sbr.Append("<a href='myorder2.aspx'>返回我的订单</a>");
                //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////
            }
            else//验证失败
            {
                //Response.Write("验证失败");
                sbr.Append("验证失败 <a href='myorder2.aspx'>返回我的订单</a>");
            }
        }
        else
        {
            //Response.Write("无返回参数");
            sbr.Append("无返回参数");
        }
    }

    /// <summary>
    /// 获取支付宝GET过来通知消息，并以“参数名=参数值”的形式组成数组
    /// </summary>
    /// <returns>request回来的信息组成的数组</returns>
    public SortedDictionary<string, string> GetRequestGet()
    {
        int i = 0;
        SortedDictionary<string, string> sArray = new SortedDictionary<string, string>();
        NameValueCollection coll;
        //Load Form variables into NameValueCollection variable.
        coll = Request.QueryString;

        // Get names of all forms into a string array.
        String[] requestItem = coll.AllKeys;

        for (i = 0; i < requestItem.Length; i++)
        {
            sArray.Add(requestItem[i], Request.QueryString[requestItem[i]]);
        }

        return sArray;
    }

    public void isPayUpdateLoc(string tid)
    {
        string UId = string.Empty;
        MemberInfo cInfo = new MemberInfo();
        cInfo.Load();
        if (string.IsNullOrWhiteSpace(Convert.ToString(cInfo.mId)) || cInfo.mId == "0")
        {
            HttpContext.Current.Session["gocar"] = "myorder2.aspx";
            Response.Redirect("login.aspx");
        }
        else
            UId = cInfo.mId;

        string sql = "update OrderCarMenu set IsPay=1 where Orderid='" + tid + "' and uid=" + UId + "; ";
        OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
    }
}
