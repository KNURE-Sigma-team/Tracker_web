package com.wimk.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "Parent")
public class Parent implements Serializable {
	private static final long serialVersionUID = -5527566248002296042L;

	@Id
	@Column(name = "idParent")
	@GeneratedValue(generator= "increment")
	@GenericGenerator(name= "increment", strategy= "increment")
	private Integer id;

	@Column(name = "name")
	private String name;

	@Column(name = "login")
	private String login;

	@Column(name = "password")
	private String password;
	
	@Column(name = "removingFrequency", columnDefinition = "int(11) default 7")
	private Integer removingFrequency;
	
	@Column(name = "hash")
	private String hash;
	
	@Column(name = "activated")
	private Boolean activated;

	public Integer getIdParent() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Integer getRemovingFrequency() {
		return removingFrequency;
	}

	public void setRemovingFrequency(int removingFrequency) {
		this.removingFrequency = removingFrequency;
	}
	
	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}

	public Boolean getActivated() {
		return activated;
	}

	public void setActivated(Boolean activated) {
		this.activated = activated;
	}

}
