using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///FavoriteInfo 的摘要说明
/// </summary>
public class FavoriteInfo : CookieInfo
{
	public FavoriteInfo()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}

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
}