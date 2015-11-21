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
		switch (request.getParameter("status")) {
			case "new":
				addArea(request);
				break;
			case "changed":
				changeArea(request);
				break;
			case "removed":
				String id = request.getParameter("area_id");
				if(id != null){
					areaService.delete(Integer.parseInt(id));
				}
				break;
		}
		return "OK";
	}
	
	private void addArea(HttpServletRequest request){
		Child currentChild = getChild(request);
		if(currentChild != null){
			Area area = setArea(request, currentChild);
			areaService.addArea(area);
		}
	}
	
	private Area setArea(HttpServletRequest request, Child currentChild) {
		Double x = Double.parseDouble(request.getParameter("latitude"));
		Double y = Double.parseDouble(request.getParameter("longitude"));
		Double radius = Double.parseDouble(request.getParameter("radius"));
		Boolean allowed = Boolean.parseBoolean(request.getParameter("allowed"));
		String name = request.getParameter("name");
		Area area = new Area(currentChild, x, y, radius, allowed, name);
		return area;
	}
	
	private void changeArea(HttpServletRequest request){
		Child currentChild = getChild(request);
		if(currentChild != null){
			Area area = setArea(request, currentChild);
			Integer areaId = Integer.parseInt(request.getParameter("area_id"));
			area.setId(areaId);
			areaService.editArea(area);
		}
	}
	
	private Child getChild(HttpServletRequest request){
		if (request.getParameter("child") == null) {
			return null;
		}
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Parent parent = parentService.getByLogin(login);
		List<Child> listOfChild = childService.getChildOfParent(parent);
			for (Child c : listOfChild) {
				if (c.getLogin().equals(request.getParameter("child").toString())) {
					return c;
				}
			}
		return null;
	}
}