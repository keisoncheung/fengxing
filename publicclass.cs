using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using DLL;

/// <summary>
///publicclass 的摘要说明
/// </summary>
public class publicclass
{


	public publicclass()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//

	}


    /// <summary>
    /// 获取订单最大值
    /// </summary>
    /// <returns></returns>
      public string GexMaxOid()
    {
        string maxSeq = "200021247";
        Random rd = new Random();
        int i = rd.Next(1, 1024);
        maxSeq = DateTime.Now.ToString("yyyyMMddHHmmss")+i;
          
        //string sql = "select count(Orderid) as cnum from OrderCarMenu";
        //if (Convert.ToInt32(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null)) == 0)
        //    maxSeq = DateTime.Now.ToString("yyyyMMddHHmmss"+i);
        //else
        //{
        //    sql = "select max(Orderid)+1 as cnum from OrderCarMenu;";
        //    maxSeq = Convert.ToString(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null));
        //}
        return maxSeq;
        
    }


    /// <summary>
    /// 订单提交
    /// </summary>
    /// <param name="carmenu"></param>
    /// <returns></returns>
      public bool SaveOrderList(OrderCarMenu carmenu)
      {
          bool bl = false;
          StringBuilder sbr = new StringBuilder();
          string sql = string.Empty;
          carmenu.Orderid = GexMaxOid();
          if (carmenu != null && !string.IsNullOrWhiteSpace(carmenu.Orderid))
          {
              try
              {
                  sql = "insert into OrderCarMenu(Orderid,Uid,Cxing,Cname,Exing,Ename,Email,Mobile,Mobile2,Remark,Createtime)values(" + Convert.ToString(carmenu.Orderid) + ",'" + Convert.ToString(carmenu.Uid) + "','" + Convert.ToString(carmenu.Cxing) + "','" + Convert.ToString(carmenu.Cname) + "','" + Convert.ToString(carmenu.Exing) + "','" + Convert.ToString(carmenu.Ename) + "','" + Convert.ToString(carmenu.Email) + "','" + Convert.ToString(carmenu.Mobile) + "','" + Convert.ToString(carmenu.Mobile2) + "','" + Convert.ToString(carmenu.Remark) + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "');";
                  OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
                  if (carmenu.OModel.Count > 0)
                  {
                      carmenu.OModel.ForEach(t =>
                      {

                          if (t.Stype == 0)
                          {
                              sql = "insert into OrderCarPro(Orderid,Proid,Godate,TotalPrice,stype,Createtime)values('" + carmenu.Orderid + "','" + t.ProId + "','" + t.GoDate + "','" + t.TotalPrice + "'," + t.Stype + ",'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "');";
                          }
                          else
                          {
                              sql = "insert into OrderCarPro(Orderid,Proid,Godate,DQ_QZ,TotalPrice,stype,Createtime)values('" + carmenu.Orderid + "','" + t.ProId + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',"+t.DQ_QZ+",'" + Convert.ToString(t.TotalPrice) + "'," + t.Stype + ",'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "');";
                          }
                          OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
                          if (t.CarChilds.Count > 0)
                          {
                              t.CarChilds.ForEach(o =>
                              {
                                 
                                  sql = "insert into CarChild(Orderid,Proid,Cid,Price,Cnum)values('" + carmenu.Orderid + "','" + t.ProId + "','" + o.CId + "','" + o.Price + "'," + o.Cnum + ");";
                                  OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
                              });
                          }
                      });
                  }
                      bl = true;
              }
              catch (Exception ee)
              {
              }
          }
          return bl;
      }

      public string GetCarProUrl(string proid)
      {
          string url = string.Empty;
          string sql = "select sfzyx,yw_country from product where id=" + proid + "";
          DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
          foreach (DataRow dr in dt.Rows)
          {
              switch (Convert.ToString(dr["sfzyx"]))
              {
                  case "1":
                      url = "";
                      break;
                  case "2":
                      url = "dingzhishow.aspx?pro_id=" + proid + "";
                      break;
                  case "3":
                      url = "tuanduily_show.aspx?pro_id="+proid+"";
                      break;
                  case "4":
                      url = "qianzheng.aspx?gj=" + dr["yw_country"] + "";
                      break;
                  case "0":
                      url = "aozhou_show.aspx?pro_id=" + proid + "";
                      break;
              }
          }
          return url;

      }

      /// 一键分享微博
      /// </summary>
      /// <returns></returns>
      public static string ShareWeibo()
      {
          StringBuilder sbr = new StringBuilder();
          sbr.Append(@"<a class='bshareDiv' href='http://www.bshare.cn/share'>分享按钮</a><script type='text/javascript' charset='utf-8' src='http://static.bshare.cn/b/buttonLite.js#uuid=&amp;style=3&amp;fs=4&amp;textcolor=#fff&amp;bgcolor=#F60&amp;text=分享到&amp;pophcol=3'></script>");
          return sbr.ToString();
      }
    

}