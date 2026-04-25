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
	            <form id="form_search" class="form-inline" method="post" target="_blank" action="${context}/download/invoiceDhItemExport">
	            <div class="col-xs-11">
					  <div class="form-group input-group inline-middle">
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
					  <div class="form-group inline-small">
						<input type="hidden" name="is_red" value="1" id = "is_red">
					  </div>
					  <div class="form-group inline-small">
					  <label >发票号：</label>
					    <input type="text" name="inv_no" class="form-control search-items" >
					  </div>					  
					  <div class="form-group inline-small">
					    <label >发票日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="invoice_date_start" id="invoice_date_start">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="invoice_date_end" id="invoice_date_end">
					  </div>
					  <div class="form-group inline-small">
					    <label >发票类型：</label>
					    <select name="invoice_class" class="form-control dictionary search-items" >
					    	<option></option>
					    </select>
					  </div>
					  <div class="form-group inline-small">
					    <label >发票类别：</label>
					    <select name="invoice_family" class="form-control dictionary search-items" >
					    	<option></option>
					    </select>
					  </div>
					  <div class="form-group inline-small">
					    <label >发票状态：</label>
					    <select name="invoice_dh_status" class="form-control dictionary search-items" >
					    	<option></option>
					    </select>
					  </div>
					  <div class="form-group input-group inline-small">
					    <label >业务员：</label>
					    <input type="text" name="o_id_operator_name" class="form-control search-items">
					    <div class="input-group-btn">
	                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                            <span class="caret"></span>
	                        </button>
	                        <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                        </div>
                        <input type="hidden" name="o_id_operator" class="form-control search-items">
					  </div>
					  <div class="form-group input-group inline-small">
					    <label >制单员：</label>
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
					    <label >录入日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="input_date_start" id="input_date_start">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="input_date_end" id="input_date_end">
					  </div>
					  <div class="form-group inline-small">
					    <label >财务分类已更新：</label>
					    <select name="has_old_cw_type" class="form-control dictionary isboolean search-items">
					    	<option></option>
					    </select>
					  </div>	
					  <div class="row" style="margin-bottom:5px">
				  		  <div class="form-group inline-small">
							  <label >发票号(多个)：</label>
							  <textarea rows="3" cols="15" name="inv_nos" class="form-control search-items"></textarea>
						  </div>
					  </div>
				 </div>
				 <div class="col-xs-1 search-group-button">
				  	<button type="button" class="btn btn-primary btn-xs" id="search">查询</button>
				  	<button type="button" class="btn btn-default btn-xs" id="reset" >清空</button>
				 </div>
				</form>
            </div>
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>发票管理</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="row row-lg">                    
                    <div class="col-sm-12">
	                    <div class="btn-group hidden-xs" id="tableTool" role="group">
	                        <div class="btn-group">
					            <button type="button" class="btn btn-outline btn-default dropdown-toggle" data-toggle="dropdown" style="color: blue;">
					                <i class="glyphicon glyphicon-plus" aria-hidden="true"></i> 新增蓝票 <span class="caret"></span>
					            </button>
					            <ul class="dropdown-menu" role="menu">
					                <li><a href="javascript:void(0);" id="add">标准蓝票</a></li>
					                <li><a href="javascript:void(0);" id="add_no">非标蓝票</a></li>
					                <li><a href="javascript:void(0);" id="add_agent">代理蓝票</a></li>
					                <li><a href="javascript:void(0);" id="add_other">其他蓝票</a></li>
					                <li class="divider"></li>
					                </ul>
					        </div>
					
					        <div class="btn-group">
					            <button type="button" class="btn btn-outline btn-default dropdown-toggle" data-toggle="dropdown" style="color: red;">
					                <i class="glyphicon glyphicon-plus" aria-hidden="true"></i> 新增红票 <span class="caret"></span>
					            </button>
					            <ul class="dropdown-menu" role="menu">
					                <li><a href="javascript:void(0);" id="red_add">标准红票</a></li>
					                <li><a href="javascript:void(0);" id="red_add_no">非标红票</a></li>
					                <li><a href="javascript:void(0);" id="red_add_agent">代理红票</a></li>
					                <li><a href="javascript:void(0);" id="red_add_other">其他红票</a></li>
					                <li class="divider"></li>
					                </ul>
					        </div>
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
    <!-- Bootstrap table editable-->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-editable.js"></script>
  	<script src="${context}/js/plugins/bootstrap-table/bootstrap-table-editable.js"></script>
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
    
	<script type="text/javascript">
		inistal_data('#invoice_date_start','#invoice_date_end');
		inistal_data('#input_date_start','#input_date_end');
		var $table = $('#table');
		function queryParams(param) {
			var json_obj=formToJson($("#form_search"));
			json_obj['limit'] =param.limit;
   	      	json_obj['offset'] =param.offset;
   	     	json_obj['sortName'] =this.sortName;
   	  		json_obj['sortOrder'] =this.sortOrder;
   	        return json_obj;
		}
		
		function end_function(index, layero){
			ajax_function_no_close("returnInvoiceDh","post",{},null);
			var json_data_list=formToJson($("#form_search"));
			json_data_list['queryId']='${queryId}';
			search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getInvoiceManageList",$table);
     	}
		

		function red_end_function(index, layero){
			var json_data_list=formToJson($("#form_search"));
			json_data_list['queryId']='${queryId}';
			search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getInvoiceManageList",$table);
     	}
		
		$(document).ready(function () {
			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化
			//initialize_table($table,"",${tableHeader},queryParams,"#tableTool",400);
			initialize_table_editable($table,"",${tableHeader},queryParams,"#tableTool",400, "editTrafficFee");
			$table.bootstrapTable('refreshOptions',{
				rowStyle: function (row, index) {
		             var style = {};
		             if(row.is_red==1)
	                 	style={css:{'background':'pink'}};
		             return style;
		         } 
			});
			
			$("#search").on('click',function(){
				 var json_data_list=formToJson($("#form_search"));
				 json_data_list['queryId']='${queryId}';
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getInvoiceManageList",$table);
			});
			
			//增加蓝票条目layer
			var $add=$("#add");
			button_click_windows_end($add,2,"新增标准蓝票",'invoiceAdd',true,['620px', '500px'],end_function);
			var $addNo=$("#add_no");
			button_click_windows_end($addNo,2,"新增非标蓝票",'noInvoiceAdd',true,['620px', '500px'],end_function);
			var $addAgent=$("#add_agent");
			button_click_windows_end($addAgent,2,"新增代理蓝票",'agentInvoiceAdd',true,['620px', '500px'],end_function);
			var $addOther=$("#add_other");
			button_click_windows_end($addOther,2,"新增其他蓝票",'otherInvoiceAdd',true,['620px', '500px'],end_function);
			//增加红票条目layer
			var $redadd=$("#red_add");
			button_click_windows_end($redadd,2,"新增标准红票",'redInvoiceAdd',true,['620px', '500px'],red_end_function);
			var $redAddNo=$("#red_add_no");
			button_click_windows_end($redAddNo,2,"新增非标红票",'redNoInvoiceAdd',true,['620px', '500px'],red_end_function);
			var $redAddAgent=$("#red_add_agent");
			button_click_windows_end($redAddAgent,2,"新增代理红票",'redAgentInvoiceAdd',true,['620px', '500px'],red_end_function);
			var $redAddOther=$("#red_add_other");
			button_click_windows_end($redAddOther,2,"新增其他红票",'redOtherInvoiceAdd',true,['620px', '500px'],red_end_function);
			
			
			//表格配置 layer
			var $config=$("#config");			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			$('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });

			//自动搜索填补
			//initialize_bsSuggest_all_type_factory("${context}");
			initialize_bsSuggest_bk_factory("${context}", "f_name", "f_id");
			initialize_bsSuggest_user_by_dept("${context}", "o_id_operator_name", "o_id_operator", "2000");      // 放用户信息(报刊的)
			initialize_bsSuggest_user_by_dept("${context}", "o_id_input_name", "o_id_input", "2000");      // 放用户信息(报刊的)
	     });
		 
		 function toEdit(id){
			 open_layer_end(2,'编辑标准蓝票','invoiceEdit?inv_id='+id,['620px', '580px'],true,end_function);
		 }
		 function toEditNo(id){
			 open_layer_end(2,'编辑非标蓝票','noInvoiceEdit?inv_id='+id,['620px', '580px'],true,end_function);
		 }
		 function toEditAgent(id){
			 open_layer_end(2,'编辑代理蓝票','agentInvoiceEdit?inv_id='+id,['620px', '580px'],true,end_function);
		 }
		 function toEditOther(id){
			 open_layer_end(2,'编辑其他蓝票','otherInvoiceEdit?inv_id='+id,['620px', '580px'],true,end_function);
		 }
		 
		 //红票
		 function toEditRed(id){
			 open_layer_end(2,'编辑标准红票','redInvoiceEdit?inv_id='+id,['620px', '580px'],true,red_end_function);
		 }
		 function toEditNoRed(id){
			 open_layer_end(2,'编辑非标红票','redNoInvoiceEdit?inv_id='+id,['620px', '580px'],true,red_end_function);
		 }
		 function toEditAgentRed(id){
			 open_layer_end(2,'编辑代理红票','redAgentInvoiceEdit?inv_id='+id,['620px', '580px'],true,red_end_function);
		 }
		 function toEditOtherRed(id){
			 open_layer_end(2,'编辑其他红票','redOtherInvoiceEdit?inv_id='+id,['620px', '580px'],true,red_end_function);
		 }
		 
		 //function toPurchase(id){
			 //open_layer(2,'财务进货明细','invoicePurchase?inv_id='+id,['620px', '580px'],true);
		 //}
		 
		 function toVerify(inv_id){
			 ajax_function_ask_and_refresh("是否提交","verifyInvoiceDh","post",{'inv_id':inv_id},"提交成功",$('#table'));
		 }
		 
		 function toOffset(inv_id){
			 open_layer_end(2,"发票核销",'invoiceOffset?inv_id='+inv_id,['620px', '580px'],true,end_function);
		 }
		 
		 function renderOperator(value,row,index){
			 var str = "";
			    var isRed = (row.is_red == 1);
			    var status = row.status;
			    var family = row.invoice_family;

			    // 判断是编辑还是查看（状态0为制单中，显示“编辑”，否则“查看”）
			    var isEdit = (status == "0");
			    var baseText = isEdit ? "编辑" : "查看";

			    // 根据红字标志和发票类别确定对应的函数名
			    var baseFunc = "";
			    if (isRed) {
			        if (family == "0") {
			            baseFunc = "toEditRed";
			        } else if (family == "1") {
			            baseFunc = "toEditAgentRed";
			        } else if (family == "2") {
			            baseFunc = "toEditOtherRed"; // 路由到其他红票编辑函数
			        } else if (family == "3") {
			            baseFunc = "toEditNoRed"; // 路由到其他红票编辑函数
			        }
			    } else {
			        if (family == "0") {
			            baseFunc = "toEdit";
			        } else if (family == "1") {
			            baseFunc = "toEditAgent";
			        } else if (family == "2") {
			            baseFunc = "toEditOther"; // 路由到其他蓝票编辑函数
			        } else if (family == "3") {
			            baseFunc = "toEditNoRed"; // 路由到其他蓝票编辑函数
			        }
			    }

			    // 拼接基础链接（编辑/查看）
			    str += "<a onclick=\"" + baseFunc + "('" + row.inv_id + "')\">" + baseText + "</a> ";

			    // 根据状态添加附加链接
			    if (status == "0") {
			        // 制单中：添加“提交”链接（所有发票均适用）
			        str += "&nbsp;&nbsp;<a onclick=\"toVerify('" + row.inv_id + "')\">提交</a>";
			    } else if (!isRed && status == "6") {
			        // 非红字且状态为6（提交待核销）：添加“核销”（其他发票与代理发票保持一致）
			        str += "&nbsp;&nbsp;<a onclick=\"toOffset('" + row.inv_id + "')\">核销</a>";
			    } else if (!isRed && family == "0") {
			        // 非红字、其他状态且发票类别为0（仅限常规发票）：添加“核销查看”
			        str += "&nbsp;&nbsp;<a onclick=\"toOffset('" + row.inv_id + "')\">核销查看</a>";
			    }

			    return str;
	    }
	</script>
</html>