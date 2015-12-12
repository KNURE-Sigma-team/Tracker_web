package com.wimk.sqljobs;

import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextClosedEvent;

public class ContextClosedListener implements ApplicationListener<ContextClosedEvent> {

	public ContextClosedListener(){
		super();
	}
	
	public void onApplicationEvent(ContextClosedEvent event) {
		SqlJobManager.shutdownJobs();
	}

}
