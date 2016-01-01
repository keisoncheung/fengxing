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
using System.Collections.Generic;


public partial class cart : System.Web.UI.Page
{
    public string pid = string.Empty;
    public Hashtable output = new Hashtable();
    protected void Page_Load(object sender, EventArgs e)
    {
        // carinfo();
    }

    private void carinfo()
    {
        try
        {
            List<CarModel> cookie_models = new List<CarModel>();
            string sql = string.Empty;
            if (Session["carinfo"] != null)
            {
                List<CarModel> _cookie_models = new List<CarModel>();
                _cookie_models = (List<CarModel>)Session["carinfo"];
            }
            if (cookie_models.Count > 0)
            {
                foreach (CarModel model in cookie_models)
                {
                    sql = "select a.id,a.title,a.stype,a.proprice,b.pictureb,b.proname from ProCarInfo a join product b  on a.proid=b.id  where a.";
                    DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
                    foreach (DataRow dr in dt.Rows)
                    {
                        
                    }
                }
            }
        }
        catch { 
        }
    }
    //商品订购数量
    public string pronum(int i)
    {
        string temp = "1";
        CartInfo cart = new CartInfo();
        cart.Load();
        if (cart.OrderId != "0")
        {
            string[] oNums = cart.OrderNum.Split('+');
            temp = oNums[i].ToString().Trim();
        }
        return temp;
    }

    //单个商品总额
    public string allprices(string num, string price)
    {
        string allprice = "";
        allprice = Convert.ToString(Convert.ToDouble(num) * Convert.ToDouble(price));
        return allprice;
    }
}