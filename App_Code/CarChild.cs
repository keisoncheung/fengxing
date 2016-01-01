using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///CarChild 的摘要说明
/// </summary>
public class CarChild
{
	public CarChild()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    public string Proid { get; set; }
    public string CId { get; set; }
    public string Price { get; set; }
    private string cnum = "0";
    public string Cnum
    {
        get
        {
            return cnum;
        }
        set
        {
            cnum = value;
        }
    }
}