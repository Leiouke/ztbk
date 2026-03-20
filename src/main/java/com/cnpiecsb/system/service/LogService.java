package com.cnpiecsb.system.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cnpiecsb.common.viewobject.Page;
import com.cnpiecsb.system.dao.LogDao;
import com.cnpiecsb.system.entity.Log;

@Service
public class LogService {
	@Autowired  // 怎么感觉跟@Resource没什么区别?注意，注入的bean不用写get/set对了
	private LogDao logDao;
    
    public void addLog(Log log){
        logDao.addLog(log);
    }
    
    public Page<Log> getLogList(Map map){
    	Page<Log> page = new Page<Log>();
    	page.setTotalCount(logDao.getLogsCount(map));
    	page.setDataList(logDao.getLogsByPage(map));
        return page;
    }
}
