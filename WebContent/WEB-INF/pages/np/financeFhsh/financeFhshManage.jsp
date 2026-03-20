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
					    <label >货源编号：</label>
					    <input type="text" name="f_id" class="form-control search-items" >
					    <div class="input-group-btn">
	                         <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                             <span class="caret"></span>
	                         </button>
	                         <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                        </div>
					  </div>
					  <div class="form-group inline-large">
					    <label >货源名称(_户号)：</label>
					    <input type="text" name="f_name" class="form-control search-items" disabled>
					  </div>
					  <div class="form-group inline-small">
					  	<label >申汇单号：</label>
					    <input type="text" name="fh_no" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					  	<label >申汇状态：</label>
					    <select name="fh_status" class="form-control dictionary search-items">
					    	<option></option>
					    </select>
					  </div>
					  <div class="form-group inline-small">
					  	<label >是否预付：</label>
					    <select name="is_advance" class="form-control dictionary search-items isboolean">
					    	<option></option>
					    </select>
					  </div>
					  <div class="form-group inline-small">
					  	<label >发票号：</label>
					    <input type="text" name="inv_no" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					    <label >申汇日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="fh_date_start" id="fh_date_start">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="fh_date_end" id="fh_date_end">
					  </div>
					  <div class="form-group input-group inline-small">
					    <label >录入员：</label>
					    <input type="text" name="o_id_input_name" class="form-control search-items">
					    <div class="input-group-btn">
	                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                            <span class="caret"></span>
	                        </button>
	                        <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                        </div>
                        <input type="hidden" name="o_id_input" class="form-control search-items">
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
                <h5>申汇列表</h5>
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
    <div class="col-md-12" id="print_div" style="display:none">
	   <form id="print_form" class="form-inline">
	   <input type="hidden" name="fh_id" value="${fh_id}">
              <div class="panel-body">
                         <div class="row">
                           	<div class="form-group small-space col-xs-12">
		                  		<label >打印类型：</label>
		                        <select name="print_type">
		                        	<option value="0">申汇单</option>
		                        	<option value="1">票汇通知单</option>
		                        	<option value="2">中行模板(图书)</option>
		                        	<option value="3">中行模板(服务费)</option>
		                        </select>
		                	</div>
		                	<div class="form-group small-space col-xs-12 print-layer-button">
		                  		<button id="export_commit" class="btn btn-success" type="button">导出</button>
		                  		<button id="print_commit" class="btn btn-success" type="button">打印</button>
		                	</div>		                	
					    </div>                        
                </div>
       </form>
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
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
    
	<script type="text/javascript">
		inistal_data('#fh_date_start','#fh_date_end');
		var $table = $('#table');
		function queryParams(param) {
			var json_obj=formToJson($("#form_search"));
			json_obj['limit'] =param.limit;
   	      	json_obj['offset'] =param.offset;
   	     	json_obj['sortName'] =this.sortName;
   	  		json_obj['sortOrder'] =this.sortOrder;
   	        return json_obj;
		}
		
		function end_function(index, layero){ 
			ajax_function_no_close("returnFinanceFhsh","post",{},null);
			$table.bootstrapTable('refresh');
     	}
		
		 $(document).ready(function () {
			 //固定列
			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化
			initialize_table($table,"",${tableHeader},queryParams,"#tableTool",400);
			$("#search").on('click',function(){
				 var json_data_list=formToJson($("#form_search"));
				 json_data_list['queryId']='${queryId}';
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getFinanceFhshManageList",$table);
			 });
			//增加条目layer
			var $add=$("#add");
			button_click_windows_end($add,2,"新增申汇单",'financeFhshAdd',true,['620px', '500px'],end_function);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			 $('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		     });
			 //自动搜索填补
			 initialize_bsSuggest_all_type_factory("${context}");
			 //initialize_bsSuggest_o_id_input("${context}");
			 initialize_bsSuggest_user_by_dept("${context}", "o_id_input_name", "o_id_input", "2000");      // 放用户信息(报刊的)
			 $("#print_commit").on('click',function(){
				 ajax_function_no_close("${context}/print/printSH","post",$('#print_form').serialize(),"发送打印完成！"); 
			 });
			 $("#export_commit").on('click',function(){
				 var href_str="${context}/download/fhExport?";
				 var fh_id=$("#print_form").find("input[name='fh_id']").val();
				 href_str+="fh_id="+fh_id;
				 var print_type=$("#print_form").find("select[name='print_type']").val();
				 href_str+="&print_type="+print_type;
				 window.open(href_str);	
			 });
	     });
		 
		 function success_fuction(data){
			 console.log("success");
		 }
		 
		 function toEdit(fh_id){
			 open_layer_end(2,'编辑申汇单','financeFhshEdit?fh_id='+fh_id,['620px', '580px'],true,end_function);
		 }
		 
		 function toPrint(fh_id){
			$("#print_form").find("input[name='fh_id']").val(fh_id);
			open_layer(1,"申汇打印",$('#print_div'),['360px', '180px'],false);
	 	 }
		 
		 function toReport(fh_id){
			 open_layer(2,'申汇单进货报表','fhShReport?fh_id='+fh_id,$table,true);
		 }
		 
		 function toCommit(fh_id){
			 ajax_function_ask_and_refresh("确认提交？","onlyCommitFinanceFhsh","post",{fh_id:fh_id},'提交成功', $table);
		 }
		 
		 function toAgaint(fh_id) {
			 open_layer_refresh(2,'代销冲销','fhshAgentAgaintItem?fh_id='+fh_id,$table,['620px', '580px'],true);
		 }
		 
		 function toPrintNotice(fh_id) {
			 open_layer(2,'付款通知打印','toFinanceFhshNotice?fh_id='+ fh_id, ['800px', '600px'], false);
		 }
		 
		 function toOA(fh_id){
			 ajax_function_ask_and_refresh("确认推送OA？","putNpFhshToOa","post",{bill_code:fh_id},'推送成功', $table);
		 }
		 
		 function renderOperator(value,row,index){
			var str="<a onclick=\"toEdit('"+row.fh_id+"')\">编辑</a>";
			
			if (row.status == '0' || row.status == '3') {
		    	str+="&nbsp;&nbsp;<a onclick=\"toCommit('"+row.fh_id+"')\">提交</a>";
		    }
			
			str+="&nbsp;&nbsp;<a onclick=\"toAgaint('" + row.fh_id + "')\">代销冲销</a>";
			
			if(true)
				str+="&nbsp;&nbsp;<a onclick=\"toPrint('"+row.fh_id+"')\">打印</a>";
			if(true)
				str+="&nbsp;&nbsp;<a onclick=\"toReport('"+row.fh_id+"')\">报表</a>";
				
			str += "&nbsp;&nbsp;<a onclick=\"toPrintNotice('" + row.fh_id + "')\">新版打印</a>";
			
			if ((row.status == '1'&& row.syn_oa != '1')||(row.status == '3'&& row.syn_oa == '1')) {
				str+="&nbsp;&nbsp;<a onclick=\"toOA('"+row.fh_id+"')\">推送</a>";
		    }
			return str;
		 }
	</script>
</html>