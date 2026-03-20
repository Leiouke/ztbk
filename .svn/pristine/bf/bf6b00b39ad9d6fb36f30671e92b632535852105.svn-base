<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String context = request.getContextPath();
	request.setAttribute("context",context);
%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	    <!-- Bootstrap table -->
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <jsp:include page="../../include/h_superHead.jsp"></jsp:include>
	</head>
	<body>
	<div class="sonpage-body">
			<div class="col-md-12">
			   <form id="form" class="form-inline">
						<div class="form-group input-group inline-small">
						    <label >指派审读人员：</label>
						    <input type="text" name="zpzs_man_name" class="form-control search-items">
						    <div class="input-group-btn">
		                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
		                            <span class="caret"></span>
		                        </button>
		                        <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                        </div>
	                        <input type="hidden" name="zpzs_man" class="form-control search-items" id = "zpzs_man">
					  </div>
					  <div class="form-group input-group inline-small">
					    <label >期望完成日期：</label>
					    <input type="text" class="form-control search-items layer-date" name="hope_date" id="hope_date">
					  </div>
						<div class="form-group inline-small" style = "margin-top: 100px; text-align: center">
							<button id="assign" class="btn btn-danger" type="button">审读指派</button>
						</div>
		       </form>
			 </div>
		</div>
	</body>
	    
	<!-- 自定义js -->
    <script src="${context}/js/content.js?v=1.0.0"></script>

    <!-- Bootstrap table -->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- Bootstrap table export-->
    <script src="${context}/js/plugins/bootstrap-table/export/bootstrap-table-export.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/tableExport.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/js-xlsx/xlsx.core.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.plugin.autotable.js"></script>
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
    
	<script type="text/javascript">	

	
	$(document).ready(function () {
		//加载时间控件
		$(".layer-date").each(function(){
			inistal_one_data('#'+$(this).attr('id'));
		});
		
		//移交按钮
		$('#assign').on('click', function () {
			var id = parent.callback($('#zpzs_man').val(),$('#hope_date').val());
			if(id == 0){
				setTimeout(function() {
					var index = parent.layer.getFrameIndex(window.name); //获取窗口索引            		
	                parent.layer.close(index);//something you want delayed
				}, 3000);
			}
		 });
	});
	
	initialize_bsSuggest_user_by_dept("${context}", "zpzs_man_name", "zpzs_man", "2000");      // 放用户信息(报刊的)
	</script>
</html>