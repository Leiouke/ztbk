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
	     <link href="${context}/css/plugins/bootstrap-table/bootstrap-editable.css" rel="stylesheet">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	</head>
	<body>
		<div class="sonpage-body">
			<div class="col-md-12">
			   <div class="ibox float-e-margins">
		            <div class="ibox-content search-content">
			            <form id="form" class="form-inline">
			            <input type="hidden" name="pc_id">
			            <div class="col-xs-12">
				            <div class="row">
								  <div class="form-group input-group inline-middle not-null">
								    <label >客户编号：</label>
								    <input type="text" name="c_id" class="form-control search-items auto-not-null" >
								    <div class="input-group-btn">
	                                    <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                        <span class="caret"></span>
	                                    </button>
	                                    <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                                </div>
								  </div>
								  <div class="form-group inline-large">
								    <label >户号(_客户名称)：</label>
								    <input type="text" name="c_name" class="form-control search-items" disabled>
								  </div>
							</div>
							<div class="row">
								  <div class="form-group inline-small">
								    <label >费用类型：</label>
								    <select name="payment_type" class="form-control dictionary search-items" >
								    </select>
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >支付金额：</label>
								    <input type="text" name="payment_money" class="form-control search-items">
								  </div>				
								  <div class="form-group input-group inline-large not-null">
								    <label >汇款账号：</label>
								    <input type="text" name="f_bank_name" class="form-control search-items auto-not-null">
								    <div class="input-group-btn">
	                                    <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                        <span class="caret"></span>
	                                    </button>
	                                    <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                                </div>
								  </div>
							  	  <input type="hidden" name="bank_id">
							</div>													
							<div class="row">	
								  <div class="form-group inline-large">
								    <label >发票号：</label>
								    <input type="text" name="invoice_nos" class="form-control search-items">
								  </div>							  								  
								  <div class="form-group inline-large">
								    <label >备注：</label>
								    <input type="text" name="memo" class="form-control search-items">
								  </div>
							</div>
						 </div>
						</form>
		            </div>
       		</div>
		</div>
	</div>
	<div class="sonpage-footer">
	    <button id="save" class="btn btn-primary" type="button">保存</button>
	    <!-- <button id="commit" class="btn btn-success" type="button">提交</button> -->
	    <button id="delete" class="btn btn-danger" type="button">作废</button>
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
	<script type="text/javascript">
	var finance_fhsh=JSON.parse('${oneJson}');
	if(finance_fhsh['status']!=0&&finance_fhsh['status']!=2){
		$("#save").hide();
		$("#delete").hide();
	}

	$(document).ready(function () {
		$(".layer-date").each(function(){
			inistal_one_data('#'+$(this).attr('id'));
		})
		$('#save').on('click', function () {
			if(!has_null($("#form"))&&!auto_not_matching($("#form"))){
				if($("input[name='c_id']").attr("data-id")==""){
					layer.msg("客户编号不正确");
				}else{
					ajax_function("editPaymentCharge","post",$('#form').serialize(),'保存成功');								
				}
			}
		});
		
		//加载字典数据
		get_dictionary("${context}",finance_fhsh);
		//$("input[name='f_name']").val(finance_fhsh['f_department']+"_"+finance_fhsh['f_account']);
		
		//填写已有数据
		set_one_info($("#form"),finance_fhsh);

		//自动搜索填补
		initialize_bsSuggest_client("${context}");
		initialize_bsSuggest_c_bank("${context}");
		
		$('#delete').on('click',function(){
			 ajax_function_ask_and_close("确认删除？","deletePaymentCharge","post",{pc_id:finance_fhsh.pc_id},'删除成功');
		});
	});
	</script>
</html>