package com.wimk.sqljobs;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class SqlJobManager {
	
	private SqlJobManager(){
	}
	
	private static final Object SYNCHRONER = new Object();
	private static boolean activated = false;

	private static Scheduler schedulerClearPoints;
	private static Scheduler schedulerCheckChildConnect;

	private static final int MINUTES_TO_CHECK_CHILD_CONNECTION = 5;

	public static void startJobs() {
		synchronized (SYNCHRONER) {
			if (!activated) {
				try {
					JobDetail clearPointsJobDetail = JobBuilder.newJob(ClearPointsJob.class).build();
					Trigger triggerClearPointsJob = TriggerBuilder.newTrigger()
							.withSchedule(CronScheduleBuilder.dailyAtHourAndMinute(0, 0)).build();
					schedulerClearPoints = new StdSchedulerFactory().getScheduler();
					schedulerClearPoints.scheduleJob(clearPointsJobDetail, triggerClearPointsJob);
					schedulerClearPoints.start();

					JobDetail checkChildConnectJobDetail = JobBuilder.newJob(CheckChildConnectJob.class).build();
					Trigger triggerCheckChildConnectJob = TriggerBuilder.newTrigger().withSchedule(SimpleScheduleBuilder
							.simpleSchedule().withIntervalInMinutes(MINUTES_TO_CHECK_CHILD_CONNECTION).repeatForever())
							.build();
					schedulerCheckChildConnect = new StdSchedulerFactory().getScheduler();
					schedulerCheckChildConnect.scheduleJob(checkChildConnectJobDetail, triggerCheckChildConnectJob);
					schedulerCheckChildConnect.start();
					
					activated = true;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	public static void shutdownJobs() {
		synchronized (SYNCHRONER) {
			if (activated && schedulerClearPoints != null && schedulerCheckChildConnect != null) {
				try {
					schedulerClearPoints.shutdown();
					schedulerCheckChildConnect.shutdown();
				} catch (SchedulerException e) {
					e.printStackTrace();
				}
				activated = false;
			}
		}
	}

}
