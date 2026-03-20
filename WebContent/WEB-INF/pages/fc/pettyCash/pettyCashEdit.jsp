<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->  
	    <jsp:include page="../../include/h_superHead.jsp"></jsp:include>
	    <!-- Bootstrap table -->
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	    <link rel="stylesheet" type="text/css" href="${context}/css/plugins/webuploader/webuploader.css">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	</head>
	<body>
		<div class="sonpage-body">
			<div class="col-md-12">
			   <div class="ibox float-e-margins">
		            <div class="ibox-content search-content">
			            <form id="form" class="form-inline">
				           <div class="col-xs-12">
								  <div class="form-group middle-space col-xs-12 not-null">
								    <label >申请金额：</label>
								    <input type="text" name="apply_money" class="search-items" />
                                   </div>
							</div>
							<div class="col-xs-12">
								  <div class="form-group middle-space col-xs-12">
								    <label >备注：</label>
								    <input type="text" name="memo" class="search-items">
								  </div>
							</div>
							<div class="col-xs-12"  style="display:none">
								  <div class="form-group middle-space col-xs-12">
								    <label >pc</label>
								    <input type="text" name="pc_id" class="search-items">
								  </div>
							</div>
						</form>
		            </div>
       		</div>       			
		</div>
	</div>
	<div class="sonpage-footer">
	    <button id="save" class="btn btn-primary" type="button">保存</button>
	    <button id="cancel" class="btn btn-white" type="button">取消</button>
	</div>
	</body>
	<!-- Bootstrap table -->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- Bootstrap table export-->
    <script src="${context}/js/plugins/bootstrap-table/export/bootstrap-table-export.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/tableExport.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/js-xlsx/xlsx.core.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.plugin.autotable.js"></script>
    
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
	<script type="text/javascript">
		var $table = $('#table');
		
		function queryParams(param) {
			var json_obj_invoice = {};
			json_obj_invoice['limit'] =param.limit;
			json_obj_invoice['offset'] =param.offset;
			json_obj_invoice['sortName'] =this.sortName;
			json_obj_invoice['sortOrder'] =this.sortOrder;
		    return json_obj_invoice;
		}
		
		$(document).ready(function () {
			var advance = JSON.parse('${oneJson}');
			
			
// 			if('${is_detail}'==1){
// 				$("#save").remove();
// 			}
			
			//加载字典数据
			get_dictionary("${context}", advance);
			
			//填写已有数据
			set_one_info($("#form"), advance);
			
			$('#save').on('click', function () {
				if(!has_null($("#form"))){
					if($("input[name='f_id']").attr("data-id")=="") {
						layer.msg("货源编号不正确");
					} else {
						ajax_function("editPaymentAdvance","post",$('#form').serialize(),'修改成功');
					}
				}
			});
	
			//加载字典数据
			get_dictionary("${context}",null);
			
			initialize_bsSuggest_fc_factory("${context}", "f_department", "f_id");
			
			// 获得当前部门的考核单位
			get_assess_unit_by_dept("${context}", "unit_code",advance.unit_code);
			
		});
		
		$("input[name='f_id']").on("onSetSelectValue",function(){
			var f_id = $("input[name='f_id']").val();
			
			var unit_code_value;
			$.ajax({
		        url: "${context}/fc/basic/getOneFactory", 
		        method: "post",
		        dataType: "json",
		        traditional:true,
		        //传送请求数据
		        data: {f_id: f_id},
		        success: function (data) { 
		        	unit_code_value = data.unit_code;
		        	
		        	// 将考核单位值设为 结算客户对应的考核单位值
					var count=$("#unit_code option").length;
				    for(var i=0;i<count;i++)  {           
				    	if($("#unit_code").get(0).options[i].value == unit_code_value){  
				            $("#unit_code").get(0).options[i].selected = true;  
				            break; 
				        }  
				    }
		        },
		        error:function(data){
		        	alert("ajax请求失败!");
		        }
		    });	
		});
	</script>
</html>