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
		<div style="padding:20px;">
			<div class="col-md-12">
			   <form id="form" class="form-horizontal">
			   		<div class="col-xs-12">
			   			<div class="form-group middle-space col-xs-12 not-null">
					    	<label >确认结果：</label>
					    	<input type="text" id="confirm_result" name="confirm_result" class="search-items" >
					 	</div>
			   		</div>
			   		<div class="col-xs-12">
			   			<div class="form-group middle-space col-xs-12">
			            	<label>确认备注：</label>
			           		<textarea rows="5" cols="50" name="confirm_memo" id="confirm_memo"></textarea>
			        	</div>
			   		</div>
			   		<div class="col-xs-12"  style="display:none">
						<div class="form-group middle-space col-xs-12">
							<label >apply_id</label>
							<input type="text" name="apply_id" id = "apply_id"  class="search-items">
						</div>
					</div>
			        <div class="sonpage-footer">
			            <button id="confirm" class="btn btn-primary" type="button">确认</button>
			            <button id="cancel" class="btn btn-white" type="button">取消</button>
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
		
		$("#apply_id").val('${apply_id}');
		
		//保存按钮
		$('#confirm').on('click', function () {
			if(!has_null($("#form"))){
				ajax_function("confirmInstanceSupply","post",$('#form').serialize(),'修改成功');
			}
		});
			
		//取消按钮
		$('#cancel').on('click', function () {
			var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	        parent.layer.close(index);
		});
	 });
	</script>
</html>