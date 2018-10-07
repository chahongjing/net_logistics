<%@ Control Language="C#" Inherits="BaseUserControlView<BaseFrameWork.Model.PaginationData>" %>
<div style="padding-top: 5px; padding-bottom: 5px; height: 43px">

    <script>
        function innerSearch(obj, totalPage, func) {
            var si = $(obj).parent().parent().find('input[name=txtPageSize]');
            var vsi = si.val().replace(/[^\d]*/g, '');
            var ind = $(obj).parent().parent().find('input[name=txtPageIndex]');
            var vind = ind.val().replace(/[^\d]*/g, '');

            if (vsi && parseInt(vsi) > 0 && vind && parseInt(vind) > 0 && parseInt(vind) <= totalPage) {
                si.val(vsi);
                ind.val(vind);
                if (si.val() == si.data('last-value') && vind == ind.data('last-value')) {
                    return; 
                } else if (si.val() > si.data('last-value')) {
                    vind = 1;
                    ind.val(vind);
                }

                si.data('last-value', vsi);
                ind.data('last-value', vind);
            } else {
                si.val(si.data('last-value'));
                ind.val(ind.data('last-value'));
                return;
            }
            eval(func);
        }
    </script>

    <div class="col-xs-2 col-sm-2" style="width: 210px; padding-left: 5px; padding-right: 5px;">
        <div class="input-group">
            <span class="input-group-addon">每页</span>
            <input class="form-control input-mask-phone text-center" type="text" name="txtPageSize"
                title="每页记录数" data-last-value="<%= this.Model.PageSize %>" value="<%= this.Model.PageSize %>" />
            <span class="input-group-addon">条/共<%= this.Model.TotalRecords%>条</span>
        </div>
    </div>
    <div class="col-xs-2 col-sm-2" style="width: 190px; padding-left: 5px; padding-right: 5px;">
        <div class="input-group">
            <span class="input-group-addon">第</span>
            <input class="form-control input-mask-phone text-center" type="text" name="txtPageIndex"
                title="页码" data-last-value="<%= this.Model.PageIndex + 1 %>" value="<%= this.Model.PageIndex + 1 %>" />
            <span class="input-group-addon">页/共<%= this.Model.TotalPages%>页</span>
        </div>
    </div>
    <div class="col-xs-1 col-sm-1" style="width: 80px; padding-left: 5px; padding-right: 5px;">
        <input class="btn btn-sm btn-info no-border" type="button" title="翻页确定" value="确定"
            onclick="innerSearch(this, <%= this.Model.TotalPages%>, '<%= this.Model.PagintionJsFunction %>')" />
    </div>
    <div class="col-xs-5 col-sm-5 pull-right" style="padding-right: 5px;">
        <ul class="pagination no-margin pull-right">
            <li class="first <%= this.Model.PageIndex == 0 ? "disabled" : String.Empty %>" title="首页">
                <a href="javascript:void(0)" value="1" onclick="<%= this.Model.PageIndex == 0 ? String.Empty : "$(this).parent().parent().parent().parent().find('input[name=txtPageIndex]').val($(this).attr('value'));" + this.Model.PagintionJsFunction %>">
                    <i class="ace-icon fa fa-angle-double-left"></i></a></li>
            <li class="prev <%= this.Model.PageIndex == 0 ? "disabled" : String.Empty %>" title="上一页">
                <a href="javascript:void(0)" value="<%= this.Model.PageIndex %>" onclick="<%= this.Model.PageIndex == 0 ? String.Empty : "$(this).parent().parent().parent().parent().find('input[name=txtPageIndex]').val($(this).attr('value'));" + this.Model.PagintionJsFunction %>"
                    style="margin-right: 5px;"><i class="ace-icon fa fa-angle-left"></i></a>
            </li>
            <% Int32 page;
               for (Int32 i = 0; i < this.Model.PageNumbers.Length; i++)
               {
                   page = this.Model.PageIndex + this.Model.PageNumbers[i];
                   if (page >= 0 && page < this.Model.TotalPages)
                   {
            %>
            <li class="<%= page == this.Model.PageIndex ? "active" : String.Empty %>" title="<%= page + 1 %>">
                <a href="javascript:void(0)" value="<%= page %>" onclick="<%= page == this.Model.PageIndex ? String.Empty : "$(this).parent().parent().parent().parent().find('input[name=txtPageIndex]').val($.trim($(this).text()));" + this.Model.PagintionJsFunction %>">
                    <%= page + 1 %></a></li>
            <%
                }
               } %>
            <li class="next <%= this.Model.PageIndex == this.Model.TotalPages - 1 ? "disabled" : String.Empty %>"
                title="下一页"><a href="javascript:void(0)" value="<%= this.Model.PageIndex + 2 %>"
                    onclick="<%= this.Model.PageIndex == this.Model.TotalPages - 1 ? String.Empty : "$(this).parent().parent().parent().parent().find('input[name=txtPageIndex]').val($(this).attr('value'));" + this.Model.PagintionJsFunction %>"
                    style="margin-left: 5px;"><i class="ace-icon fa fa-angle-right"></i></a>
            </li>
            <li class="last <%= this.Model.PageIndex == this.Model.TotalPages - 1 ? "disabled" : String.Empty %>"
                title="尾页"><a href="javascript:void(0)" value="<%= this.Model.TotalPages %>" onclick="<%= this.Model.PageIndex == this.Model.TotalPages - 1 ? String.Empty : "$(this).parent().parent().parent().parent().find('input[name=txtPageIndex]').val($(this).attr('value'));" + this.Model.PagintionJsFunction %>">
                    <i class="ace-icon fa fa-angle-double-right"></i></a></li>
        </ul>
    </div>
</div>
