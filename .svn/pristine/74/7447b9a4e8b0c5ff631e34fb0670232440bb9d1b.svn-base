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
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">	
	</head>
	<body>
		<div class="sonpage-body">
			<div class="col-md-12">
			   			        
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" id="tab-1-title" href="#tab-1" aria-expanded="true"> 客户信息</a>
                        </li>
                        <!-- <li class=""><a data-toggle="tab" id="tab-2-title" href="#tab-2" aria-expanded="false">客户系数</a>
                        </li>
                        <li class=""><a data-toggle="tab" id="tab-3-title" href="#tab-3" aria-expanded="false">联系人</a>
                        </li>
                        <li class=""><a data-toggle="tab" id="tab-4-title" href="#tab-4" aria-expanded="false">开票信息</a>
                        </li> -->
                    </ul>
                    <div class="tab-content">                    
                        <div id="tab-1" class="tab-pane active">
                            <div class="panel-body">
                            <form id="form" class="form-inline">
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
							            <label >折扣(填小数)：</label>
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
				                	</div>	 -->		
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
				                        <input type="text" disabled>
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >创建日期：</label>
							            <input type="text" name="h_input_date" class="date-type" disabled>
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >最后修改时间：</label>
							            <input type="text" name="last_mod_date" class="date-type" disabled>
							        </div>
						    	</div>
						    </form>
						    </div><!-- panel-body1-->
                        </div>
                        <!-- <div id="tab-2" class="tab-pane">
                            <div class="panel-body">
                            	<div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>币种：</label>
				                        <select name="currency" class="dictionary">
				                  			<option></option>
				                  		</select>
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >图书免税系数：</label>
							            <input type="text" name="l_factor">
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >文献免税系数：</label>
							            <input type="text" name="d_factor" >
							        </div>
						    	</div>
						    	<div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>协议汇率：</label>
				                        <input type="text" name="exchange_rate">
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >结算位数：</label>
							            <input type="text" name="decimal_place">
							        </div>
						    	</div>
	                                <div class="row row-lg">                    
					                    <div class="col-sm-12">
					                                <div class="btn-group hidden-xs" id="tableTool_ratio" role="group">
					                                    <button type="button" class="btn btn-outline btn-default" id="config_ratio">
					                                        <i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
					                                    </button>
					                                   <select class="form-control" >
					                                   		<option value="all">导出全部</option>
											                <option value="basic">导出当页</option>	
											            </select>
					                                </div>
					                                <table id="table_ratio"  data-mobile-responsive="true">
					                                    
					                                </table>
					                    </div>
					                </div>
                            </div>panel-body2
                        </div>
                        <div id="tab-3" class="tab-pane">
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
					                                <table id="table_contact" data-mobile-responsive="true">
					                                    
					                                </table>
					                    </div>
					            </div>
                            </div>
                        </div>
                        <div id="tab-4" class="tab-pane"> 
                            <div class="panel-body">
                            	<div class="row">
	                            	<div class="form-group middle-space col-xs-8">
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
				                        <input type="text" name="f_companyAddres">
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >联系电话：</label>
							            <input type="text" name="f_companyPhone">
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >手机：</label>
							            <input type="text" name="f_mobile">
							        </div>
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
					                                <table id="table_bank" data-mobile-responsive="true">
					                                    
					                                </table>
					                    </div>
					            </div>
                            </div>panel-body4
                        </div> -->
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
    
	<script src="${context}/js/common/common.js"></script>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script src="${context}/js/plugins/webuploader/webuploader.min.js"></script>
	
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
 	
	<script type="text/javascript">
		$(document).ready(function () {
			$('#save').on('click', function () {
				if(!has_null($("#form")))
					ajax_function("addClient","post",$('#form').serialize(),'新增成功');		
			});
			
			//加载字典数据
			get_dictionary("${context}",null);
			
			initialize_bsSuggest_user_by_dept("${context}", "c_charge_man_name", "c_charge_man", "2000");      // 放用户信息(报刊的)
			
			initialize_bsSuggest_c_level("${context}");  // 推广类型
		});
	</script>
</html>