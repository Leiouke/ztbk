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
	    <link rel="stylesheet" type="text/css" href="${context}/css/plugins/webuploader/webuploader.css">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <!-- Bootstrap table -->
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-editable.css" rel="stylesheet">
	</head>
	<body>
		<div class="sonpage-body">
			<div class="col-md-12">
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" id="tab-1-title" href="#tab-1" aria-expanded="true"> 货源信息</a>
                        </li>
                        <li class=""><a data-toggle="tab" id="tab-3-title" href="#tab-3" aria-expanded="false">付款信息</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane active">
                        <form id="form_tab1" class="form-inline">
                        <input type="hidden" class="f_id" name="f_id">
                            <div class="panel-body">
                            	<div class="row">
	                            	<div class="form-group small-space col-xs-4 not-null">
				                  		<label >地区：</label>
				                        <select name="f_country" class="dictionary">
							            	<option></option>
							            </select>
				                	</div>
							    </div>
	                            <div class="row">
	                            	<div class="form-group small-space col-xs-4 not-null">
				                  		<label >货源编号：</label>
				                        <input type="text" name="f_id" disabled> 
				                	</div>
							        <div class="form-group small-space col-xs-4">
							            <label >财务编码：</label>
							            <input type="text" name="f_account_id" >
							        </div>
							    </div>
							    <div class="row">
	                            	<div class="form-group large-space col-xs-12 not-null">
				                  		<label >名称：</label>
				                        <input type="text" name="f_department" > 
				                	</div>
							    </div>
							    <div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>简称：</label>
				                        <input type="text" name="f_department_simple">
				                	</div>
				                	<div class="form-group small-space col-xs-4" >
							            <label >货源户号：</label>
							            <input type="text" name="f_account" >
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >业务员：</label>
							            <input type="text" name="f_charge_man_name">
									    <div class="input-group-btn">
				                         <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
				                             <span class="caret"></span>
				                         </button>
				                         <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
				                        </div>
				                        <input type="hidden" name="f_charge_man">
							        </div>						        
							    </div>
							    <div class="row">
	                            	<div class="form-group middle-space col-xs-8">
				                  		<label>网址：</label>
				                        <input type="text" name="f_website" >
				                	</div>
							    </div>
							    <div class="row">
	                            	<div class="form-group large-space col-xs-12">
				                  		<label>备注：</label>
				                        <textarea  name="f_mem" rows="5" ></textarea>
				                	</div>
							    </div>
							    <div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>录入人：</label>
				                        <input type="text" name="o_id_input_name" disabled>
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >录入日期：</label>
							            <input type="text" name="f_input_date" class="date-type" disabled>
							        </div>
							    </div>
							    <div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>修改人：</label>
				                        <input type="text" name="o_id_lastmodify_name" disabled>
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >修改日期：</label>
							            <input type="text" name="last_mod_date" class="date-type" disabled>
							        </div>
							    </div>
							    <div class="row">
	                            	<div class="form-group small-space col-xs-4 not-null">
				                  		<label>所属组织机构：</label>
				                        <input type="text" name="org_name" readonly="readonly"/>
				                	</div>
				                	<div class="form-group small-space col-xs-4 not-null">	
				                  		<label>考核单位：</label>
				                        <select name="unit_code" class="dictionary" >
								    	</select>
					                </div>
					                <div class="form-group small-space col-xs-4 not-null">	
				                  		<label>财务分类：</label>
				                        <select name="f_cw_type" class="dictionary" >
								    	</select>
					                </div>	
						    	</div>
                            </div>
                        </form>
                        </div><!-- tab-1 -->
                        
                        <div id="tab-3" class="tab-pane">
                        <div class="panel-body">
                        <form id="form_tab3" class="form-inline">
                        <input type="hidden" class="f_id" name="f_id">
                            <div class="row">
	                            	<div class="form-group middle-space col-xs-8 not-null">
				                  		<label>公司名称：</label>
				                        <input type="text" name="f_companyName">
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >联系电话：</label>
							            <input type="text" name="f_companyPhone">
							        </div>
						    	</div>
						    	<div class="row">
	                            	<div class="form-group middle-space col-xs-8">
				                  		<label>公司地址：</label>
				                        <input type="text" name="f_companyAddress">
				                	</div>
							        <div class="form-group small-space col-xs-4">
				                  		<label>开户银行：</label>
				                        <input type="text" name="f_bank">
				                	</div> 
						    	</div>
						    	<div class="row">
							        <div class="form-group small-space col-xs-4" >
							            <label >银行账号：</label>
							            <input type="text" name="f_account">
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >Swift code：</label>
							            <input type="text" name="swift_code">
							        </div>
							        <div class="form-group small-space col-xs-2 not-null" >
							            <label >是否默认：</label>
							            <select name="f_default" class="dictionary isboolean">
							            	<option></option>
							            </select>
							        </div>
							        <div class="form-group small-space col-xs-2" >
							            <button type="button" class="btn btn-primary btn-xs" id="save">新增保存</button>
							        </div>
						    	</div>
	                            <div class="row row-lg">                    
					                <div class="col-sm-12">
		                                <div class="btn-group hidden-xs" id="tableTool_bank" role="group">
		                                    <button type="button" class="btn btn-outline btn-default" id="config_bank">
		                                        <i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
		                                    </button>
		                                   <select class="form-control" >
		                                   		<option value="all">导出全部</option>
								                <option value="basic">导出当页</option>	
								            </select>
		                                </div>
		                                <table id="table_bank" data-height="250" data-mobile-responsive="true">
		                                    
		                                </table>
					                </div>
					            </div>
                          </form>
                        </div>
                        </div>
                    </div>   <!-- tab-content  -->
                    
                </div>
			 </div>
		</div><!-- sonpage-body -->
		<div class="sonpage-footer">
	        <button id="save_out" class="btn btn-primary" type="button">保存</button>
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
    <!-- Bootstrap table editable-->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-editable.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table-editable.js"></script> 
    
	<script src="${context}/js/common/common.js"></script>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script src="${context}/js/plugins/webuploader/webuploader.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
    <!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<script type="text/javascript">
	var active=1;//区别那个窗口在活动
	var $table_bank = $('#table_bank');
	$(document).ready(function () {
			$('#save_out').on('click', function () {
				switch(active){
			       case 1:{
			    	   if(!has_null($("#form_tab1")))
			    		   ajax_function("editFactory","post",$('#form_tab1').serialize(),'修改成功');    	   		
			    	   break;
			       }
			   }
			});
			
			$('#save').on('click', function () {
				switch(active){
			       case 3:{
			    	   if(!has_null($("#form_tab3"))){
			    		   ajax_function_no_close("addFactoryBank","post",$('#form_tab3').serialize(),'新增成功');
						   $table_bank.bootstrapTable('refresh');
			    	   }
			    	   break;
			       }
			   }
			});
			
			$('#cancel').on('click', function () {
				var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                parent.layer.close(index);
			});
			//加载字典数据
			var f_str='${oneJson}';
			f_str=f_str.replace(/\r\n/g,"\\r\\n")  
        	f_str=f_str.replace(/\n/g,"\\n");
			f_str=f_str.replace(/\s/g," ");
			var factory=JSON.parse(f_str);
			get_dictionary("${context}",factory);
			$(".f_id").each(function(){
				$(this).val(factory["f_id"]);
			});
			//填写已有数据
			set_one_info($("#form_tab1"),factory);
			
			// 获得当前部门的考核单位
			get_assess_unit_by_dept("${context}", "unit_code", factory.unit_code);
			
			// 获得当前部门的财务分类(取普通型)
			get_financial_classify_by_dept("${context}", "${sessionScope.defaultRole.dep_org_code}", false, "f_cw_type", factory.f_cw_type);
			
			function queryParams_bank(param) {
				var json_obj_bank = {};
				json_obj_bank['limit'] =param.limit;
				json_obj_bank['offset'] =param.offset;
				json_obj_bank['sortName'] =this.sortName;
				json_obj_bank['sortOrder'] =this.sortOrder;
				json_obj_bank['f_id'] =factory['f_id'];
			    return json_obj_bank;
			}
			
			//子元素滚动到底，父元素不随着滚动
			$('.tab-content').scrollUnique();
			//bootstrap初始化
			var to_initialize_tab3=true;
			$('#tab-1-title').on('click',function(){
				active=1;
				$("#tab-1").css('display','block');
				$("#tab-3").css('display','none');
			});		
					
			$('#tab-3-title').on('click',function(){
				active=3;
				$("#tab-1").css('display','none');
				$("#tab-3").css('display','block');
				if(to_initialize_tab3){
					to_initialize_tab3=false;
					initialize_table_editable($table_bank,"getFactoryBankList",${tableHeader_bank},queryParams_bank,"#tableTool_bank",400,"editBank");
				}		
			});	
			
			var $config_bank=$("#config_bank");			
			table_column_config_layer($config_bank,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId_bank}');
			
			//导出选择
			$('#tableTool_bank').find('select').change(function () {
				 $('#table_bank').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
			
			initialize_bsSuggest_fc_user("${context}", "f_charge_man_name", "f_charge_man");      // 放用户信息
		});
		
		function toDel(id){
			 switch(active){
		       case 3:{
		    	   ajax_function_ask_and_refresh("是否删除","deleteFactoryBank","post",{'id':id},"删除成功",$('#table_bank'));
		    	   break;
		       }
		     }
		}
		
		function toEdit(id) {
			var f_id = $("input[name='f_id']").val();
			open_layer_refresh(2,'修改开票信息','toFactoryBankEdit?id='+ id + '&f_id=' + f_id, $('#table_bank'), ['750px', '500px'], true);
		}

		function renderOperator(value,row,index){
    	   var str = "<a onclick=\"toEdit("+row.id+")\">编辑</a>&nbsp;&nbsp;";
		   str += "<a onclick=\"toDel("+row.id+")\">删除</a>";
		   return str;
		}	
	</script>
</html>