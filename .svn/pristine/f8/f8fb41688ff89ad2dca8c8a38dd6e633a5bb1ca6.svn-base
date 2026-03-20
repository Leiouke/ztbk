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
	<div class="wrapper wrapper-content animated fadeInRight">
         <div class="ibox float-e-margins">
	            <form id="form_search" class="form-inline">
	            	  <div class="form-group input-group inline-middle">
							    <label >架号：</label>
							    <input type="text" name="rack_no" id="rack_no"/>							                       
					  </div>
					  <button id="commit" type="button" class="btn btn-success btn-xs">提交</button>
					  <button id="cancel" class="btn btn-white btn-xs" type="button">取消</button>
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
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
    
	<script type="text/javascript">

	 $(document).ready(function () {
		var items={};
		//区分是单挑记录还是多选
		$("#commit").click(function(){
			var rack_no=$("#rack_no").val();
			if(rack_no!=""){
				var item_ids = $.map(parent.$table.bootstrapTable('getSelections'), function (row) {
	                return row.id;
	            });
				if(item_ids.length!=0) {
					ajax_function_ask_and_close("确认修改？","batchUpdateBackIssueInBoundItemRackNo","post",{'ids':item_ids,'rack_no':rack_no, bi_id: '${param.bi_id}'}, '修改成功！');
				} else {
					layer.msg("未选择明细！");
				}
			}else{
				layer.msg("未填写架号！");
			}
			
		});
    });
	 
	</script>
</html>