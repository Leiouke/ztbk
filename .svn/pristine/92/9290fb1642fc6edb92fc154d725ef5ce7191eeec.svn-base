package com.cnpiecsb.messageIntergration.job;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.cnpiecsb.messageIntergration.service.PushItomsMsgToOaService;

/**
 * Oa消息集成
 * 
 * @author user
 *
 */
public class OaMsgJob extends QuartzJobBean {

	private PushItomsMsgToOaService pushItomsMsgToOaService;
	
	@Override
	protected void executeInternal(JobExecutionContext arg0){
		pushItomsMsgToOaService.pushMessage();
	}

	public void setPushItomsMsgToOaService(PushItomsMsgToOaService pushItomsMsgToOaService) {
		this.pushItomsMsgToOaService = pushItomsMsgToOaService;
	}
}
