<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->  
	    <jsp:include page="../../include/h_superHead.jsp"></jsp:include>
	    <!-- Bootstrap table -->
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	    <link rel="stylesheet" type="text/css" href="${context}/css/plugins/webuploader/webuploader.css">
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-editable.css" rel="stylesheet">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <style type="text/css">
	    </style>
	</head>
	<body>
		<div class="sonpage-body">
			<div class="col-md-12">
			   <div class="ibox float-e-margins">
		            <div class="ibox-content search-content">
			            <form id="form" class="form-inline">
			            	<div class="col-xs-12">
								<div class="form-group middle-space col-xs-12" style = "display:none">
									<label >单据内码：</label>
									<input type="text" name="pc_id" class="search-items"/>
	                            </div>
								<div class="form-group input-group middle-space col-xs-12 not-null" id = "repay_date">
			                  		<label >还款日期：</label>
			                        <input type="text" id="repay_time" name="repay_time" class="layer-date date-type search-items" > 
		                        </div>
								<div class="form-group input-group middle-space col-xs-12 not-null" id = "claim_date">
			                  		<label >领款日期：</label>
			                        <input type="text" id="claim_time" name="claim_time" class="layer-date date-type search-items"> 
		                        </div>
								<div class="form-group input-group middle-space col-xs-12">
				                  	<label>组织机构：</label>
				                    <input type="text" name="org_name" class = "search-items" disabled/>
					            </div>
					            <div class="form-group input-group middle-space col-xs-12">
									<label >申请人：</label>
									<input type="text" name="o_id_input_name" id = "o_id_input_name" class="search-items" disabled/>
	                            </div>
								<div class="form-group input-group middle-space col-xs-12">
									<label >申请金额：</label>
									<input type="text" name="apply_money" class="search-items" disabled/>
	                            </div>
								<div class="form-group input-group middle-space col-xs-12">
									 <label >备注：</label>
									 <input type="text" name="memo" class="search-items" disabled>
								</div>
							</div>
						</form>
		            </div>
       		</div>
		</div>
	</div>
	<div style = "text-align: center;margin-top:50px">
	    <button type="button" class="btn btn-primary btn-xs"  id="claim">确认领款</button>
		<button type="button" class="btn btn-danger btn-xs" id="repay" >确认还款</button>
		<button id="cancel" class="btn btn-white" type="button">取消</button>
	</div>
	</body>
	<!-- Bootstrap table -->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- Bootstrap table export-->
    <script src="${context}/js/plugins/bootstrap-table/export/bootstrap-table-export.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/tableExport.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/js-xlsx/xlsx.core.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.plugin.autotable.js"></script>
    <!-- Bootstrap table editable-->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-editable.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table-editable.js"></script>
    
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script type="text/javascript">
	function queryParams(param) {
		var json_obj_invoice = formToJson($("#form"));
		json_obj_invoice['limit'] =param.limit;
		json_obj_invoice['offset'] =param.offset;
		json_obj_invoice['sortName'] =this.sortName;
		json_obj_invoice['sortOrder'] =this.sortOrder;
	    return json_obj_invoice;
	}
	
	var $table = $('#table');
	
	$(document).ready(function () {	
		inistal_one_data('#claim_time');
		inistal_one_data('#repay_time');
		
		if('${claimRepay}'==1){ //领款
			$('#repay').remove();
			$('#repay_date').remove();
		}else if('${claimRepay}'==2){//还款
			$('#claim').remove();
			$('#claim_date').remove();
		}
		
		//填充数据
		var petty=JSON.parse('${oneJson}');
		set_one_info($("#form"),petty);
		//加载字典数据
		get_dictionary("${context}",petty);
		
		//确认领款按钮
		$('#claim').on('click', function () {
			if(!has_null($("#form"))){
				ajax_function_ask_and_close("确认是否确认领款","toPettyCashClaimDeal","post",$('#form').serialize(),'已确认领款');
			}
		 });
		
		//确认还款按钮
		$('#repay').on('click', function () {
			if(!has_null($("#form"))){
				ajax_function_ask_and_close("确认是否确认还款","toPettyCashRepayDeal","post",$('#form').serialize(),'已确认还款');
			}
		 });
	});
	</script>
</html>