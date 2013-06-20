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
package com.baker.social.twitter;

public class MessageForm {
	
	/**
	 * @uml.property  name="to"
	 */
	private String to;
	
	/**
	 * @uml.property  name="text"
	 */
	private String text;

	/**
	 * @return
	 * @uml.property  name="to"
	 */
	public String getTo() {
		return to;
	}

	/**
	 * @param to
	 * @uml.property  name="to"
	 */
	public void setTo(String to) {
		this.to = to;
	}

	/**
	 * @return
	 * @uml.property  name="text"
	 */
	public String getText() {
		return text;
	}

	/**
	 * @param text
	 * @uml.property  name="text"
	 */
	public void setText(String text) {
		this.text = text;
	}
	
	
}
