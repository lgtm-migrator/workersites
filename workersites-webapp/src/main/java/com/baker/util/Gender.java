package com.baker.util;

public enum Gender {

	Male("Male"),
	Female("Female");
	
	private String description;
	
	private Gender(String description) {
		this.description = description;
	}
	
	public String getValue() {
		return name();
	}
	
	public void setValue(String value){}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
}
