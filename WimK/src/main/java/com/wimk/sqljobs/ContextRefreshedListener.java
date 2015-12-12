package com.wimk.sqljobs;

import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

public class ContextRefreshedListener implements ApplicationListener<ContextRefreshedEvent> {
	
	public ContextRefreshedListener(){
		super();
	}
	
	public void onApplicationEvent(ContextRefreshedEvent event) {
		SqlJobManager.startJobs();
	}
	
}
