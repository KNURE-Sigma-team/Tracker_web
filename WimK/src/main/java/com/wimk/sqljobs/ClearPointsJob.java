package com.wimk.sqljobs;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.wimk.config.DataConfig;
import com.wimk.service.PointService;

public class ClearPointsJob implements Job{
		
	public void execute(JobExecutionContext context) throws JobExecutionException {
		AnnotationConfigApplicationContext appContext = new AnnotationConfigApplicationContext(DataConfig.class);
		PointService ps = appContext.getBean(PointService.class);
		ps.clearingPoints();
		appContext.close();
	} 
	
}
