using System;
using System.Web.UI;

namespace System
{
    /// <summary>
    /// 页面消息类。
    /// </summary>
    public class Messages
    {
        public Messages()
        {
        }
        private static string ScriptBegin = "<script language=\"JavaScript\">";
        private static string ScriptEnd = "</script>";

        /// <summary>
        /// 对话框(确定会转到PageTarget页)
        /// </summary>
        /// <param name="PageTarget">转到的网址</param>
        /// <param name="Content">错误内容</param>
        public static void ConfirmMessageBox(string PageTarget, string Content)
        {
            string ConfirmContent = "var retValue=window.confirm('" + Content + "');" + "if(retValue){window.location='" + PageTarget + "';}";
            ConfirmContent = ScriptBegin + ConfirmContent + ScriptEnd;
            Page ParameterPage = (Page)System.Web.HttpContext.Current.Handler;
            ParameterPage.RegisterStartupScript("confirm", ConfirmContent);
        }
        /// <summary>
        /// 对话框(然后关闭窗体)
        /// </summary>
        /// <param name="Content">提示内容</param>
        public static void MessageClose(string Content)
        {
            string ConfirmContent = "var retValue=window.confirm('" + Content + "');" + "if(retValue){window.close();}";
            ConfirmContent = ScriptBegin + ConfirmContent + ScriptEnd;
            Page ParameterPage = (Page)System.Web.HttpContext.Current.Handler;
            ParameterPage.RegisterStartupScript("confirm", ConfirmContent);
        }
        /// <summary>
        /// 对话框(然后关闭窗体)
        /// </summary>
        /// <param name="PageTarget">转到的网址</param>
        /// <param name="Content">提示内容</param>
        public static void MessageClose(string PageTarget, string Content)
        {
            string ConfirmContent = "var retValue=window.confirm('" + Content + "');" + "if(retValue){window.close();}else{window.location='" + PageTarget + "';}";
            ConfirmContent = ScriptBegin + ConfirmContent + ScriptEnd;
            Page ParameterPage = (Page)System.Web.HttpContext.Current.Handler;
            ParameterPage.RegisterStartupScript("confirm", ConfirmContent);
        }
        /// <summary>
        /// 提示框
        /// </summary>
        /// <param name="Message">提示消息</param>
        public static void Message(string Message)
        {
            string ConfirmContent = "window.alert('" + Message + "');";
            ConfirmContent = ScriptBegin + ConfirmContent + ScriptEnd;
            Page ParameterPage = (Page)System.Web.HttpContext.Current.Handler;
            ParameterPage.RegisterStartupScript("confirm", ConfirmContent);
        }
        /// <summary>
        /// 提示框,重定向
        /// </summary>
        /// <param name="Message">提示消息</param>
        /// <param name="page">转到的网址</param>
        public static void Message(string Message, string page)
        {
            string ConfirmContent = "window.alert('" + Message + "');window.location='" + page + "';";
            ConfirmContent = ScriptBegin + ConfirmContent + ScriptEnd;
            Page ParameterPage = (Page)System.Web.HttpContext.Current.Handler;
            ParameterPage.RegisterStartupScript("confirm", ConfirmContent);
        }
        /// <summary>
        /// 关闭窗体
        /// </summary>
        public static void Close()
        {
            string ConfirmContent = "window.close();";
            ConfirmContent = ScriptBegin + ConfirmContent + ScriptEnd;
            Page ParameterPage = (Page)System.Web.HttpContext.Current.Handler;
            ParameterPage.RegisterStartupScript("close", ConfirmContent);
        }
    }
}
