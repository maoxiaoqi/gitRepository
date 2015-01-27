package com.mvc.task;

import org.apache.log4j.Logger;

import com.mvc.service.QueryService;

public class EventWorkTask {
	public static Logger log = Logger.getLogger(EventWorkTask.class);
	 
	public void excute(){
		try {
			log.info("处理任务开始>........");
			QueryService service = new QueryService() ;
			service.updateEventStatusWithR();
			service.updateEventStatusWithA();
			log.info("处理任务结束!");
		} catch (Exception e) {
			log.error("处理任务出现异常", e);
		}
		
	}
}
