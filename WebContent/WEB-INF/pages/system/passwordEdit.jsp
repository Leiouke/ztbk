<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<jsp:include page="../include/h_superHead.jsp"></jsp:include>				
		
	</head>
	<body>
	<div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>修改密码</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
               <div class="row row-lg">                    
               <div class="col-md-12">
			   <form id="form" class="form-horizontal">
			        <div class="form-group">
	                  <label class="col-sm-3 control-label">新用户密码：</label>
	                  <div class="col-sm-6">
	                  	<input type="password" id="password" name="password" class="form-control"/> 
	                  </div>
			        </div>
			        <div class="form-group">
	                  <label class="col-sm-3 control-label">请重复密码：</label>
	                  <div class="col-sm-6">
	                  	<input type="password" id="confirm_password" name="confirm_password" class="form-control"/> 
	                  </div>
			        </div>
			        <div class="form-group">
	                  <label class="col-sm-3 control-label">提醒：</label>
	                  <div class="col-sm-6">
	                  	<p class="form-control-static" style="color:red">
	                  		密码必须包含数字和字母且不能少于8位
	                  	</p>	        
	                  </div>
			        </div>
			        <div class="form-group" >
        			  <label class="col-sm-3 control-label" ></label>
	                  <div class="col-sm-6">
	                      <button id="save" class="btn btn-primary" type="submit">修改</button>
	                      <button id="cancel" class="btn btn-white" type="button">取消</button>
                      </div>
		            </div>
		       </form>
			 </div>
                </div>
            </div>
        </div>
	</body>
	 <script src="${context }/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${context }/js/plugins/validate/messages_zh.min.js"></script>
	<script type="text/javascript">
		$().ready(function() {
	        $.validator.addMethod("passwordCheck",function(value, element){  
	            var iNow = 0;
	            if (value.match(/\s/)) {
	                return false;
	            }
	            if (value.match(/[\u4E00-\u9FA5]/g)) {
	                return false;
	            }
	            if(value.match(/[0-9]/g)){
	                iNow++;
	            }
	            if(value.match(/[a-z]/ig)){
	                iNow++;
	            }
	            if(value.match(/[~!@#$%^&*]/g)){
	                iNow++;
	            }
	            //console.log(inow);
	            if(iNow < 2){
	                return false;
	            }
	            return true;
	        }, "密码必须包含字母和数字");  
	        
			$("#form").validate({
			    rules: {
			      password: {
			        required: true,
					passwordCheck:true,
			        minlength: 8
			      },
			      confirm_password: {
			        required: true,
			        minlength: 8,
			        equalTo: "#password"
			      }
			    },
			    messages: {
			      password: {
			        required: "请输入密码",
			        minlength: "密码长度不能小于 8个字符"
			      },
			      confirm_password: {
			        required: "请输入密码",
			        minlength: "密码长度不能小于 8个字符",
			        equalTo: "两次密码输入不一致"
			      }
			    },
			    submitHandler: function(form) 
			    {      
			       $.ajax
			        ({ 
			            url: "${context}/system/editPassword", 
			            method: "post",
			            dataType: "json",  // 返回的结果类型是json...
			            //传送请求数据
			            data: $('#form').serialize(),
			            success: function (data) { 
			            	if (data.success){
			            		//关闭modal框
			            		alert("修改成功");
			            		$('#form')[0].reset();
			            	}
			            }
			        })
			    }
			});
		});
	</script>
</html>