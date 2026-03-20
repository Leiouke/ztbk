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
					    <label >分类编码：</label>
					    <input type="text" name="classfiy_code" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					    <label >科目大类：</label>
					    <input type="text" name="category_name" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-middle">
					    <label >分类名称：</label>
					    <input type="text" name="classfiy_name" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-middle">
					    <label >显示部门：</label>
					    <input type="text" name="depts" class="form-control search-items" >
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
                <h5>财务分类信息</h5>
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
    <!-- Bootstrap table export-->
    <script src="${context}/js/plugins/bootstrap-table/export/bootstrap-table-export.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/tableExport.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/js-xlsx/xlsx.core.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.plugin.autotable.js"></script>
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
    <!-- 通用查询grid 列渲染函数库 -->
	<script src="${context}/js/common/gridColumnFormat.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
    
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
			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化
			initialize_table_no_footer($table,"",${tableHeader},queryParams,"#tableTool",400);
			$("#search").on('click',function(){
				 var json_data_list=formToJson($("#form_search"));
				 json_data_list['queryId']='${queryId}';
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getFinancialClassifyManageList",$('#table'));
			});
			//增加条目layer
			var $add=$("#add");
			button_click_layer_refresh($add,2,"新增财务分类",'financialClassifyAdd',$table,false,['750px', '400px']);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','csu/columnConfig?queryId=${queryId}');
			
			 $('#tableTool').find('select').change(function () {
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		     });
			 initialize_bsSuggest_fc_user("${context}", "c_charge_man_name", "c_charge_man");      // 放用户信息
	     });
		 
		 function toEdit(classfiy_code){
			 open_layer_refresh(2,'编辑财务分类','financialClassifyEdit?classfiy_code='+classfiy_code,$table,['750px', '400px'],false);
		 }
		 
		 function toDeps(classfiy_code){
			open_layer_refresh(2,'显示部门维护','financialClassifyDepsManage?classfiy_code=' + classfiy_code,$table,['750px', '500px'],true);
		 }
		 
		 function toMapping(classfiy_code){
			open_layer_refresh(2,'显示科目映射','financialClassifyMappingManage?classfiy_code=' + classfiy_code,$table,['750px', '500px'],true);
		 }
		 
		 function renderOperator(value,row,index){
			 return "<a onclick=\"toEdit('"+row.classfiy_code+"')\">修改</a>&nbsp;&nbsp;<a onclick=\"toDeps('"+row.classfiy_code+"')\">显示部门</a>" +
			 	"&nbsp;&nbsp;<a onclick=\"toMapping('"+row.classfiy_code+"')\">科目映射</a>";
		 }
	</script>
</html>