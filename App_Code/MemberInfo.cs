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
///MemberInfo 的摘要说明
/// </summary>
[System.Serializable]
public class MemberInfo : CookieInfo
{
    private string m_mId = "0";
    public string mId
    {
        get
        {
            return m_mId;
        }
        set
        {
            m_mId = value;
        }
    }

    private string m_OrderValue = "0";
    public string OrderValue
    {
        get
        {
            return m_OrderValue;
        }
        set
        {
            m_OrderValue = value;
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
