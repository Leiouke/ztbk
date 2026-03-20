//报刊供应商信息补全
function initialize_bsSuggest_bk_factory(context, input_name, input_id){
	initialize_bsSuggest($("input[name='"+input_id+"']"),context+"/bk/basic/getFactoryAutoSearch?keyword=","f_department","f_id",{f_id: "客户编号",f_department:"户号_客户名称"},["f_id","f_department"],false,bsSuggest_data_process_bk_factory,null);
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

//供应商处理
function bsSuggest_data_process_bk_factory(json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
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
	    	"f_department":json.rows[i]['custom_id']+"_"+json.rows[i]['f_department'],
	    });
	}
	return data;
}

//含有权限的客户信息自动补全, 客户 id和name传入模式
function initialize_bsSuggest_bk_client(context, input_name, input_id){
	initialize_bsSuggest($("input[name='"+input_id+"']"),context+"/bk/basic/getClientAutoSearch?keyword=","c_department","c_id",{c_id: "客户编号",c_department:"户号_客户名称"},["c_id","c_department"],false,bsSuggest_data_process_bk_client,null);
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
function bsSuggest_data_process_bk_client(json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
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