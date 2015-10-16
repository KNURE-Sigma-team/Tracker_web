package com.wimk.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Child")
public class Child implements Serializable{
	
	private static final long serialVersionUID = -5527566248012296042L;
	
	@Id
	@Column(name = "idChild")
	@GeneratedValue
	private Integer id;
	
	@Column(name = "idParent")
	private Integer idParent;
	
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

	public Integer getIdParent() {
		return idParent;
	}

	public void setIdParent(Integer idParent) {
		this.idParent = idParent;
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
