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
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-editable.css" rel="stylesheet">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <jsp:include page="../../include/h_superHead.jsp"></jsp:include>
	</head>
	<body>
	<!-- <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>报表明细列表</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div> -->
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
	                    <div class="sonpage-footer">
	    					<button id="save" class="btn btn-primary" type="button">保存</button>
	    					<button id="cancel" class="btn btn-white" type="button">取消</button>
						</div>
                    </div>
                </div>
            </div>
        <!-- </div>
    </div> -->
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
    <!-- Bootstrap table editable-->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-editable.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table-editable.js"></script>
    
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
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
   	  		json_obj['mail_code'] ='${param.mail_code}';
   	  		if('${param.instance_tm}' == null || '${param.instance_tm}' == ''){
   	  			json_obj['instance_tm'] ='000';    //给一个查不到的条码，避免入参为空造成sql脚本报错
   	  		} else {
   	  			json_obj['instance_tm'] ='${param.instance_tm}';
   	  		}
	  		
	  		//console.log("param：" + param);
	  		//console.log("json_obj['instance_tm']：" + json_obj['instance_tm']);
   	        return json_obj;
		}
		
		load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}'});
		$(document).ready(function () {			
			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化
			initialize_table($table,"getFirstPoliticalCheckItemConsultList",${tableHeader},queryParams,"#tableTool",400);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			
			$('#tableTool').find('select').change(function () {
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
		});
		
		$("#save").on('click',function() {
			//获取选中行的数据
			var item_ids= $.map($table.bootstrapTable('getSelections'), function (row) {
                return {'zs1_opn':row.zs1_opn, 'zs1_result':row.zs1_result};
            });
			
			if(item_ids.length != 0) {
				parent.receiveDataFromChild(item_ids); // 调用父窗口的方法
				var index = parent.layer.getFrameIndex(window.name); // 获取当前弹出层的索引
				parent.layer.close(index); // 关闭当前弹出层
			} else {
				parent.layer.msg("未选择明细！");
			}
		});
	</script>
</html>