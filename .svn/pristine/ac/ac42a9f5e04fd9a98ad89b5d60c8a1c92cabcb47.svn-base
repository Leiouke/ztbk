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
				           <div class="row">
								  <div class="form-group input-group inline-middle not-null">
								    <label >结算客户：</label>
								    <input type="text" name="custom_f_id" class="form-control search-items" >
								    <div class="input-group-btn">
	                                    <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                        <span class="caret"></span>
	                                    </button>
	                                    <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                                 </div>
								  </div>
								  <div class="form-group inline-large">
								    <label >户号(_客户名称)：</label>
									<input type="text" name="custom_f_name" class="form-control search-items" disabled>
								  </div>
							</div>
							<div class="row">
								  <div class="form-group input-group inline-middle">
								    <label >销售客户：</label>
								    <input type="text" name="custom_s_id" class="form-control search-items" >
								    <div class="input-group-btn">
	                                    <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                        <span class="caret"></span>
	                                    </button>
	                                    <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                                 </div>
								  </div>
								  <div class="form-group inline-large">
								    <label >户号(_客户名称)：</label>
									<input type="text" name="custom_s_name" class="form-control search-items" disabled>
								  </div>
							</div>
							<div class="row">
								  <div class="form-group inline-small not-null">
								    <label >总码洋：</label>
								    <input type="text" name="total_money" class="form-control search-items">
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >总实洋：</label>
								    <input type="text" name="real_money" class="form-control search-items">
								  </div>
								  <div class="form-group inline-small">
								    <label >外币实洋：</label>
								    <select name="currency" id="currency" class="form-control dictionary search-items">
								    	<option></option>
								    </select>
								    <input type="text" name="c_real_money" class="form-control search-items" />
								  </div>
							</div>
							<div class="row">
								  <div class="form-group inline-large">
								    <label >备注：</label>
								    <input type="text" name="memo" class="form-control search-items">
								  </div>
								  <div class="form-group inline-small not-null">
			                  		<label>所属组织机构：</label>
			                        <input type="text" name="org_name" readonly="readonly" value="${sessionScope.defaultRole.org_name}"/>
			                        <input type="hidden" name="org_code" value="${sessionScope.defaultRole.org_code}" />
			                        <input type="hidden" name="rs_type" value="${param.rs_type}"/>
				                  </div>
				                  <div class="form-group inline-small not-null">	
				                  		<label>考核单位：</label>
				                        <select name="unit_code" class="dictionary" id="unit_code">
								    	</select>
					              </div>
							</div>
						 </div>
						</form>
		            </div>
       		</div>
       		
       		<div class="ibox float-e-margins">
	            <div class="ibox-title">
	                <h5>财务分类明细</h5>
	                <div class="ibox-tools">
	                    <a class="collapse-link">
	                        <i class="fa fa-chevron-up"></i>
	                    </a>
	                </div>
	            </div>
	            <div class="ibox-content ibox-content-table">
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
		
		function toDel(inc_no) {
			ajax_function_ask_and_dosuccess("确认删除？","deleteStatementCwItem","post",{'inc_no':inc_no},end_function);
		}
		
		function toEdit(inc_no) {
			open_layer_end(2,'编辑财务分类','statementCwItemEdit?rs_type=${param.rs_type}&inc_no='+inc_no,['620px', '500px'],false,end_function);
		}
		
		function renderOperator(value,row,index) {
			var str = "";
			str += "<a onclick=\"toEdit('"+row.inc_no+"')\">编辑</a> ";
			str += "<a onclick=\"toDel('"+row.inc_no+"')\">删除</a>";
			return str;
		}
		
		function end_function(index, layero){
			load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'statement_guid'},$table);
     	}
		
		$(document).ready(function () {
			$('#save').on('click', function () {
				if(!has_null($("#form"))){
					if($("input[name='custom_f_id']").attr("data-id")=="") {
						layer.msg("结算客户编号不正确");
					} else {
						ajax_function("addStatement","post",$('#form').serialize(),'新增成功');
					}
				}
			});
	
			//加载字典数据
			get_dictionary("${context}",null);
			
			initialize_table($table,"getStatmentAddItemList",${tableHeader},queryParams,"#tableTool",550);
			
			initialize_bsSuggest_fc_client("${context}", "custom_f_name", "custom_f_id");
			initialize_bsSuggest_fc_client("${context}", "custom_s_name", "custom_s_id");
			
			// 获得当前部门的考核单位
			get_assess_unit_by_dept("${context}", "unit_code");
			
			//增加条目layer
			var $add=$("#add");
			//button_click_windows_refresh($add,2,"新增分类明细",'statementCwItemAdd',$table,false);
			button_click_windows_end($add,2,"新增分类明细",'statementCwItemAdd?rs_type=${param.rs_type}', false, ['620px', '500px'], end_function);
			
			$table.bootstrapTable('refreshOptions',{onLoadSuccess: function(data){
	 			var sum_total_money=0;
	 			var sum_real_money = 0;
	 			var sum_c_real_money = 0;
	 			$.each(data.rows, function(index, row) {
	 				if(row.total_money == undefined){
	 					sum_total_money += 0;
					}else{
						sum_total_money += row.total_money;
					}
	 				
	 				if(row.real_money == undefined){
	 					sum_real_money += 0;
					}else{
	 					sum_real_money += row.real_money;
					}
	 				
	 				if(row.c_real_money == undefined){
	 					sum_c_real_money += 0;
					}else{
	 					sum_c_real_money += row.c_real_money;
					}
				});
	 			//sum_money=sum_money.toFixed(2);
	 			$("input[name='total_money']").val(sum_total_money);
	 			$("input[name='real_money']").val(sum_real_money);
	 			$("input[name='c_real_money']").val(sum_c_real_money);
			}});
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');		
			
			$('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
		});
		
		$("input[name='custom_f_id']").on("onSetSelectValue",function(){
			var custom_f_id = $("input[name='custom_f_id']").val();
			
			var unit_code_value;
			$.ajax({
		        url: "${context}/fc/basic/getOneClient", 
		        method: "post",
		        dataType: "json",
		        traditional:true,
		        //传送请求数据
		        data: {c_id: custom_f_id},
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