package com.wimk.entity;

import java.io.Serializable;
import java.util.Date;

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
@Table(name = "Point")
public class Point implements Serializable {

	private static final long serialVersionUID = -5517566248012296042L;

	@Id
	@Column(name = "idPoint")
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

	@Column(name = "time")
	private Date time;

	@Column(name = "batteryStatus")
	private Integer batteryStatus;
	
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idType")
	private PointType pointType;
	
	public Point(){
	}
	
	public Point(Child child, Double x, Double y, Date time, Integer batteryStatus, PointType pointType) {
		this.child = child;
		this.x = x;
		this.y = y;
		this.time = time;
		this.batteryStatus = batteryStatus;
		this.pointType = pointType;
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

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Integer getBatteryStatus() {
		return batteryStatus;
	}

	public void setBatteryStatus(Integer batteryStatus) {
		this.batteryStatus = batteryStatus;
	}
	
	public PointType getPointType() {
		return pointType;
	}

	public void setPointType(PointType pointType) {
		this.pointType = pointType;
	}
}
