using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///CarModel 的摘要说明
/// </summary>
public class CarModel
{
	public CarModel()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
      
	}
    public string Orderid { get; set; }
    public string ProId { get; set; }
    public string GoDate { get; set; }
    public decimal TotalPrice  { get; set; }

    public string DQ_QZ { get; set; }
    public string BX_QZ { get; set; }
    public int Stype { get; set; }

    public List<CarChild> CarChilds = new List<CarChild>();
    

}