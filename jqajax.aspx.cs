using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DLL;

public partial class jqajax : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            switch (Convert.ToString(Request["ntype"]))
            {
                case "reg":
                    memberreg();
                    break;
                case "log":
                    memberlogin();
                    break;
            }
            
            addguest();
            addcart();
            changenum();
            delpro();
            delproall();
            delproall();
            addorder();
        }
    }

    //登录
    private void memberlogin()
    {
        if (Convert.ToString(Request["ntype"])=="log" && (Request["lname"] + "" != "") &&(Request["pwd"] + "" != ""))
        {
            Response.Clear();
            string lname = Request["lname"].ToString();
            string pwd = Request["pwd"].ToString();
           
            
                string sql = "select Pwd from MemberList where Name1='" + lname + "'";
                string sql_pwd =OleDbHelper.ExecuteScalar(OleDbHelper.Conn,sql,null)+"";
                if (sql_pwd != "")
                {
                    if (sql_pwd == pwd)
                    {
                        string sql2 = "select Id from MemberList where Name1='" + lname + "' and Pwd='" + sql_pwd + "'";
                        string mid = OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql2, null) + "";
                        MemberInfo cInfo = new MemberInfo();

                        //cInfo.Load();
                        cInfo.mId = mid;
                        cInfo.OrderValue = lname;
                        cInfo.Save();

                        //HttpCookie cookie = new HttpCookie("xid");
                        //cookie.Values["loname"] = mid + "xuzx";
                        ////cookie.Values["randoncode"] = "xzhuox" + mid ;
                        //cookie.Expires = DateTime.Now.AddHours(1);
                        //Response.AppendCookie(cookie);
                        //CookieInfo2 cInfo2 = new CookieInfo2();
                        //cInfo2.mId = mid + "xuzx";
                        //cInfo2.Save(DateTime.Now.AddHours(1));

                        Response.Write("1");
                    }
                    else
                    {
                        Response.Write("4");
                    }
               
            }
        }
    }

    //注册
    private void memberreg()
    {
        if ((Request["ntype"] + "" != "") && (Request["ntype"].ToString() == "reg") && (Request["lname"] + "" != "") && (Request["pwd"] + "" != "") )
        {
            Response.Clear();
            string lname = Request["lname"].ToString();
            string pwd = Request["pwd"].ToString();
            string email = Request["lname"].ToString();

           
                string sql = "select Id from MemberList where Name1='" + lname + "'";
                string sql_id = OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null) + "";
                if (!string.IsNullOrWhiteSpace(sql_id))
                {
                    Response.Write("3");
                }
                else
                {
                    //string sql2 =  "select Id from MemberList where Name1='" + tjcode + "' and mDown = 1";
                   // string sql_id2 = OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql2, null) + "";
                
                        string sql3 = "insert into MemberList (Name1,Pwd,nEmail,ParId,CreateDate) values('" + lname + "','" + pwd + "','" + email + "',0,'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "')";
                        if (Igs(sql3))
                        {
                            Response.Write("1");
                        }
                        else
                        {
                            Response.Write("0");
                        }
                
            }
        }
    }

    //留言
    private void addguest()
    {
        if ((Request["gtitle"] + "" != "") && (Request["gname"] + "" != "") && (Request["gsex"] + "" != "") && (Request["gtel"] + "" != "") && (Request["gqq"] + "" != "") && (Request["gc"] + "" != ""))
        {
            Response.Clear();
            string gtitle = Request["gtitle"].ToString();
            string gname = Request["gname"].ToString();
            string gsex = Request["gsex"].ToString();
            string gtel = Request["gtel"].ToString();
            string gqq = Request["gqq"].ToString();
            string gc = Request["gc"].ToString();

            try
            {
                string sql = "insert into GuestBook(Title,RealName,Tel,Sex,QQ,[Content],CreateDate) values('" + gtitle + "','" + gname + "','" + gtel + "','" + gsex + "','" + gqq + "','" + gc + "','" + DateTime.Now.ToString() +"')";
                if (Public2.Igs(sql))
                {
                    Response.Write("1");
                }
                else
                {
                    Response.Write("2");
                }
            }
            catch(Exception ex)
            {
                Response.Write(ex);
            }
        }
    }

    //购物车
    private void addcart()
    {
        if ((Request["ntype"] + "" != "") && (Request["ntype"].ToString() == "order") && (Request["proId"] + "" != ""))
        {
            try
            {
                Response.Clear();
                string proId = Request["proId"] + "";
                CartInfo cart = new CartInfo();
                cart.Load();
                string[] oIds = cart.OrderId.Split('+');
                int i = 0;
                while (i < oIds.Length)
                {
                    if (oIds[i] == proId)
                    {
                        Response.Write("2");
                        return;
                    }
                    i++;
                }
                cart.OrderId += "+" + proId;
                cart.OrderNum +=  "+1";
                cart.Save(DateTime.Now.AddDays(1));
                Response.Write("1");
            }
            catch(Exception ex)
            {
                Response.Write(ex);
            }
        }
    }

    //修改订购数量
    private void changenum()
    {
        if ((Request["ntype"] + "" != "") && (Request["ntype"].ToString() == "changenum") && (Request["OrderId"] + "" != "") && (Request["OrderNum"] + "" != ""))
        {
            try
            {
                Response.Clear();
                string proId = Request["OrderId"] + "";
                string proNum = Request["OrderNum"] + "";
                CartInfo cart = new CartInfo();
                cart.Load();
                string[] oIds = cart.OrderId.Split('+');
                string[] oNums = cart.OrderNum.Split('+');
                int i = 0;
                while( i< oIds.Length )
                {
                    if(oIds[i]== proId)
                    {
                        oNums[i] = proNum;
                    }
                    i++;
                }
                cart.OrderNum = "0";
                for (int j = 1; j < oNums.Length;j++ )
                {
                    cart.OrderNum += "+" + oNums[j];
                }
                cart.Save(DateTime.Now.AddDays(1));

                string sql = "select Price2 from Products where Id="+ proId;
                string price = OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null) + "";
                price = Convert.ToString(Convert.ToDouble(proNum.Trim()) * Convert.ToDouble(price));

                Response.Write(price);
            }
            catch (Exception ex)
            {
                Response.Write("00");
            }
        }
    }

    //删除商品
    private void delpro()
    {
        if ((Request["ntype"] + "" != "") && (Request["ntype"].ToString() == "delpro") && (Request["OrderId"] + "" != ""))
        {
            try
            {
                Response.Clear();
                string proId = Request["OrderId"] + "";
                CartInfo cart = new CartInfo();
                cart.Load();
                string[] oIds = cart.OrderId.Split('+');
                string[] oNums = cart.OrderNum.Split('+');
                int i = 1;
                cart.OrderId = "0";
                cart.OrderNum = "0";
                while (i < oIds.Length)
                {
                    if (oIds[i] != proId)
                    {
                        cart.OrderNum += "+" + oNums[i];
                        cart.OrderId += "+" + oIds[i];
                    }
                    i++;
                }
                cart.Save(DateTime.Now.AddDays(1));
                Response.Write("1");
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
    }

    //删除所有商品
    private void delproall()
    {
        if ((Request["ntype"] + "" != "") && (Request["ntype"].ToString() == "delproall"))
        {
            try
            {
                Response.Clear();
                CartInfo cart = new CartInfo();
                cart.OrderId = "0";
                cart.OrderNum = "0";
                cart.Save();
                Response.Write("1");
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
    }

    //下订单
    private void addorder()
    {
        if ((Request["ntype"] + "" != "") && (Request["ntype"].ToString() == "addorder") && (Request["mid"] + "" != "") && (Request["mAddress"] + "" != "") && (Request["mZip"] + "" != "") && (Request["mRelname"] + "" != "") && (Request["mTel"] + "" != "") && (Request["nPrice"] + "" != "") && (Request["nPoints"] + "" != ""))
        {
            Response.Clear();
            try
            {
                string mid = Request["mid"] + "";
                string maddress = Server.UrlDecode(Request["mAddress"]);
                string mzip = Server.UrlDecode(Request["mZip"]);
                string mrelname = Server.UrlDecode(Request["mRelname"]);
                string mtel = Server.UrlDecode(Request["mTel"]);
                string ntime1 = Server.UrlDecode(Request["ntime1"] + "");
                string ntime2 = Server.UrlDecode(Request["ntime2"] + "");
                string nguest = Server.UrlDecode(Request["nguest"] + "");
                string nPrice = Server.UrlDecode(Request["nPrice"]);
                string nPoints = Server.UrlDecode(Request["nPoints"]);
                string noid = shang();

                bool tf = true;

                CartInfo cart = new CartInfo();
                cart.Load();
                if ((cart.OrderId != "0") && (cart.OrderNum != "0"))
                {
                    string[] oIds = cart.OrderId.Split('+');
                    string[] oNums = cart.OrderNum.Split('+');

                    if (oIds.Length == oNums.Length)
                    {
                        for (int i = 1; i < oIds.Length; i++)
                        {
                            if (tf)
                            {
                                string id = oIds[i];
                                string num = oNums[i];
                                string proname = protitle(id);
                                string price = relprices(id);
                                string allprice = allprices(price, num);
                                string sql = "insert into OrderInfo(MemberId,OrderId,ProId,ProName,ProNum,Price2,allPrices,CreateDate)values(" + mid + ",'" + noid + "','" + id + "','" + proname + "','" + num + "','" + price + "','" + allprice + "','" + DateTime.Now.ToString() + "')";
                                if (Igs(sql))
                                {
                                    tf = true;
                                }
                                else
                                {
                                    tf = false;
                                }
                            }
                            else
                            {
                                break;
                            }
                        }
                    }
                    else
                    {
                        tf = false;
                    }

                }
                else
                {
                    tf = false;
                }

                if (tf)
                {
                    string sql = "insert into  OrderList(MemberId,NoId,Points,AllPrice,RelName,Tel,nTime,Address,Zip,guests,CreateDate)values(" + mid + ",'" + noid + "','" + nPoints + "','" + nPrice + "','" + mrelname + "','" + mtel + "','" + ntime1 + "&nbsp;&nbsp;&nbsp;" + ntime2 + "','" + maddress + "','" + mzip + "','" + nguest + "','" + DateTime.Now.ToString() + "')";
                    if (Igs(sql))
                    {
                        tf = true;
                        try
                        {
                            string msql = "update MemberList set newPoints = Points+" + nPoints + ",allPoints=allpoints+" + nPoints + "  where Id=" + mid;
                            Igs(msql);
                            CartInfo clearcar = new CartInfo();
                            clearcar.OrderId = "0";
                            clearcar.OrderNum = "0";
                            clearcar.Save();
                        }
                        catch { }
                    }
                    else
                    {
                        tf = false;
                    }
                }

                if (tf)
                {
                    Response.Write("1");
                }
                else
                {
                    Response.Write("2");
                }
            }
            catch(Exception ex)
            {
                Response.Write(ex);
            }
        }
    }

    //订单编号
    private string shang()
    {
        Random rn = new Random();
        int n = 0;
        string m;
        n = rn.Next(1000, 9999);
        m = DateTime.Now.ToString("yyyyMMddhhmmss") + n.ToString();
        return m;
    }

    //商品名称
    private string protitle(string id)
    {
        string temp = "";
        try
        {
            string sql = "select Title from Products where Id= " + id;
            temp = OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null) + "";
        }
        catch { }
        return temp;
    }

    //单个商品销售价
    private string relprices(string id)
    {
        string temp = "0";
        try
        {
            string sql = "select Price2 from Products where Id= " + id;
            temp = OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null) + "";
        }
        catch { }
        return temp;
    }

    //一个商品的总价
    private string allprices(string price, string num)
    {
        string temp = "";
        try
        {
            temp = Convert.ToString(Convert.ToDouble(price) * Convert.ToDouble(num));
        }
        catch { }
        return temp;
    }

    //返回bool类型
    private bool Igs(string sql)
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
}
