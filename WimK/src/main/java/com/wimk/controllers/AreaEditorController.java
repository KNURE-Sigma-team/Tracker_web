package com.wimk.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wimk.entity.Area;
import com.wimk.entity.Child;
import com.wimk.entity.Parent;
import com.wimk.service.AreaService;
import com.wimk.service.ChildService;
import com.wimk.service.ParentService;

@Controller
@RequestMapping(value = "/area_editor")
public class AreaEditorController {
	
	@Autowired
	ChildService childService;

	@Autowired
	ParentService parentService;
	
	@Autowired
	AreaService areaService;
	
	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody String areaEditor(HttpServletRequest request, HttpServletResponse response) {
		String status = request.getParameter("status");
		
		if(status.equals("removed")){
			String id = request.getParameter("area_id");
			if(id != null){
				areaService.delete(Integer.parseInt(id));
			}
		} else if(status.equals("new")){
			addArea(request);
		} else if(status.equals("changed")){
			changeArea(request);
		}
		
		return "OK";
	}
	
	private void addArea(HttpServletRequest request){
		Child currentChild = getChild(request);
		if(currentChild != null){
			String x = request.getParameter("latitude");
			String y = request.getParameter("longitude");
			String radius = request.getParameter("radius");
			String allowed = request.getParameter("allowed");
			String name = request.getParameter("name");
			
			Area area = new Area();
			area.setChild(currentChild);
			area.setX(Double.parseDouble(x));
			area.setY(Double.parseDouble(y));
			area.setRadius(Double.parseDouble(radius));
			area.setAllowed(Boolean.parseBoolean(allowed));
			area.setName(name);
			areaService.addArea(area);
		}
	}
	
	private void changeArea(HttpServletRequest request){
		Child currentChild = getChild(request);
		if(currentChild != null){
			String areaId = request.getParameter("area_id");
			String x = request.getParameter("latitude");
			String y = request.getParameter("longitude");
			String radius = request.getParameter("radius");
			String allowed = request.getParameter("allowed");
			String name = request.getParameter("name");
			
			Area area = new Area();
			area.setId(Integer.parseInt(areaId));
			area.setChild(currentChild);
			area.setX(Double.parseDouble(x));
			area.setY(Double.parseDouble(y));
			area.setRadius(Double.parseDouble(radius));
			area.setAllowed(Boolean.parseBoolean(allowed));
			area.setName(name);
			areaService.editArea(area);
		}
	}
	
	private Child getChild(HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Parent parent = parentService.getByLogin(login);
		List<Child> listOfChild = childService.getChildOfParent(parent);

		Child currentChild = null;
		if (request.getParameter("child") != null) {
			for (Child c : listOfChild) {
				if (c.getLogin().equals(request.getParameter("child").toString())) {
					currentChild = c;
					break;
				}
			}
		}
		return currentChild;
	}
}