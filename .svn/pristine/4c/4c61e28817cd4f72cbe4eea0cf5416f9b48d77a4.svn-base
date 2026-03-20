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
	            	  <div class="form-group input-group inline-middle">
					    <label >户号：</label>
					    <input type="text" name="custom_id" class="form-control search-items" >
					    <div class="input-group-btn">
	                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                            <span class="caret"></span>
	                        </button>
	                        <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                    </div>
					  </div>
					  <div class="form-group inline-middle">
					    <label >客户名称：</label>
					    <input type="text" name="c_department" class="form-control search-items" disabled>
					  </div>
<!-- 					  <div class="form-group inline-middle"> -->
<!-- 					    <label >户号：</label> -->
<!-- 					    <input type="text" name="custom_id" class="form-control search-items"> -->
<!-- 					  </div> -->
					  <div class="form-group inline-small">
					    <label >配送日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="sh_date_start" id="sh_date_start">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="sh_date_end" id="sh_date_end">
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
                <h5>代销转配送列表</h5>
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
		//加载时间控件
	 	$(".layer-date").each(function(){	
			inistal_one_data('#'+$(this).attr('id'));
		});
		
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
			initialize_table($table,"",${tableHeader},queryParams,"#tableTool",400);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			
			 $('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		     });
			 $("#search").on('click',function(){
				 var json_data_list=formToJson($("#form_search"));
				 json_data_list['queryId']='${queryId}';
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getAgencyToDeliverySearchList",$('#table'));
			 });
			 
			//自动搜索填补
			initialize_bsSuggest_yh_client_custom_id("${context}","c_department", "custom_id");
			
	     });
		 
		//益华客户通过custom_id传入
		 function initialize_bsSuggest_yh_client_custom_id(context,input_name, input_id){
		 	initialize_bsSuggest($("input[name='"+input_id+"']"),context+"/basic/getYHClientListSearch?keyword=","c_department","custom_id",{custom_id: "户号",c_department:"客户名称"},["custom_id","c_department"],false,bsSuggest_data_process_client_custom,null);
		 	$("input[name='"+input_id+"']")
		     .on('onSetSelectValue', function (e, keyword) {
		         $("input[name='"+input_name+"']").val(keyword['id']);
		   }).on('onUnsetSelectValue', function (e) {
		 	  $("input[name='"+input_name+"']").val('');
		   }).on('keyup',function(){
		 	  if($(this).val()==""){
		 		  $("input[name='"+input_name+"']").val('');
		 	  }
		   });
		 }

		 // 客户数据处理custom_id
		 function bsSuggest_data_process_client_custom(json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
		 	var i, len, data = {
		 		      value: []
		 		  };

		 		  if (!json || !json.rows || json.rows.length == 0) {
		 		      return false;
		 		  }
		 		  len = json.rows.length;

		 		  for (i = 0; i < len; i++) {
		 		      data.value.push({
		 		      	"custom_id": json.rows[i]['custom_id'],
		 		      	"c_department":json.rows[i]['c_department'],
		 		      });
		 	}
		 	return data;
		 }
	</script>
</html>