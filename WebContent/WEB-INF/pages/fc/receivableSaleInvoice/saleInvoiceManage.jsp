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
	                        <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                      </div>
					  </div>
					  <div class="form-group inline-large">
					    <label >户号(_客户名称)：</label>
					    <input type="text" name="c_name" class="form-control search-items" disabled>
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
					    <label >开票类别：</label>
					    <select name="fc_kp_form" class="form-control dictionary search-items" >
					    	<option></option>
					    </select>
					  </div>					  
					  <div class="form-group input-group inline-small">
					    <label >操作人：</label>
					    <input type="text" name="o_id_input_name" class="form-control search-items">
					    <div class="input-group-btn">
                               <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                   <span class="caret"></span>
                               </button>
                               <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                        </div>
                        <input type="hidden" name="o_id_input" class="form-control search-items">
					  </div>
					  <div class="form-group inline-small">
					    <label >操作日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="input_date_start" id="input_date_start">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="input_date_end" id="input_date_end">
					  </div>
					  <div class="form-group inline-small">
						    <label >是否有发票号：</label>
						    <select name="has_kp_no" class="form-control dictionary search-items isboolean" >
						    	<option value=""></option>
						    </select>
					  </div>
					  <div class="form-group inline-middle">
					  	<label >备注：</label>
					    <input type="text" name="memo" class="form-control search-items" >
					    <input type="hidden" name="fc_kp_type" value="${param.fc_kp_type}" />
					  </div>
					  <div class="form-group inline-small">
					    <label >考核单位：</label>
					    <select name="unit_code" class="form-control dictionary search-items" id="unit_code">
					    	<option></option>
					    </select>
					  </div>
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
                                    <button type="button" class="btn btn-outline btn-default" id="add">
                                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
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
		                <div class="row">
		                	<div class="form-group small-space col-xs-12 print-layer-button">
		                  		<button id="kp_no_update_commit" class="btn btn-success" type="button">确认</button>
		                	</div>
					    </div>           
                </div>
       </form>
	 </div>
	 
	 <div class="sonpage-footer">
		<button id="account" class="btn btn-success" type="button">记账</button>	
	    <button id="return_account" class="btn btn-danger" type="button">撤销</button>	                  
	 </div>
	</body>
	
	<div class="col-md-4" id="account_div" style="display:none">
	   <form id="account_form" class="form-inline">
       		<div class="panel-body">
              <div class="row">
               	<div class="form-group small-space col-xs-4 not-null">
       				<label >记账年月：</label>
             		<input type="text" name="account_month" class="form-control search-items">
					<div class="input-group-btn">
	                    <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                      	<span class="caret"></span>
	                    </button>
	                    <ul class="dropdown-menu dropdown-menu-right" style="height:200px" role="menu"></ul>
	                </div>
	          	</div>
	            <div class="form-group small-space col-xs-12 print-layer-button">
           			<button id="account_commit" class="btn btn-success" type="button">确认</button>
	            </div>
			  </div>                        
       		</div>
       </form>
	 </div>
	    
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
		
		function end_function(index, layero){
			ajax_function_no_close("returnSaleInvoice","post",{},null);
			var json_data_list=formToJson($("#form_search"));
			json_data_list['queryId']='${queryId}';
			search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getSaleInvoiceManageList",$('#table'));
     	}
		
		var kp_layer_index;
		$(document).ready(function () {
			 //固定列
			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化
			initialize_table($table,"",${tableHeader},queryParams,"#tableTool",400);
			$("#search").on('click',function(){
				 var json_data_list=formToJson($("#form_search"));
				 json_data_list['queryId']='${queryId}';
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getSaleInvoiceManageList",$table);
			});
			//增加条目layer
			var $add=$("#add");
			button_click_windows_end($add,2,"新增开票",'saleInvoiceAdd?fc_kp_type=${param.fc_kp_type}',true,['620px', '500px'],end_function);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			 $('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		     });
			 //自动搜索填补
			 initialize_bsSuggest_fc_client("${context}", "c_name", "c_id");
			 initialize_bsSuggest_fc_user("${context}", "o_id_input_name", "o_id_input");      // 放用户信息
			 
			// 获得当前部门的考核单位
			get_assess_unit_by_dept("${context}", "unit_code");
			 
			 // 获得未关账的记账年月
			 initialize_bsSuggest_fc_account_month("${context}", "account_month", 0);
			 
			 $('#kp_no_update_commit').on('click',function(){
				 if(!has_null($("#kp_no_update_form"))){						
					 ajax_function_refresh("editSaleInvoiceNo","post",$("#kp_no_update_form").serialize(),'操作成功',$table);
					 layer.close(kp_layer_index);
				 }
			 });
			 
			 // 假如是 '应收发票', 记账按钮 就去掉
			 if (${param.fc_kp_type == 0}) {
				$("#account").hide();
				$("#return_account").hide(); 
			 }
			 
			 $('#account').on('click',function(){
				 open_layer(1,"记账",$('#account_div'),['360px', '380px'],false);
			 });
			 
			 $('#account_commit').on('click',function(){
				 if(!has_null($("#account_form"))){
					var kp_ids = $.map($table.bootstrapTable('getSelections'), function (row) {
		                return row.kp_id;
		            });
					var account_month=$("input[name='account_month']").val();
					if(kp_ids.length!=0){
						ajax_function_ask_and_refresh("确认记账？","accountSaleInvoice","post",{'kp_ids':kp_ids,'account_month':account_month},'操作成功',$table);
						layer.close(layer.index);
					} else {
						layer.msg("未选择明细！");
					}
				 }
			});
			
			$('#return_account').on('click',function(){
				 if(true){
					var kp_ids = $.map($table.bootstrapTable('getSelections'), function (row) {
		                return row.kp_id;
		            });
					if(kp_ids.length!=0) {
						ajax_function_ask_and_refresh("确认撤销？","deleteSaleInvoiceAccount","post",{'kp_ids':kp_ids},'操作成功',$table);
				 	} else {
						layer.msg("未选择明细！");
				 	}
				 }
			});
	     });
		
		 function toEdit(kp_id, fc_kp_type){
			 open_layer_end(2,'编辑开票','saleInvoiceEdit?kp_id='+kp_id + '&fc_kp_type=' + fc_kp_type,['620px', '580px'],true,end_function);
		 }	
		 
		 function toKp(kp_id,kp_no,kp_date){
			 $('#kp_no_update_div').find("input[name='kp_id']").val(kp_id);
			 if(kp_no!='undefined') {
			 	$('#kp_no_update_div').find("input[name='kp_no']").val(kp_no);
			 } else {
				$('#kp_no_update_div').find("input[name='kp_no']").val("");
			 }
			 if(kp_date!='undefined'){
			 	$('#kp_no_update_div').find("input[name='kp_date']").val(kp_date);
			 } else{
				$('#kp_no_update_div').find("input[name='kp_date']").val("");
			 }
			 
			 kp_layer_index = open_layer(1,"开票",$('#kp_no_update_div'),['360px', '380px'],false);
		 }
		 
		function toClaim(kp_id, is_claim_kp, c_id) {
			if (is_claim_kp == 'false') {
				open_layer_refresh(2,'申请开票','toSaleInvoiceClaimKp?kp_id='+kp_id + '&c_id=' + c_id,$table,['750px', '500px'], true);
			} else if (is_claim_kp == 'true') {
				open_layer_refresh(2,'已申请开票','toSaleInvoiceNextClaimKp?kp_id='+kp_id,$table,['850px', '500px'],true);
			}
		}
		 
		function renderOperator(value,row,index){
			var str = '';
			str += "<a onclick=\"toEdit('" + row.kp_id + "','" + row.fc_kp_type + "')\">编辑</a>";
			// 开票中的开票单, 且申请未提交的  才需要申请开票, 且 发票类别不为1-形式发票 （形式发票不让申请开票了）
			if (row.status == '0' && !row.is_commit_claim && row.fc_kp_family != '1') {
				str += "&nbsp;&nbsp;<a onclick=\"toClaim('"+row.kp_id + "','" + row.is_claim_kp + "','" + row.c_id +"')\">申请开票</a>";
			}
			// 开票操作在后续任何时候都可以操作
			var the_kp_date="";
			if(row.kp_date){
				the_kp_date=format_date(row.kp_date);
			}
			str += "&nbsp;&nbsp;<a onclick=\"toKp('"+row.kp_id+"','"+row.kp_no+"','" + the_kp_date + "')\">开票</a>";
			return str;
		}
		 
		$("#a_create_no").on('click',function(){
			 ajax_function_ask_and_dosuccess("确认生成吗?", "getSaleInvoiceNo", "post", {}, success_fuction);
		});
		
		function success_fuction(data) {
			if (data.success){
	   			layer.msg("成功生成！");
	   			$('#kp_no_update_div').find("input[name='kp_no']").val(data.kp_no);
	    	} else {
	    		layer.msg(data.errorMsg);
	    	}
		}
	</script>
</html>