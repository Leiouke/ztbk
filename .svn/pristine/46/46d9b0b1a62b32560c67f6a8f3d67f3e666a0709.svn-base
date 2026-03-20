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
                <h5>验货明细查询</h5>
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
                                </div>
                                <table id="table" data-mobile-responsive="true">
                                    
                                </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="ibox float-e-margins">
            <form id="form_verify">
            	<div class="not-null">
		            <input type="hidden" name="qk_id">
		            <input type="hidden" name="period_name">
		            <input type="hidden" name="inventory">
	            </div>
	            <div class="ibox-content">
	                <div class="row row-lg">
	                    <div class="col-sm-12">
	                    	<div class="form-group  col-xs-4 not-null" >
		                  		<label >数量：</label>
		                        <input name="amount" class="form-input-items" value="1" type="text">
		                	</div>
                            <div class="form-group select-group col-xs-4">
		                  		<label >架号：</label>
		                  		<input name="rack_no" type="text" class="form-input-items">
		                	</div>
			                	
	                    </div>
	                </div>
	                <div class="row row-lg">
	                	<div class="col-xs-5"></div>    
	               		<div class="col-xs-7">
		                    <button id="commit" class="btn btn-success" type="button">提交</button>
					        <button id="cancel" class="btn btn-white" type="button">取消</button>
					    </div> 
	                </div>
	                
	            </div>
            </form>
        </div>
   </div>
	</body>
	    
	<!-- 自定义js -->
    <script src="${context}/js/content.js?v=1.0.0"></script>
    <!-- Bootstrap table -->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
    
	<script type="text/javascript">
		var $table = $('#table');
		function queryParams(param) {
			var json_other_out_bound = {};
			json_other_out_bound['key_word'] =parent.$("#key_word").val();
   	        return json_other_out_bound;
		}	

		$(document).ready(function () {
			//加载字典数据
			//get_dictionary("${context}",null);
			$('#commit').on('click', function () {
				var now_num=Number($("input[name='amount']").val());
				if(isNaN(now_num)||now_num<1){
					layer.msg("数量不符合规范");
					return;
				}
				
				if(!has_null($("#form_verify"))){
					ajax_function("confirmBackIssueInBound","post",$('#form_verify').serialize(),'验货成功!');
				}
			});
			//$("input[name='rack_no']").val(parent.$("input[name='rack_no']").val());
			$("input[name='amount']").val(parent.$("input[name='amount']").val());
			$("input[name='inventory']").val(parent.$("#inventory").val());
			
			//bootstrap初始化				
			initialize_table_singleSelect($table,"getConfirmBackIssueInBoundList",${tableHeader},queryParams,"#tableTool",400);
			
			$table.bootstrapTable('refreshOptions',{onLoadSuccess: function(data){
				$table.bootstrapTable('check',0);
			},onCheck: function(row) {
				ajax_function_dosuccess("getOneBackIssueInventory", "post", {"inventory":$("input[name='inventory']").val(), "qk_id": row.qk_id, "period_name": row.period_name},
					function(data) {
						$("input[name='rack_no']").val(data.rack_no);  // 放置架号
					}
				);
				$("input[name='qk_id']").val(row.qk_id);
				$("input[name='period_name']").val(row.period_name);
			}}
			);
			
			var $config=$("#config");
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
	     });
	</script>
</html>