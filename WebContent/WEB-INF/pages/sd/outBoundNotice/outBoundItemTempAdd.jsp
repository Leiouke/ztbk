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
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-editable.css" rel="stylesheet">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <style type="text/css">
	    	/*table里面的文本框css*/
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
									<div class="form-group input-group inline-middle" style = "margin-left:0px">
									    <label >客户编号：</label>
									    <input type="text" name="c_id" id = "c_id" class="form-control search-items" >
									    <div class="input-group-btn">
		                                    <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
		                                        <span class="caret"></span>
		                                    </button>
		                                    <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
		                                </div>
									  </div>
									  <div class="form-group inline-large">
									    <label >户号(_客户名称)：</label>
									    <input type="text" name="c_department" id = "c_department" class="form-control search-items" disabled>
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
	                <h5>出库明细</h5>
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
	function queryParams(param) {
		var json_obj_invoice = formToJson($("#form_search"));;
		json_obj_invoice['limit'] =param.limit;
		json_obj_invoice['offset'] =param.offset;
		json_obj_invoice['sortName'] =this.sortName;
		json_obj_invoice['sortOrder'] =this.sortOrder;
	    return json_obj_invoice;
	}
	
	var $table = $('#table');
	$(document).ready(function () {
		
		$('#save').on('click', function () {
			var stock_ids = $.map($table.bootstrapTable('getSelections'), function (row) {
                return row.stock_id;
            });
			if(stock_ids.length!=0) {
				//ajax_function_ask_and_dosuccess("确认删除？","deleteOutBoundItemTemp","post",{'inc_nos':inc_nos},load_table_data_success);
				ajax_function_ask_and_close("确认引入？","addOutBoundItemTemp","post",{'stock_ids':stock_ids},"引入成功");
			} else {
				layer.msg("未选择明细！");
			}
			
		});
		
		//加载字典数据
		get_dictionary("${context}",null);
		//bootstrap初始化		
		initialize_table($table,"",${tableHeader},queryParams,"#tableTool",550);
		
		$("#search").on('click',function(){
			 var json_data_list=formToJson($("#form_search"));
			 json_data_list['queryId']='${queryId}';
			 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getCanOutBoundItemTempList",$table);
		 });
		
		//表格配置 layer
		var $config=$("#config");
		
		table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		
		//重写config方法，否则重新刷新会同时刷新guid
// 		function table_column_config_layer($config,type,title,url,$table){
// 			$config.on('click', function () {
// 				  parent.layer.open({
// 		              type: 2,
// 		              title:title,
// 		              moveOut:true,
// 		              area: ['820px', '580px'],
// 		              skin: 'layui-layer-rim', //加上边框
// 		              content: url,
// 		              end:function () {
// 		            	  $table.bootstrapTable('refresh');
// 		              }
// 		          }); 				
// 			 });
// 		}
		
		$('#tableTool').find('select').change(function () {
			 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
	    });
		
		initialize_bsSuggest_bk_client("${context}", "c_department", "c_id");
	});
	</script>
</html>