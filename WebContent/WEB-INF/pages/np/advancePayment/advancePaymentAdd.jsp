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
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-editable.css" rel="stylesheet">
	</head>
	<body>
		<div class="sonpage-body">
			<div class="col-md-12">
			   <div class="ibox float-e-margins">
		            <div class="ibox-content search-content">
			            <form id="form" class="form-inline">
			            <div class="col-xs-12">
				            <div class="row">
								  <div class="form-group input-group inline-middle not-null">
								    <label >货源编号：</label>
								    <input type="text" name="f_id" class="form-control search-items" >
								    <div class="input-group-btn">
	                                    <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                        <span class="caret"></span>
	                                    </button>
	                                    <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                                 </div>
								  </div>
								  <div class="form-group inline-large">
								    <label >货源名称(_户号)：</label>
								    <input type="text" name="f_name" class="form-control search-items" disabled>
								  </div>
								  <div class="form-group input-group inline-small not-null">
								    <label >年月批次：</label>
								    <input type="text" name="account_month" class="form-control search-items">
								    <div class="input-group-btn">
                                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
		                            </div>
								  </div>
							</div>
							<div class="row">
								  <div class="form-group inline-small not-null">
								    <label >外币金额：</label>
								    <select name="currency" id="currency" class="form-control dictionary search-items" style="width:65px!important;">
								    	<option></option>
								    </select>
								    <input type="text" id="advance_money" name="advance_money" class="form-control search-items calculation">
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >汇率：</label>
								    <input type="text" id="exchange_rate" name="exchange_rate" class="form-control search-items calculation">
								  </div>			
								  <div class="form-group inline-small not-null">
								    <label >人民币金额：</label>
								    <input type="text" id="rmb_advance_money" name="rmb_advance_money" class="form-control search-items calculation">
								  </div>				
							</div>													
							<div class="row">							  								  
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
		$(document).ready(function () {
			$('#save').on('click', function () {
				if(!has_null($("#form"))&&!auto_not_matching($("#form"))){
					if($("input[name='f_id']").attr("data-id")==""){
						layer.msg("货源编号不正确");
					}else{
						ajax_function("addAdvancePayment","post",$('#form').serialize(),'新增成功');
					}
				}
			});
			
			//加载字典数据
			get_dictionary("${context}",null);
			
			//自动搜索填补
		    initialize_bsSuggest_all_type_factory_against("${context}", 1);
		    initialize_bsSuggest_account_month_not_close("${context}");
		});
		
		$(".calculation").change(function(){
			var id=$(this).attr("id");
			
			var advance_money=$("#advance_money").val();  // 外币金额
			if (id == 'rmb_advance_money') {
				var rmb_advance_money = $("#rmb_advance_money").val(); // 人民币
				var exchange_rate = rmb_advance_money / advance_money; // 算出汇率
				$("#exchange_rate").val(exchange_rate); // 填写汇率
			} else {
				var exchange_rate = $("#exchange_rate").val(); //汇率
	            var rmb_advance_money=advance_money*exchange_rate;  // 算出人民币          
	            $("#rmb_advance_money").val(rmb_advance_money.toFixed(2)); // 填写人民币, 保留2位数
			} 
        })
	</script>
</html>