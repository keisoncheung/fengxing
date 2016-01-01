using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

/// <summary>
///ShopInfo 的摘要说明
/// </summary>
public class ShopInfo : CookieInfo
{

    private string shop_sid = "0";
    public string shopSid
    {
        get
        {
            return shop_sid;
        }
        set
        {
            shop_sid = value;
        }
    }

    

    private string shop_name = "0";
    public string ShopName
    {
        get
        {
            return shop_name;
        }
        set
        {
            shop_name = value;
        }
    }

    private DateTime shop_oDateTime = DateTime.Now;
    public DateTime ShopoDateTime
    {
        get
        {
            return shop_oDateTime;
        }
        set
        {
            shop_oDateTime = value;
        }
    }
}

