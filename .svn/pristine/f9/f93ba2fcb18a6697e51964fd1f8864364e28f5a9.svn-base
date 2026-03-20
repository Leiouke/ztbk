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
					<div class="form-group inline-large">
						<label>审批内容：</label>
						<textarea rows="5" cols="50" name="audit_memo" id = "audit_memo"></textarea>
					</div>
					<div class="form-group inline-large" style = "display:none">
						<label >申请编码：</label>
						<input type="text" id="bill_code" name="bill_code" class="form-control search-items">
					</div>
					<div class="form-group inline-large" style = "display:none">
						<label >流程号：</label>
						<input type="text" id="flow_id" name="flow_id" class="form-control search-items">
					</div>
					<div class="form-group inline-large" style = "display:none">
						<label >是否同意</label>
						<input type="text" id="audit_status" name="audit_status" class="form-control search-items">
					</div>
					<div class="form-group" >
						<div class="col-sm-12" style="text-align:center">
							<button type="button" class="btn btn-primary btn-xs" id="approve">通过</button>
					  		<button type="button" class="btn btn-danger btn-xs" id="notapprove" >不通过</button>
						</div>
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
		
		$('#bill_code').val('${pr_id}');
		$('#flow_id').val('${flow_id}');
		
		//通过按钮
		$('#approve').on('click', function () {
			$('#audit_status').val(0);
			ajax_function_ask_and_close("确认是否通过审核","toFreeApproveDeal","post",$('#form').serialize(),'通过审核');
		 });
		
		//不通过按钮
		$('#notapprove').on('click', function () {
			$('#audit_status').val(1);
			ajax_function_ask_and_close("确认是否通过审核","toFreeApproveDeal","post",$('#form').serialize(),'通过审核');
		 });
	});
	</script>
</html>