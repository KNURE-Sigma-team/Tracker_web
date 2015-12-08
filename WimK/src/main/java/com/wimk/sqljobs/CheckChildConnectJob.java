package com.wimk.sqljobs;

import java.util.List;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.wimk.config.DataConfig;
import com.wimk.entity.Child;
import com.wimk.service.ChildService;
import com.wimk.utils.EmailSender;

public class CheckChildConnectJob implements Job{
	
	public void execute(JobExecutionContext context) throws JobExecutionException {
		AnnotationConfigApplicationContext appContext = new AnnotationConfigApplicationContext(DataConfig.class);
		ChildService childService = appContext.getBean(ChildService.class);
		List<Child> childList = childService.getUnconnectedChild();
		for(Child c : childList){
			EmailSender.sendDropChildConnection(c.getParent().getLogin(), c.getLogin());
		}
		appContext.close();
	} 
	
}

