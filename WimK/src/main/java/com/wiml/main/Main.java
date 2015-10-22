package com.wiml.main;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.wimk.config.DataConfig;
import com.wimk.entity.Parent;
import com.wimk.service.ParentService;

public class Main {

	public static void main(String[] args) {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DataConfig.class);
		ParentService ps = context.getBean(ParentService.class);
		Parent p = ps.getByLogin("Albert1");
		System.out.println(p==null);
		context.close();
	}
}
