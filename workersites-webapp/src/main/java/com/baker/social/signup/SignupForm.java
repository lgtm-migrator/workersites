/*
 * Copyright 2013 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.baker.social.signup;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.social.connect.UserProfile;

@Entity
public class SignupForm implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4913140439393414722L;

	@NotEmpty
	private String email;

	@Size(min = 8, message = "must be at least 8 characters")
	private String password;

	@NotEmpty
	private String fname;
	
	@NotEmpty
	private String gender;

	private String maidenname;

	@NotEmpty
	private String lname;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return fname;
	}

	public void setFirstName(String fname) {
		this.fname = fname;
	}

	public String getLastName() {
		return fname;
	}

	public void setLastName(String fname) {
		this.fname = fname;
	}

	public static SignupForm fromProviderUser(UserProfile providerUser) {
		SignupForm form = new SignupForm();
		form.setFirstName(providerUser.getFirstName());
		form.setLastName(providerUser.getLastName());
		form.setEmail(providerUser.getEmail());
		return form;
	}

	public String getMaidenname() {
		return maidenname;
	}

	public void setMaidenname(String maidenname) {
		this.maidenname = maidenname;
	}
}
