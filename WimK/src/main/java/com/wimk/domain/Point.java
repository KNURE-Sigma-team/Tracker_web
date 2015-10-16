package com.wimk.domain;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Point")
public class Point implements Serializable {

	private static final long serialVersionUID = -5517566248012296042L;

	@Id
	@Column(name = "idPoint")
	@GeneratedValue
	private Integer id;

	@Column(name = "idChild")
	private Integer idChild;

	@Column(name = "x")
	private Integer x;

	@Column(name = "y")
	private Integer y;

	@Column(name = "time")
	private LocalDateTime time;

	@Column(name = "batteryStatus")
	private Integer batteryStatus;

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

	public LocalDateTime getTime() {
		return time;
	}

	public void setTime(LocalDateTime time) {
		this.time = time;
	}

	public Integer getBatteryStatus() {
		return batteryStatus;
	}

	public void setBatteryStatus(Integer batteryStatus) {
		this.batteryStatus = batteryStatus;
	}
}
