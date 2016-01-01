using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Xml;
using Com.Alipay;
using DLL;

/// <summary>
/// 功能：即时到账交易接口接入页
/// 版本：3.3
/// 日期：2012-07-05
/// 说明：
/// 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
/// 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
/// 
/// /////////////////注意///////////////////////////////////////////////////////////////
/// 如果您在接口集成过程中遇到问题，可以按照下面的途径来解决
/// 1、商户服务中心（https://b.alipay.com/support/helperApply.htm?action=consultationApply），提交申请集成协助，我们会有专业的技术工程师主动联系您协助解决
/// 2、商户帮助中心（http://help.alipay.com/support/232511-16307/0-16307.htm?sh=Y&info_type=9）
/// 3、支付宝论坛（http://club.alipay.com/read-htm-tid-8681712.html）
/// 
/// 如果不想使用扩展功能请把扩展功能参数赋空值。
/// </summary>
public partial class alipay : System.Web.UI.Page
{
    public string UId = string.Empty;
    public string ispay = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["oid"] != null)
        {
            MemberInfo cInfo = new MemberInfo();
            cInfo.Load();
            if (string.IsNullOrWhiteSpace(Convert.ToString(cInfo.mId)) || cInfo.mId == "0")
            {
                HttpContext.Current.Session["gocar"] = "myorder2.aspx";
                Response.Redirect("login.aspx");
            }
            else
                UId = cInfo.mId;

            GotoPay(Request["oid"] + "");
        }
    }
    protected void BtnAlipay_Click(object sender, EventArgs e)
    {

        if (ispay == "1")
        {
            Messages.Message("该订单已支付！无需重复支付！", "myorder2.aspx");
            return;
        }

        ////////////////////////////////////////////请求参数////////////////////////////////////////////

        //支付类型
        string payment_type = "1";
        //必填，不能修改
        //服务器异步通知页面路径
        string notify_url = "http://fx.2010.net.cn/notify_url.aspx";
        //需http://格式的完整路径，不能加?id=123这类自定义参数

        //页面跳转同步通知页面路径
        string return_url = "http://fx.2010.net.cn/alipay_return_url.aspx";
        //需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/

        //商户订单号
        string out_trade_no = tbxoid.Text.Trim();
        //商户网站订单系统中唯一订单号，必填

        //订单名称
        string subject = tbxproname.Text.Trim();
        //必填

        //付款金额
        string total_fee = tbxTotalPrice.Text.Trim();
        //必填

        //订单描述

        string body = "";
        //商品展示地址
        string show_url = "";
        //需以http://开头的完整路径，例如：http://www.fx.2010.net.cn.com/myorder.html

        //防钓鱼时间戳
        string anti_phishing_key = "";
        //若要使用请调用类文件submit中的query_timestamp函数

        //客户端的IP地址
        string exter_invoke_ip = "";
        //非局域网的外网IP地址，如：221.0.0.1


        ////////////////////////////////////////////////////////////////////////////////////////////////

        //把请求参数打包成数组
        SortedDictionary<string, string> sParaTemp = new SortedDictionary<string, string>();
        sParaTemp.Add("partner", Config.Partner);
        sParaTemp.Add("seller_email", Config.Seller_email);
        sParaTemp.Add("_input_charset", Config.Input_charset.ToLower());
        sParaTemp.Add("service", "create_direct_pay_by_user");
        sParaTemp.Add("payment_type", payment_type);
        sParaTemp.Add("notify_url", notify_url);
        sParaTemp.Add("return_url", return_url);
        sParaTemp.Add("out_trade_no", out_trade_no);
        sParaTemp.Add("subject", subject);
        sParaTemp.Add("total_fee", total_fee);
        sParaTemp.Add("body", body);
        sParaTemp.Add("show_url", show_url);
        sParaTemp.Add("anti_phishing_key", anti_phishing_key);
        sParaTemp.Add("exter_invoke_ip", exter_invoke_ip);

        //建立请求
        string sHtmlText = Submit.BuildRequest(sParaTemp, "get", "确认");
        Response.Write(sHtmlText);
    }



    public void GotoPay(string oid)
    {

        decimal TotalPrice = 0;
        string sql = "select * from OrderCarMenu where Orderid='" + oid + "' and uid=" + UId + "; ";
        DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
        foreach (DataRow dr in dt.Rows)
        {
            ispay = Convert.ToString(dr["ispay"]);
            tbxoid.Text = oid;
            sql = "select proname from product  where id in (select proid from OrderCarPro where orderid='"+dr["orderid"]+"' );";
            DataTable dt2 = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
            foreach (DataRow dr2 in dt2.Rows)
            {
                tbxproname.Text = Convert.ToString(dr2["proname"]);
            }
            sql = "select  iif(isnull(totalprice),0,totalprice)as totalprice from OrderCarPro where Orderid='" + dr["Orderid"] + "';";
            TotalPrice = Convert.ToDecimal(DLL.OleDbHelper.ExecuteScalar(DLL.OleDbHelper.Conn, sql, null));
            tbxTotalPrice.Text = TotalPrice.ToString();
           
        }
    }
}