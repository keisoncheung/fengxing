using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Collections.Specialized;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;

public partial class Default2 : System.Web.UI.Page
{
   
    private static Random RndSeed = new Random();

    public string GenerateRndNonce()
    {
        return (RndSeed.Next(1, 0x5f5e0ff).ToString("00000000") + RndSeed.Next(1, 0x5f5e0ff).ToString("00000000") +
                RndSeed.Next(1, 0x5f5e0ff).ToString("00000000") + RndSeed.Next(1, 0x5f5e0ff).ToString("00000000"));
    }

    public string file_get_contents(string url, Encoding encode)
    {
        HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(url);
        WebResponse response = request.GetResponse();
        using (MemoryStream ms = new MemoryStream())
        {
            using (Stream stream = response.GetResponseStream())
            {
                int readc;
                byte[] buffer = new byte[1024];
                while ((readc = stream.Read(buffer, 0, buffer.Length)) > 0)
                {
                    ms.Write(buffer, 0, readc);
                }
            }
            return encode.GetString(ms.ToArray());
        }
    }

    NameValueCollection ParseJson(string json_code)
    {
        NameValueCollection mc = new NameValueCollection();
        Regex regex = new Regex(@"(\s*\""?([^""]*)\""?\s*\:\s*\""?([^""]*)\""?\,?)");
        json_code = json_code.Trim();
        if (json_code.StartsWith("{"))
        {
            json_code = json_code.Substring(1, json_code.Length - 2);
        }
        foreach (Match m in regex.Matches(json_code))
        {
            mc.Add(m.Groups[2].Value, m.Groups[3].Value);
            //Response.Write(m.Groups[2].Value + "=" + m.Groups[3].Value + "<br/>");
        }
        return mc;
    }
    NameValueCollection ParseUrlParameters(string str_params)
    {
        NameValueCollection nc = new NameValueCollection();
        foreach (string p in str_params.Split('&'))
        {
            string[] p_s = p.Split('=');
            nc.Add(p_s[0], p_s[1]);
        }
        return nc;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //应用的APPID
        string app_id = "101204188";
        //应用的APPKEY
        string app_secret = "bfe8a1ca9d7c7261ecb799814b5113a6";
        //成功授权后的回调地址
        string my_url = "http://fx.2010.net.cn/";

        //Step1：获取Authorization Code
        //session_start();
        string code = Request.QueryString["code"];
        if (string.IsNullOrEmpty(code))
        {
            //state参数用于防止CSRF攻击，成功授权后回调时会原样带回
            Session["state"] = GenerateRndNonce();//md5(uniqid(rand(), TRUE)); 
            //拼接URL     
            string dialog_url = "https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id="
               + app_id + "&redirect_uri=" + Server.UrlEncode(my_url) + "&state="
               + Session["state"];
            Response.Write("<script> location.href='" + dialog_url + "'</script>");
            Response.End();
        }

        //Step2：通过Authorization Code获取Access Token
        if (Request["state"].ToString().Equals(Session["state"].ToString()))
        {
            //拼接URL   
            string token_url = "https://graph.qq.com/oauth2.0/token?grant_type=authorization_code&"
            + "client_id=" + app_id + "&redirect_uri=" + Server.UrlEncode(my_url)
            + "&client_secret=" + app_secret + "&code=" + code;
            string response = file_get_contents(token_url, Encoding.UTF8);
            NameValueCollection msg;
            if (response.IndexOf("callback") != -1)
            {
                int lpos = response.IndexOf("(");
                int rpos = response.IndexOf(")");
                response = response.Substring(lpos + 1, rpos - lpos - 1);
                msg = ParseJson(response);

                if (!string.IsNullOrEmpty(msg["error"]))
                {
                    Response.Write("<h3>error:</h3>" + msg["error"].ToString());
                    Response.Write("<h3>msg  :</h3>" + msg["error_description"]);
                    Response.End(); return;
                }
            }
            Response.Write(response);
            //Step3：使用Access Token来获取用户的OpenID
            NameValueCollection ps = ParseUrlParameters(response);
            //*parse_str($response, $params);
            string graph_url = "https://graph.qq.com/oauth2.0/me?access_token=" + ps["access_token"];
            string str = file_get_contents(graph_url, Encoding.Default);
            if (str.IndexOf("callback") != -1)
            {
                int lpos = str.IndexOf("(");
                int rpos = str.IndexOf(")");
                str = str.Substring(lpos + 1, rpos - lpos - 1);
            }
            NameValueCollection user = ParseJson(str);
            

            if (!string.IsNullOrEmpty(user["error"]))
            {
                Response.Write("<h3>error:</h3>" + user["error"]);
                Response.Write("<h3>msg  :</h3>" + user["error_description"]);
                Response.End();
            }
            Response.Write("Hello " + user["nickname"]);
        }
        else
        {
            Response.Write("The state does not match. You may be a victim of CSRF.request=" + Request["state"] + ",session=" + Session["state"]);
        }

        Response.End();
    }
}