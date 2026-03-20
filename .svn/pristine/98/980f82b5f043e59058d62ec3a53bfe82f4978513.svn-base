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
			   		<h5>补刊申请信息:</h5>
			   		<div class="col-xs-12">
			   			<div class="form-group middle-space col-xs-6">
					    	<label >刊号：</label>
					    	<input type="text" id="mail_code" name="mail_code" class="search-items" >
						</div>
			   			<div class="form-group middle-space col-xs-6">
					    	<label >刊名：</label>
					    	<input type="text" id="qk_name" name="qk_name" class="search-items" >
						</div>
			   		</div>
			   		<div class="col-xs-12">
			   			<div class="form-group middle-space col-xs-6">
					    	<label >期次：</label>
					    	<input type="text" id="period_name" name="period_name" class="search-items" >
						</div>
			   			<div class="form-group middle-space col-xs-6">
					    	<label >本期条码：</label>
					    	<input type="text" id="instance_tm" name="instance_tm" class="search-items" >
						</div>
			   		</div>
			   		<div class="col-xs-12">
			   			<div class="form-group middle-space col-xs-6">
					    	<label >数量：</label>
					    	<input type="text" id="h_amount" name="h_amount" class="search-items" >
						</div>
			   			<div class="form-group middle-space col-xs-6">
					    	<label >补刊理由：</label>
					    	<input type="text" id="supply_reason" name="supply_reason" class="search-items" >
						</div>
			   		</div>
			   		<div class="col-xs-12">
			   			<div class="form-group middle-space col-xs-6">
					    	<label >申请日期：</label>
					    	<input type="text" name="apply_time" id = "apply_time" class="date-type" >
						</div>
			   			<div class="form-group middle-space col-xs-6">
					    	<label >申请人：</label>
					    	<input type="text" id="apply_man_name" name="apply_man_name" class="search-items" >
						</div>
			   		</div>
			   		<div class="col-xs-12">
			   			<div class="form-group middle-space col-xs-6">
					    	<label >货源：</label>
					    	<input type="text" name="h_factory_name" id = "h_factory_name" class="search-items" >
						</div>
			   			<div class="form-group middle-space col-xs-6">
					    	<label >货源主管：</label>
					    	<input type="text" id="o_name" name="o_name" class="search-items" >
						</div>
			   		</div>
			   		<h5>补刊处理信息:</h5>
			   		<div class="col-xs-12">
			   			<div class="form-group middle-space col-xs-6">
					    	<label >是否处理：</label>
					    	<select id="is_process" name="is_process" class="search-items" >
					    		<option></option>
					    		<option value = "1">是</option>
					    		<option value = "0">否</option>
					    	</select>
						</div>
			   			<div class="form-group middle-space col-xs-6">
					    	<label >处理结果：</label>
					    	<input type="text" id="p_result" name="p_result" class="search-items" >
						</div>
			   		</div>
			   		<div class="col-xs-12">
			   			<div class="form-group middle-space col-xs-6">
					    	<label >处理人：</label>
					    	<input type="text" id="p_man_name" name="p_man_name" class="search-items" >
						</div>
						<div class="form-group middle-space col-xs-6">
					    	<label >处理时间：</label>
					    	<input type="text" name="p_time" id = "p_time" class="date-type" >
						</div>
			   		</div>
			   		<div class="col-xs-12">
						<div class="form-group middle-space col-xs-6">
					    	<label >完成进度：</label>
					    	<input type="text" name="Percent_progress" id = "Percent_progress" class="search-items" >
						</div>
						<div class="form-group middle-space col-xs-6">
					    	<label >采购处理时间：</label>
					    	<input type="text" name="deal_time" id = "deal_time" class="date-type" >
						</div>
			   		</div>
			   		<h5>补刊确认信息:</h5>
			   		<div class="col-xs-12">
			   			<div class="form-group middle-space col-xs-6">
					    	<label >是否确认：</label>
					    	<select id="is_confirm" name="is_confirm" class="search-items" >
					    		<option></option>
					    		<option value = "1">是</option>
					    		<option value = "0">否</option>
					    	</select>
						</div>
			   			<div class="form-group middle-space col-xs-6">
					    	<label >确认结果：</label>
					    	<input type="text" id="confirm_result" name="confirm_result" class="search-items" >
						</div>
			   		</div>
			   		<div class="col-xs-12">
			   			<div class="form-group middle-space col-xs-6">
					    	<label >确认人：</label>
					    	<input type="text" id="confirm_man_name" name="confirm_man_name" class="search-items" >
						</div>
			   			<div class="form-group middle-space col-xs-6">
					    	<label >确认时间：</label>
					    	<input type="text" name="confirm_time" id = "confirm_time" class="date-type" >
						</div>
			   		</div>
			   		<div class="col-xs-12">
			   			<div class="form-group middle-space col-xs-6">
			            	<label>确认备注：</label>
			           		<textarea rows="4" cols="58" name="confirm_memo" id="confirm_memo"></textarea>
						</div>
			   		</div>
			   		<div class="col-xs-12"  style="display:none">
						<div class="form-group middle-space col-xs-12">
							<label >ac_staff_id</label>
							<input type="text" name="ac_staff_id" class="search-items">
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
	$(document).ready(function () {
		
		//加载时间控件
		$(".layer-date").each(function(){
			inistal_one_data('#'+$(this).attr('id'));
		});
		
		var supply=JSON.parse('${oneJson}');
		
		//填写已有数据
		set_one_info($("#form"),supply);
	 });
	</script>
</html>