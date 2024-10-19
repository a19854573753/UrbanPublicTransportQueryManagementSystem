<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="${ctx}/sys/query${actionclass1}.action" method="post">
    		<input type="hidden" name="pageCurrent" value="0">
        <div class="bjui-searchBar">
            <label>主题：</label><input type="text" value="" id="${actionclass1}_title" name="s_title" class="form-control" size="10">&nbsp;
<!--             <label>:</label> -->
<!--             <select name="type" data-toggle="selectpicker"> -->
<!--                 <option value="">全部</option> -->
<!--             </select>&nbsp; -->
            <button type="submit" class="btn-default" data-icon="search">查询</button>&nbsp;
            <div class="pull-right">
                <div class="btn-group">
                	<button type="button" class="btn-blue" data-url="${ctx}/sys/add2${actionclass1}.action" data-toggle="navtab" data-options="{reloadWarn:''}" data-id="baseAdd" 
                		data-icon="plus" title="添加记录">添加${actionname1}</button>&nbsp;
                </div>
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true">
        <thead>
            <tr>
                <th width="300px">主题</th>
                <th >用户</th>
                <th >日期</th>
                <th >类型</th>
                <th width="100">查看</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${SESSION_PAGE.list}" var="item">
            <tr data-id="${item.id }">
               <td>${item.title}</td>
               <td>${item.user.user.uname}</td>
               <td>${item.addDate}</td>
               <td>${item.type}</td>
                <td>
                    <a href="${ctx}/sys/get${actionclass1}.action?uid=${item.id}" class="btn btn-green" data-toggle="navtab" data-options="{reloadWarn:''}" data-id="baseAdd" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="投诉建议详情">查看</a>
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<div class="bjui-pageFooter">
    <div class="pages">
        <span>&nbsp;共 ${SESSION_PAGE.totalNumber} 条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${SESSION_PAGE.totalNumber}" data-page-size="${SESSION_PAGE.itemsPerPage}" data-page-current="${SESSION_PAGE.currentPageNumber}">
    </div>
    </div>
<script type="text/javascript">
<c:forEach items="${textmap }" var="keyitem">
$("#${actionclass1}_${keyitem.key}").val("${keyitem.value}");
</c:forEach>
</script>