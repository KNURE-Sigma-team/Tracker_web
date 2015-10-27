package com.wiml.main;

import java.util.Date;
import java.util.List;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.wimk.config.DataConfig;
import com.wimk.entity.Child;
import com.wimk.entity.Parent;
import com.wimk.service.ChildService;
import com.wimk.service.ParentService;

public class Main {

	public static void main(String[] args) {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DataConfig.class);
		ParentService ps = context.getBean(ParentService.class);
		ChildService cs = context.getBean(ChildService.class);
		Parent p = ps.getByLogin("alik");
		List<Child> l= cs.getChildOfParent(p);
		System.out.println(l.size());
		for(Child c: l){
		System.out.println(c.getLogin());
		}
		Child c = cs.getById(4);
		System.out.println(c.getLogin());
		context.close();
		Date d = new Date();
		System.out.println(d.toString());
	}
}
