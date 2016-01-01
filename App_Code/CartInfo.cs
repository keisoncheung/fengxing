using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;

/// <summary>
///CartInfo 的摘要说明
/// </summary>
[System.Serializable]
public class CartInfo : CookieInfo
{


    private string m_OrderId = "0";


    public string OrderId
    {
        get
        {
            return m_OrderId;
        }
        set
        {
            m_OrderId = value;
        }
    }


    private List<CarModel> _CModels=new List<CarModel>();

    public List<CarModel> CModels
    {
        get
        {
            return _CModels;
        }
        set
        {
            _CModels = value;
        }
    }
    private string m_OrderNum = "0";
    public string OrderNum
    {
        get
        {
            return m_OrderNum;
        }
        set
        {
            m_OrderNum = value;
        }
    }

    private DateTime m_oDateTime = DateTime.Now;
    public DateTime oDateTime
    {
        get
        {
            return m_oDateTime;
        }
        set
        {
            m_oDateTime = value;
        }
    }
}
