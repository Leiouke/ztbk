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
					<div class="form-group inline-middle"  >
						<label>处理结果：</label>
						<textarea rows="3" cols="70" name="op_result" id="op_result"></textarea>
					</div>
					<div class="form-group inline-middle" >
						<label>处理意见：</label>
						<textarea rows="3" cols="70" name="op_memo" id="op_memo"></textarea>
					</div>
					<div>
						<button id="deal" class="btn btn-danger" type="button">提交处理</button>
					</div>
					<div class="row" style="display:none">
						<label >结算单编号：</label>
						<input type="text" id="statement_no" name="statement_no" class="form-control search-items" >
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
	function queryParams(param) {
		var json_obj=formToJson($("#form"));
		json_obj['limit'] =param.limit;
	      	json_obj['offset'] =param.offset;
	     	json_obj['sortName'] =this.sortName;
	  		json_obj['sortOrder'] =this.sortOrder;
	  		json_obj['sortOrder'] =this.sortOrder;
	        return json_obj;
	}
	
	$(document).ready(function () {
		$('#statement_no').val('${statement_no}');
		
		//处理按钮
		$('#deal').on('click', function () {
			ajax_function_ask_and_close("确认处理?","dealStatement","post",$('#form').serialize(),"处理成功!");
		 });
	});
	</script>
</html>