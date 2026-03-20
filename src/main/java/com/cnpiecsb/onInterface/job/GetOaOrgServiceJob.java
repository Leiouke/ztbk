package com.cnpiecsb.onInterface.job;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.cnpiecsb.onInterface.service.GetOaMemberCode;
import com.cnpiecsb.onInterface.service.GetOaOrgService;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * 发货飞单发送相关作业
 * 
 * @author user
 *
 */
public class GetOaOrgServiceJob extends QuartzJobBean {
	private static Logger logger = LogManager.getLogger(GetOaOrgServiceJob.class.getName());
	
	private GetOaMemberCode getOaMemberCode;
	
	@Override
	protected void executeInternal(JobExecutionContext arg0){
		int sendCount = 0;
		try {
			getOaMemberCode.getOaMemberCode();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void setGetOaMemberCode(GetOaMemberCode getOaMemberCode) {
		this.getOaMemberCode = getOaMemberCode;
	}
}
