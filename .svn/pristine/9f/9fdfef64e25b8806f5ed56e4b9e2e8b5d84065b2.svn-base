<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->  
	    <jsp:include page="../include/h_superHead.jsp"></jsp:include>
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	</head>
	<body>
	<div style="padding:20px;">
	<div class="sonpage-body">			
			   <form id="form" class="form-inline">
			   <div class="col-md-12">
                <!-- <div class="panel-body form-inline"> -->
                            	<div class="row">
	                            	<div class="form-group small-space col-xs-6 not-null">
				                  		<label >用户账号：</label>
				                        <input type="text" name="account" > 
				                	</div>
				                	<div class="form-group small-space col-xs-6 not-null">
				                  		<label >密码：</label>
				                        <input type="password" name="password"> 
				                	</div>
							    </div>
							    <div class="row">
	                            	<div class="form-group small-space col-xs-6">
				                  		<label >工号：</label>
				                        <input type="text" name="job_no" > 
				                	</div>
				                	<div class="form-group small-space col-xs-6 not-null">
				                  		<label >用户姓名：</label>
				                        <input type="text" name="userName"> 
				                	</div>
							    </div>
							    <div class="row">
	                            	<div class="form-group small-space col-xs-6">
				                  		<label >联系电话：</label>
				                        <input type="text" name="mobile" > 
				                	</div>
				                	<div class="form-group small-space col-xs-6">
				                  		<label >电子邮箱：</label>
				                        <input type="text" name="email"> 
				                	</div>
							    </div>
							    <div class="row">	                            	
				                	<div class="form-group input-group inline-middle">	
				                  		<label>业务角色：</label>
										<select class="form-control" name="roleId">
			                        
			                            </select>
				                	</div>
				                </div>
				                <div>
							        <div class="form-group input-group inline-middle">
									    <label >所属组织：</label>
									    <input type="text" name="org_name" class="form-control search-items auto-not-null" >
									    <div class="input-group-btn">
	                                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                            <span class="caret"></span>
	                                        </button>
	                                        <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
		                                 </div>
									  </div>
									  <input type="hidden" name="org_code">
							    </div>
							    <div class="row">	                            	
				                	<div class="form-group inline-small">
									    <label >审批角色：</label>
									    <select name="approve_role" class="form-control dictionary search-items" >
									    
									    </select>
									</div>			
				                </div>
							    
                  <!-- </div> -->
                  </div>
		       </form>
			 
		</div><!-- sonpage-body -->
		</div>
		<div class="sonpage-footer">
	        <button id="save" class="btn btn-primary" type="button">保存</button>
	        <button id="cancel" class="btn btn-white" type="button">取消</button>
		</div>
	</body>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<script type="text/javascript">
		$.ajax({ 
	        url: "getAllRoles", 
	        method: "post",
	        dataType: "json",
	        traditional:true,
	        //传送请求数据
	        //data: {productids:productids,level:configLevel},
	        success: function (data) { 
	        	for (i = 0; i < data.length; i++){
	        		$("[name='roleId']").append("<option value=" + data[i].id + ">" + data[i].name + "</option>");
	        	}
	        },
	        error:function(data){	
	        	alert("ajax请求失败!");	
	        }
	    });
		
		$(document).ready(function () {
			//加载字典数据
			get_dictionary("${context}",null);
			
			initialize_bsSuggest_org("${context}","org_name","org_code");

			$('#save').on('click', function () {
				if(!has_null($("#form"))){
					ajax_function_ask_and_close("确认新增用户？","newAddUser","post",$("#form").serialize(),"新增完成！");
				}
			});
			$('#cancel').on('click', function () {
				var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                parent.layer.close(index);
			});
		});
	</script>
</html>