package com.wiml.main;

import java.util.Date;

public class Main {

	public static void main(String[] args) {
		/*AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DataConfig.class);
		ParentService ps = context.getBean(ParentService.class);
		ChildService cs = context.getBean(ChildService.class);
		Parent p = ps.getByLogin("alik");*/
		/*List<Child> l= cs.getChildOfParent(p);
		System.out.println(l.size());
		for(Child c: l){
		System.out.println(c.getLogin());
		}*/
		/*Child c = cs.getById(4);
		System.out.println(c.getLogin());
		context.close();*/
		Date d = new Date();
		System.out.println(d.toString());
	}
}
