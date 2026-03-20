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
                        <li class="active"><a data-toggle="tab" id="tab-1-title" href="#tab-1" aria-expanded="true">货源信息</a>
                        </li>
                        <li class=""><a data-toggle="tab" id="tab-2-title" href="#tab-2" aria-expanded="false">联系人</a>
                        </li>
                        <li class=""><a data-toggle="tab" id="tab-3-title" href="#tab-3" aria-expanded="false">付汇信息</a>
                        </li>
                    </ul>
                    <div class="tab-content" style = "height:70%;">                    
                        <div id="tab-1" class="tab-pane active">
                            <div class="panel-body">
                            <form id="form_tab1" class="form-inline">
	                            <div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>货源编号*：</label>
				                        <input type="text" name="f_id" readonly>  <!-- 如果没有赋值, 那么传到数据库是null 不是空字符串了 -->
				                	</div>
							        <div class="form-group small-space col-xs-4">
				                  		<label>级别*：</label>
				                        <select name="f_jb" class="dictionary">
							            	<option></option>
							            </select>
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label>建档日期：</label>
							            <input type="text" class="layer-date search-items date-type" name="f_create" id="f_create">
							        </div>
							    </div>
							    <div class="row">
							        <div class="form-group small-space col-xs-4" >
							            <label >名称*：</label>
							            <input type="text" name="f_department" >
							        </div>	    
							        <div class="form-group small-space col-xs-4" >
							            <label >简称：</label>
							            <input type="text" name="f_department_simple" >
							        </div>	
							        <div class="form-group small-space col-xs-4" >
							            <label >户号：</label>
							            <input type="text" name="custom_id" >
							        </div> 
							    </div>	
							     <div class="row">
							        <div class="form-group small-space col-xs-4">
				                  		<label>货源类别*：</label>
										 <select name="fc_id" class="dictionary">
							            	<option></option>
							            </select>
				                	</div>
				                	<div class="form-group small-space col-xs-4">
				                  		<label>财务编码：</label>
										<input type="text" name="f_account" >
				                	</div>
							        <div class="form-group small-space col-xs-4">
				                  		<label>经销方式：</label>
										 <select name="cm_id" class="dictionary">
							            	<option></option>
							            </select>
				                	</div>         				
							    </div>					    
							    <div class="row">
							        <div class="form-group small-space col-xs-4">
				                  		<label>退货率：</label>
										<input type="text" name="f_back" >
				                	</div>
				                	<div class="form-group small-space col-xs-4">
				                  		<label>退货联系人：</label>
										<input type="text" name="f_back_man" >
				                	</div>
							        <div class="form-group small-space col-xs-4">
				                  		<label>退货期限：</label>
										<input type="text" name="back_limit_date" >
				                	</div>         				
							    </div>
							    <div class="row">
							        <div class="form-group small-space col-xs-4">
				                  		<label >退货地址：</label>
				                        <input type="text" name="f_back_address" >
				                	</div> 
				                	<div class="form-group small-space col-xs-4">
				                  		<label >退货电话：</label>
				                        <input type="text" name="f_back_tel" >
				                	</div> 
					                <div class="form-group small-space col-xs-4">
					                  	<label >发订周期：</label>
					                    <select name="qk_bd_regular" class="dictionary">
								           <option></option>
								        </select>
					                </div> 
							    </div>
							    <div class="row">
							    	<div class="form-group small-space col-xs-4" >
							            <label >欠款币种：</label>
							            <select name="f_sxxe" class="dictionary">
							            	<option></option>
							            </select>
							        </div>
							        <div class="form-group small-space col-xs-4">
				                  		<label >最大欠款：</label>
				                        <input type="text" name="limit_money" >
				                	</div> 
				                	<div class="form-group small-space col-xs-4">
				                  		<label >折扣：</label>
				                        <input type="text" name="f_discount" >
				                	</div>	
							    </div>
							    <div class="row">
							    	
							    	<div class="form-group small-space col-xs-4" >
							            <label >行业：</label>
							            <select name="hy_id" class="dictionary">
							            	<option></option>
							            </select>
							        </div>		
							        <div class="form-group small-space col-xs-4">
				                  		<label >结算期限：</label>
				                        <input type="text" name="limit_day" >
				                	</div> 
				                	<div class="form-group small-space col-xs-4">
				                  		<label >结算方式：</label>
				                        <input type="text" name="f_account_style" >
				                	</div>			        						       	
							    </div>
							    <div class="row">
							    	<div class="form-group small-space col-xs-4">
				                  		<label >电话：</label>
				                        <input type="text" name="f_tel" >
				                	</div>    
				                	<div class="form-group small-space col-xs-4">
				                  		<label >移动电话：</label>
				                        <input type="text" name="f_handset" >
				                	</div>       
				                	<div class="form-group small-space col-xs-4">
				                  		<label >传真：</label>
				                        <input type="text" name="f_fax" >
				                	</div>          	
							    </div>
							    <div class="row">	
							    	<div class="form-group small-space col-xs-4">
				                  		<label >邮编：</label>
				                       <input type="text" name="f_zip" >
				                	</div>   	
				                	<div class="form-group small-space col-xs-4">
				                  		<label >邮件：</label>
							            <input type="text" name="f_mail" >
				                	</div>
				                	<div class="form-group small-space col-xs-4">
				                  		<label >联系人：</label>
				                        <input type="text" name="f_contact_man" >
				                	</div>     	
							    </div>
							    <div class="row">
							    	<div class="form-group small-space col-xs-4">
				                  		<label >主管业务员：</label>
				                        <input type="text" name="f_charge_man_name">
									    <div class="input-group-btn">
				                         <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
				                             <span class="caret"></span>
				                         </button>
				                         <ul class="dropdown-menu dropdown-menu-right" role="menu" style="margin-left:580px"></ul>
				                        </div>
				                        <input type="hidden" name="f_charge_man">
				                	</div>
				                	<div class="form-group small-space col-xs-4">
				                  		<label >当前状况*：</label>
				                        <select name="f_level" class="dictionary">
							            	<option></option>
							            </select>
				                	</div>    
				                	<div class="form-group small-space col-xs-4">
				                  		<label >信用管制：</label>
				                        <select name="clients_credit" class="dictionary">
							            	<option></option>
							            </select>
				                	</div> 				       	
							    </div>							    
							    <div class="row">
							        <div class="form-group small-space col-xs-4">
				                  		<label >国家：</label>
				                        <select name="f_country" class="dictionary">
							            	<option></option>
							            </select>
				                	</div> 
				                	<div class="form-group small-space col-xs-4">
				                  		<label >地址：</label>
							            <input type="text" name="f_address" >
				                	</div> 
				                	<div class="form-group small-space col-xs-4">
				                  		<label >网址：</label>
							            <input type="text" name="http_address" >
				                	</div> 		
							    </div>
							    <div class="row">
										<div class="form-group small-space col-xs-4">
							    				<label >所属货源编号：</label>
							    				<input type="text" name="parent_factory" >
							    				<div class="input-group-btn">
                                            		<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                                		<span class="caret"></span>
                                            		</button>
                                            		<ul class="dropdown-menu dropdown-menu-right" role="menu" style="margin-left:580px">
                                            		</ul>
                                 				</div>
							  			</div>
										<div class="form-group small-space col-xs-4">
											<label >所属货源：</label>
											<input type="text" name="parent_factory_name"  disabled>
										</div>
										<div class="form-group small-space col-xs-4">
					                  		<label >报订类型：</label>
					                        <select name="qk_bd_style" class="dictionary">
								            	<option></option>
								            </select>
				                		</div>
							    </div>
							    <div class="row">
				                	<div class="form-group small-space col-xs-4">
				                  		<label >财务编号：</label>
							            <input type="text" name="f_account_id" >
				                	</div> 
				                	<div class="form-group small-space col-xs-4">
				                  		<label >业务种类：</label>
				                        <select name="f_type" class="dictionary">
							            	<option></option>
							            </select>
				                	</div> 
				                	<div class="form-group small-space col-xs-4">
				                  		<label >我方户号：</label>
							            <input type="text" name="f_myaccount" >
				                	</div> 		
							    </div>
							    <div class="row">
							    	<div class="form-group small-space col-xs-4">
				                  		<label >需代销冲销：</label>
				                        <select name="is_need_against">
							            	<option></option>
							            	<option value = "0">否</option>
							            	<option value = "1">是</option>
							            </select>
				                	</div> 
							    	<div class="form-group small-space col-xs-4">
				                  		<label >庆典日期：</label>
				                       <input type="text" class="layer-date search-items date-type" name="f_birth" id="f_birth">
				                	</div>
							    </div>
							    <div class="row">
							    	<div class="form-group large-space col-xs-12" >
							            <label >备注：</label>
							            <textarea name="f_mem" cols="50" rows="5"></textarea>
							        </div>
							    </div>
							    </form>
						    </div><!-- panel-body1-->
                        </div>
                      <div id="tab-2" class="tab-pane">
                        <form id="form_tab2" class="form-inline">
                        <input type="hidden" class="f_id" name="f_id">
                        <input type="hidden" class="input-items" name="id">
                            <div class="panel-body">
                                <div class="row">	                            	
							        <div class="form-group small-space col-xs-4" >
							            <label >邮编：</label>
							            <input type="text" name="f_zip"  class="input-items">
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >是否默认：</label>
							            <select name="f_status" class="dictionary isboolean input-items">
							            </select>
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <button type="button" class="btn btn-default btn-xs" id="tab2_reset" >清空</button>
							        </div>
						    	</div>
						    	<div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>联系人：</label>
				                        <input type="text" name="f_contact_man" class="input-items">
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >电话：</label>
							            <input type="text" name="f_tel" class="input-items">
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >手机：</label>
							            <input type="text" name="f_mobile" class="input-items">
							        </div>
						    	</div>
						    	<div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>邮件：</label>
				                        <input type="text" name="f_email" class="input-items">
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >qq：</label>
							            <input type="text" name="f_QQ" class="input-items">
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >微信：</label>
							            <input type="text" name="f_weixin" class="input-items">
							        </div>
						    	</div>
						    	<div class="row">
						    		<div class="form-group small-space col-xs-4">
				                  		<label >国家：</label>
				                        <select name="f_country" class="dictionary input-items">
							            	<option></option>
							            </select>
				                	</div>
						    		<div class="form-group small-space col-xs-4 not-null">
				                  		<label>地址类别：</label>
				                        <select name="f_contact_category" class="dictionary input-items">
				                        </select>
				                	</div>
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>备注：</label>
				                        <input type="text" name="f_contact_mem" class="input-items">
				                	</div>							        
						    	</div>
							    <div class="row">
							    	<div class="form-group middle-space col-xs-8 textarea-group not-null">
				                  		<label>地址：</label>
				                        <textarea name="f_address" rows="4" cols="100" class="input-items"></textarea>
				                	</div>
							    </div>
	                            <div class="row row-lg">                    
					                    <div class="col-sm-12">
					                                <div class="btn-group hidden-xs" id="tableTool_contact" role="group">
					                                    <button type="button" class="btn btn-outline btn-default" id="config_contact">
					                                        <i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
					                                    </button>
					                                   <select class="form-control" >
					                                   		<option value="all">导出全部</option>
											                <option value="basic">导出当页</option>	
											            </select>
					                                </div>
					                                <table id="table_contact" data-height="250" data-mobile-responsive="true">
					                                    
					                                </table>
					                    </div>
					            </div>
                            </div><!-- panel-body -->
                        </form>
                        </div><!-- tab-2 -->
                        
                        <div id="tab-3" class="tab-pane">
                        <form id="form_tab3" class="form-inline">
                        <input type="hidden" class="f_id" name="f_id">
                            <div class="panel-body">
                            	<div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>收款人公司名称：</label>
				                        <input type="text" name="f_companyName">
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >收款人公司地址：</label>
							            <input type="text" name="f_companyAddress">
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >收款人公司电话：</label>
							            <input type="text" name="f_companyPhone">
							        </div>
						    	</div>
                            	<div class="row">
	                            	<div class="form-group small-space col-xs-4 not-null">
				                  		<label>付汇方式：</label>
				                        <select  name="f_payment" class="dictionary">
				                        </select>
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >开户银行：</label>
							            <input type="text" name="f_bank">
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >银行账号：</label>
							            <input type="text" name="f_account">
							        </div>
						    	</div>
						    	<div class="row">
						    		<div class="form-group middle-space col-xs-8">
				                  		<label>银行地址：</label>
				                        <input type="text" name="f_bankAddress">
				                	</div>
				                	<div class="form-group small-space col-xs-4">
				                  		<label>银行电话：</label>
				                        <input type="text" name="f_bankPhone">
				                	</div>
						    	</div>
						    	<div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>Swift：</label>
				                        <input type="text" name="swift_code">
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >Iban：</label>
							            <input type="text" name="iban">
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >Aba：</label>
							            <input type="text" name="aba">
							        </div>
						    	</div>
						    	<!-- <div class="row">
						    		<div class="form-group small-space col-xs-4">
				                  		<label>地址类型：</label>
				                        <input type="text" name="address_category">
				                	</div>
						    	</div> -->
						    	<div class="row">
						    		<div class="form-group middle-space col-xs-8">
				                  		<label>备注：</label>
				                        <input type="text" name="memo">
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >是否默认：</label>
							            <select name="f_default" class="dictionary isboolean">
							            	<option></option>
							            </select>
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
                            </div><!-- panel-body3 -->
                        </form>
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
    <!-- Bootstrap table editable-->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-editable.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table-editable.js"></script>
    
    <script src="${context}/js/common/common.js"></script>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script src="${context}/js/plugins/webuploader/webuploader.min.js"></script>
	
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
 	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
    
	<script type="text/javascript">
	
	var active=1;//区别那个窗口在活动
	var $table_contact = $('#table_contact');
	var $table_bank = $('#table_bank');
		$(document).ready(function () {
			$('#save').on('click', function () {
				switch(active){
			       case 1:{
			    	   if(!has_null($("#form_tab1")))
			    		   ajax_function("editFactory","post",$('#form_tab1').serialize(),'修改成功');			    	   		
			    	   break;
			       }
			       case 2:{
			    	   if(!has_null($("#form_tab2"))){
			    		   var contact_id=$(form_tab2).find("input[name='id']").val();
			    		   if(!contact_id){
			    			   ajax_function_no_close("addContact","post",$('#form_tab2').serialize(),'新增成功');
				    		   $table_contact.bootstrapTable('refresh');
				    		   reset_form($("#form_tab2"));
			    		   }else{
			    			   ajax_function_no_close("editContact","post",$('#form_tab2').serialize(),'保存成功');
				    		   $table_contact.bootstrapTable('refresh');
				    		   reset_form($("#form_tab2"));
			    		   }			    		   
			    	   }							
			    	   break;
			       }
			       case 3:{
			    	   if(!has_null($("#form_tab3"))){
			    		   ajax_function_no_close("addBank","post",$('#form_tab3').serialize(),'新增成功');
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
			
			function queryParams_contact(param) {
				var json_obj_contact = {};
				json_obj_contact['limit'] =param.limit;
				json_obj_contact['offset'] =param.offset;
				json_obj_contact['sortName'] =this.sortName;
				json_obj_contact['sortOrder'] =this.sortOrder;
				json_obj_contact['f_id'] =factory['f_id'];
			    return json_obj_contact;
			}
			
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
			var to_initialize_tab2=true;
			var to_initialize_tab3=true;
			$('#tab-1-title').on('click',function(){
				active=1;
				$("#tab-1").css('display','block');
				$("#tab-2").css('display','none');
				$("#tab-3").css('display','none');
				$("#save").text("保存");
			});
			
			$('#tab-2-title').on('click',function(){
				active=2;
				$("#tab-1").css('display','none');
				$("#tab-2").css('display','block');
				$("#tab-3").css('display','none');
				if(to_initialize_tab2){
					to_initialize_tab2=false;
					initialize_table_no_footer($table_contact,"getContactList",${tableHeader_contact},queryParams_contact,"#tableTool_contact",400);
				}		 
			});
			$('#tab2_reset').on('click', function () {
				reset_form($("#form_tab2"));
			});			
					
			$('#tab-3-title').on('click',function(){
				active=3;
				$("#tab-1").css('display','none');
				$("#tab-2").css('display','none');
				$("#tab-3").css('display','block');
				$("#save").text("保存付汇信息");
				if(to_initialize_tab3){
					to_initialize_tab3=false;
					initialize_table_editable($table_bank,"getFactoryBankList",${tableHeader_bank},queryParams_bank,"#tableTool_bank",400,"editBank");
				}		
			});	
			
			var $config_contact=$("#config_contact");			
			table_column_config_layer($config_contact,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId_contact}');
			
			var $config_bank=$("#config_bank");			
			table_column_config_layer($config_bank,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId_bank}');
			
			//导出选择
			$('#tableTool_contact').find('select').change(function () {
				 $('#table_contact').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    }); 
			
			//导出选择
			$('#tableTool_bank').find('select').change(function () {
				 $('#table_bank').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
			//initialize_bsSuggest_sfactory_basic("${context}");
			
			initialize_bsSuggest_user_by_dept("${context}", "f_charge_man_name", "f_charge_man", "2000");      // 放用户信息(报刊的)
			
			initialize_bsSuggest_bk_factory("${context}", "parent_factory_name", "parent_factory");
		});
		
		function toDel(id){
			 switch(active){
			   case 2:{
		    	   ajax_function_ask_and_refresh("是否删除","deleteContact","post",{'id':id},"删除成功",$('#table_contact'));
		    	   break;
		       }
		       case 3:{
		    	   ajax_function_ask_and_refresh("是否删除","deleteBank","post",{'id':id},"删除成功",$('#table_bank'));
		    	   break;
		       }
		     }
		}
		
		function toEditContect(id){
			$.ajax({
		        type: "post",
		        url: "getOneContact",
		        data: {'id':id},
		        dataType: 'JSON',
		        success: function (data) {
		        	reset_form($("#form_tab2"));
		        	set_one_info($("#form_tab2"),data);
		        	set_one_dictionary($("#form_tab2"),data);
		        },
		        error: function (data) {
		        	console.log(data);
		        }
		    });	
		 }
		
		function renderOperator(value,row,index){
			 switch(active){	
			   case 2:{
		    	   var str="<a onclick=\"toDel("+row.id+")\">删除</a>";
		    	   if(true)
						 str+="&nbsp;&nbsp;<a onclick=\"toEditContect('"+row.id+"')\">编辑</a>";
		    	   return str;
		       }
		       case 3:{
		    	   return "<a onclick=\"toDel("+row.id+")\">删除</a>";
		       }
		     } 
		}	
		
		function reset_form($f_form){
			 $f_form.find('.input-items').each(function(){
		 			$(this).val('');
		 	 });
		}
	</script>
</html>