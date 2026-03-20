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
	    <!-- Bootstrap table -->
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-editable.css" rel="stylesheet">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">	
	</head>
	<body>
		<div class="sonpage-body">
			<div class="col-md-12">			  
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" id="tab-1-title" href="#tab-1" aria-expanded="true"> 客户信息</a>
                        </li>
                        <li class=""><a data-toggle="tab" id="tab-4-title" href="#tab-4" aria-expanded="false">开票信息</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane active">
                            <div class="panel-body">
                            <form id="form_tab1" class="form-inline">
			   				<input type="hidden" name="c_id">
	                            <div class="row">
	                            	<div class="form-group small-space col-xs-4 not-null">
				                  		<label >户号：</label>
				                        <input type="text" name="custom_id" >  <!-- 如果没有赋值, 那么传到数据库是null 不是空字符串了 -->
				                	</div>
							        <div class="form-group small-space col-xs-4">
							            <label >财务科目：</label>
							            <input type="text" name="finance" >
							        </div>
							        <!-- <div class="form-group small-space col-xs-4">
							            <label >客户类别：</label>
							            <select name="cc_id" class="dictionary">
							            	<option></option>
							            </select>
							        </div> -->
							        <div class="form-group small-space col-xs-4" >
							            <label >客户名称：</label>
							            <input type="text" name="c_department" >
							        </div>
							    </div>
							    <div class="row">
							        <div class="form-group small-space col-xs-4" >
							            <label >客户简称：</label>
							            <input type="text" name="c_department_simple" >
							        </div>	    
							        <div class="form-group small-space col-xs-4" >
							            <label >译名：</label>
							            <input type="text" name="c_department_Foreign" >
							        </div> 
							        <div class="form-group small-space col-xs-4" >
							            <label >推广类型：</label>
							            <input type="text" name="c_level_name">
									    <div class="input-group-btn">
				                         <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
				                             <span class="caret"></span>
				                         </button>
				                         <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
				                        </div>
				                        <input type="hidden" name="c_level">
							        </div>    
							    </div>						    
							    <div class="row">
							        <div class="form-group small-space col-xs-4">
				                  		<label>客户属性：</label>
				                        <select name="attribute" class="dictionary">
							            	<option></option>
							            </select>
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >主管业务员：</label>
							            <input type="text" name="c_charge_man_name">
									    <div class="input-group-btn">
				                         <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
				                             <span class="caret"></span>
				                         </button>
				                         <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
				                        </div>
				                        <input type="hidden" name="c_charge_man">
							        </div>			
							    </div>
							    <div class="row">
							    	<div class="form-group small-space col-xs-4" >
							            <label >是否免税：</label>
							            <select name="c_ms_id" class="dictionary isboolean">
							            	<option></option>
							            </select>
							        </div>	
							    	<div class="form-group small-space col-xs-4" >
							            <label >折扣：</label>
							            <input type="text" name="c_discount">
							        </div>		
							   		<div class="form-group small-space col-xs-4" >
							            <label >最大欠款：</label>
							            <input type="text" name="limit_money" >
							        </div>							        						       	
							    </div>
							    <div class="row">
							    	<!-- <div class="form-group small-space col-xs-4">
				                  		<label>图文边界：</label>
				                        <input type="text" name="boundary">
				                	</div>	 -->
							    	<div class="form-group small-space col-xs-4" >
							            <label >结算小数位：</label>
							            <input type="text" name="decimal_place">
							        </div>
							        <!-- <div class="form-group small-space col-xs-4">
				                  		<label>关联本地汇率：</label>
				                        <select name="is_local_rate" class="dictionary isboolean">
							            	<option></option>
							            </select>
				                	</div>	 -->
				                	<div class="form-group small-space col-xs-4">
				                  		<label>参考利润率：</label>
				                        <input type="text" name="profit_rate">
				                	</div>	
				                	<div class="form-group small-space col-xs-4" >
							            <label >销售方式：</label>
							            <select name="cm_id" class="dictionary">
							            	<option></option>
							            </select>
							        </div>						       	
							    </div>
							    <div class="row">
							    	<!-- <div class="form-group small-space col-xs-4" >
							            <label >核价方式：</label>
							            <select name="c_verify_style" class="dictionary">
							            	<option></option>
							            </select>
							        </div>
							        <div class="form-group small-space col-xs-4">
				                  		<label>免税区域：</label>
				                        <input type="text" name="c_area_id">
				                	</div>	 -->						       	
							    </div>
							    <div class="row">
							    	<div class="form-group small-space col-xs-4">
				                  		<label>结算期限：</label>
				                        <input type="text" name="limit_day">
				                	</div>	
							    	<div class="form-group small-space col-xs-4" >
							            <label >退货期限：</label>
							            <input type="text" name="back_limit_date">
							        </div>
							        <div class="form-group small-space col-xs-4">
				                  		<label>退货率：</label>
				                        <input type="text" name="c_back">
				                	</div>							       	
							    </div>							    
							    <div class="row">
							        <!-- <div class="form-group small-space col-xs-4" >
							            <label >配送说明：</label>
							            <input type="text" name="c_mem" >
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >打印配书单：</label>
							            <select name="is_print" class="dictionary isboolean">
							            	<option></option>
							            </select>
							        </div>
							        <div class="form-group small-space col-xs-4 not-null">
				                  		<label>打印人民币：</label>
				                        <select name="is_print_h_price" class="dictionary isboolean">
							            	<option></option>
							            </select>
				                	</div> -->
							    </div>
							    <div class="row">
							        <div class="form-group small-space col-xs-4" >
							            <label >所在国家：</label>
							            <input type="text" name="a_id" >
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >所在省：</label>
							            <input type="text" name="p_id" >
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >所在市：</label>
							            <input type="text" name="city_id" >
							        </div>
							    </div>
							    <div class="row">
							        <div class="form-group small-space col-xs-4" >
							            <label >行业分类：</label>
							            <input type="text" name="c_hy_id" >
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >注册资金：</label>
							            <input type="text" name="c_money" >
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >法人：</label>
							            <input type="text" name="c_law_man" >
							        </div>
							    </div>
							    <div class="row">
							        <div class="form-group small-space col-xs-4" >
							            <label >所属客户：</label>
							            <input type="text" name="parent_client" >
							        </div>
							        <!-- <div class="form-group small-space col-xs-4" >
							            <label >政审等级：</label>
							            <input type="text" name="zs_type" >
							        </div> -->
							    </div>
							    <div class="row">
							    	<div class="form-group large-space col-xs-12" >
							            <label >配送说明：</label>
							            <textarea name="c_mem" cols="50" rows="5"></textarea>
							        </div>
							    </div>
							    <div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>录入员：</label>
				                        <input type="text" name="o_id" disabled>
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >创建日期：</label>
							            <input type="text" name="c_create" class="date-type" disabled>
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >最后修改时间：</label>
							            <input type="text" name="last_mod_date" class="date-type" disabled>
							        </div>
						    	</div>
						    	</form>
						    </div><!-- panel-body1-->
                        </div>
                        <div id="tab-4" class="tab-pane"> 
                            <div class="panel-body">
                            <form id="form_tab4" class="form-inline">
			   				<input type="hidden" class="c_id" name="f_id">
                            	<div class="row">
	                            	<div class="form-group middle-space col-xs-8 not-null">
				                  		<label>公司名称：</label>
				                        <input type="text" name="f_companyName">
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >税务号：</label>
							            <input type="text" name="f_registMark">
							        </div>
						    	</div>
						    	<div class="row">
	                            	<div class="form-group middle-space col-xs-8">
				                  		<label>公司地址：</label>
				                        <input type="text" name="f_companyAddress">
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >联系电话：</label>
							            <input type="text" name="f_companyPhone">
							        </div>
							       <!--  <div class="form-group small-space col-xs-4" >
							            <label >手机：</label>
							            <input type="text" name="f_mobile">
							        </div> -->
						    	</div>
						    	<div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>开户银行：</label>
				                        <input type="text" name="f_bank">
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >银行账号：</label>
							            <input type="text" name="f_account">
							        </div>
							        <div class="form-group small-space col-xs-4 not-null" >
							            <label >是否默认：</label>
							            <select name="f_default" class="dictionary isboolean">
							            	<option></option>
							            </select>
							        </div>
						    	</div>
						    	<div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>我方银行：</label>
				                        <input type="text" name="my_bank" value="工行南京西路支行">
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >我方银行账号：</label>
							            <input type="text" name="my_account" value="1001207419206563490">
							        </div>
							        <div class="form-group small-space col-xs-4">
									    <label >开票类型：</label>
									    <select name="kp_type" class="dictionary" >
									    </select>
									</div>
						    	</div>
						    	<div class="row">
	                            	<div class="form-group small-space col-xs-4 not-null">
									    <label >发票税率：</label>
									    <select name="tax_rate" class="dictionary" >
									    </select>
									</div>
							        <div class="form-group small-space col-xs-4 not-null">
									    <label >是否开到明细：</label>
									    <select name="is_item" class="dictionary isboolean" >
									    </select>
									</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >开票内容：</label>
								    	<input type="text" name="kp_content">
							        </div>
						    	</div>
						    	<div class="row">
	                            	<div class="form-group small-space col-xs-4">
									    <label >开票数量：</label>
								    	<input type="text" name="kp_amount">
									</div>
							        <div class="form-group small-space col-xs-4">
									    <label >开票单位：</label>
								    	<input type="text" name="kp_unit">
									</div>
							        <div class="form-group small-space col-xs-4" >
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
                            </div><!-- panel-body4 -->
                        </div>
                    </div><!-- tab-content        -->             
                    
                </div>
			 </div>
		</div>
		<div class="sonpage-footer">
	        <button id="savePrimary" class="btn btn-primary" type="button">保存</button>
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
    
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script src="${context}/js/plugins/webuploader/webuploader.min.js"></script>
	
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<script type="text/javascript">
		var active=1;//区别那个窗口在活动	
		$(document).ready(function () {			
			//var to_initialize_tab2=true;
			//var to_initialize_tab3=true;
			var to_initialize_tab4=true;		
			$('#save').on('click', function () {
				switch(active){
			       case 4:{
			    	   if(!has_null($("#form_tab4"))){
			    		   ajax_function_no_close("addBank","post",$('#form_tab4').serialize(),'新增成功');
							$table_bank.bootstrapTable('refresh');
			    	   }
			    	   break;
			       }
			   }				
			});
			
			$('#savePrimary').on('click', function () {
				switch(active){
			       case 1:{
			    	   if(!has_null($("#form_tab1")))
			    		   ajax_function("editClient","post",$('#form_tab1').serialize(),'修改成功');
			    	   break;
			       }
			   }				
			});
			//加载字典数据
			var c_str='${oneJson}';
			c_str=c_str.replace(/\r\n/g,"\\r\\n");
        	c_str=c_str.replace(/\n/g,"\\n");
        	c_str=c_str.replace(/\s/g," ");
			var client=JSON.parse(c_str);
			get_dictionary("${context}",client);
			set_one_info($("#form_tab1"),client);
			$(".c_id").each(function(){
				$(this).val(client["c_id"]);
			});

			function queryParams_bank(param) {
				var json_obj_bank = {};
				json_obj_bank['limit'] =param.limit;
				json_obj_bank['offset'] =param.offset;
				json_obj_bank['sortName'] =this.sortName;
				json_obj_bank['sortOrder'] =this.sortOrder;
				json_obj_bank['f_id'] =client["c_id"];
			    return json_obj_bank;
			};
			var $table_bank = $('#table_bank');		
			
			$('#tab-1-title').on('click',function(){
				active=1;
				$("#tab-1").css('display','block');
				$("#tab-4").css('display','none');
			});
			
			$('#tab-4-title').on('click',function(){
				active=4;
				$("#tab-1").css('display','none');
				$("#tab-4").css('display','block');
				if(to_initialize_tab4){
					to_initialize_tab4=false;  
					initialize_table_editable($table_bank,"getClientBankList",${tableHeader_bank},queryParams_bank,"#tableTool_bank",400,"editBank");
				}		
			});
			//表格配置 layer
			var $config_bank=$("#config_bank");			
			table_column_config_layer($config_bank,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId_bank}');
			//导出选择
			$('#tableTool_bank').find('select').change(function () {
				 $('#table_bank').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
			
			initialize_bsSuggest_user_by_dept("${context}", "c_charge_man_name", "c_charge_man", "2000");      // 放用户信息(报刊的)
			
			initialize_bsSuggest_c_level("${context}");  // 推广类型
		});
		
		function toDel(id){
		   switch(active){
		       case 4:{
		    	   ajax_function_ask_and_refresh("是否删除","deleteBank","post",{'id':id},"删除成功",$('#table_bank'));
		    	   break;
		       }
		   }		
		}
		
		function toEdit(id) {
			var f_id = $("input[name='f_id']").val();
			open_layer_refresh(2,'修改开票信息','toClientBankEdit?id='+ id + '&f_id=' + f_id,$('#table_bank'),['750px', '500px'],true);
		}
		
		function renderOperator(value,row,index) {
			var str = "<a onclick=\"toEdit("+row.id+")\">编辑</a>&nbsp;&nbsp;";
			str += "<a onclick=\"toDel("+row.id+")\">删除</a>";
			return str;
		}
	</script>
</html>