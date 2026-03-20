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
		            	  	<div class="form-group inline-small">
						    	<label>刊号：</label>
						    		<input type="text" name="mail_code" class="mail_code search-items" id="mail_code"/>
						  	</div>	
		            	  	<div class="form-group inline-small">
						    	<label>刊名：</label>
						    		<input type="text" name="qk_name" class="qk_name search-items" id="qk_name"/>
						  	</div>	
		            	  	<div class="form-group inline-small">
						    	<label>译名：</label>
						    		<input type="text" name="qk_name_foreign" class="qk_name_foreign search-items" id="qk_name_foreign"/>
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
                <h5>价格波动查询</h5>
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
			//bootstrap初始化
 			initialize_table($table,"getPriceFluctuationManageList",${tableHeader},queryParams,"#tableTool",400);
				
				
			//表格配置 layer
			var $config=$("#config");
				
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		     
			
			$("#search").on('click',function(){
				var json_data_list=formToJson($("#form_search"));
				 json_data_list['queryId']='${queryId}';
				 console.log(json_data_list);
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getPriceFluctuationManageList",$('#table'));
			 });
		 });
		 
		//加载操作按钮
		function renderOperator(value,row,index){
			var str="<a onclick=\"toDetail('"+row.qk_id+"')\">详情</a>"
			return str;
		}
		
		//跳转详情页面
		function toDetail(qk_id){
			open_layer_refresh(2,'详情','priceFluctuationDetailManage?qk_id=' + qk_id,
				$table,['700px', '700px'],false);
		 }
		 
	</script>
</html>