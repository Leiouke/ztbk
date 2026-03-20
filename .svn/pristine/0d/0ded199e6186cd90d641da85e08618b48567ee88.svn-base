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
						    <label >来款单位：</label>
						    <input type="text" name="company" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					  	<label >是否已审核：</label>
					    <select name="audit_status" class="form-control dictionary search-items isboolean">
					    </select>
					  </div>					  
					  <div class="form-group inline-small">
					    <label >认领日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="input_time_start" id="input_time_start">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="input_time_end" id="input_time_end">
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
                <h5>认领审核</h5>
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
    <div class="sonpage-footer">
    		<button id="verify" class="btn btn-success" type="button">通过</button>	
	        <button id="not_verify" class="btn btn-danger" type="button">撤销</button>	                  
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
    <!-- 通用查询grid 列渲染函数库 -->
	<script src="${context}/js/common/gridColumnFormat.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
    
	<script type="text/javascript">
	inistal_data('#input_time_start','#input_time_end');
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
			initialize_table($table,"",${tableHeader},queryParams,"#tableTool",400);
						
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','csu/columnConfig?queryId=${queryId}');
			$("select[name='audit_status']").change(function () {
					$("#verify").toggle();
					$("#not_verify").toggle();
			});
			 $('#tableTool').find('select').change(function () {				 
				 $table.bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		     });
			 $("#search").on('click',function(){
					var json_data_list=formToJson($("#form_search"));
					json_data_list['queryId']='${queryId}';
					search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getCashClaimVerifyList",$table);
			 });
			 $('#verify').on('click',function(){
				 if(true){
					var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
		                return row.id;
		            });
					if(ids.length!=0)
						ajax_function_ask_and_refresh("确认通过？","cashClaimVerify","post",{'ids':ids},'操作成功',$table);
					else
						layer.msg("未选择明细！");
				 }
			 });
			 $('#not_verify').on('click',function(){
				 if(true){
					var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
		                return row.id;
		            });
					if(ids.length!=0)
						ajax_function_ask_and_refresh("确认撤销？","cashClaimNotVerify","post",{'ids':ids},'操作成功',$table);
					else
						layer.msg("未选择明细！");
				 }
			 });
	     });
		 
		 function toVerify(id){
			 ajax_function_ask_and_refresh('确认通过？','cashClaimVerify',"post",{'ids':id},"操作成功",$('#table'));
		 }
		 
		 function toReturn(id){
			 ajax_function_ask_and_refresh("是否退回？",'cashClaimNotVerify',"post",{'ids':id},"退回成功",$('#table'));
		 }
		 
		 function toDel(id){
			 ajax_function_ask_and_refresh("是否作废？",'cashClaimDelete',"post",{'ids':id},"作废成功",$('#table'));
		 }
		 
		 function renderOperator(value,row,index){
			 var str="";
			 if(row.audit_status==0){
				 str+="<a onclick=\"toVerify('"+row.id+"')\">通过</a>&nbsp;&nbsp;<a onclick=\"toReturn('"+row.id+"')\">退回</a>"
			 }else if(row.audit_status==1 && row.audit_pass == 1) {  // 审核通过的才可以作废
				 str+="<a onclick=\"toDel('"+row.id+"')\">作废</a>"
			 }
			 //str+="";
			 return str;
		 }
	</script>
</html>