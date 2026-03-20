package com.cnpiecsb.bd.util;

public class InvoiceUtil {
  private String paramNames_offset[];
  private String spName_offset;
  
  public InvoiceUtil(){	  
	  paramNames_offset=new String[]{"inv_id","o_id_offset","guid","ItemExclusiveCode"};
	  spName_offset="n_np_invoice_dh_offset";
  }

public String[] getParamNames_offset() {
	return paramNames_offset;
}

public void setParamNames_offset(String[] paramNames_offset) {
	this.paramNames_offset = paramNames_offset;
}

public String getSpName_offset() {
	return spName_offset;
}

public void setSpName_offset(String spName_offset) {
	this.spName_offset = spName_offset;
}



}
