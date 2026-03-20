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
	    <link rel="stylesheet" type="text/css" href="${context}/css/plugins/webuploader/webuploader.css">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	</head>
	<body>
		<div class="sonpage-body">
			<div class="col-md-12">
						   <div class="ibox float-e-margins">
		            <div class="ibox-content search-content">
			            <form id="form" class="form-inline">
			            <div class="col-xs-12">
							<div class="row">
								  <div class="form-group inline-small">
								  	<label>刊号:</label>
								    <input type="text" class="form-control  search-items"  name="mail_code" id="mail_code" readonly>
								  </div>
								  <div class="form-group inline-middle">
								  	<label>刊名:</label>
								    <input type="text" class="form-control  search-items"  name="qk_name" id="qk_name" readonly>
								  </div>
								  <div class="form-group inline-small">
								  	<label>期次:</label>
								    <input type="text" class="form-control  search-items"  name="period_id" id="period_id" readonly>
								  </div>
								  <div class="form-group inline-small">
								  	<label>期名:</label>
								    <input type="text" class="form-control  search-items"  name="period_name" id="period_name" readonly>
								  </div>
								  <div class="form-group inline-small">
								  	<label>零售价:</label>
								    <input type="text" class="form-control  search-items"  name="qk_price_ls" id="qk_price_ls" readonly>
								  </div>
								  <div class="form-group inline-small">
								  	<label>配送日期:</label>
								    <input type="text" class="form-control  search-items"  name="ps_date" id="ps_date" readonly>
								  </div>
								  <div class="form-group inline-small">
								  	<label>订阅日期:</label>
								    <input type="text" class="form-control  search-items"  name="subscribe_date" id="subscribe_date" readonly>
								  </div>
							</div>
							<div class="row">
								<div class="form-group inline-small">
								  	<label>到货数:</label>
								    <input type="text" class="form-control  search-items"  name="h_amount_dh" id="h_amount_dh" readonly>
								  </div>
								<div class="form-group inline-small">
								  	<label>实发数:</label>
								    <input type="text" class="form-control  search-items"  name="h_amount_now" id="h_amount_now" readonly>
								</div>
							</div>
						 </div>
						</form>
		            </div>
       		</div>
       		<div class="ibox float-e-margins">
	            <div class="ibox-title">
	                <h5>分发</h5>
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
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
     <!-- Bootstrap table editable-->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-editable.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table-editable.js"></script>
	<script type="text/javascript">
		var $table = $('#table');
		load_sum_list_first("${context}/csu/getTableCollectDataBK",{'queryId':'${queryId}','ItemExclusiveCode':'${ItemExclusiveCode}'});
		function queryParams(param) {
			var json_obj_invoice = {};
			json_obj_invoice['limit'] =param.limit;
			json_obj_invoice['offset'] =param.offset;
			json_obj_invoice['sortName'] =this.sortName;
			json_obj_invoice['sortOrder'] =this.sortOrder;
			json_obj_invoice['ItemExclusiveCode'] ='${ItemExclusiveCode}';
		    return json_obj_invoice;
		}
		
		$("#ps_date").val('${ps_date}');
		$("#subscribe_date").val('${subscribe_date}');
		$("#h_amount_dh").val('${h_amount_dh}');
		
		$(document).ready(function () {
			
			var ff_item = dealOneJson('${oneJson}');
			
			//填写已有数据
			set_one_info($("#form"), ff_item);
			
			//表格配置 layer
			var $config=$("#config");
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			$('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		     });
			
			initialize_table_editable_footer($table,"getMagffList",${tableHeader},queryParams,"#tableTool",550,"editMagff");
			
		});
		
		function load_sum_list_first(sumurl,datajson){
			$.ajax({
		        type: "post",
		        url: sumurl,
		        data: datajson,
		        dataType: 'JSON',
		        success: function (data) {
		        	sum_list=data;
		        	$('#h_amount_now').val(sum_list.h_amount_now);
		        },
		        error: function (data) {
		        	console.log(data);
		        }
		    });
		}
		
		function load_sum_list(sumurl,datajson,$table){
			$.ajax({
		        type: "post",
		        url: sumurl,
		        data: datajson,
		        dataType: 'JSON',
		        success: function (data) {
		        	sum_list=data;
		        	$('#h_amount_now').val(sum_list.h_amount_now);
		        	$table.bootstrapTable('refresh');
		        },
		        error: function (data) {
		        	console.log(data);
		        }
		    });
		}
		
		//重写方法，让其可以刷新下方的汇总
		function initialize_table_editable_footer($table,url,columns_config,queryParams,toolbar,height,edit_url){
			$table.bootstrapTable({
			      url: url,
			      method:'post',
			      pagination: true,
			      showRefresh: true,
			      showColumns: true,
			      showExport:true,
			      sortable:true,
			      showFooter:true,
			      sidePagination : "server", // 服务端处理分页 
			      iconSize: 'outline',
			      toolbar: toolbar,
			      exportDataType:'all',
			      queryParams: queryParams,
			      pageSize:200,
			      height:height,
			      pageList:[200, 500, 5000],
			      columns: columns_config,
			      icons: {
			        refresh: 'glyphicon-repeat',
			        toggle: 'glyphicon-list-alt',
			        columns: 'glyphicon-list'
			      },
			      onEditableSave: function (field, row, oldValue, $el) {
		              $.ajax({
		                  type: "post",
		                  url: edit_url,
		                  data: row,
		                  dataType: 'JSON',
		                  success: function (data, status) {
		                      if (data.success) {
		                      	layer.msg('修改成功');
		                      	load_sum_list("${context}/csu/getTableCollectDataBK",{'queryId':'${queryId}','ItemExclusiveCode':'${ItemExclusiveCode}'},$table);
		                      	$table.bootstrapTable('refresh'); //后台控制数据是否符合规范时，不符合也会返回success。需要重新刷新数据
		                      }else{
		                    	row[field]=oldValue;
		                      	$el.editable('setValue', oldValue);
		                        if(data.errorMsg){
		                        	layer.msg(data.errorMsg);
		                        }else{
		                        	layer.msg("修改失败");
		                        }
		                      }
		                  },
		                  error: function (data) {
		                	row[field]=oldValue;
		                	$el.editable('setValue', oldValue);
		                  	layer.msg('修改失败');
		                  },
		                  complete: function () {

		                  }

		              });
		          },
		          onCheck:function(row){
		            	var num=calculate_select($table);
		            	$("#checkbox_num").html(num);
		          },
		          onUncheck:function(row){
		        	var num=calculate_select($table);
		        	$("#checkbox_num").html(num);
		          },
		          onCheckAll:function(row){
		        	var num=calculate_select($table);
		        	$("#checkbox_num").html(num);
		          },
		          onUncheckAll:function(row){
		        	var num=calculate_select($table);
		        	$("#checkbox_num").html(num);
		          }
			    });
		}
		
		
	</script>
</html>