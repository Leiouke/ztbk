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
	            	  <div class="form-group inline-middle">
					  	<label >批次状态：</label>
					    <select name="dh_batch_status" class="form-control dictionary search-items">
					    	<option></option>
					    </select>
					  </div>
					  <div class="form-group input-group inline-small">
					    <label >创建人：</label>
					    <input type="text" name="created_by" id="created_by" class="form-control search-items">
					    <div class="input-group-btn">
	                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                            <span class="caret"></span>
	                        </button>
	                        <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                        </div>
					  </div>
					  <div class="form-group inline-small">
					    <label >创建日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="created_at_start" id="created_at_start">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="created_at_end" id="created_at_end">
					  </div>
					  <div class="form-group inline-middle">
					    <label >批次号：</label>
					    <input type="text" name="batch_id" class="form-control search-items" >
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
                <h5>到货批次</h5>
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
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
    
	<script type="text/javascript">
		inistal_data('#created_at_start','#created_at_end');
		var $table = $('#table');
		function queryParams(param) {
			var json_obj=formToJson($("#form_search"));;
			json_obj['limit'] =param.limit;
   	      	json_obj['offset'] =param.offset;
   	     	json_obj['sortName'] =this.sortName;
   	  		json_obj['sortOrder'] =this.sortOrder;
   	        return json_obj;
		}
		
		//当前日期
		var myDate = new Date();
		 var nowY = myDate.getFullYear();
		 var nowM = myDate.getMonth()+1;
		 var nowD = myDate.getDate();
		 var enddate = nowY+"-"+(nowM<10 ? "0" + nowM : nowM)+"-"+(nowD<10 ? "0"+ nowD : nowD);//当前日期
		
		//获取三十天前日期
		
		var lw = new Date(myDate - 1000 * 60 * 60 * 24 * 30);//最后一个数字30可改，30天的意思
		var lastY = lw.getFullYear();
		var lastM = lw.getMonth()+1;
		var lastD = lw.getDate();
		var startdate=lastY+"-"+(lastM<10 ? "0" + lastM : lastM)+"-"+(lastD<10 ? "0"+ lastD : lastD);//三十天之前日期
		
		$("#apply_date_start").val(startdate);
		$("#apply_date_end").val(enddate);
		$("#created_by").val('${userName}');

		$(document).ready(function () {
			 //固定列
			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化
			initialize_table_editable($table,"getDhBatchManageList",${tableHeader},queryParams,"#tableTool",400, "editLibraryDuplicateMemo");
			$("#search").on('click',function(){
				 var json_data_list=formToJson($("#form_search"));
				 json_data_list['queryId']='${queryId}';
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getDhBatchManageList",$table);
			});
			//增加条目layer
			var $add=$("#add");
			button_click_layer_refresh($add,2,"新增进货批次",'dhBatchAdd',$table,false,['1000px', '600px']);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			 $('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		     });
			 
			 initialize_bsSuggest_user("${context}", "created_by");      //放用户信息
	     });
		
		 function toDel(batch_id) {
			ajax_function_ask_and_refresh("确认作废该批次?","deleteDhBatch","post",{'batch_id':batch_id},"作废成功!",$('#table'));
		 }
		 
		 function toDetail(batch_id){
			open_layer_refresh(2,'批次明细','dhBatchItem?batch_id='+batch_id,$table,['750px', '500px'],true);
		 }
		 
		 function toEdit(batch_id){
				open_layer_refresh(2,'编辑进货批次','dhBatchEdit?batch_id='+batch_id,$table,['1000px', '600px'],false);
		 }
		 
		 function toConfirmArrival(batch_id){
				open_layer_refresh(2,'确认到港','dhBatchConfirmArrival?batch_id='+batch_id,$table,['750px', '450px'],false);
		 }
		 function toConfirmWarehouse(batch_id){
				open_layer_refresh(2,'确认到库','dhBatchConfirmWarehouse?batch_id='+batch_id,$table,['750px', '450px'],false);
		 }
		 function toConfirmFinish(batch_id) {
				ajax_function_ask_and_refresh("是否确认?","confirmDhBatch","post",{'batch_id':batch_id,'input_type':'3'},"确认完成!",$('#table'));
		 }
		 
		 function renderOperator(value,row,index){
			var str = "";
			str += "<a onclick=\"toEdit('"+row.batch_id+"')\">编辑</a> ";
			str += "&nbsp;";
			str += "<a onclick=\"toDetail('"+row.batch_id+"')\">明细</a> ";
			str += "&nbsp;";
			str += "<a onclick=\"toDel('"+row.batch_id+"')\">作废</a>";
			
			if (row.status != "4" && row.actual_arrival_date == null && row.warehouse_arrival_date == null){
				str += "&nbsp;&nbsp;";
				str += "<a onclick=\"toConfirmArrival('"+row.batch_id+"')\">确认到港</a>";
			} else if (row.status != "4" && row.actual_arrival_date != null && row.warehouse_arrival_date == null){
				str += "&nbsp;&nbsp;";
				str += "<a onclick=\"toConfirmWarehouse('"+row.batch_id+"')\">确认到库</a>";
			} else if (row.status != "4" && row.actual_arrival_date != null && row.warehouse_arrival_date != null){
				str += "&nbsp;&nbsp;";
				str += "<a onclick=\"toConfirmFinish('"+row.batch_id+"')\">确认完成</a>";
			}
			
			return str;
		 }
		 
	</script>
</html>