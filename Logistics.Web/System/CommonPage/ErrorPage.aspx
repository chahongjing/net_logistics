<%@ Page Language="C#" AutoEventWireup="true" Inherits="BasePageView<BaseFrameWork.Exceptions.ErrorPageViewData>" %>

<%@ Import Namespace="System.Linq" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta charset="utf-8">
    <title>异常信息</title>
    <meta name="description" content="top menu &amp; navigation">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <link rel="stylesheet" href="/Front/dist/css/bootstrap.min.css">
    <link href="/Front/Css/Block.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body
        {
            background-color: #FFFBFF;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="col-md-12">
            <div style="height: 34px; padding: 0px; margin: 0px;">
                <ul id="myTab" class="nav nav-tabs" role="tablist" style="height: 42px; margin-left: 0px;
                    border-top: 1px solid #DDDDDD">
                    <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab"
                        aria-controls="home" aria-expanded="true">异常基本信息</a></li>
                    <li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab"
                        aria-controls="profile">其它信息</a></li>
                </ul>
            </div>
            <div id="myTabContent" class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
                    <div class="bs-docs-section">
                        <div id="callout-navbar-overflow" class="bs-callout bs-callout-warning">
                            <h4>
                                问题</h4>
                            <p>
                                <%= this.Model.log.ErrorMessage %></p>
                        </div>
                        <div class="bs-callout bs-callout-info">
                            <h4>
                                来源</h4>
                            <p>
                                <%= this.Model.log.ErrorSource%></p>
                        </div>
                        <div class="bs-callout bs-callout-danger">
                            <h4>
                                堆栈</h4>
                            <ol type="1">
                                <% foreach (string item in this.Model.log.StackTrace.Split(new string[] { Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries).ToList())
                                   {%>
                                <li>
                                    <%= item.Replace("行号", "<span style='color:red;font-weight:bold;'>行号</span>").Replace("位置", "<span style='color:red;font-weight:bold;'>位置</span>")%></li>
                                <% } %>
                            </ol>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
                    <div role="tabpanel" class="tab-pane fade in active" id="ditTwo" aria-labelledby="home-tab">
                        <div class="bs-docs-section">
                            <div id="Div2" class="bs-callout bs-callout-info">
                                <h4>
                                    IP</h4>
                                <p>
                                    <%= this.Model.log.IP%></p>
                                <h4>
                                    日期</h4>
                                <p>
                                    <%= this.Model.log.CreatedOn.HasValue ? this.Model.log.CreatedOn.Value.ToString("yyyy-MM-dd HH:mm:ss") : string.Empty%></p>
                                <h4>
                                    地址</h4>
                                <ol type="1">
                                    <li>
                                        <%= this.Model.log.Url%></li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="/Front/dist/js/jquery/1.11.2/jquery.min.js" type="text/javascript"></script>

    <script src="/Front/dist/js/bootstrap.js" type="text/javascript"></script>

    <script type="text/javascript">
        $('#myTab a').click(function(e) {
            e.preventDefault()
            $(this).tab('show')
        })
    </script>

</body>
</html>
