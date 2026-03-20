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
	            <div class="col-xs-11">
	            	  <div class="form-group inline-small">
					    <label >货源简称：</label>
					    <input type="text" name="f_department_simple" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					    <label >货源户号：</label>
					    <input type="text" name="f_account" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					    <label >货源名称：</label>
					    <input type="text" name="f_department" class="form-control search-items" >
					  </div>
					  <div class="form-group input-group inline-small">
					    <label >业务员：</label>
					    <input type="text" name="charge_man_name" class="form-control search-items">
					    <div class="input-group-btn">
                          <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                              <span class="caret"></span>
                          </button>
                          <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                        </div>
                        <input type="hidden" name="charge_man" class="form-control search-items">
					  </div>
					  <div class="form-group inline-small">
					    <label >国家：</label>
					    <select name="f_country" class="form-control dictionary search-items">
					    	<option></option>
					    </select>
					  </div>
					  <div class="form-group inline-small">
					    <label >审核状态：</label>
					    <select name="factory_status" class="form-control dictionary search-items" data-id-start=1 data-id-end=2>
					    </select>
					  </div>
				 </div>
				 <div class="col-xs-1 search-group-button">
					  	<button type="button" class="btn btn-primary btn-xs" id="search">查询</button>
					  	<button type="button" class="btn btn-default btn-xs" id="reset">清空</button>
				 </div>
				</form>
            </div>
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>货源信息</h5>
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
    <!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
    <!-- 通用查询grid 列渲染函数库 -->
	<script src="${context}/js/common/gridColumnFormat.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
    
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
			 //固定列
			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化
			initialize_table_no_footer($table,"getFactoryAuditList",${tableHeader},queryParams,"#tableTool");
			$("#search").on('click',function(){
				 var json_data_list=formToJson($("#form_search"));
				 json_data_list['queryId']='${queryId}';
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getFactoryAuditList",$('#table'));
			 });
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','csu/columnConfig?queryId=${queryId}');
			
			 $('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		     });
			 
			 initialize_bsSuggest_user_by_dept("${context}", "charge_man_name", "charge_man", "2000");      // 放用户信息(报刊的)
	     });
		 
		 //bootstrap-table 操作栏
		 function renderOperator(value,row,index){
			 var str = '';
			 if (row.status == '1') {
			 	str += "<a onclick=\"toFirstAudit('"+row.f_id+"')\">一级审核</a> ";
			 } else if (row.status == '2') {
				str += "<a onclick=\"toSecondAudit('"+row.f_id+"')\">二级审核</a> ";
			 }
			 str += "<a onclick=\"toAuditBack('"+row.f_id+"')\">审核退回</a> ";
			 str += "<a onclick=\"toEdit('"+row.f_id+"')\">详情</a>"
			return str;
		 }
		 
		 function toFirstAudit(f_id){
			ajax_function_ask_and_refresh("是否一级审核通过?","firstAuditFactory","post",{'f_id':f_id},"审核完成",$('#table'));
		 }
		 
		 function toSecondAudit(f_id){
			ajax_function_ask_and_refresh("是否二级审核通过?","secondAuditFactory","post",{'f_id':f_id},"审核完成",$('#table'));
		 }
		 
		 function toAuditBack(f_id){
			ajax_function_ask_and_refresh("是否审核退回?","auditBackFactory","post",{'f_id':f_id},"审核完成",$('#table'));
		 }
		 
		 function toEdit(id){
			open_layer_refresh(2,'编辑货源','factoryEdit?f_id='+id,$table,['620px', '580px'],true);
		 }
	</script>
</html>