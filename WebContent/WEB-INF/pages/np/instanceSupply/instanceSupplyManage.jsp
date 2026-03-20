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
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <jsp:include page="../../include/h_superHead.jsp"></jsp:include>
		
		<script type="text/javascript">
		</script>
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
	            <div class="col-xs-10">
				    <div class="form-group input-group inline-small">
					    <label >刊号：</label>
					    <input type="text" id="mail_code" name="mail_code" class="form-control search-items" >
					 </div>		  
					  <div class="form-group input-group inline-small">
					    <label>刊名：</label>
					    <input type="text" id="qk_name" name="qk_name" class="form-control search-items" >
					  </div>
					  <div class="form-group input-group inline-small">
				        <label>申请人：</label>
						<input type="text" name="apply_man_name" class="form-control search-items auto-not-null" >
							<div class="input-group-btn">
	                        	<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                        	<span class="caret"></span>
	                        	</button>
	                        	<ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                     	</div>
	                     <input type="hidden" name="apply_man" class="form-control search-items">
				    </div>
					  <div class="form-group input-group inline-small">
				        <label>货源主管：</label>
						<input type="text" name="o_name" class="form-control search-items auto-not-null" >
							<div class="input-group-btn">
	                        	<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                        	<span class="caret"></span>
	                        	</button>
	                        	<ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                     	</div>
	                     <input type="hidden" name="o_id" class="form-control search-items">
				    </div>
				    <div class="form-group input-group inline-small">
					    <label >处理：</label>
					    <select id="is_process" name="is_process" class="form-control search-items"" >
					    	<option></option>
					    	<option value = "1">是</option>
					    	<option value = "0">否</option>
					    </select>
					</div>
				    <div class="form-group inline-small">
			            <label>处理时间：</label>
			           	<input type="text" id="apply_time_start" name="apply_time_start" class="form-control search-items layer-date">
			           	-
			           	<input type="text" id="apply_time_end" name="apply_time_end" class="form-control search-items layer-date">
			        </div>
				    <div class="form-group input-group inline-small">
					    <label >确认：</label>
					    <select id="is_confirm" name="is_confirm" class="form-control search-items"" >
					    	<option></option>
					    	<option value = "1">是</option>
					    	<option value = "0">否</option>
					    </select>
					</div>
				 </div>
				 <div class="col-xs-2 search-group-button">
					  	<button type="button" class="btn btn-primary btn-xs" id="search">查询</button>
					  	<button type="button" class="btn btn-default btn-xs" id="reset" >清空</button>
				 </div>
				</form>
            </div>
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>杂志补刊查询</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-wrench"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="row row-lg">                    
                    <div class="col-sm-12">
                    	<div class="btn-group hidden-xs" id="tableTool" role="group">
                    		<button type="button" class="btn btn-outline btn-default" id="add">
                    			<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                    		</button>
                    		<button type="button" class="btn btn-outline btn-default" id="config">
                                <i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
                            </button>
<!--                             <button type="button" class="btn btn-outline btn-default" id="batch_deal"> -->
<!--                                 <i class="glyphicon" aria-hidden="true">批量处理</i> -->
<!--                             </button> -->
                    		<select class="form-control" >						                
								<option value="all">导出全部</option>
								<option value="basic">导出当页</option>
							</select>
                    	</div>
                    	<table id="table" data-height="400" data-mobile-responsive="true">
                                    
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
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
    <!-- comment-->
    <script src="${context}/js/common/common.js"></script>
    <!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
 	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
    
	<script type="text/javascript">
	var $table = $('#table');
	
	function queryParams(param) {
		var json_obj=formToJson($("#form_search"));
			json_obj['limit'] =param.limit;
	      	json_obj['offset'] =param.offset;
	     	json_obj['sortName'] =this.sortName;
	  		json_obj['sortOrder'] =this.sortOrder;
	        return json_obj;
	}
	
	$(document).ready(function () {
			 
		//加载时间控件
		$(".layer-date").each(function(){
			inistal_one_data('#'+$(this).attr('id'));
		});
		
		//加载新增杂志补刊页面
		$("#add").click(function(){
			open_layer_refresh(2,'新增补刊页面','toAddInstanceSupplyManage',
					$table,['600px', '400px'],true);
		});
		
		//批量处理
// 		$("#batch_deal").click(function(){
// 			var apply_ids = $.map($table.bootstrapTable('getSelections'), function (row) {
//                 return row.apply_id;
//             });
// 			if(apply_ids.length!=0) {
// 				open_layer_refresh(2,'补刊申请处理','toDealInstanceSupplyBatchManage?apply_ids=' +apply_ids,$table,['700px', '425px'],false);
// 			} else {
// 				layer.msg("未选择明细！");
// 			}
// 		});
			
		//bootstrap初始化
		initialize_table($table,"getInstanceSupplyList",${tableHeader},queryParams,"#tableTool",400);
		
		//表格配置 layer
		var $config=$("#config");
		
		table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		
		 $('#tableTool').find('select').change(function () {				 
			 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
	     });
			
		//点击search查询
		$("#search").on('click',function(){
			var json_data_list=formToJson($("#form_search"));
			json_data_list['queryId']='${queryId}';
			search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getInstanceSupplyList",$('#table'));
		});
	 });
		 
	//自动搜索填补		
	initialize_bsSuggest_user("${context}","apply_man_name","apply_man");
	initialize_bsSuggest_user("${context}","o_name","o_id");
		 
	//跳转处理页面
	function toDeal(apply_id){
		open_layer_refresh(2,'补刊申请处理','toDealInstanceSupplyManage?apply_id=' +apply_id,$table,['700px', '425px'],false);
	}
	
	//删除操作
	function toDelete(apply_id){
		ajax_function_ask_and_refresh("确认删除?","deleteInstanceSupply","post",{'apply_id': apply_id},"删除成功!",$('#table'));
	}
	
	//跳转确认页面
	function toConfirm(apply_id){
		open_layer_refresh(2,'补刊物流确认','toConfirmInstanceSupplyManage?apply_id=' +apply_id,$table,['600px', '400px'],false);
	}
	
	//跳转详情页面
	function toDetail(apply_id){
		open_layer_refresh(2,'补刊详情','toInstanceSupplyDetailManage?apply_id=' +apply_id,$table,['1200px', '700px'],false);
	}
		 
	//操作按钮加载
	function renderOperator(value,row,index){
		var str="";
		if(row.is_process==0){
			str+="<a onclick=\"toDeal('"+row.apply_id+"')\">业务处理</a>"+"&nbsp;&nbsp;";
			str+="<a onclick=\"toDelete('"+row.apply_id+"')\">删除</a>"+"&nbsp;&nbsp;";
		}
		if(row.is_confirm==0){
			str+="<a onclick=\"toConfirm('"+row.apply_id+"')\">确认</a>"+"&nbsp;&nbsp;";
		}
		str+="<a onclick=\"toDetail('"+row.apply_id+"')\">详情</a>"+"&nbsp;&nbsp;";
		return str;
	}
		  
	</script>
</html>