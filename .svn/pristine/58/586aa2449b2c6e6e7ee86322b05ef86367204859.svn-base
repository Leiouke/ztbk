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
					    <label >户名(模糊)：</label>
					    <input type="text" name="c_department" class="form-control search-items" >
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
                                    <button type="button" class="btn btn-outline btn-default" id="add" style="color: blue">
                                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn btn-outline btn-default" id="red_add" style="color: red;">
                                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn btn-outline btn-default" id="config">
                                        <i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
                                    </button>
                                    <!-- <button type="button" class="btn btn-outline btn-default" id="delete">
                                        <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
                                    </button> -->
                                    <select class="form-control" >
                                   		<option value="all">导出全部</option>
						                <option value="basic">导出当页</option>	
						            </select>
                                </div>
                                <table id="table" data-mobile-responsive="true" >
                                    
                                </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- <div class="sonpage-footer">
	    <button id="export_kp_finance" class="btn btn-success" type="button">导出开票明细</button>
	</div> -->
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
			//initialize_table($table,"",${tableHeader},queryParams,"#tableTool",400);
			
			initialize_table_line($table,"getSaleInvoiceManageList",${tableHeader},queryParams,"#tableTool",600);
			
// 			$table.bootstrapTable('refreshOptions',{
// 				rowStyle: function (row, index) {
// 		             //var style = "";             
// 		             //    style='danger'; 
// 		             var style = {};
// 		             console.log(JSON.stringify(row, null, 2));
// 		             // 红票使用红底
// 		             if(row.is_destory =='ture') {
// 		                style={css:{'text-decoration': 'line-through','text-decoration-thickness': '2px'}};
// 		             }
					
// 		             return style;
// 		         },
// 		         customStyle: function(value, row, index, field) {
// 		        	 var style = {};
		        	 
// 		             // 假设我们想要将名为 'Important' 的单元格背景色设置为红色
// 		             if (field === 'name' && value === '00099') {
		                 
// 		                	 style = {css: {'background-color': 'red'}};
// 		             }
// 		             // 如果不需要特殊样式，则返回空对象或null
// 		             return style;
// 		         }
// 			});
			
			$("#search").on('click',function(){
				 var json_data_list=formToJson($("#form_search"));
				 json_data_list['queryId']='${queryId}';
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getSaleInvoiceManageList",$table);
			});
			//增加条目layer
			var $add=$("#add");
			button_click_windows_end($add,2,"新增开票",'saleInvoiceAdd',true,['620px', '500px'],end_function);
			
			var $red_add=$("#red_add");
			button_click_windows_end($red_add,2,"新增红票",'saleInvoiceRedAdd',true,['620px', '500px'],end_function);
			
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
					var href_str="${context}/download/kpInvoiceFinanceExport?";
					href_str+="kp_ids="+kp_ids;
					window.open( href_str);
				 }else {
					layer.msg("未选择明细！");
				 }
			});
	     });
		
		 function toEdit(kp_id){
			 open_layer_end(2,'编辑开票','saleInvoiceEdit?kp_id='+kp_id,['620px', '580px'],true,end_function);
		 }	
		 
		 function toRedEdit(kp_id){
			 open_layer_end(2,'编辑开票','saleInvoiceRedEdit?kp_id='+kp_id,['620px', '580px'],true,end_function);
		 }	
		 
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
		 
		function toClaim(kp_id, is_claim_kp, c_id) {
			if (is_claim_kp == 'false') {
				open_layer_refresh(2,'申请开票','toSaleInvoiceClaimKp?kp_id='+kp_id + '&f_id=' + c_id,$table,['750px', '500px'], true);
			} else if (is_claim_kp == 'true') {
				open_layer_refresh(2,'已申请开票','toSaleInvoiceNextClaimKp?kp_id='+kp_id,$table,['850px', '500px'],true);
			}
		}
		 
		function renderOperator(value,row,index){
			var str = '';
			// 已申请开票的不能编辑, 按钮有 只是里面无法编辑保存
			//if (!row.is_claim_kp) {
				if(row.is_red == '1'){
				 str +="<a onclick=\"toRedEdit('"+row.kp_id+"')\">编辑</a>";
			 }else{
				 str +="<a onclick=\"toEdit('"+row.kp_id+"')\">编辑</a>";
			 }
				//str += "<a onclick=\"toEdit('"+row.kp_id+"')\">编辑</a>";
			//}
			// 开票中的开票单, 且不属于结算单直接生成的发票, 且申请未提交的  才需要申请开票
			if (row.status == '0' && row.memo != '结算单直接生成发票' && !row.is_commit_claim) {
				str += "&nbsp;&nbsp;<a onclick=\"toClaim('"+row.kp_id + "','" + row.is_claim_kp + "','" + row.c_id +"')\">申请开票</a>";
			}
			// 申请开票且提交开票了才可以 开票 或者 手工单 但是没有申请开票的单子
			if((row.is_claim_kp && row.is_commit_claim) ||
					(row.memo != '结算单直接生成发票' && !row.is_claim_kp)){
				var the_kp_date="";
				if(row.kp_date){
					the_kp_date=format_date(row.kp_date);
				}
				str += "&nbsp;&nbsp;<a onclick=\"toKp('"+row.kp_id+"','"+row.kp_no+"','"+the_kp_date+"','"+row.sale_class+"')\">开票</a>";
			}
			
			// 如果已开票的 可以撤销开票
			if (row.status == '1') {
				str += "&nbsp;&nbsp;<a onclick=\"toCancel('"+row.kp_id+"')\">撤销开票</a>";
			}
			return str;
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
		
		function toCancel(kp_id) {
			ajax_function_ask_and_refresh("确认撤销开票?","saleInvoiceKpCancel","post",{'kp_id': kp_id},"撤销成功!",$('#table'));
		}
	</script>
</html>