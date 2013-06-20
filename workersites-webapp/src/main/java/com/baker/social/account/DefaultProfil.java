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
package com.baker.social.account;


public class DefaultProfil implements Profil {

	/**
	 * @uml.property  name="email"
	 */
	private final String email;

	/**
	 * @uml.property  name="password"
	 */
	private final String password;

	/**
	 * @uml.property  name="firstName"
	 */
	private final String firstName;
	
	/**
	 * @uml.property  name="gender"
	 */
	private final String gender;
	
	/**
	 * @uml.property  name="maidenname"
	 */
	private final String maidenname;

	/**
	 * @uml.property  name="lastName"
	 */
	private final String lastName;

	public DefaultProfil(String email, String password, String firstName, String lastName, String gender, String maidenname) {
		this.email = email;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.gender = gender;
		this.maidenname = maidenname;
	}

	/**
	 * @return
	 * @uml.property  name="gender"
	 */
	public String getGender() {
		return gender;
	}

	/**
	 * @return
	 * @uml.property  name="password"
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @return
	 * @uml.property  name="firstName"
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @return
	 * @uml.property  name="lastName"
	 */
	public String getLastName() {
		return lastName;
	}

	public String getMaidenName() {
		return maidenname;
	}

	/**
	 * @return
	 * @uml.property  name="email"
	 */
	public String getEmail() {
		return email;
	}

	

	
}
