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
					  <div class="form-group input-group inline-small">
					    <label >操作人：</label>
					    <input type="text" name="user_name" id = "user_name" class="form-control search-items" value="${sessionScope.user.userName}" readonly>
					    <div class="input-group-btn">
	                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                            <span class="caret"></span>
	                        </button>
	                        <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                        </div>
                        <input type="hidden" name="user_code" id = "user_code" class="form-control search-items" value="${sessionScope.user.job_no}">
					  </div>
					  <div class="form-group inline-small">
					    <label >录入日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="input_date_start" id="input_date_start">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="input_date_end" id="input_date_end">
					  </div>
					  <div class="form-group inline-middle">
					    <label >模版名称：</label>
					    <input type="text" name="template_name" class="form-control search-items" >
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
                <h5>模版查询</h5>
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
    <!-- ajaxfileupload-->
	<script src="${context}/js/plugins/ajaxfileupload/ajaxfileupload.js"></script>
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
    <!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
    
	<script type="text/javascript">			
	inistal_data('#input_date_start','#input_date_end');
	
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
		
		//增加条目layer
		var $add=$("#add");
		button_click_layer_refresh($add,2,"新增模版",'excelTransferModelAdd',$table,false,['750px', '400px']);
		
		//查询按钮
		$("#search").on('click',function(){
			 var json_data_list = {};
			 json_data_list['queryId']='${queryId}';
			 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getExcelTransferManageList",$('#table'));
		 });
		
		//表格配置 layer
		var $config=$("#config");
		
		table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		
		//bootstrap初始化
      	initialize_table($table,"getExcelTransferManageList",${tableHeader},queryParams,"#tableTool",400);
		
      	initialize_bsSuggest_user("${context}", "user_name", "user_code");      // 放用户信息
	 });    
        
      
	
	//加载操作按钮
  	function renderOperator(value,row,index){
		if(row.input_code == '${sessionScope.user.job_no}'){
			var str="<a onclick=\"toEdit('"+row.template_no+"')\">编辑</a>";
	  		str += "&nbsp;&nbsp;"
		}else{
			var str="<a onclick=\"toDetail('"+row.template_no+"')\">详情</a>";
	  		str += "&nbsp;&nbsp;"
		}

  		str+="<a onclick=\"toUpload('"+row.template_no+"')\">上传文件</a>";
  		str += "&nbsp;&nbsp;"
  		
  		if(row.input_code == '${sessionScope.user.job_no}'){
  			str+="<a onclick=\"toDel('"+row.template_no+"')\">作废</a>";
  		  	str += "&nbsp;&nbsp;"
  		  	str+="<a onclick=\"toShare('"+row.template_no+"')\">共享</a>";
  		}
  	  	
		return str;
	}
	
     //跳转详情页面
	function toDetail(template_no){
		open_layer_refresh(2,'模版详情','excelTransferDetail?template_no='+template_no,$table,['750px', '500px'],true);
	 }
     
	//跳转编辑页面
	function toEdit(template_no){
		open_layer_refresh(2,'模版修改','excelTransferEdit?template_no='+template_no,$table,['750px', '500px'],true);
	 }
     
	//删除按钮
	function toDel(template_no){
		ajax_function_ask_and_refresh("确认作废该模版?","deleteExcelTransferModel","post",{'template_no':template_no},"作废成功!",$('#table'));
	}
     
	//跳转详情页面
	function toUpload(template_no){
		open_layer_refresh(2,'上传文件','excelTransferUpload?template_no='+template_no,$table,['750px', '500px'],false);
	 }
	
	//跳转详情页面
	function toShare(template_no){
		open_layer_refresh(2,'模版共享','excelTransferModelShare?template_no='+template_no,$table,['750px', '500px'],true);
	 }
	</script>
</html>