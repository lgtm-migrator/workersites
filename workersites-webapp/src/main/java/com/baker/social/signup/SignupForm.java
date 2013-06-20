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

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.social.connect.UserProfile;



public class SignupForm {


	/**
	 * @uml.property  name="email"
	 */
	@NotEmpty
	private String email;

	/**
	 * @uml.property  name="password"
	 */
	@Size(min = 8, message = "must be at least 8 characters")
	private String password;
	
	/**
	 * @uml.property  name="conpassword"
	 */
	@Size(min = 8, message = "must be at least 8 characters")
	private String conpassword;

	/**
	 * @uml.property  name="firstName"
	 */
	@NotEmpty
	private String firstName;
	
	/**
	 * @uml.property  name="gender"
	 * @uml.associationEnd  
	 */
	@NotEmpty
	@Enumerated(EnumType.STRING)
	private Gender gender;

	/**
	 * @uml.property  name="maidenname"
	 */
	private String maidenname;

	/**
	 * @uml.property  name="lastName"
	 */
	@NotEmpty
	private String lastName;

	/**
	 * @return
	 * @uml.property  name="email"
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 * @uml.property  name="email"
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return
	 * @uml.property  name="gender"
	 */
	public Gender getGender() {
		return gender;
	}

	/**
	 * @param gender
	 * @uml.property  name="gender"
	 */
	public void setGender(Gender gender) {
		this.gender = gender;
	}

	/**
	 * @return
	 * @uml.property  name="password"
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 * @uml.property  name="password"
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return  the conpassword
	 * @uml.property  name="conpassword"
	 */
	public String getConpassword() {
		return conpassword;
	}

	/**
	 * @param conpassword  the conpassword to set
	 * @uml.property  name="conpassword"
	 */
	public void setConpassword(String conpassword) {
		this.conpassword = conpassword;
	}
	
	public static SignupForm fromProviderUser(UserProfile providerUser) {
		SignupForm form = new SignupForm();
		form.setFirstName(providerUser.getFirstName());
		form.setLastName(providerUser.getLastName());
		form.setEmail(providerUser.getEmail());
		return form;
	}

	/**
	 * @return  the firstName
	 * @uml.property  name="firstName"
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param firstName  the firstName to set
	 * @uml.property  name="firstName"
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @return  the lastName
	 * @uml.property  name="lastName"
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName  the lastName to set
	 * @uml.property  name="lastName"
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * @return
	 * @uml.property  name="maidenname"
	 */
	public String getMaidenname() {
		return maidenname;
	}

	/**
	 * @param maidenname
	 * @uml.property  name="maidenname"
	 */
	public void setMaidenname(String maidenname) {
		this.maidenname = maidenname;
	}
}
