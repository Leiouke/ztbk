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
            <div class="ibox-content search-content">
            	<form class="form-inline"> <!-- 外面放1个form页面排布方便好看一些, 虽然没有什么实际意义 -->
	            <div class="col-xs-11">
					  <div class="col-sm-11 form-horizontal">			   		
							<div class="form-group">
								<label class="col-sm-3 control-label">文件：</label>
							    <div class="col-sm-5">
							    	<input type="file" name="pic" id="pic" class="form-control">				                        
								 </div>
							</div>
							<div class="form-group" >
								<div class="col-sm-offset-3 col-sm-3">
							    	<button id="upload" class="btn btn-primary" type="button">上传文件</button>
						    	</div>
							</div>								      			
					 </div>	
				 </div>
				 </form>
            </div>
        </div>
        <div class="ibox float-e-margins">
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
    <!-- ajaxfileupload-->
	<script src="${context}/js/plugins/ajaxfileupload/ajaxfileupload.js"></script>
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
    
	<script type="text/javascript">
		var $table = $('#table');
		function queryParams(param) {
			var json_obj={};  // 代表是集合
			json_obj['limit'] =param.limit;
   	      	json_obj['offset'] =param.offset;
   	     	json_obj['sortName'] =this.sortName;
   	  		json_obj['sortOrder'] =this.sortOrder;
   	  		json_obj['dcl_id'] = '${dcl_id}';
   	        return json_obj;
		}
		
		$(document).ready(function () {
			
			 //固定列
			//bootstrap初始化
			initialize_table($table,"getTaxbackPic",${tableHeader},queryParams,"#tableTool",400);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			 $('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		     }); 
	    });
		
		//上传图片文件
		$('#upload').on('click', function () {
			 $.ajaxFileUpload({ 
					url:'addTaxbackPic?dcl_id='+'${dcl_id}',			  
			        secureuri:false,
			        method:'post',
			        fileElementId:'pic',	//与页面处理代码中file相对应的ID值
			        dataType: 'json',		//返回数据类型:text，xml，json，html,scritp,jsonp五种
			        success: function (returnData){
						   if(returnData.success==false){ 
							   alert("文件不能为空");
						  }else{
							  //$table.bootstrapTable('refresh');
							  // 重新刷新页面
							  window.location.href='';
						  }
			        },
			        error: function (data,status,e){	
			        	alert("数据有误");	
			        }
			});
		})
		
		function toDel(pic_id){
			ajax_function_ask_and_refresh("确认删除？","deleteTaxbackPic","post",{'pic_id':pic_id},"删除成功！", $table);
		}
		
		function toOpenPic(pic_name){
			var tempwindow=window.open('_blank');
			tempwindow.location = '../../../images/tb_pic/' + pic_name;
		}
		
		function renderOperator(value,row,index){
			var str = '';
			str += "<a onclick=\"toDel('"+row.pic_id+"')\">删除</a> ";
			//str += "<a href='downloadCashApplicationFile?filename=" + row.pic_name + "')\">下载</a>";
			str +="&nbsp;&nbsp;";
			str += "<a onclick=\"toOpenPic('"+row.pic_name+"')\">查看</a> "
			return str;
		 }
	</script>
</html>