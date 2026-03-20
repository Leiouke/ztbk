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
					    <label >货源名称：</label>
					    <input type="text" name="f_department" class="form-control search-items" disabled>
					  </div>
<!-- 					  <div class="form-group inline-small"> -->
<!-- 					  <label >发票号：</label> -->
<!-- 					    <input type="text" name="inv_no" class="form-control search-items" > -->
<!-- 					  </div>					   -->
<!-- 					  <div class="form-group inline-small"> -->
<!-- 					    <label >发票类型：</label> -->
<!-- 					    <select name="fc_invoice_class" class="form-control dictionary search-items" > -->
<!-- 					    	<option></option> -->
<!-- 					    </select> -->
<!-- 					  </div>					   -->
					  <div class="form-group inline-small">
					    <label >付款申请状态：</label>
					    <select name="fc_ap_status" class="form-control dictionary search-items" >
					    	<option></option>
					    </select>
					  </div>					  
					  <div class="form-group inline-small">
					    <label >付款申请去向：</label>
					    <select name="application_target" class="form-control dictionary search-items" >
					    	<option></option>
					    </select>
					  </div>					  
					  <div class="form-group input-group inline-small">
					    <label >录入人：</label>
					    <input type="text" name="o_id_input_name" class="form-control search-items">
					    <div class="input-group-btn">
                               <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                   <span class="caret"></span>
                               </button>
                               <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                        </div>
                        <input type="hidden" name="o_id_input" class="form-control search-items">
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
					  <div class="form-group inline-small">
					    <label >考核单位：</label>
					    <select name="unit_code" class="form-control dictionary search-items" id="unit_code">
					    	<option></option>
					    </select>
					  </div>
<!-- 					  <div class="form-group inline-small"> -->
<!-- 					    <label >发票日期：</label> -->
<!-- 					    <input type="text" class="form-control layer-date search-items" name="invoice_date_start" id="invoice_date_start"> -->
<!-- 					    - -->
<!-- 					    <input type="text" class="form-control layer-date search-items" name="invoice_date_end" id="invoice_date_end"> -->
<!-- 					  </div> -->
<!-- 					  <div class="form-group inline-small"> -->
<!-- 					    <label >操作日期：</label> -->
<!-- 					    <input type="text" class="form-control  layer-date search-items" name="input_date_start" id="input_date_start"> -->
<!-- 					    - -->
<!-- 					    <input type="text" class="form-control  layer-date search-items" name="input_date_end" id="input_date_end"> -->
<!-- 					  </div> -->
<!-- 					  <div class="form-group inline-small"> -->
<!-- 						    <label >是否有发票号：</label> -->
<!-- 						    <select name="has_kp_no" class="form-control dictionary search-items isboolean" > -->
<!-- 						    	<option value=""></option> -->
<!-- 						    </select> -->
<!-- 					  </div> -->
<!-- 					  <div class="form-group inline-middle"> -->
<!-- 					  	<label >备注：</label> -->
<!-- 					    <input type="text" name="memo" class="form-control search-items" > -->
<%-- 					    <input type="hidden" name="fc_kp_type" value="${param.fc_kp_type}" /> --%>
<!-- 					  </div> -->
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
                                	<button type="button" class="btn btn-outline btn-default" id="config">
                                        <i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn btn-outline btn-default" id="add_advance">
                                    	预付单付款申请
                                    </button>
                                    <button type="button" class="btn btn-outline btn-default" id="add_invoice">
                                    	发票付款申请
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
    
    <div class="col-md-12" id="print_div" style="display:none">
	   <form id="print_form" class="form-inline">
	   		  <input type="hidden" name="ap_id">
	   		  <input type="hidden" name="is_print">
              <div class="panel-body">
                         <div class="row">
		                	<div class="form-group small-space col-xs-12 print-layer-button">
		                  		<button id="export_commit" class="btn btn-success" type="button">导出</button>
		                  		<button id="print_commit" class="btn btn-success" type="button">打印</button>
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
			ajax_function_no_close("returnPaymentApplication","post",{},null);
			var json_data_list=formToJson($("#form_search"));
			json_data_list['queryId']='${queryId}';
			search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getApplicationManageList",$('#table'));
     	}
		
// 		var kp_layer_index;
		$(document).ready(function () {
			 //固定列
			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化
			initialize_table($table,"",${tableHeader},queryParams,"#tableTool",400);
			$("#search").on('click',function(){
				 var json_data_list=formToJson($("#form_search"));
				 json_data_list['queryId']='${queryId}';
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getApplicationManageList",$table);
			});
			//增加条目layer
			var $add_advance=$("#add_advance");
			button_click_windows_end($add_advance,2,"新增预付申请",'paymentApplicationAdd?type=0',true,['620px', '500px'],end_function);
			//增加条目layer
			
			var $add_invoice=$("#add_invoice");
			button_click_windows_end($add_invoice,2,"新增发票付款申请",'paymentApplicationAdd?type=1',true,['620px', '500px'],end_function);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			$('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
			
			//自动搜索填补
			initialize_bsSuggest_fc_factory("${context}", "f_department", "f_id");//货源
			initialize_bsSuggest_fc_user("${context}", "o_id_input_name", "o_id_input");      // 放用户信息(录入人)
			initialize_bsSuggest_fc_user("${context}", "o_id_operator_name", "o_id_operator");      // 放用户信息(操作人)
			 
			// 获得当前部门的考核单位
			get_assess_unit_by_dept("${context}", "unit_code"); 
			
			$("#export_commit").on('click',function(){
				 var href_str="${context}/fc/print/paymentApplicationRmb?is_print=0&";
				 var ap_id=$("#print_form").find("input[name='ap_id']").val();
				 href_str+="ap_id="+ap_id;
				 /*var print_type=$("#print_form").find("select[name='print_type']").val();
				 href_str+="&print_type="+print_type;*/
				 window.open(href_str);	
			});
			
			$("#print_commit").on('click',function(){
				 $("#print_form").find("input[name='is_print']").val(1);
				 ajax_function_no_close("${context}/fc/print/paymentApplicationRmb","post",$('#print_form').serialize(),"发送打印完成！"); 
			 });
	     });
		
		 function toEdit(ap_id){
			 open_layer_end(2,'编辑付款申请','paymentApplicationEdit?ap_id='+ap_id+'&is_detail='+0,['620px', '580px'],true,end_function);
		 }
		 
		 function toDetail(ap_id){
			 open_layer_end(2,'付款申请详情','paymentApplicationEdit?ap_id='+ap_id+'&is_detail='+1,['620px', '580px'],true,end_function);
		 }
		 
		 function toDel(ap_id){
			 ajax_function_ask_and_refresh("确认删除","paymentApplicationDelete","post",{'ap_id':ap_id},'删除成功',$table);
		 }
		 
		 function toSubmit(ap_id,flow_id){
			 ajax_function_ask_and_refresh("确认提交","paymentApplicationSubmit","post",{'bill_code':ap_id,'flow_id':flow_id},'提交成功',$table);
		 }
		 
		function toPrint(ap_id){
			$("#print_form").find("input[name='ap_id']").val(ap_id);
			open_layer(1,"付出凭证打印",$('#print_div'),['360px', '180px'],false);
	 	}
		
		function toPrintNotice(ap_id) {
			open_layer(2,'付款通知打印','toApplicationPaymentNotice?ap_id='+ ap_id, ['800px', '600px'], false);
		}
		
		function toOA(ap_id){
			 ajax_function_ask_and_refresh("确认推送OA","paymentApplicationOa","post",{'bill_code':ap_id},'推送成功',$table);
		 }
		 
		function renderOperator(value,row,index){
			var str = '';
			if(row.status==0){
				str += "<a onclick=\"toEdit('"+row.ap_id+"')\">编辑</a>";
				str += "&nbsp;&nbsp;<a onclick=\"toDel('"+row.ap_id+"')\">删除</a>";
				str += "&nbsp;&nbsp;<a onclick=\"toSubmit('"+row.ap_id+"','"+row.flow_id+"')\">提交</a>";
			}else{
				str += "<a onclick=\"toDetail('"+row.ap_id+"')\">详情</a>";
			}
			
			if(row.approval_result==1&&row.syn_oa!=1){
				str += "&nbsp;&nbsp;<a onclick=\"toOA('"+row.ap_id+"')\">推送</a>";
			}
			
// 			if(row.approval_result!=0&&row.syn_oa!=1){
// 				str += "&nbsp;&nbsp;<a onclick=\"toOA('"+row.ap_id+"')\">推送</a>";
// 			}
			
			
			// 假如人民币
			if (row.currency == '00') {
				str += "&nbsp;&nbsp;<a onclick=\"toPrint('" + row.ap_id + "')\">付出凭证</a>";
			} else {  // 其他币种
				str += "&nbsp;&nbsp;<a onclick=\"toPrintNotice('" + row.ap_id + "')\">付款通知</a>";
			}
			return str;
		}
	</script>
</html>