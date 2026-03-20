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
		<div style="padding:20px;">
			<div class="col-md-12">
			   <form id="form" class="form-horizontal">
			   		<div class="col-xs-12">
			   			<div class="form-group middle-space col-xs-12">
					    	<label >刊号：</label>
					    	<input name="mail_code" id = "mail_code" class="search-items" disabled="disabled">
						</div>
			   		</div>
			   		<div class="col-xs-12">
			   			<div class="form-group middle-space col-xs-12">
					    	<label >书名：</label>
					    	<input type="text" id="qk_name" name="qk_name" class="search-items" disabled="disabled">
					 	</div>
			   		</div>
			   		
			   		<div class="col-xs-12">
			   			<div class="form-group middle-space col-xs-12">
					    	<label >期次：</label>
					    	<input type="text" id="period_name" name="period_name" class="search-items" >
					 	</div>
			   		</div>
			   		<div class="col-xs-12">
			   			<div class="form-group middle-space col-xs-12 not-null">
					    	<label >数量：</label>
					    	<input type="text" id="h_amount" name="h_amount" class="search-items" >
					 	</div>
			   		</div>
			   		<div class="col-xs-12">
			   			<div class="form-group middle-space col-xs-12">
					    	<label >客户：</label>
					    	<input type="text" name="customer_id" class="search-items" >
					   		<div>
	                        	<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                            	<span class="caret"></span>
	                        	</button>
	                        	<ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                    	</div>
					  	</div>
					  </div>
					  <div class="col-xs-12">
						  <div class="form-group middle-space col-xs-12">
						    <label >客户名称：</label>
						    <input type="text" name="customer" class="search-items" id = "customer" disabled="disabled">
						  </div>
					</div>
			   		<div class="col-xs-12">
			   			<div class="form-group middle-space col-xs-12">
					    	<label >供应商编号：</label>
					    	<input type="text" name="f_id" id = "f_id" class="search-items" >
					   		<div>
	                        	<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                            	<span class="caret"></span>
	                        	</button>
	                        	<ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                    	</div>
					  	</div>
					  </div>
					  <div class="col-xs-12">
						  <div class="form-group middle-space col-xs-12">
						    <label >货源名称：</label>
						    <input type="text" name="f_department" class="search-items" id = "f_department" disabled="disabled">
						  </div>
					</div>
			   		<div class="col-xs-12">
			   			<div class="form-group middle-space col-xs-12">
					    	<label >申请理由：</label>
					    	<input type="text" id="supply_reason" name="supply_reason" class="search-items" >
					 	</div>
			   		</div>
			   		<div class="col-xs-12"  style="display:none">
						<div class="form-group middle-space col-xs-12">
							<label >qk_id</label>
							<input type="text" name="qk_id" id = "qk_id"  class="search-items">
						</div>
					</div>
			        <div class="sonpage-footer">
			            <button id="save" class="btn btn-primary" type="button">提交</button>
			            <button id="cancel" class="btn btn-white" type="button">取消</button>
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
	function ajax_function_close_parent(url,method,data,success_info){
		var index = layer.load(1, {
			  shade: [0.1,'#fff'] //0.1透明度的白色背景
		});
		$.ajax({ 
	        url: url, 
	        method: method,
	        dataType: "json",
	        traditional:true,
	        //传送请求数据
	        data: data,
	        success: function (data) { 
	        	if (data.success){
	        		layer.close(index);
	        		layer.msg(success_info); 
	        		setTimeout(function (){
	        			parent.colsethis();
	            	   }, 1000); // how long do you want the delay to be?
	        	} else {
	        		layer.msg(data.errorMsg);
	        		layer.close(index);
	        	}        	
	        },
	        error:function(data){
	        	layer.close(index);
	        	alert("请求失败!");        	
	        }
	    });	
	}
	
	
	
	$(document).ready(function () {
		
		$("#mail_code").val('${mail_code}');
		$("#qk_name").val('${qk_name}');
		$("#period_name").val('${period_name}');
		$("#qk_id").val('${qk_id}');
		$("#f_id").val('${f_id}');
		$("#f_department").val('${f_department}');
		
		//保存按钮
		$('#save').on('click', function () {
			if(!has_null($("#form"))){
				$("#mail_code").removeAttr("disabled");
				$("#qk_name").removeAttr("disabled");
				$("#customer").removeAttr("disabled");
				$("#f_department").removeAttr("disabled");
				ajax_function_close_parent("saveDxOrder","post",$('#form').serialize(),'新增成功');
			}
		});
			
		//取消按钮
		$('#cancel').on('click', function () {
			var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	        parent.layer.close(index);
		});
		
		// 客户 id和name传入模式
		function initialize_bsSuggest_dx_client_by_input(context, input_name, input_id){
			initialize_bsSuggest($("input[name='"+input_id+"']"),context+"/basic/getClientListSearch?attribute=2&keyword=","c_department","c_id",{c_id: "客户编号",c_department:"户号_客户名称"},["c_id","c_department"],false,bsSuggest_data_process_client,null);
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
		
		//代销货源自动填补
		function initialize_bsSuggest_factory_dx(context){
			initialize_bsSuggest($("input[name='f_id']"),context+"/basic/getFactoryListSearch?f_type=2&keyword=","f_department","f_id",{f_id: "货源编号",f_department:"货源名称_户号"},["f_id","f_department"],false,bsSuggest_data_process_factory_dx,null);
			 $("input[name='f_id']")
			    .on('onSetSelectValue', function (e, keyword) {
			        $("input[name='f_department']").val(keyword['id']);
			  }).on('onUnsetSelectValue', function (e) {
				  $("input[name='f_department']").val('');
			  }).on('keyup',function(){
				  if($(this).val()==""){
					  $("input[name='f_department']").val('');
				  }
			  });
		}
		
		//货源数据处理
		function bsSuggest_data_process_factory_dx(json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
		    var i, len, data = {
		        value: []
		    };

		    if (!json || !json.rows || json.rows.length == 0) {
		        return false;
		    }
		    len = json.rows.length;

		    for (i = 0; i < len; i++) {
		        data.value.push({
		        	"f_id": json.rows[i]['f_id'],
		        	"f_department":json.rows[i]['f_department']
		        });
		    }
		    return data;
		}
		
		//自动搜索填补
		initialize_bsSuggest_dx_client_by_input("${context}","customer","customer_id");
		initialize_bsSuggest_factory_dx("${context}");
		
		
	 });
	</script>
</html>