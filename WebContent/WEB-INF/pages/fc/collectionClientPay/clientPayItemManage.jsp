<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	    <style type="text/css">
	    .ibox-content-table input[type='text']{
	    	width:70px;
	        text-align: right;
	    }
	    </style>
	</head>
	<body>
		<div class="sonpage-body">
			<div class="col-md-12">
			   <div class="ibox float-e-margins">
		            <div class="ibox-content search-content">
			            <form id="form" class="form-inline">
			            <input type="hidden" name="ci_id">
			            <div class="col-xs-12">
				            <div class="row">
								  <div class="form-group input-group inline-middle not-null">
								    <label >客户编号：</label>
								    <input type="text" name="c_id" class="form-control search-items auto-not-null"  disabled />
								  </div>
								  <div class="form-group inline-large">
								    <label >户号(_客户名称)：</label>
								    <input type="text" name="c_name" class="form-control search-items" disabled />
								  </div>
								  <div class="form-group input-group inline-small">
								    <label >余额：</label>
								    <input type="text" name="advance_balance" class="form-control search-items" disabled />
								  </div>
							</div>
						 </div>
						</form>
		            </div>
       		</div>
       		<div class="ibox float-e-margins">
	            <div class="ibox-title">
	                <h5>支出明细</h5>
	                <div class="ibox-tools">
	                    <a class="collapse-link">
	                        <i class="fa fa-chevron-up"></i>
	                    </a>
	                </div>
	            </div>
	            <div class="ibox-content ibox-content-table">
	                <div class="row row-lg">                    
	                    <div class="col-sm-12">
	                        <div class="btn-group hidden-xs" id="tableTool" role="group">
	                          <c:if test="${param.to_audit == null}">
	                          <button type="button" class="btn btn-outline btn-default" id="add">
		                          <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
		                      </button>
		                      </c:if>
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
	</div>
	<div class="sonpage-footer">
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
    
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
	<script type="text/javascript">
		var cash_register_str='${oneJson}';
		cash_register_str=cash_register_str.replace(/\r\n/g,"\\r\\n")  
    	cash_register_str=cash_register_str.replace(/\n/g,"\\n");
		cash_register_str=cash_register_str.replace(/\s/g," ");
		var cash_register=JSON.parse(cash_register_str);
		
		function queryParams(param) {
			var json_obj_cash_register = {};
			json_obj_cash_register['limit'] =param.limit;
			json_obj_cash_register['offset'] =param.offset;
			json_obj_cash_register['sortName'] =this.sortName;
			json_obj_cash_register['sortOrder'] =this.sortOrder;
			json_obj_cash_register['c_id']=cash_register.c_id;
		    return json_obj_cash_register;
		}
		
		var $table = $('#table');
		
		function end_function(index, layero){
			ajax_function_no_close("returnClientPayItem","post",{},null);
			var json_data_list=formToJson($("#form"));
			json_data_list['queryId']='${queryId}';
			search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getClientPayItemManageList",$('#table'));
     	}
		
		load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}', 'c_id': cash_register.c_id});
		$(document).ready(function () {
			$("input[name='c_name']").val(cash_register['custom_id']+"_"+cash_register['c_department']);
			//填写已有数据
			set_one_info($("#form"),cash_register);
			
			//bootstrap初始化
			initialize_table($table,"getClientPayItemManageList", ${tableHeader}, queryParams, "#tableTool", 400);
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			$('#tableTool').find('select').change(function () {
				$('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
			
			//增加条目layer
			var $add=$("#add");
			button_click_windows_end($add,2,"新增余额支出记录",'clientPayItemAdd?c_id=' + cash_register.c_id + '&advance_balance=' + $("input[name='advance_balance']").val(),
					true,['620px', '500px'],end_function);
			
			$table.bootstrapTable('refreshOptions',{onLoadSuccess: function(data){
				// 实时 余额更新
				$.ajax({ 
				        url: "getClientPayItemOneClient", 
				        method: "post",
				        dataType: "json",
				        traditional:true,
				        //传送请求数据
				        data: {c_id: cash_register.c_id},
				        success: function (data) { 
				        	$("input[name='advance_balance']").val(data.advance_balance);
				        },
				        error:function(data){	
				        	alert("ajax请求失败!");
				        }
				});
			}});
		});
		
		var to_audit = 0;
		<c:if test="${param.to_audit != null}">
			to_audit = 1;
		</c:if>
		function toEdit(pa_id, pay_money) {
			var advance_balance = Number($("input[name='advance_balance']").val()) + Number(pay_money);
			open_layer_end(2,'编辑来款认领','clientPayItemEdit?pa_id=' + pa_id + '&advance_balance=' + advance_balance,['620px', '580px'],true,end_function);
		}
			
		function toDel(pa_id, c_id) {
			ajax_function_ask_and_refresh("是否作废支出单？",'deleteClientPayItem',"post",{'pa_id':pa_id, 'c_id': c_id},"作废成功",$('#table'));
		}
		
		function toDetail(pa_id) {
			open_layer_end(2,'余额支出详情','clientPayItemEdit?to_detail=1&pa_id=' + pa_id,['620px', '580px'],true,end_function);
		}
		
		function toAuditPass(pa_id, c_id, rebate_money) {
			ajax_function_ask_and_refresh("审核通过该支出单？",'auditClientPayItemPass',"post",{'pa_id':pa_id, 'c_id':c_id, 'rebate_money':rebate_money},"操作成功",$('#table'));
		}
		
		function toAuditNotPass(pa_id, c_id) {
			ajax_function_ask_and_refresh("审核不通过该支出单？",'auditClientPayItemNotPass',"post",{'pa_id':pa_id, 'c_id': c_id},"操作成功",$('#table'));
		}
		
		function toAccount(pa_id) {
			ajax_function_ask_and_refresh("是否记账支出单？",'accountClientPayItem',"post",{'pa_id':pa_id},"记账成功",$('#table'));
		}
			
		function renderOperator(value,row,index){
			var str = "";
			var is_audit = row.is_audit;
			var is_audit_pass = row.is_audit_pass;
			var is_sale = row.is_sale;
			var is_account = row.is_account;
			if (to_audit == 0) {
				if (!is_audit) {
					str += "<a onclick=\"toEdit('" + row.pa_id + "','" + row.pay_money + "')\">修改</a> ";
					str += "<a onclick=\"toDel('" + row.pa_id + "','"  + row.c_id + "')\">作废</a>";
				} else {
					str+= "<a onclick=\"toDetail('" + row.pa_id + "')\">详情</a>";
				}
			} else {
				if (!is_audit) {
			 		str+= "<a onclick=\"toAuditPass('" + row.pa_id + "','" + row.c_id + "','" + row.rebate_money + "')\">通过</a> ";
			 		str+= "<a onclick=\"toAuditNotPass('" + row.pa_id + "','" + row.c_id + "')\">不通过</a> ";
				} else if (is_audit_pass && is_sale && !is_account) {  // 审核通过的 和  销售归档 过的 可以 记账
					str+= "<a onclick=\"toAccount('" + row.pa_id + "')\">记账</a> ";
				} 
				str+= "<a onclick=\"toDetail('" + row.pa_id + "')\">详情</a>";
			}
			return str;
		}
	</script>
</html>