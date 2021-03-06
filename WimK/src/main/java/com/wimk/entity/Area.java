package com.wimk.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "Area")
public class Area implements Serializable {

	private static final long serialVersionUID = -5517566248012236042L;

	@Id
	@Column(name = "idArea")
	@GeneratedValue(generator= "increment")
	@GenericGenerator(name= "increment", strategy= "increment")
	private Integer id;

	@ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "idChild", nullable = false)
	private Child child;

	@Column(name = "x")
	private Double x;

	@Column(name = "y")
	private Double y;

	@Column(name = "radius")
	private Double radius;

	@Column(name = "allowed")
	private Boolean allowed;
	
	@Column(name = "name")
	private String name;
	
	public Area(){
	}
	
	public Area(Child child, Double x, Double y, Double radius, Boolean allowed, String name) {
		this.child = child;
		this.x = x;
		this.y = y;
		this.radius = radius;
		this.allowed = allowed;
		this.name = name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Child getChild() {
		return child;
	}

	public void setChild(Child child) {
		this.child = child;
	}

	public Double getX() {
		return x;
	}

	public void setX(Double x) {
		this.x = x;
	}

	public Double getY() {
		return y;
	}

	public void setY(Double y) {
		this.y = y;
	}

	public Double getRadius() {
		return radius;
	}

	public void setRadius(Double radius) {
		this.radius = radius;
	}

	public Boolean getAllowed() {
		return allowed;
	}

	public void setAllowed(Boolean allowed) {
		this.allowed = allowed;
	}	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
