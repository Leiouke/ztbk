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
		            <div class="ibox-content search-content">
			            <form id="form_search" class="form-inline">
				            <div class="col-xs-11">
					        	<div class="form-group inline-small not-null">
									<label >出库类型：</label>
									<select name="out_type" data-id-start ="01" data-id-end ="01" class="form-control dictionary search-items">
									</select>
								</div>
								<div class="form-group inline-small ">
									<label >收订单号：</label>
									<input type="text" name="zd_id" class="form-control search-items" >
								</div>
								<div class="form-group inline-large">
									<label >客户名称：</label>
									<input type="hidden" name="c_id" id="c_id"  class="form-control search-items" >
									<input type="text" name="c_department" id="c_department" class="form-control search-items" disabled>
								</div>
								<div class="form-group inline-small ">
									<label >期刊名称：</label>
									<input type="text" name="qk_name" class="form-control search-items" >
								</div>
								<div class="form-group inline-small ">
									<label >库存数量  ></label>
									<input type="text" name="inventory_amount" class="form-control search-items" value = "0">
								</div>
								<div class="form-group inline-small">
					    			<label >最新入库时间：</label>
					    			<input type="text" class="form-control  layer-date search-items" name="last_inbound_time_start" id="last_inbound_time_start">
					    			-
					    			<input type="text" class="form-control  layer-date search-items" name="last_inbound_time_end" id="last_inbound_time_end">
					  		 	</div>
					  		 	<div class="form-group inline-small ">
									<label >累计期次数 >=</label>
									<input type="text" name="period_count" class="form-control search-items">
								</div>
							 </div>
							 <div class="col-xs-1 search-group-button">
					  			<button type="button" class="btn btn-primary btn-xs" id="search">查询</button>
					  			<button type="button" class="btn btn-default btn-xs" id="reset" >清空</button>
				 			</div>
						</form>
						<div class="row row-lg">                    
	                    	<div class="col-sm-12">
	                                <div class="btn-group hidden-xs" id="tableTool_canOutBound" role="group">	                                   
	                                    <button type="button" class="btn btn-outline btn-default" id="config_canOutBound">
	                                        <i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
	                                    </button>	                                    
	                                   <select class="form-control" >
	                                   		<option value="all">导出全部</option>
							                <option value="basic">导出当页</option>	
							            </select>
	                                </div>
	                                <table id="table_canOutBound" data-mobile-responsive="true">
	                                    
	                                </table>
	                    	</div>
	                	</div>
	                	<div class="row row-lg" style="margin-top: 5px;margin-bottom: 5px;text-align: center;">
                			<button type="button" class="btn btn-primary" id="select_in">选择</button>
                			<button type="button" class="btn btn-warning" id="cancel_pull_in">清空</button>
                		</div>
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
<!-- 	                        	<button type="button" class="btn btn-outline btn-default" id="add"> -->
<!-- 	                            	<i class="glyphicon glyphicon-plus" aria-hidden="true"></i> -->
<!-- 	                        	</button> -->
	                            <button type="button" class="btn btn-outline btn-default" id="delete_items">
	                               <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
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
	</div>
	<div class="row row-lg" style="margin-top: 5px;margin-bottom: 5px;text-align: center;">
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
    <!--<script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>-->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
	<script type="text/javascript">
	function queryParams(param) {
		var json_obj_invoice = {};
		json_obj_invoice['limit'] =param.limit;
		json_obj_invoice['offset'] =param.offset;
		json_obj_invoice['sortName'] =this.sortName;
		json_obj_invoice['sortOrder'] =this.sortOrder;
	    return json_obj_invoice;
	}
	
	function queryParams_canOutBound(param) {
		var json_obj_invoice = formToJson($("#form_search"));
		json_obj_invoice['limit'] =param.limit;
		json_obj_invoice['offset'] =param.offset;
		json_obj_invoice['sortName'] =this.sortName;
		json_obj_invoice['sortOrder'] =this.sortOrder;
		json_obj_invoice['c_id'] ='${c_id}';
	    return json_obj_invoice;
	}
	
	inistal_data('#last_inbound_time_start','#last_inbound_time_end');
	
// 	function load_table_data_success(data){
// 		if (data.success){
//    			layer.msg("操作成功！");
//    			load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'outBound_guid'},$table);
//     	} else {
//     		layer.msg(data.errorMsg);
//     	}
// 	}
	
	$('#c_id').val('${c_id}');
	$('#c_department').val('${c_department}');
	
	var $table = $('#table');
	var $table_canOutBound = $('#table_canOutBound');
	//load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'outBound_guid'});
	$(document).ready(function () {
		
		//增加条目layer
// 		var $add=$("#add");
// 		button_click_layer_refresh($add,2,"新增出库单明细",'outBoundItemTempAdd',$table,true,['620px', '580px']);
		
		//表格一
		//加载字典数据
		get_dictionary("${context}",null);
		
		//bootstrap初始化		
		initialize_table($table_canOutBound,"getCanOutBoundItemTempList",${canOutBoundTableHeader},queryParams_canOutBound,"#tableTool_canOutBound",550);
		
		//集货规则为累计期次的，期次到了标红
		$table_canOutBound.bootstrapTable('refreshOptions',{
			rowStyle: function (row, index) {
	             var style = {};
	             if(row.downshelf_rule_type==0&&row.period_count>=row.downshelf_rule_detail)
                 	style={css:{'background':'pink'}};
	             return style;
	         } 
		});
		
		//表格配置 layer
		var $config_canOutBound=$("#config_canOutBound");
		
		table_column_config_layer($config_canOutBound,2,'表格属性配置','${context}/csu/columnConfig?queryId=${canOutBoundqueryId}');
		
		$('#tableTool_canOutBound').find('select').change(function () {
			 $('$table_canOutBound').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
	    });
		
		$("#search").on('click', function () {
			var json_data_list=formToJson($("#form_search"));
			 json_data_list['queryId']='${canOutBoundqueryId}';
			 search_sum_list("${context}/csu/getTableCollectDataBK",json_data_list,"getCanOutBoundItemTempList",$table_canOutBound);
		});
		
		//引入明细
		$("#select_in").on('click', function () {
			var check_mark = false;
			var stock_ids = $.map($table_canOutBound.bootstrapTable('getSelections'), function (row) {
				if((row.inventory_amount - row.notice_amount)<=0){
					check_mark = true;
				}
                return row.stock_id;
            });
			if(check_mark){
				layer.msg("有商品库存已经全部通知下架，无可下架库存，请确认");
				return;
			}
			if(stock_ids.length!=0) {
				//ajax_function_ask_and_close("确认引入？","addOutBoundItemTemp","post",{'stock_ids':stock_ids},"引入成功");
				ajax_function_ask_and_refresh("确认引入？","addOutBoundItemTemp","post",{'stock_ids':stock_ids},"引入成功",$table_canOutBound,$table);
			} else {
				layer.msg("未选择明细！");
			}
		});
		
		//清空明细
		$("#cancel_pull_in").on('click', function () {
			var inc_nos = $.map($table.bootstrapTable('getData'), function (row) {
                return row.inc_no;
            });
			if(inc_nos.length!=0) {
				//ajax_function_ask_and_dosuccess("确认清空？","deleteOutBoundItemTemp","post",{'inc_nos':inc_nos},load_table_data_success);
				ajax_function_ask_and_refresh("确认清空？","deleteOutBoundItemTemp","post",{'inc_nos':inc_nos},"清空成功",$table_canOutBound,$table);
			} else {
				layer.msg("表格内没有明细可清空！");
			}	
		});
		
		
		
		//表格二
		//bootstrap初始化		
		initialize_table_editable_footer($table,"getOutBoundItemTempList",${tableHeader},queryParams,"#tableTool",550,"updateOutBoundItemTemp");
		
		//表格配置 layer
		var $config=$("#config");
		
		table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		
		//重写config方法，否则重新刷新会同时刷新guid
		function table_column_config_layer($config,type,title,url,$table){
			$config.on('click', function () {
				  parent.layer.open({
		              type: 2,
		              title:title,
		              moveOut:true,
		              area: ['820px', '580px'],
		              skin: 'layui-layer-rim', //加上边框
		              content: url,
		              end:function () {
		            	  $table.bootstrapTable('refresh');
		            	  //location.reload();
		              }
		          }); 				
			 });
		}
		
		$('#tableTool').find('select').change(function () {
			 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
	    });
		
		$('#save').on('click', function () {
			if(!has_null($("#form_search"))){
				ajax_function_ask_and_close("确认新增？","addOutBound","post",$('#form_search').serialize(),'新增成功');
			}
		});
		
		$('#delete_items').on('click',function(){
			var inc_nos = $.map($table.bootstrapTable('getSelections'), function (row) {
                return row.inc_no;
            });
			if(inc_nos.length!=0) {
				//ajax_function_ask_and_dosuccess("确认删除？","deleteOutBoundItemTemp","post",{'inc_nos':inc_nos},load_table_data_success);
				ajax_function_ask_and_refresh("确认删除？","deleteOutBoundItemTemp","post",{'inc_nos':inc_nos},"删除成功",$table_canOutBound,$table);
			} else {
				layer.msg("未选择明细！");
			}
		});
		
		//initialize_bsSuggest_bk_client("${context}", "c_department", "c_id");
	});
	
	function toDel(inc_no){
		//ajax_function_ask_and_dosuccess("确认删除？","deleteOutBoundItemTemp","post",{'inc_nos':inc_no},load_table_data_success);
		ajax_function_ask_and_refresh("确认删除？","deleteOutBoundItemTemp","post",{'inc_nos':inc_no},"删除成功",$table_canOutBound,$table);
	}	
	
	function renderOperator(value,row,index){
		var str = "";
		str += "<a onclick=\"toDel('" + row.inc_no + "')\">删除</a>";
		str += "&nbsp;&nbsp;";
			
		return str;
	}
	
	function ajax_function_ask_and_refresh(ask_info,url,method,data,success_info,$table,$table2){
		if(confirm(ask_info)){
			$.ajax({ 
		        url: url, 
		        method: method,
		        dataType: "json",
		        traditional:true,
		        //传送请求数据
		        data: data,
		        success: function (data) {
		        	if (data.success){
		        		if(success_info==null){
		        			console.log('success');
		        		}else{
		        			layer.msg(success_info);
		    	        	$table.bootstrapTable('refresh');
		    	        	$table2.bootstrapTable('refresh');
		        		}
		        	} else {
		        		layer.msg(data.errorMsg);
		        		$table.bootstrapTable('refresh');
		        		$table2.bootstrapTable('refresh');
		        	}	        	
		        },
		        error:function(data){	
		        	alert("请求失败!");	
		        }
		    });		
		}
	}
	</script>
</html>