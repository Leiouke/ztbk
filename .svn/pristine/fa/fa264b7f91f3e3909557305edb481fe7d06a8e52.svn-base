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
		<div>
        	<div class="ibox-content">
				<form id="form" class="form-horizontal" enctype=”multipart/form-data”>
					<div class="col-xs-12">
						<div class="form-group middle-space-long-label col-xs-6 not-null">
							<label><span style="color:red">*</span>投标项目：</label>
							<input type="text" name="bids_project" class="search-items auto-not-null" id = "bids_project" >
							<div>
					  			<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
					  				<span class="caret"></span>
					     		</button>
					        	<ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
					    	</div>
					    	<input type="hidden" name="td_id" class="search-items" id = "td_id">
						</div>
						<div class="form-group middle-space-long-label col-xs-6" style="display:none">
							<label>fe_id</label>
							<input type="text" name="fe_id" id="fe_id" >
						</div>
					</div>
			        <div class="col-xs-12">
						<div class="form-group middle-space-long-label col-xs-6 not-null">	
							<label ><span style="color:red">*</span>费用类型：</label>
							<select name="fee_type" id="fee_type" data-id-start=3 data-id-end=3 class="search-items dictionary">
							</select>
						</div>
						<div class="form-group middle-space-long-label col-xs-6">	
							<label >是否抵扣：</label>
							<select name="is_rebate" id="is_rebate" class="search-items">
								<option value = "1">是</option>
							</select>
						</div>
					</div>
					<div class="col-xs-12">
						<div class="form-group middle-space-long-label col-xs-6 not-null" >
							<label><span style="color:red">*</span>付款金额：</label>
							<input type="text" name="payment_fee" id="payment_fee" disabled="disabled">
						</div>
						<div class="form-group middle-space-long-label col-xs-6" >
							<label>剩余保证金：</label>
							<input type="text" name="refund_fee" id="refund_fee" disabled="disabled">
						</div>
					</div>
					<div class="col-xs-12">
						<div class="form-group middle-space-long-label col-xs-6  not-null">
							<label><span style="color:red">*</span>申请人：</label>
							<input type="text" name="apply_man_name" class="search-items" id = "apply_man_name" >
							<div>
					  			<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
					  				<span class="caret"></span>
					     		</button>
					        	<ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
					    	</div>
					    	<input type="hidden" name="apply_man" class="search-items" id = "apply_man" >
						</div>
						<div class="form-group middle-space-long-label col-xs-6 not-null">
							<label><span style="color:red">*</span>申请部门：</label>
							<input type="text" name="apply_dep_org_name" class="search-items" id = "apply_dep_org_name" readonly = "readonly">
								<div>
						        	<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
						            	<span class="caret"></span>
						            </button>
						            <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
								</div>
							<input type="hidden" name="apply_dep_org_code" class="search-items" id = "apply_dep_org_code" readonly = "readonly">
						</div>
					</div>
					<div class="col-xs-12">
						<div class="form-group middle-space-long-label col-xs-6" >
							<label>备注：</label>
							<textarea rows="5" cols="50" name="memo" id = "memo"></textarea>
						</div>
					</div>
					<div class="form-group" >
						<div class="col-sm-12" style="text-align:center">
							<button id="save"  class="btn btn-primary" type="button">新增</button>
							<button id="cancel"  class="btn btn-white" type="button" name="cancel">取消</button>
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
	
	var json_obj=formToJson($("#form"));
    json_obj['sortName'] =this.sortName;
 	json_obj['sortOrder'] =this.sortOrder;
	
 	//加载单位类型字典
	get_dictionary('${context}',null);
 	
 	//加载投标项目
	initialize_bsSuggest_td_project('${context}',"bids_project","td_id");
 	
	//自动搜索填补部门		
	initialize_bsSuggest_org_type("${context}","apply_dep_org_name","apply_dep_org_code","0")
	
	//加载申请人字典
	initialize_bsSuggest_user_by_dept('${context}',"apply_man_name","apply_man","")
 	
	$(document).ready(function () {
		
		//从投标页面自动带过来投标信息和保证金金额
		if('${td_id}'){
			$("#bids_project").val("");	
			$("#bids_project").val('${bids_project}');	
			$("#td_id").val('${td_id}');	
// 			$.ajax({
// 		        url:"${context}"+ "/finance/getTdDepositFee?td_id="+'${td_id}',
// 		        method: "post",
// 		        dataType: "json",
// 		        traditional:true,
// 		        success: function (data) {
// 		        	$("#refund_fee").val(data.rows[0].remanent_fee);
// 		        },
// 		        error:function(data){	
// 		        	alert("请求失败!");	
// 		        }
// 			});
		}
		
		//自动默认业务员和部门
		$('#apply_man').val('${account}');
		$('#apply_man_name').val('${userName}');
		$('#apply_dep_org_code').val('${dep_org_code}');
		$('#apply_dep_org_name').val('${dep_org_name}');
		$('#fe_id').val('${fe_id}');
		
		//加载差额保证金或质保金
		$.ajax({
			url:"${context}"+ "/fc/depositFinance/getTdDepositFeeByFd?fe_id="+'${fe_id}',
		    method: "post",
		    dataType: "json",
		    traditional:true,
		    success: function (data) {
		        $("#refund_fee").val(data.rows[0].remanent_fee);
		        $("#payment_fee").val(data.rows[0].remanent_fee);
		        if(data.rows[0].fee_type==2){
		        	$("#memo").val("冲销质保金");
		        }else if (data.rows[0].fee_type==0){
		        	$("#memo").val("冲销保证金");
		        }
		    },
		    error:function(data){	
		        alert("请求失败!");	
		    }
		});
		
		
		
		 //取消按钮
		 $("#cancel").on('click', function () {
				var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	            parent.layer.close(index);
			});
		 
		 //提交按钮
		 $('#save').on('click', function () {
			 //付款金额必须不等于0
			 if($("#payment_fee").val()!=0){
				 if(!has_null($("#form"))){
					 ajax_function("${context}"+"/fc/depositFinance/saveFeeCXApplyInformation","post",$('#form').serialize(),'新增成功');
				 }
			 }else{
				 alert("付款金额等于0，请确认付款金额"); 
			 }
		 });
	 });
	</script>
</html>