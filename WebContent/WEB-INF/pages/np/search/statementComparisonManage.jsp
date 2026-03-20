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
	            	<div class="col-xs-12">
	            		<div class="col-xs-9">
	            			<div class="form-group input-group inline-middle">
								<label>业务员：</label>
								<input type="text" name="sales_name" class="form-control search-items auto-not-null" >
								<div class="input-group-btn">
				  					<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
				  					<span class="caret"></span>
				     				</button>
				        			<ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
				    			</div>
				    			<input type="hidden" name="sales_code" class="form-control search-items">
							</div>
							<div class="form-group inline-middle">
								<label>处理开始时间：</label>
								<input type="text" id="op_date_start" name="op_date_start" class="form-control search-items layer-date">
							</div>
							<div class="form-group inline-middle" >
								<label>处理结束时间：</label>
								<input type="text" id="op_date_end" name="op_date_end" class="form-control search-items layer-date">
							</div>
							<div class="form-group inline-small" >
								<label>是否处理</label>
								<select class="form-control search-items " name="is_deal">
									<option></option>
									<option value = "1">是</option>
									<option value = "0">否</option>
								</select>
							</div>
						  </div>	
				         <div class="search-group-button col-xs-3">
						  	<button type="button" class="btn btn-primary btn-xs" id="search">查询</button>
						  	<button type="button" class="btn btn-default btn-xs" id="reset" >清空</button>
						 </div>
		         	</div>
				</form>
            </div>
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>结算单对比查询</h5>
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
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
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
		//加载时间 
		$(".layer-date").each(function(){
			inistal_one_data('#'+$(this).attr('id'));
		});
		
		//bootstrap初始化
 		initialize_table($table,"getStatementComparisonList",${tableHeader},queryParams,"#tableTool",400);
				
				
		//表格配置 layer
		var $config=$("#config");
				
		table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		     
			
		$("#search").on('click',function(){
			var json_data_list=formToJson($("#form_search"));
			json_data_list['queryId']='${queryId}';
			search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getStatementComparisonList",$('#table'));
		});
			
		//自动搜索填补		
		initialize_bsSuggest_user("${context}","sales_name","sales_code");          // 填补业务员	
	});
		 
		//加载操作按钮
		function renderOperator(value,row,index){
			var str = "";
			
			if(!row.is_destroy){
				str+="<a onclick=\"toCancel('"+row.statement_no+"')\">作废</a>"+"&nbsp;&nbsp;";
			}
			
			if(!row.is_deal){
				str+="<a onclick=\"toDeal('"+row.statement_no+"')\">处理</a>"+"&nbsp;&nbsp;";
			}
			
			return str;
		}
		
		//作废按钮
		function toCancel(statement_no){
			ajax_function_ask_and_refresh("确认作废?","cancelStatement","post",{'statement_no': statement_no},"作废成功!",$('#table'));
		 }
		
		//处理按钮
		function toDeal(statement_no){
			open_layer_refresh(2,'处理结算单','dealStatementPage?statement_no='+statement_no,$table,['600px', '400px'],false);
		 }
		
		//加载显示结算单明细数据页面
		function renderStatement(value,row,index){
			var str="<a onclick=\"toStatementDeatilPage('"+row.statement_no+"')\">"+value+"</a>"
			return str;
		 }
		
		//加载显示结算单明细数据
		function toStatementDeatilPage(statement_no){
			open_layer_refresh(2,'结算单明细','toStatementDeatilPage?statement_no='+statement_no,$table,['900px', '700px'],true);
		 }
		
		//加载显示益华结算单明细数据页面
		function renderSource(value,row,index){
			var str="<a onclick=\"toSourceDeatilPage('"+row.source_no+"')\">"+value+"</a>"
			return str;
		 }
		
		//加载显示益华结算单明细数据
		function toSourceDeatilPage(source_no){
			open_layer_refresh(2,'益华结算单明细','toSourceDeatilPage?source_no='+source_no,$table,['900px', '700px'],true);
		 }
		 
	</script>
</html>