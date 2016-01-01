using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using DLL;
using System.Drawing;
using System.IO;

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


      public int GetTotalBuyRecord(string pid)
      {
          int num = 0;
          string sql = "select count(uid) as num from OrderCarMenu where orderid in (select orderid from OrderCarPro where Proid=" + pid + ") group by uid;";

          DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
          foreach (DataRow dr in dt.Rows)
          {

              num = Convert.ToInt32(dr["num"]);
          }

          return num;
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
                          else if (t.Stype == 1)
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
                 OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, "insert into AdminUser(Content)values('"+ee.ToString()+"');", null);
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


    /// <summary>
    /// 删除订单
    /// </summary>
    /// <param name="oid"></param>
    /// <param name="uid"></param>
    /// <returns></returns>
      public bool DelOrder(string oid,string uid)
      {
          bool bl = false;
          string sql = "select count(orderid) from OrderCarMenu where uid="+uid+" and orderid='"+oid+"'; ";
          int num = Convert.ToInt32(OleDbHelper.ExecuteScalar(OleDbHelper.Conn,sql,null));
          if (num == 0)
          {
              return bl;
          }
          else
          {
              sql = "update  OrderCarMenu set style=1 where uid=" + uid + " and orderid='" + oid + "'; ";
              OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
              bl = true;
          }
          return bl;
      }


      public bool SavePic(string imgurl)
      {
          bool bl = false;
          try
          {
              string filePath = imgurl;
              string path = "pic\\";
              Bitmap map = new Bitmap(filePath);
              string fileName = Path.GetFileName(filePath);
              string mapPath = HttpContext.Current.Server.MapPath("~");
              string savePath = mapPath + "\\" + path + fileName;
              map.Save(savePath);
              bl = true;
          }
          catch (Exception ee)
          {
              bl = false;
          }

          return bl;

      }


    /// <summary>
    /// 获取会员信息
    /// </summary>
    /// <param name="uid"></param>
    /// <returns></returns>
      public MemberList GetMenberInfo(string uid)
      {
          MemberList menber = new MemberList();
          string sql = "select " + menber.Field + " from MemberList where id="+uid+" ;";
          DataTable dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
          foreach (DataRow dr in dt.Rows)
          {
              menber.Id = Convert.ToString(dr["Id"]);
              menber.Name1 = Convert.ToString(dr["Name1"]);
              menber.Name2 = Convert.ToString(dr["Name2"]);
              menber.nEmail = Convert.ToString(dr["nEmail"]);
              menber.nSex = Convert.ToString(dr["nSex"]);
              menber.Bpic = Convert.ToString(dr["Bpic"]);
              menber.Chinesename = Convert.ToString(dr["Chinesename"]);
              menber.tel = Convert.ToString(dr["tel"]);
              menber.zhengjian = Convert.ToString(dr["zhengjian"]);
          }
          return menber;
      }

    /// <summary>
    /// 保存个人信息
    /// </summary>
    /// <param name="info"></param>
    /// <returns></returns>
      public bool SaveMemberInfo(MemberList info)
      {
          bool bl = false;
          StringBuilder sbr = new StringBuilder();

          if(!string.IsNullOrWhiteSpace(info.Pwd))
              sbr.Append(" ,Pwd='"+info.Pwd+"' ");

          try
          {
              //if (SavePic(info.Bpic)==false)
              //{

              //    return bl;
              //}
              string sql=string.Empty;
              if(string.IsNullOrWhiteSpace(Convert.ToString(info.Bpic)))
               sql = "update MemberList set nEmail='" + Convert.ToString(info.nEmail) + "',Chinesename='" + Convert.ToString(info.Chinesename) + "',Name2='" + Convert.ToString(info.Name2) + "',nSex='" + Convert.ToString(info.nSex) + "',zhengjian='" + Convert.ToString(info.zhengjian) + "',tel='" + Convert.ToString(info.tel) + "',ModifyDate='"+DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")+"'  " + sbr.ToString() + "  where id=" + info.UId + ";";
              else
                  sql = "update MemberList set ModifyDate='" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',bpic='"+info.Bpic+"'  where id=" + info.UId + ";";
              OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
              bl = true;
          }
          catch (Exception ee)
          {
              bl = false;
          }
          return bl;
      }



    /// <summary>
    /// 加入收藏
    /// </summary>
    /// <param name="pid"></param>
    /// <param name="uid"></param>
    /// <returns></returns>
      public string AddMyFavorite(string pid,string uid)
      {
          string str = "-1";
          string sql = "select count(id) from tblMyFavorite where uid=" + uid + " and proid=" + pid + "; ";
          
          int num = Convert.ToInt32(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null));
          if (num == 0)
          {
              sql = "insert into tblMyFavorite (Uid,proid,createtime)values(" + uid + "," + pid + ",'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "'); ";
              OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
              str = "1";
          }
          else
          {
              str = "2";
          }
          return str;
      }


      /// <summary>
      /// 删除收藏
      /// </summary>
      /// <param name="pid"></param>
      /// <param name="uid"></param>
      /// <returns></returns>
      public string DelMyFavorite(string pid, string uid)
      {
          string str = "-1";
          string sql = "select count(id) from tblMyFavorite where uid=" + uid + " and proid=" + pid + "; ";

          int num = Convert.ToInt32(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null));
          if (num == 1)
          {
              sql = "delete from  tblMyFavorite where uid=" + uid + " and proid=" + pid + "; ";
              OleDbHelper.ExecuteNonQuery(OleDbHelper.Conn, sql, null);
              str = "1";
          }
          else
          {
              str = "2";
          }
          return str;
      }


    /// <summary>
    /// 获取总的收藏数量
    /// </summary>
    /// <returns></returns>
      public int GetTotalFavorite(string pid=null,string uid=null)
      {
          int num = 0;
          StringBuilder sbr = new StringBuilder();
          sbr.Append(" where 1=1 ");
          if (!string.IsNullOrEmpty(Convert.ToString(pid)))
              sbr.Append(" and proid=" + pid + " ");
          else
              if(!string.IsNullOrEmpty(Convert.ToString(uid)))
                  sbr.Append(" and uid=" + uid + " ");
          string sql = "select count(proid) as totnums from tblMyFavorite "+sbr.ToString()+";";
          num = Convert.ToInt32(OleDbHelper.ExecuteScalar(OleDbHelper.Conn, sql, null));
          return num;
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


    /// <summary>
    /// 获取文章列表
    /// </summary>
    /// <param name="parid"></param>
    /// <returns></returns>
      public DataTable GetNews(string parid,int num)
      {
          DataTable dt = new DataTable();
          StringBuilder sbr = new StringBuilder();
          string sql = "select top " + num + " id,Title,Content,canshu,CreateDate,tjzhishu,Picture from news where parid=" + parid + " order by id desc ";
          dt = OleDbHelper.ExecuteDataSet(OleDbHelper.Conn, sql, null).Tables[0];
          return dt;

      }

}