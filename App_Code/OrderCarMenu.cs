using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///OrderCarMenu 的摘要说明
/// </summary>
public class OrderCarMenu
{
	public OrderCarMenu()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//

        

	}
    
    public string Orderid { get; set; }
    public string Uid { get; set; }
    public string Cxing { get; set; }
    public string Cname { get; set; }
    public string Exing { get; set; }
    public string Ename { get; set; }
    public string Email { get; set; }
    public string Mobile { get; set; }
    public string Mobile2 { get; set; }
    public string Remark { get; set; }
    public string Createtime { get; set; }
    public List<CarModel> OModel = new List<CarModel>(); 
}