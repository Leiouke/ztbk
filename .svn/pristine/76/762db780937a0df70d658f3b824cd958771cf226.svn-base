//具体部门的员工自动补全
function initialize_bsSuggest_user_by_dept(context, input_name, input_id, dep_org_code){
	initialize_bsSuggest($("input[name='"+input_name+"']"),context+"/system/getUserListSearch?dep_org_code=" + dep_org_code + "&keyword=","job_no","name",{job_no: "工号",name:"名称"},["job_no","name"],true,bsSuggest_data_process_user_by_dept,null);
	 $("input[name='"+input_name+"']")
	    .on('onSetSelectValue', function (e, keyword) {
	        $("input[name='"+input_id+"']").val(keyword['id']);
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='"+input_id+"']").val('');
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='"+input_id+"']").val('');
		  }
	  });
}

//含有权限信息的的员工自动补全(后续都用这个吧, 更具通用性)
function initialize_bsSuggest_fc_user(context, input_name, input_id){
	initialize_bsSuggest($("input[name='"+input_name+"']"),context+"/system/getUserListCommonSearch?keyword=","job_no","name",{job_no: "工号",name:"名称"},["job_no","name"],true,bsSuggest_data_process_user_by_dept,null);
	 $("input[name='"+input_name+"']")
	    .on('onSetSelectValue', function (e, keyword) {
	        $("input[name='"+input_id+"']").val(keyword['id']);
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='"+input_id+"']").val('');
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='"+input_id+"']").val('');
		  }
	  });
}

//员工数据处理
function bsSuggest_data_process_user_by_dept(json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
    var i, len, data = {
        value: []
    };
    if (!json || !json.rows || json.rows.length == 0) {
        return false;
    }
    len = json.rows.length;

    for (i = 0; i < len; i++) {
        data.value.push({
        	"account": json.rows[i]['account'],
        	"job_no": json.rows[i]['job_no'],
        	"name":json.rows[i]['name']
        });
    }
    return data;
}

// --------------------------------------------------------------      //

//含有权限的客户信息自动补全, 客户 id和name传入模式
function initialize_bsSuggest_fc_client(context, input_name, input_id){
	initialize_bsSuggest($("input[name='"+input_id+"']"),context+"/fc/basic/getClientListSearch?keyword=","c_department","c_id",{c_id: "客户编号",c_department:"户号_客户名称"},["c_id","c_department"],false,bsSuggest_data_process_fc_client,null);
	$("input[name='"+input_id+"']")
    .on('onSetSelectValue', function (e, keyword) {
        $("input[name='"+input_name+"']").val(keyword['id']);
  }).on('onUnsetSelectValue', function (e) {
	  $("input[name='"+input_name+"']").val('');
  }).on('keyup',function(){
	  if($(this).val()==""){
		  $("input[name='"+input_name+"']").val('');
	  }
  });
}

//客户数据处理
function bsSuggest_data_process_fc_client(json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
	var i, len, data = {
	    value: []
	};
	
	if (!json || !json.rows || json.rows.length == 0) {
	    return false;
	}
	len = json.rows.length;
	
	for (i = 0; i < len; i++) {
	    data.value.push({
	    	"c_id": json.rows[i]['c_id'],
	    	"c_department":json.rows[i]['custom_id']+"_"+json.rows[i]['c_department'],
	    });
	}
	return data;
}

//--------------------------------------------------------------      //
//记账日期自动补全, is_close = 0(只找未关账的年月) is_close = all (找所有的年月)
function initialize_bsSuggest_fc_account_month(context, input_name, is_close){
	initialize_bsSuggest($("input[name='" + input_name + "']"),context+"/fc/basic/getAccountMonthSearchList?is_close=" + is_close + "&keyword=","month_name","month_code",
			{month_name: "年/月",month_code:"记账年月内码"},["month_name"],true,bsSuggest_data_process_fc_account_month,null);
}

//记账年月数据处理
function bsSuggest_data_process_fc_account_month(json){
	var i, len, data = {
	        value: []
	    };

	    if (!json || !json.rows || json.rows.length == 0) {
	        return false;
	    }
	    len = json.rows.length;

	    for (i = 0; i < len; i++) {
	        data.value.push({
	        	"month_code": json.rows[i]['month_code'],
	        	"month_name": json.rows[i]['month_name']
	        });
	    }
	    return data;
}

//--------------------------------------------------------------      //

//含有权限的货源信息自动补全, 客户 id和name传入模式
function initialize_bsSuggest_fc_factory(context, input_name, input_id){
	initialize_bsSuggest($("input[name='" + input_id + "']"),context+"/fc/basic/getFactoryListSearch?&keyword=","f_department","f_id",{f_id: "货源编号",f_department:"货源名称_户号"},["f_id","f_department"],false,bsSuggest_data_process_factory,null);
	 $("input[name='" + input_id + "']")
	    .on('onSetSelectValue', function (e, keyword) {
	        $("input[name='" + input_name + "']").val(keyword['id']);
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='" + input_name +"']").val('');
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='" + input_name + "']").val('');
		  }
	  });
}

//货源数据处理
function bsSuggest_data_process_factory(json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
    var i, len, data = {
        value: []
    };

    if (!json || !json.rows || json.rows.length == 0) {
        return false;
    }
    len = json.rows.length;

    for (i = 0; i < len; i++) {
        data.value.push({
        	"f_id": json.rows[i]['f_id'],
        	"f_department":json.rows[i]['f_department']+"_"+json.rows[i]['f_account']
        });
    }
    return data;
}

//含有权限的货源信息自动补全银行信息
function initialize_bsSuggest_fc_f_bank(context,f_id){
	initialize_bsSuggest($("input[name='f_bank_name']"),context+"/fc/basic/getFBankListSearch","bank_id","f_bank_name",{bank_id:"银行内码",f_bank:"开户银行",f_account:"银行账号"},["f_bank","f_account"],true,bsSuggest_data_process_f_bank,ajaxparam_f_band);
	$("input[name='f_bank_name']")
  .on('onSetSelectValue', function (e, keyword) {
      $("input[name='bank_id']").val(keyword['id']);
  }).on('onUnsetSelectValue', function (e) {
	  $("input[name='bank_id']").val('');
  }).on('keyup',function(){
	  if($(this).val()==""){
		  $("input[name='bank_id']").val('');
	  }
  });
}

//货源银行数据处理
function bsSuggest_data_process_f_bank(json) { // 银行地址
	var i, len, data = {
        value: []
    };

    if (!json || !json.rows || json.rows.length == 0) {
        return false;
    }
    len = json.rows.length;

    for (i = 0; i < len; i++) {
    	var the_f_bank=!json.rows[i]['f_bank']?"无":json.rows[i]['f_bank'];
    	var the_f_account=!json.rows[i]['f_account']?"无":json.rows[i]['f_account'];
    	data.value.push({
        	"id": json.rows[i].id,
        	"f_bank":the_f_bank,
        	"f_account":the_f_account,
        	"f_bank_name":the_f_bank+"|"+the_f_account
        });
    }
    return data;
}

//货源银行账号发送请求-数据补充
function ajaxparam_f_band(keyword, opts) {
	//调整 ajax 请求参数方法，用于更多的请求配置需求。如对请求关键字作进一步处理、修改超时时间等
	var input_f_id= $("input[name='f_id']").val();
	if(input_f_id=="") input_f_id="kh";
    return {
        timeout: 10000,
        data: {
        	keyword:keyword,
            f_id: input_f_id
        }
    };
}

//具体招标单位自动补全
function initialize_bsSuggest_c_department(context, input_name, input_id,c_id,company_type){
	initialize_bsSuggest($("input[name='"+input_name+"']"),context+"/fc/basic/getDepartmentListSearch?c_id=" + c_id + "&company_type=" + company_type + "&c_department=","c_id","c_department",{c_id: "编号",c_department:"名称"},["c_id","c_department"],true,bsSuggest_data_process_c_department,null);
	 $("input[name='"+input_name+"']")
	    .on('onSetSelectValue', function (e, keyword) {
	        $("input[name='"+input_id+"']").val(keyword['id']);
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='"+input_id+"']").val('');
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='"+input_id+"']").val('');
		  }
	  });
}

//招标单位数据处理
function bsSuggest_data_process_c_department(json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
    var i, len, data = {
        value: []
    };
    if (!json || !json.rows || json.rows.length == 0) {
        return false;
    }
    len = json.rows.length;

    for (i = 0; i < len; i++) {
        data.value.push({
        	"c_id": json.rows[i]['c_id'],
        	"c_department":json.rows[i]['c_department']
        });
    }
    return data;
}

//具体招标项目补全
function initialize_bsSuggest_bd_project(context, input_name, input_id){
	initialize_bsSuggest($("input[name='"+input_name+"']"),context+"/fc/basic/getBidProjectListSearch?bids_project=","bd_id","bids_project",{bd_id: "编号",bids_project:"名称"},["bd_id","bids_project"],true,bsSuggest_data_process_b_project,null);
	 $("input[name='"+input_name+"']")
	    .on('onSetSelectValue', function (e, keyword) {
	        $("input[name='"+input_id+"']").val(keyword['id']);
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='"+input_id+"']").val('');
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='"+input_id+"']").val('');
		  }
	  });
}

//招标项目数据处理
function bsSuggest_data_process_b_project(json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
    var i, len, data = {
        value: []
    };
    if (!json || !json.rows || json.rows.length == 0) {
        return false;
    }
    len = json.rows.length;

    for (i = 0; i < len; i++) {
        data.value.push({
        	"bd_id": json.rows[i]['bd_id'],
        	"bids_project":json.rows[i]['bids_project']
        });
    }
    return data;
}

//具体投标项目补全
function initialize_bsSuggest_td_project(context, input_name, input_id){
	initialize_bsSuggest($("input[name='"+input_name+"']"),context+"/fc/basic/getTenderProjectListSearch?bids_project=","td_id","bids_project",{td_id: "编号",bids_project:"名称"},["td_id","bids_project"],true,bsSuggest_data_process_td_project,null);
	 $("input[name='"+input_name+"']")
	    .on('onSetSelectValue', function (e, keyword) {
	        $("input[name='"+input_id+"']").val(keyword['id']);
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='"+input_id+"']").val('');
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='"+input_id+"']").val('');
		  }
	  });
}

//投标项目数据处理
function bsSuggest_data_process_td_project(json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
    var i, len, data = {
        value: []
    };
    if (!json || !json.rows || json.rows.length == 0) {
        return false;
    }
    len = json.rows.length;

    for (i = 0; i < len; i++) {
        data.value.push({
        	"td_id": json.rows[i]['td_id'],
        	"bids_project":json.rows[i]['bids_project']
        });
    }
    return data;
}

//员工银行填补
function initialize_bsSuggest_fc_staff_bank(context, input_name, input_id){
	initialize_bsSuggest($("input[name='"+input_name+"']"),context+"/fc/reimbursement/getStaffBankSuggestSearch?keyword=","id","r_account",{r_bank: "银行",r_account:"帐号"},["id","r_account"],true,bsSuggest_data_process_staff_bank,null);
	 $("input[name='"+input_name+"']")
	    .on('onSetSelectValue', function (e, keyword) {
	        $("input[name='"+input_id+"']").val(keyword['id']);
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='"+input_id+"']").val('');
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='"+input_id+"']").val('');
		  }
	  });
}

//员工数据处理
function bsSuggest_data_process_staff_bank(json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
    var i, len, data = {
        value: []
    };
    if (!json || !json.rows || json.rows.length == 0) {
        return false;
    }
    len = json.rows.length;

    for (i = 0; i < len; i++) {
        data.value.push({
        	"id": json.rows[i]['id'],
        	"r_account": json.rows[i]['r_bank']+json.rows[i]['r_account']
        });
    }
    return data;
}

//退税明细商品填补
function initialize_bsSuggest_fc_taxback_product(context, product_code, product_name){
	initialize_bsSuggest($("input[name='"+product_code+"']"),context+"/fc/declare/getTaxdeclareProduct?keyword=","product_name","product_code",{product_code: "编号",product_name:"商品名"},["product_code","product_name"],true,bsSuggest_data_process_taxback_product,null);
	 $("input[name='"+product_code+"']")
	    .on('onSetSelectValue', function (e, keyword) {
	        $("input[name='"+product_name+"']").val(keyword['id']);
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='"+product_name+"']").val('');
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='"+product_name+"']").val('');
		  }
	  });
}

//员工数据处理
function bsSuggest_data_process_taxback_product(json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
    var i, len, data = {
        value: []
    };
    if (!json || !json.rows || json.rows.length == 0) {
        return false;
    }
    len = json.rows.length;

    for (i = 0; i < len; i++) {
        data.value.push({
        	"product_code": json.rows[i]['product_code'],
        	"product_name": json.rows[i]['product_name']
        });
    }
    return data;
}
