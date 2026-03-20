package com.cnpiecsb.csu.util;

public class CommonSpUtil {
  
  private String paramNames_approval_operate[] ;
  private String spName_approval_operate;
  
  
  public CommonSpUtil(){	  
	  paramNames_approval_operate=new String[]{"job_no","account","bill_code","flow_id","audit_status","audit_memo","to_org_code"};	  
	  spName_approval_operate="u_process_approval_operate";

  }


public String[] getParamNames_approval_operate() {
	return paramNames_approval_operate;
}


public String getSpName_approval_operate() {
	return spName_approval_operate;
}
  
}
