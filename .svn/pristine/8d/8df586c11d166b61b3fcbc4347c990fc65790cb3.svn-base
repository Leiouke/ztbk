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
	</head>
	<body>
		<div class="sonpage-body">
			<div class="col-md-12">
			   <form id="form" class="form-inline">			        
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true"> 货源信息</a>
                        </li>
                        <!-- <li class=""><a data-toggle="tab" id="tab-2-title" href="#tab-2" aria-expanded="false">联系人</a>
                        </li>
                        <li class=""><a data-toggle="tab" id="tab-3-title" href="#tab-3" aria-expanded="false">付汇信息</a>
                        </li> -->
                    </ul>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane active">
                            <div class="panel-body">
                            	<div class="row">
	                            	<div class="form-group small-space col-xs-4 not-null">
				                  		<label >国家：</label>
				                        <select name="f_country" class="dictionary">
							            	<option></option>
							            </select>
				                	</div>
							    </div>
	                            <div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label >货源编号：</label>
				                        <input type="text" name="f_id" disabled>
				                	</div>
							        <div class="form-group small-space col-xs-4">
							            <label >财务编号：</label>
							            <input type="text" name="f_account_id" >
							        </div>
							        <div class="form-group small-space col-xs-4">
							            <label >货源类别：</label>
							            <select name="fc_id" class="dictionary">
							            	<option></option>
							            </select>
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
				                	<div class="form-group small-space col-xs-4">
				                  		<label>EDI编号：</label>
				                        <input type="text" name="edi">
				                	</div>
							    </div>
							    <div class="row">
							        <div class="form-group input-group small-space col-xs-4" >
							            <label style="float:left">所属集货商：</label>
							            <!-- <input type="text" name="f_id_belong" > -->
							            <input type="text" name="f_id_belong" class="form-control" style="width:68%;">
									    <div class="input-group-btn">
	                                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                            <span class="caret"></span>
	                                        </button>
	                                        <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
		                                </div>
							        </div>
							    </div>
							    <div class="row">
							    	<div class="form-group large-space col-xs-12">
				                  		<label >名称(_户号)：</label>
								    <input type="text" name="sf_name" class="" disabled>
				                	</div>
							    </div>
							    <div class="row">
							    	<div class="form-group small-space col-xs-4">
				                  		<label>我方户号：</label>
				                        <input type="text" name="f_myaccount" >
				                	</div>
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>结算周期：</label>
				                        <input type="text" name="limit_day" >
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >折扣(小数)：</label>
							           	<input type="text" name="f_discount" >
							        </div>
							    </div>
							    <div class="row">
	                            	<div class="form-group small-space-group col-xs-4">	
				                  		<label>赊销限额：</label>
				                        <select name="f_sxxe" class="dictionary title">
				                        	<option></option>
				                        </select>
				                        <input type="text" class="content" name="limit_money" >
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >级别：</label>
							            <select name="f_level" class="dictionary">
				                        	<option></option>
				                        </select>
							        </div>
							        <div class="form-group small-space col-xs-4 not-null" >
							            <label >业务类型：</label>
							            <select name="f_type" class="dictionary">
				                        	<option></option>
				                        </select>
							        </div>
							    </div>
							    <div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>退货周期：</label>
				                        <input type="text" name="back_limit_date">
				                	</div>
							        <!-- <div class="form-group small-space col-xs-4" >
							            <label >退货率：</label>
							            <input type="text" name="f_back" disabled>
							        </div> -->
							        <div class="form-group small-space col-xs-4 not-null" >
							            <label >需代销冲销：</label>
							            <select name="is_need_against" class="dictionary isboolean">
							            </select>
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
				                        <input type="text" name="o_id_input" disabled>
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >录入日期：</label>
							            <input type="text" name="h_input_date" disabled>
							        </div>
							    </div>
							    <div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>修改人：</label>
				                        <input type="text" name="o_id_lastmodify" disabled>
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >修改日期：</label>
							            <input type="text" name="last_mod_date" disabled>
							        </div>
							    </div>
                            </div>
                        </div>
                        <!-- <div id="tab-2" class="tab-pane">
                            <div class="panel-body">
                                <div class="row">
	                            	<div class="form-group middle-space col-xs-8">
				                  		<label>地址：</label>
				                        <input type="text" name="f_address">
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >邮编：</label>
							            <input type="text" name="f_zip">
							        </div>
						    	</div>
						    	<div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>联系人：</label>
				                        <input type="text" name="f_contact_man">
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >电话：</label>
							            <input type="text" name="f_tel">
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >手机：</label>
							            <input type="text" name="f_mobile">
							        </div>
						    	</div>
						    	<div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>邮件：</label>
				                        <input type="text" name="f_email">
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >qq：</label>
							            <input type="text" name="f_QQ">
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >微信：</label>
							            <input type="text" name="f_weixin">
							        </div>
						    	</div>
						    	<div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>备注：</label>
				                        <input type="text" name="f_contact_mem">
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >是否默认：</label>
							            <select name="f_status" class="dictionary isboolean">
							            	<option></option>
							            </select>
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
					                                <table id="table_contact" data-height="350" data-mobile-responsive="true">
					                                    
					                                </table>
					                    </div>
					            </div>
                            </div>panel-body
                        </div>
                        <div id="tab-3" class="tab-pane">
                            <div class="panel-body">
                            	<div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>付汇方式：</label>
				                        <input type="text" name="f_payment">
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
					                                <table id="table_bank" data-height="350" data-mobile-responsive="true">
					                                    
					                                </table>
					                    </div>
					            </div>
                            </div>panel-body3
                        </div> -->
                    </div>   <!-- tab-content  -->
                    
                </div>
		       </form>
			 </div>
		</div><!-- sonpage-body -->
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
    
	<script src="${context}/js/common/common.js"></script>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script src="${context}/js/plugins/webuploader/webuploader.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
    <!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('#save').on('click', function () {
				if(!has_null($('#form')))
					ajax_function("addFactory","post",$('#form').serialize(),'新增成功');		
			 });
			//子元素滚动到底，父元素不随着滚动
			$('.tab-content').scrollUnique();
			//加载字典数据
			get_dictionary("${context}",null);
			initialize_bsSuggest_sfactory_basic("${context}");
			
			initialize_bsSuggest_user_by_dept("${context}", "f_charge_man_name", "f_charge_man", "2000");      // 放用户信息(报刊的)
		});
	</script>
</html>