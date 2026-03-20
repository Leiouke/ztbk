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
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-editable.css" rel="stylesheet">
	    <jsp:include page="../../include/h_superHead.jsp"></jsp:include>
	</head>
	<body>
	<div class="wrapper wrapper-content animated fadeInRight">
         <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>查询</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content search-content">
	            <form id="form_search" class="form-inline">
	            <div class="col-xs-11">
					  <div class="form-group input-group inline-middle">
							    <label >客户编号：</label>
							    <input type="text" name="c_id" class="form-control search-items" >
							    <div class="input-group-btn">
                                            <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                                <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                            </ul>
                                 </div>
					  </div>
					  <div class="form-group inline-large">
							    <label >户号(_客户名称)：</label>
							    <input type="text" name="c_name" class="form-control search-items" disabled>
					  </div>
					  <div class="form-group inline-small">
					    <label >户号：</label>
					    <input type="text" name="custom_id" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					  	<label >发票号：</label>
					    <input type="text" name="inv_no" class="form-control search-items" >
					  </div>					  
					  <div class="form-group inline-small">
					    <label >发票日期：</label>
					    <input type="text" class="form-control layer-date search-items" name="invoice_date_start" id="invoice_date_start">
					    -
					    <input type="text" class="form-control layer-date search-items" name="invoice_date_end" id="invoice_date_end">
					  </div>
					  <div class="form-group inline-small">
					    <label >发票类型：</label>
					    <select name="invoice_type" class="form-control dictionary search-items" >
					    	<option></option>
					    </select>
					  </div>					  
					  <div class="form-group input-group inline-small">
					    <label >操作人：</label>
					    <input type="text" name="o_id_operator_name" class="form-control search-items">
					    <div class="input-group-btn">
                               <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                   <span class="caret"></span>
                               </button>
                               <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                        </div>
                        <input type="hidden" name="o_id_operator" class="form-control search-items">
					  </div>
					  <div class="form-group inline-small">
					    <label >录入日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="input_date_start" id="input_date_start">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="input_date_end" id="input_date_end">
					  </div>
					  <div class="form-group inline-small">
						    <label >是否有发票号：</label>
						    <select name="is_account" class="form-control dictionary search-items isboolean" >
						    	<option value=""></option>
						    </select>
					  </div>
					  <div class="form-group inline-middle">
					  	<label >备注：</label>
					    <input type="text" name="memo" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					    <label >是否开明细：</label>
					    <select name="is_item_kp" class="form-control dictionary search-items isboolean" >
					    	<option value=""></option>
					    </select>
					  </div>
					  <!-- <div class="form-group inline-small">
					  	<label >导出批次号：</label>
					    <input type="text" name="kp_batch_id" class="form-control search-items" >
					  </div>	
					  <div class="form-group inline-small">
					    <label >是否导出过：</label>
					    <select name="is_export" class="form-control dictionary search-items isboolean" >
					    	<option value=""></option>
					    </select>
					  </div> -->
				 </div>
				 <div class="col-xs-1 search-group-button">
					  	<button type="button" class="btn btn-primary btn-xs" id="search">查询</button>
					  	<button type="button" class="btn btn-default btn-xs" id="reset" >清空</button>
				 </div>
				</form>
            </div>
        </div>
        <div class="ibox float-e-margins" style="margin-bottom:0px">
            <div class="ibox-title">
                <h5>发票管理</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content" style="padding-bottom:0px">
                <div class="row row-lg">                    
                    <div class="col-sm-12">
                                <div class="btn-group hidden-xs" id="tableTool" role="group">
                                    <button type="button" class="btn btn-outline btn-default" id="batchImport">
		                              	批量导入开票
		                            </button>
		                            <button type="button" class="btn btn-outline btn-default" id="batchwbImport">
		                              	批量导入外部开票
		                            </button>
                                    <button type="button" class="btn btn-outline btn-default" id="config">
                                        <i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
                                    </button>
                                    <select class="form-control" >
                                   		<option value="all">导出全部</option>
						                <option value="basic">导出当页</option>	
						            </select>
                                </div>
                                <table id="table" data-mobile-responsive="true">
                                    
                                </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="sonpage-footer">
	    <button id="export_kp_finance" class="btn btn-success" type="button">导出开票明细</button>
	    <button id="export_kp_wb_finance" class="btn btn-success" type="button">导出外部开票明细</button>
	</div>
    <div class="col-md-4" id="kp_no_update_div" style="display:none">
	   <form id="kp_no_update_form" class="form-inline">
              <div class="panel-body">
              			<input type="hidden" name="kp_id">
                        <div class="row">
                         	<div class="form-group small-space col-xs-12 not-null">
		                  		<label >发票号：</label>
		                        <input type="text" name="kp_no" class="form-control search-items">
		                        <a id="a_create_no" href="javascript:;">生成号码</a>
		                	</div>
		                </div>
		                <div class="row">
                           	<div class="form-group small-space col-xs-4 not-null">
		                  		<label >开票日期：</label>
		                        <input type="text" name="kp_date" id="kp_date" class="form-control layer-date date-type search-items">
		                	</div>
		                </div>
		                <!-- <div class="row">
		                	<div class="form-group small-space col-xs-4 not-null" >
							    <label >发票分类：</label>
							    <select name="sale_class" class="form-control dictionary search-items" style="padding:1px 1px">
							    	<option value=''></option>
							    </select>
							</div>
		                </div>	 -->	                
		                <div class="row">
		                	<div class="form-group small-space col-xs-12 print-layer-button">
		                  		<button id="kp_no_update_commit" class="btn btn-success" type="button">确认</button>
		                	</div>
					    </div>           
                </div>
       </form>
	 </div>
	</body>
	    
	<!-- 自定义js -->
    <script src="${context}/js/content.js?v=1.0.0"></script>


    <!-- Bootstrap table -->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

    <script src="${context}/js/plugins/bootstrap-table/export/bootstrap-table-export.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/tableExport.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/js-xlsx/xlsx.core.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.plugin.autotable.js"></script>
    <!-- Bootstrap table editable-->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-editable.js"></script>
  	<script src="${context}/js/plugins/bootstrap-table/bootstrap-table-editable.js"></script>
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
    
	<script type="text/javascript">
		//加载时间控件
	 	$(".layer-date").each(function(){	
			inistal_one_data('#'+$(this).attr('id'));
		});
		
		var $table = $('#table');
		function queryParams(param) {
			var json_obj=formToJson($("#form_search"));;
			json_obj['limit'] =param.limit;
   	      	json_obj['offset'] =param.offset;
   	     	json_obj['sortName'] =this.sortName;
   	  		json_obj['sortOrder'] =this.sortOrder;
   	        return json_obj;
		}

		var kp_layer_index;
		$(document).ready(function () {
			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化
			initialize_table($table,"",${tableHeader},queryParams,"#tableTool",400);
			$("#search").on('click',function(){
				 var json_data_list=formToJson($("#form_search"));
				 json_data_list['queryId']='${queryId}';
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getSaleInvoiceFinanceManageList",$table);
			});
			
			//增加条目layer
			var $batchImport=$("#batchImport");
			button_click_layer_refresh($batchImport,2,"导入开票结果",'saleInvoiceKpBatchUpload',$table,false,['750px', '500px']);
			
			var $batchwbImport=$("#batchwbImport");
			button_click_layer_refresh($batchwbImport,2,"导入外部开票结果",'saleInvoicewbKpBatchUpload',$table,false,['750px', '500px']);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			 $('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		     });
			 //自动搜索填补
			 initialize_bsSuggest_client("${context}");
			 initialize_bsSuggest_user_by_dept("${context}", "o_id_operator_name", "o_id_operator", "2000");      // 放用户信息(报刊的)
			 
			 $('#kp_no_update_commit').on('click',function(){
				 if(!has_null($("#kp_no_update_form"))){						
					 ajax_function_refresh("editSaleInvoiceNo","post",$("#kp_no_update_form").serialize(),'操作成功',$table);
					 layer.close(kp_layer_index);
				 }
			 });
			 $('#export_kp_finance').on('click', function () {
				 var has_common = 0;
				 var has_zengzhi = 0;
				 //var same_kp_batch = true;
				 //var kp_batch = '';
				 var kp_ids = $.map($table.bootstrapTable('getSelections'), function (row) {
					if (row.invoice_type == '0002'){
						has_common = 1;
					}
					if (row.invoice_type == '0003') {
						has_zengzhi = 1;
					}
					/*if (row.kp_batch_id != undefined) {
						if (kp_batch != '' && kp_batch != row.kp_batch_id) {
							same_kp_batch = false;
						}
						kp_batch = row.kp_batch_id;
					}*/
						
	                return row.kp_id;
	             });
				 
				 if (has_common == 1 && has_zengzhi == 1) {
					layer.msg("普通发票和增值税发票不能一起导出！");
					return;
				 }
				 
				 /*if (!same_kp_batch) {
					layer.msg("不同批次号不能一起导出！");
					return;
				 }*/
				 
				 if(kp_ids.length!=0){
					//alert("导出完成后请重新查询查看对应的导出批次号！");
					var href_str="${context}/download/kpInvoiceFinanceExport?";
					href_str+="kp_ids="+kp_ids;
					window.open( href_str);
				 }else {
					layer.msg("未选择明细！");
				 }
			});	
		
		 $('#export_kp_wb_finance').on('click', function () {
			 var has_common = 0;
			 var has_zengzhi = 0;
			 var kp_ids = $.map($table.bootstrapTable('getSelections'), function (row) {
				if (row.invoice_type == '0002'){
					has_common = 1;
				}
				if (row.invoice_type == '0003') {
					has_zengzhi = 1;
				}
					
                return row.kp_id;
             });
			 
			 if (has_common == 1 && has_zengzhi == 1) {
					layer.msg("普通发票和增值税发票不能一起导出！");
					return;
				 }
			 
			 if(kp_ids.length!=0){
				var href_str="${context}/download/kpwbInvoiceFinanceExport?";
				href_str+="kp_ids="+kp_ids;
				window.open( href_str);
			 }else {
				layer.msg("未选择明细！");
			 }
		});
     });	
		 
		 function toKp(kp_id,kp_no,kp_date,sale_class){
			 $('#kp_no_update_div').find("input[name='kp_id']").val(kp_id);
			 if(kp_no!='undefined')
			 	$('#kp_no_update_div').find("input[name='kp_no']").val(kp_no);
			 else
				 $('#kp_no_update_div').find("input[name='kp_no']").val("");
			 if(kp_date!='undefined'){
			 	$('#kp_no_update_div').find("input[name='kp_date']").val(kp_date);
			 }else{
				 $('#kp_no_update_div').find("input[name='kp_date']").val("");
			 }
			 if(sale_class!='undefined'){
				 $('#kp_no_update_div').find("select[name='sale_class']").val(sale_class);
			 }else{
				 $('#kp_no_update_div').find("select[name='sale_class']").val('');
			 }
			 kp_layer_index=open_layer(1,"开票",$('#kp_no_update_div'),['360px', '380px'],false);
		 }
		 
		function toClaim(kp_id) {
			ajax_function_ask_and_refresh("确认申请开票吗?","claimKpSaleInvoice","post",{'kp_id':kp_id},"成功申请开票!",$('#table'));
		}
		 
		function renderOperator(value,row,index){
			var str="";
			if(true){
				var the_kp_date="";
				if(row.kp_date){
					the_kp_date=format_date(row.kp_date);
				}
				str+="<a onclick=\"toKp('"+row.kp_id+"','"+row.kp_no+"','"+the_kp_date+"','"+row.sale_class+"')\">开票</a>";
			}
			
			if (row.status == '0') {
				str+=" <a onclick=\"toGoback('" + row.kp_id + "')\">退回申请</a> ";
			}
			return str;
		}
		
		function toGoback(kp_id) {
			ajax_function_ask_and_refresh("确认退回申请?","saleInvoiceKpApplyGoback","post",{'kp_id': kp_id},"退回成功!",$('#table'));
		}
		 
		$("#a_create_no").on('click',function(){
			 ajax_function_ask_and_dosuccess("确认生成吗?", "getSaleInvoiceNo", "post", {}, success_fuction);
		});
		
		function success_fuction(data){
			if (data.success){
	   			layer.msg("成功生成！");
	   			$('#kp_no_update_div').find("input[name='kp_no']").val(data.kp_no);
	    	} else {
	    		layer.msg(data.errorMsg);
	    	}
		}
	</script>
</html>