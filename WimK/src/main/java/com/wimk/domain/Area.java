package com.wimk.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Area")
public class Area implements Serializable {

	private static final long serialVersionUID = -5517566248012236042L;

	@Id
	@Column(name = "idArea")
	@GeneratedValue
	private Integer id;

	@Column(name = "idChild")
	private Integer idChild;

	@Column(name = "x")
	private Integer x;

	@Column(name = "y")
	private Integer y;

	@Column(name = "radius")
	private Integer radius;

	@Column(name = "allowed")
	private Boolean allowed;

	public Integer getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getIdChild() {
		return idChild;
	}

	public void setIdChild(Integer idChild) {
		this.idChild = idChild;
	}

	public Integer getX() {
		return x;
	}

	public void setX(Integer x) {
		this.x = x;
	}

	public Integer getY() {
		return y;
	}

	public void setY(Integer y) {
		this.y = y;
	}

	public Integer getRadius() {
		return radius;
	}

	public void setRadius(Integer radius) {
		this.radius = radius;
	}

	public Boolean getAllowed() {
		return allowed;
	}

	public void setAllowed(Boolean allowed) {
		this.allowed = allowed;
	}
}
