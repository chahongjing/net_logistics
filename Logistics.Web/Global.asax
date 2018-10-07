<%@ Application Language="C#" Debug="true" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Web.Compilation" %>
<%@ Import Namespace="BaseFrameWork" %>
<%@ Import Namespace="BaseFrameWork.Initial" %>
<%@ Import Namespace="BaseFrameWork.Config" %>
<%@ Import Namespace="BaseFrameWork.MVC" %>
<%@ Import Namespace="BaseFrameWork.Exceptions" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Linq" %>

<script Language="C#" RunAt="server">
    Boolean isLogToDB = true;
    DateTime dt = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
    String dts = DateTime.Now.ToString("yyyy-MM-dd");
    protected void Application_Start(object sender, EventArgs e)
    {
        InitialManager.Initial(ConfigHelper.DefaultConnectionString);
        BaseFrameWork.User.UserManager.InnerGetCurrentUserGuid = Logistics.BLL.UserInfoBLL.GetCurrentUserGuid;
        TypeMapManager.LoadTypeMap();

        ////System.Collections.Generic.List<SiteVisit> list = new SiteVisit().RetrieveList() as System.Collections.Generic.List<SiteVisit>;
        using(BaseFrameWork.DAL.DbConnectionScope scope = new BaseFrameWork.DAL.DbConnectionScope())
        {
            Application["SiteVisitCount"] = BaseFrameWork.DAL.DbHelper.Db("SELECT COUNT(*) FROM SiteVisit").ExecuteScalar<Int64>();
            Application[dt.AddDays(-6).ToString("yyyy-MM-dd")] = 0;
            Application[dt.AddDays(-5).ToString("yyyy-MM-dd")] = 0;
            Application[dt.AddDays(-4).ToString("yyyy-MM-dd")] = 0;
            Application[dt.AddDays(-3).ToString("yyyy-MM-dd")] = 0;
            Application[dt.AddDays(-2).ToString("yyyy-MM-dd")] = 0;
            Application[dt.AddDays(-1).ToString("yyyy-MM-dd")] = 0;
            Application[dts] = 0;
        }
    }
    protected void Application_Error(object sender, EventArgs e)
    {
        String strPath;
        BasePageView<ErrorPageViewData> p;
        StringWriter output = new StringWriter();
        AjaxResult<Exception> r;
        HttpApplication ha = sender as HttpApplication;

        Exception ex = Server.GetLastError().GetBaseException();
        BaseFrameWork.Log.ErrorLog el = new BaseFrameWork.Log.ErrorLog(ex);
        BaseFrameWork.Log.LogHelper.Log(el);

        if (isLogToDB)
        {
            try
            {
                //BaseFrameWork.Log.LogHelper.WriteLogIntoDB(ex);
            }
            catch (Exception exce)
            {
                BaseFrameWork.Log.LogHelper.Log(exce);
                isLogToDB = false;
            }
        }

        HttpApplication app = (HttpApplication)sender;
        if (app.Request.FilePath.EndsWith(".cspx", StringComparison.OrdinalIgnoreCase))
        {
            r = new AjaxResult<Exception>(ResultStatus.NO, ex.Message);
            Response.ContentType = "text/json";
            Response.StatusCode = 500;
            Response.Write(r.ToString());
        }
        else
        {
            if (ha.Request.IsLocal) 
            { 
                //return;
            }
            strPath = "/System/CommonPage/ErrorPage.aspx";
            p = BuildManager.CreateInstanceFromVirtualPath(strPath, typeof(object)) as BasePageView<ErrorPageViewData>;

            el.CreatedOn = DateTime.Now;
            el.Url = HttpContext.Current.Request.Url.ToString();
            el.ClientHostName = Dns.GetHostName();
            el.IP = String.Join(" | ", Dns.GetHostEntry(el.ClientHostName).AddressList.AsEnumerable().Where(item => item.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork).Select(item => item.ToString()).ToArray());
            el.ExceptionType = ex.GetType().ToString();
            p.Model = new ErrorPageViewData();
            p.Model.log = el;

            Server.Execute(p, output, false);
            Response.StatusCode = 200;
        }
        Server.ClearError();

        Response.Write(output.ToString());
        Response.Flush();
        Response.End();
    }
    protected void Session_Start(object sender, EventArgs e)
    {
        Application["SiteVisitCount"] = Convert.ToInt64(Application["SiteVisitCount"].ToString()) + 1;
        if (((int)(DateTime.Now - dt).TotalDays) > 0)
        {
            int d = ((int)(DateTime.Now - dt).TotalDays);
            for (int i = 7; i > 0; i--)
            {
                if (Application[dt.AddDays(d - i).ToString("yyyy-MM-dd")] != null)
                {
                    Application[dt.AddDays(d - i).ToString("yyyy-MM-dd")] = Application[dt.AddDays(d - i + 1).ToString("yyyy-MM-dd")];
                }
                else
                {
                    Application[dt.AddDays(d - i).ToString("yyyy-MM-dd")] = 0;
                }
            }
            dt = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
            dts = dt.ToString("yyyy-MM-dd");
        }
        else
        {
            Application[dts] = Convert.ToInt64(Application[dts].ToString()) + 1;
        }
        SiteVisit sv = new SiteVisit();
        sv.Broswer = Request.Browser.Browser + "_" + Request.Browser.Version;
        sv.IP = BaseFrameWork.Tool.Tools.GetClientIP();
        sv.System = BaseFrameWork.Tool.Tools.GetOSNameByUserAgent(Request.UserAgent == null ? "无" : Request.UserAgent);
        sv.CreatedOn = DateTime.Now;
        sv.ID = Guid.NewGuid();
        //sv.Insert();
    }
</script>

