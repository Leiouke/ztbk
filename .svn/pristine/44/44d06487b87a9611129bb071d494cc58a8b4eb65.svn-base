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
								  <div class="form-group input-group inline-middle">
								    <label >来款账号：</label>
								    <input type="text" name="account" class="form-control search-items" disabled>
								  </div>
								  <div class="form-group input-group inline-middle">
								    <label >来款单位：</label>
								    <input type="text" name="company" class="form-control search-items" disabled>
								  </div>
								  <div class="form-group input-group inline-small">
								    <label >来款日期：</label>
								    <input type="text" name="receive_date" class="form-control search-items date-type" disabled>
								  </div>
							</div>							
							<div class="row">
								 <div class="form-group input-group inline-small">
								    <label >付款类型：</label>
								    <select name="pay_type" class="dictionary" disabled>
								    </select>
								  </div>
								  <div class="form-group input-group inline-small">
								    <label >凭证号：</label>
								    <input type="text" name="pay_certificate" class="form-control search-items" disabled>
								  </div>
								  <div class="form-group input-group inline-middle">
								    <label >摘要：</label>
								    <input type="text" name="summary" class="form-control search-items" disabled>
								  </div>
								  <div class="form-group input-group inline-small">
								    <label >来款金额：</label>
								    <input type="text" name="receive_money" class="form-control search-items" disabled>
								  </div>
								  <div class="form-group input-group inline-small">
								    <label >剩余金额：</label>
								    <input type="text" name="surplus_money" class="form-control search-items" disabled>
								  </div>
							</div>
						 </div>
						</form>
		            </div>
       		</div>
       		<div class="ibox float-e-margins">
	            <div class="ibox-title">
	                <h5>认领明细</h5>
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
			json_obj_cash_register['ci_id']=cash_register.ci_id;
		    return json_obj_cash_register;
		}
		
		var $table = $('#table');
		
		function end_function(index, layero){
			ajax_function_no_close("returnIncomingClaimItem","post",{},null);
			var json_data_list=formToJson($("#form"));
			json_data_list['queryId']='${queryId}';
			search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getIncomingClaimItemManageList",$('#table'));
     	}
		
		load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}', 'ci_id': cash_register.ci_id});
		$(document).ready(function () {
			//加载字典数据
			get_dictionary("${context}",cash_register);
			//填写已有数据
			set_one_info($("#form"),cash_register);
			//bootstrap初始化
			initialize_table($table,"getIncomingClaimItemManageList", ${tableHeader}, queryParams, "#tableTool", 400);
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			$('#tableTool').find('select').change(function () {				 
				$('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
			
			//增加条目layer
			var $add=$("#add");
			button_click_windows_end($add,2,"新增来款认领记录",'incomingClaimItemAdd?ci_id=' + cash_register.ci_id + '&can_claim_money=' + $("input[name='surplus_money']").val(),
					true,['620px', '500px'],end_function);
			
			$table.bootstrapTable('refreshOptions',{onLoadSuccess: function(data){
	 			var total_claim_money = 0;
	 			$.each(data.rows, function(index, row){
	 				var is_audit = row.is_audit;
	 				var is_audit_pass = row.is_audit_pass;
					if(row.claim_money==undefined){
						total_claim_money += 0;
					}else{
						// 只有未审核 或者 已审核 但是审核通过的 才是有效的单子
						if (!is_audit || (is_audit && is_audit_pass)) {
							total_claim_money += row.claim_money;
						}
					}
				});
	 			total_claim_money = total_claim_money.toFixed(2);
	 			
	 			var receive_money = $("input[name='receive_money']").val();
	 			$("input[name='surplus_money']").val(receive_money - total_claim_money);
			}});
		});
		
		var to_audit = 0;
		<c:if test="${param.to_audit != null}">
			to_audit = 1;
		</c:if>
		function toEdit(ca_id, ci_id, claim_money) {
			var can_claim_money = Number($("input[name='surplus_money']").val()) + Number(claim_money);
			open_layer_end(2,'编辑来款认领','incomingClaimItemEdit?ca_id=' + ca_id + '&ci_id' + ci_id + '&can_claim_money=' + can_claim_money,
					['620px', '580px'],true,end_function);
		}
			
		function toDel(ca_id, ci_id) {
			ajax_function_ask_and_refresh("是否作废认领单？",'deleteIncomingClaimItem',"post",{'ca_id':ca_id, 'ci_id': ci_id},"作废成功",$('#table'));
		}
		
		function toDetail(ca_id, ci_id) {
			open_layer_end(2,'来款认领详情','incomingClaimItemEdit?to_detail=1&ca_id=' + ca_id + '&ci_id' + ci_id,['620px', '580px'],true,end_function);
		}
		
		function toAuditPass(ca_id, c_id, rebate_money) {
			ajax_function_ask_and_refresh("审核通过该认领单？",'auditIncomingClaimItemPass',"post",{'ca_id':ca_id, 'c_id':c_id, 'rebate_money':rebate_money},"操作成功",$('#table'));
		}
		
		function toAuditNotPass(ca_id, ci_id) {
			ajax_function_ask_and_refresh("审核不通过该认领单？",'auditIncomingClaimItemNotPass',"post",{'ca_id':ca_id, 'ci_id': ci_id},"操作成功",$('#table'));
		}
			
		function renderOperator(value,row,index){
			var str = "";
			var is_audit = row.is_audit;
			if (to_audit == 0) {
				if (!is_audit) {
					str += "<a onclick=\"toEdit('" + row.ca_id + "','" + row.ci_id + "','" + row.claim_money + "')\">修改</a> ";
					str += "<a onclick=\"toDel('" + row.ca_id + "','"  + row.ci_id + "')\">作废</a>";
				} else {
					str+= "<a onclick=\"toDetail('" + row.ca_id + "','" + row.ci_id + "')\">详情</a>";
				}
			} else {
				if (!is_audit) {
			 		str+= "<a onclick=\"toAuditPass('" + row.ca_id + "','" + row.c_id + "','" + row.rebate_money + "')\">通过</a> ";
			 		str+= "<a onclick=\"toAuditNotPass('" + row.ca_id + "','" + row.ci_id + "')\">不通过</a> ";
				}
		 		str+= "<a onclick=\"toDetail('" + row.ca_id + "','" + row.ci_id + "')\">详情</a>";
			}
			return str;
		}
	</script>
</html>