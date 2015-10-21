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
@Table(name = "Child")
public class Child implements Serializable{
	
	private static final long serialVersionUID = -5527566248002296042L;
	
	@Id
	@Column(name = "idChild")
	@GeneratedValue(generator= "increment")
	@GenericGenerator(name= "increment", strategy= "increment")
	private Integer id;
	
	@ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "idParent", nullable = false)
	private Parent parent;
	
	@Column(name = "login")
	private String login;

	@Column(name = "password")
	private String password;

	@Column(name = "sendingFrequency")
	private Integer sendingFrequency;
	
	public Integer getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Parent getParent() {
		return parent;
	}

	public void setParent(Parent parent) {
		this.parent = parent;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public Integer getSendingFrequency() {
		return sendingFrequency;
	}

	public void setSendingFrequency(int sendingFrequency) {
		this.sendingFrequency = sendingFrequency;
	}
	
}
