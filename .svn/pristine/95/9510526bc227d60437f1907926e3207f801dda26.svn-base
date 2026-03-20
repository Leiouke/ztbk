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
            <div class="ibox-content">
                <div class="row row-lg">                    
                    <div class="col-sm-12">                    			
	                    <table id="table" data-mobile-responsive="true">
	                        
	                    </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="ibox float-e-margins">
        <div class="row row-lg">
        	<div class="col-xs-5"></div>    
       		<div class="col-xs-7">
             	<button id="commit" class="btn btn-success" type="button">选取</button>
			    <button id="cancel" class="btn btn-white" type="button">取消</button>
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
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
    
	<script type="text/javascript">
		var $table = $('#table');
		function queryParams(param) {
			var json_obj = {};
			json_obj['limit'] =param.limit;
   	      	json_obj['offset'] =param.offset;
   	     	json_obj['sortName'] =this.sortName;
   	  		json_obj['sortOrder'] =this.sortOrder;
   	  		json_obj['c_id'] ='${param.c_id}';
   	        return json_obj;
		}
		
		var has_url=0;		
		$(document).ready(function () {
			$('#commit').on('click', function () {
				var item_id = $.map($table.bootstrapTable('getSelections'), function (row) {
	                return row.id;
	            });
				
				var table_data=$table.bootstrapTable('getSelections');
				if(item_id.length == 0 ) {
					layer.msg("未选择明细！");
				} else {
					parent.$("input[name='bank_name']").val(table_data[0].f_companyName);
					parent.$("input[name='bank_id']").val(table_data[0].id)
					//alert(parent.$("input[name='c_name']").val());
					layer.msg("选取完成!");   
	        		setTimeout(function (){
	            		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引            		
	                    parent.layer.close(index);//something you want delayed
	            	   }, 1000); // how long do you want the delay to be?
				}
			});
			//bootstrap初始化
			initialize_table_singleSelect($table,"getClientBankQueryList",${tableHeader},queryParams,"#tableTool",250);
	    });
	</script>
</html>