// 自动完成框逻辑都放在这里了

//客户
function initialize_bsSuggest_client(context){
	initialize_bsSuggest($("input[name='c_id']"),context+"/basic/getClientListSearch?keyword=","c_department","c_id",{c_id: "客户编号",c_department:"户号_客户名称"},["c_id","c_department"],false,bsSuggest_data_process_client,null);
	$("input[name='c_id']")
    .on('onSetSelectValue', function (e, keyword) {
        $("input[name='c_name']").val(keyword['id']);
  }).on('onUnsetSelectValue', function (e) {
	  $("input[name='c_name']").val('');
  }).on('keyup',function(){
	  if($(this).val()==""){
		  $("input[name='c_name']").val('');
	  }
  });
}

// 客户 id和name传入模式
function initialize_bsSuggest_client_by_input(context, input_name, input_id){
	initialize_bsSuggest($("input[name='"+input_id+"']"),context+"/basic/getClientListSearch?keyword=","c_department","c_id",{c_id: "客户编号",c_department:"户号_客户名称"},["c_id","c_department"],false,bsSuggest_data_process_client,null);
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

//益华的客户
function initialize_bsSuggest_yh_client(context){
	initialize_bsSuggest($("input[name='c_id']"),context+"/basic/getYHClientListSearch?keyword=","c_department","c_id",{c_id: "客户编号",c_department:"户号_客户名称"},["c_id","c_department"],false,bsSuggest_data_process_client,null);
	$("input[name='c_id']")
    .on('onSetSelectValue', function (e, keyword) {
        $("input[name='c_name']").val(keyword['id']);
  }).on('onUnsetSelectValue', function (e) {
	  $("input[name='c_name']").val('');
  }).on('keyup',function(){
	  if($(this).val()==""){
		  $("input[name='c_name']").val('');
	  }
  });
}

//搜索自动补全处理数据方法
//客户数据处理
function bsSuggest_data_process_client(json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
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

//客户带是否免税
function initialize_bsSuggest_client_is_duty_free(context){
	initialize_bsSuggest($("input[name='c_id']"),context+"/basic/getClientListSearch?keyword=","c_department_is_duty_free","c_id",{c_id: "客户编号",c_department:"户号_客户名称",c_department_is_duty_free:"户号_客户名称_是否免税"},["c_id","c_department"],false,bsSuggest_data_process_client_is_duty_free,null);
	$("input[name='c_id']")
    	.on('onSetSelectValue', function (e, keyword) {
    		var c_info=keyword['id'];   		
    		var is_duty_free=c_info.substring(c_info.lastIndexOf("_")+1,c_info.length);
    		c_info=c_info.substring(0,c_info.lastIndexOf("_"));
    		if(is_duty_free=='true'){
    			$("input[name='is_duty_free']").prop("checked",true);
    		}else
    			$("input[name='is_duty_free']").prop("checked",false);
	    	var c_name=c_info;
	        $("input[name='c_name']").val(c_name);        
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='c_name']").val('');
		  $("input[name='is_duty_free']").prop("checked",false);
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='c_name']").val('');
			  $("input[name='is_duty_free']").prop("checked",false);
		  }
	  });
}

//客户带是否免税数据处理
function bsSuggest_data_process_client_is_duty_free(json) { // 客户带核价模式
    var i, len, data = {
        value: []
    };
    if (!json || !json.rows || json.rows.length == 0) {
        return false;
    }
    len = json.rows.length;

    for (i = 0; i < len; i++) {
    	var the_is_duty_free=!json.rows[i]['c_ms_id']?"0":json.rows[i]['c_ms_id'];
        data.value.push({
        	"c_id": json.rows[i]['c_id'],
        	"c_department":json.rows[i]['custom_id']+"_"+json.rows[i]['c_department'],
        	"c_department_is_duty_free":json.rows[i]['custom_id']+"_"+json.rows[i]['c_department']+"_"+the_is_duty_free
        });
    }
    return data;
}

//记账日期自动补全
function initialize_bsSuggest_account_month(context){
	initialize_bsSuggest($("input[name='account_month_all']"),context+"/np/getAccountMonthSearchList?keyword=","month_name","month_code",{month_name: "年/月",month_code:"记账年月内码"},["month_name"],true,bsSuggest_data_process_account_month,null);
}

//记账日期自动补全
function initialize_bsSuggest_account_month_by_input(context, input_name){
	initialize_bsSuggest($("input[name='" + input_name + "']"),context+"/np/getAccountMonthSearchList?keyword=","month_name","month_code",{month_name: "年/月",month_code:"记账年月内码"},["month_name"],true,bsSuggest_data_process_account_month,null);
}

//记账日期自动补全
function initialize_bsSuggest_account_month_not_close(context){
	initialize_bsSuggest($("input[name='account_month']"),context+"/np/getAccountMonthSearchList?is_close=0&keyword=","month_name","month_code",{month_name: "年/月",month_code:"记账年月内码"},["month_name"],true,bsSuggest_data_process_account_month,null);
}

//记账年月数据处理
function bsSuggest_data_process_account_month(json){
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

//客户带预收余额
function initialize_bsSuggest_client_advance_balance(context){
	initialize_bsSuggest($("input[name='c_id']"),context+"/basic/getClientListSearch?keyword=","c_department_advance_balance","c_id",{c_id: "客户编号",c_department:"户号_客户名称",c_department_style_contact:"户号_客户名称_账户余额"},["c_id","c_department"],false,bsSuggest_data_process_client_advance_balance,null);
	$("input[name='c_id']")
    	.on('onSetSelectValue', function (e, keyword) {
    		var c_info=keyword['id'];   
    		var advance_balance=c_info.substring(c_info.lastIndexOf("_")+1,c_info.length);
    		c_info=c_info.substring(0,c_info.lastIndexOf("_"));
    		$("input[name='advance_balance']").val(advance_balance);
	    	var c_name=c_info;
	        $("input[name='c_name']").val(c_name);
	        
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='c_name']").val('');
		  $("input[name='advance_balance']").val('');
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='c_name']").val('');
			  $("input[name='advance_balance']").val('');
		  }
	  });
}

//客户带预收余额 数据处理
function bsSuggest_data_process_client_advance_balance(json) { 
    var i, len, data = {
        value: []
    };
    if (!json || !json.rows || json.rows.length == 0) {
        return false;
    }
    len = json.rows.length;

    for (i = 0; i < len; i++) {
    	var the_advance_balance=!json.rows[i]['advance_balance']?"0":json.rows[i]['advance_balance'];
        data.value.push({
        	"c_id": json.rows[i]['c_id'],
        	"c_department":json.rows[i]['custom_id']+"_"+json.rows[i]['c_department'],
        	"c_department_advance_balance":json.rows[i]['custom_id']+"_"+json.rows[i]['c_department']+"_"+the_advance_balance
        });
    }
    return data;
}

//货源自动补全--图书，供应商
function initialize_bsSuggest_factory(context){
	initialize_bsSuggest($("input[name='f_id']"),context+"/basic/getFactoryListSearch?f_type=0&keyword=","f_department","f_id",{f_id: "货源编号",f_department:"货源名称_户号"},["f_id","f_department"],false,bsSuggest_data_process_factory,null);
	 $("input[name='f_id']")
	    .on('onSetSelectValue', function (e, keyword) {
	        $("input[name='f_name']").val(keyword['id']);
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='f_name']").val('');
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='f_name']").val('');
		  }
	  });
}

//货源自动补全-图书，集货商+供应商
function initialize_bsSuggest_all_factory(context){
	initialize_bsSuggest($("input[name='f_id']"),context+"/basic/getAllFactoryListSearch?f_type=0&keyword=","f_department","f_id",{f_id: "货源编号",f_department:"货源名称_户号"},["f_id","f_department"],false,bsSuggest_data_process_factory,null);
	 $("input[name='f_id']")
	    .on('onSetSelectValue', function (e, keyword) {
	        $("input[name='f_name']").val(keyword['id']);
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='f_name']").val('');
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='f_name']").val('');
		  }
	  });
}

//货源自动补全-图书+数据库，集货商+供应商
function initialize_bsSuggest_all_type_factory(context){
	initialize_bsSuggest($("input[name='f_id']"),context+"/basic/getAllFactoryListSearch?&keyword=","f_department","f_id",{f_id: "货源编号",f_department:"货源名称_户号"},["f_id","f_department"],false,bsSuggest_data_process_factory,null);
	 $("input[name='f_id']")
	    .on('onSetSelectValue', function (e, keyword) {
	        $("input[name='f_name']").val(keyword['id']);
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='f_name']").val('');
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='f_name']").val('');
		  }
	  });
}

//货源自动补全-图书+数据库，集货商+供应商, 另外加入条件是否需要冲销
function initialize_bsSuggest_all_type_factory_against(context, is_need_against){
	initialize_bsSuggest($("input[name='f_id']"),context+"/basic/getAllFactoryListSearch?is_need_against=" + is_need_against + "&keyword=","f_department","f_id",{f_id: "货源编号",f_department:"货源名称_户号"},["f_id","f_department"],false,bsSuggest_data_process_factory,null);
	 $("input[name='f_id']")
	    .on('onSetSelectValue', function (e, keyword) {
	        $("input[name='f_name']").val(keyword['id']);
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='f_name']").val('');
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='f_name']").val('');
		  }
	  });
}

//集货商自动补全--基础数据
function initialize_bsSuggest_sfactory_basic(context){
	initialize_bsSuggest($("input[name='f_id_belong']"),context+"/basic/getSFactoryListSearch?keyword=","f_department","f_id",{f_id: "集货商编号",f_department:"集货商名称_户号"},["f_id","f_department"],false,bsSuggest_data_process_factory2,null);
	$("input[name='f_id_belong']")
    .on('onSetSelectValue', function (e, keyword) {
        $("input[name='sf_name']").val(keyword['id']);
  }).on('onUnsetSelectValue', function (e) {
	  $("input[name='sf_name']").val('');
  }).on('keyup',function(){
	  if($(this).val()==""){
		  $("input[name='sf_name']").val('');
	  }
  });
}

//益华货源自动补全
function initialize_bsSuggest_yh_factory(context){
	initialize_bsSuggest($("input[name='f_id']"),context+"/basic/getYHFactoryListSearch?&keyword=","f_department","f_id",{f_id: "货源编号",f_department:"货源名称_户号"},["f_id","f_department"],false,bsSuggest_data_process_factory,null);
	 $("input[name='f_id']")
	    .on('onSetSelectValue', function (e, keyword) {
	        $("input[name='f_name']").val(keyword['id']);
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='f_name']").val('');
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='f_name']").val('');
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

//集货商数据处理
function bsSuggest_data_process_factory2(json) { // 集货商
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

//客户带代理余额
function initialize_bsSuggest_client_agent_balance(context){
	initialize_bsSuggest($("input[name='agent_c_id']"),context+"/basic/getClientListSearch?keyword=","c_department_advance_balance","c_id",{c_id: "客户编号",c_department:"户号_客户名称",c_department_style_contact:"户号_客户名称_代理余额"},["c_id","c_department"],false,bsSuggest_data_process_client_agent_balance,null);
	$("input[name='agent_c_id']")
    	.on('onSetSelectValue', function (e, keyword) {
    		var c_info=keyword['id'];  
    		var agent_balance=c_info.substring(c_info.lastIndexOf("_")+1,c_info.length);
    		c_info=c_info.substring(0,c_info.lastIndexOf("_"));
    		$("input[name='agent_balance']").val(agent_balance);
	    	var c_name=c_info;
	        $("input[name='c_name']").val(c_name);
	        
	  }).on('onUnsetSelectValue', function (e) {
		  $("input[name='c_name']").val('');
		  $("input[name='agent_balance']").val('');
	  }).on('keyup',function(){
		  if($(this).val()==""){
			  $("input[name='c_name']").val('');
			  $("input[name='agent_balance']").val('');
		  }
	  });
}

//客户带代理余额- 数据处理 
function bsSuggest_data_process_client_agent_balance(json) { // 客户带核价模式
    var i, len, data = {
        value: []
    };
    if (!json || !json.rows || json.rows.length == 0) {
        return false;
    }
    len = json.rows.length;

    for (i = 0; i < len; i++) {
    	var the_advance_balance=!json.rows[i]['agent_balance']?"0":json.rows[i]['agent_balance'];
        data.value.push({
        	"c_id": json.rows[i]['c_id'],
        	"c_department":json.rows[i]['custom_id']+"_"+json.rows[i]['c_department'],
        	"c_department_advance_balance":json.rows[i]['custom_id']+"_"+json.rows[i]['c_department']+"_"+the_advance_balance
        });
    }
    return data;
}

// 代理客户
function initialize_bsSuggest_agent_client(context){
	initialize_bsSuggest($("input[name='agent_c_id']"),context+"/basic/getClientListSearch?keyword=","c_department","c_id",{c_id: "客户编号",c_department:"户号_客户名称"},["c_id","c_department"],false,bsSuggest_data_process_client,null);
	$("input[name='agent_c_id']")
    .on('onSetSelectValue', function (e, keyword) {
        $("input[name='c_name']").val(keyword['id']);
  }).on('onUnsetSelectValue', function (e) {
	  $("input[name='c_name']").val('');
  }).on('keyup',function(){
	  if($(this).val()==""){
		  $("input[name='c_name']").val('');
	  }
  });
}

// 货源银行账号自动补全
function initialize_bsSuggest_f_bank(context,f_id){
	initialize_bsSuggest($("input[name='f_bank_name']"),context+"/basic/getFBankListSearch","bank_id","f_bank_name",{bank_id:"银行内码",f_bank:"开户银行",f_account:"银行账号"},["f_bank","f_account"],true,bsSuggest_data_process_f_bank,ajaxparam_f_band);
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

//客户银行账号自动补全
function initialize_bsSuggest_c_bank(context,c_id){
	initialize_bsSuggest($("input[name='f_bank_name']"),context+"/basic/getFBankListSearch","bank_id","f_bank_name",{bank_id:"银行内码",f_bank:"开户银行",f_account:"银行账号"},["f_bank","f_account"],true,bsSuggest_data_process_f_bank,ajaxparam_c_band);
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

//客户银行账号发送请求-数据补充
function ajaxparam_c_band(keyword, opts) {
	//调整 ajax 请求参数方法，用于更多的请求配置需求。如对请求关键字作进一步处理、修改超时时间等
	var input_c_id= $("input[name='c_id']").val();
	if(input_c_id=="") input_c_id="kh";
    return {
        timeout: 10000,
        data: {
        	keyword:keyword,
            f_id: input_c_id
        }
    };
}

//客户里面的推广类型字典项目
function initialize_bsSuggest_c_level(context){
  initialize_bsSuggest($("input[name='c_level_name']"),context+"/basic/getClientCLevelListSearch?keyword=","code","name",{code: "编号",name:"名称"},["code","name"],true,bsSuggest_data_process_c_level,null);
  $("input[name='c_level_name']")
    .on('onSetSelectValue', function (e, keyword) {
        $("input[name='c_level']").val(keyword['id']);
  }).on('onUnsetSelectValue', function (e) {
	  $("input[name='c_level']").val('');
  }).on('keyup',function(){
	  if($(this).val()==""){
		  $("input[name='c_level']").val('');
	  }
  });
}

//搜索自动补全处理数据方法
//客户数据处理
function bsSuggest_data_process_c_level(json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
  var i, len, data = {
      value: []
  };

  if (!json || !json.rows || json.rows.length == 0) {
      return false;
  }
  len = json.rows.length;

  for (i = 0; i < len; i++) {
      data.value.push({
      	"code": json.rows[i]['code'],
      	//"name":json.rows[i]['custom_id']+"_"+json.rows[i]['c_department'],
      	"name":json.rows[i]['name']
      });
  }
  return data;
}

// 益华货源查询 id和name传入模式
function initialize_bsSuggest_yh_factory_by_input(context, input_name, input_id, station_id){
	initialize_bsSuggest($("input[name='"+input_id+"']"),context+"/basic/getYhFactoryListSearch?station_id=" + station_id + "&keyword=","f_department","f_id",{f_id: "货源编号",f_department:"货源名称"},["f_id","f_department"],false,bsSuggest_data_process_yh_factory,null);
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

// 益华货源数据处理
function bsSuggest_data_process_yh_factory(json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
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
        	"f_department":json.rows[i]['f_department']
        });
    }
    return data;
}
