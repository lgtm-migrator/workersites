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

public class Account {

	private final String email;

	private final String password;

	private final String fname;
	
	private final String gender;
	
	private final String maidenname;

	private final String lname;

	public Account(String email, String password, String fname, String lname, String gender, String maidenname) {
		this.email = email;
		this.password = password;
		this.fname = fname;
		this.lname = lname;
		this.gender = gender;
		this.maidenname = maidenname;
	}

	public String getGender() {
		return gender;
	}

	public String getPassword() {
		return password;
	}

	public String getFirstName() {
		return fname;
	}

	public String getLastName() {
		return lname;
	}

	public String getMaidenName() {
		return maidenname;
	}

	public String getEmail() {
		return email;
	}

	
}
