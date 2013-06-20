package com.baker.util.validator;

import org.springframework.core.convert.converter.Converter;

@SuppressWarnings("rawtypes")
final class StringToEnumConverter implements Converter<String, Enum> {

	/**
	 * @uml.property  name="enumType"
	 */
	private Class<Enum> enumType;

	/**
	 * @return the enumType
	 */
	public Class<Enum> getEnumType() {
		return enumType;
	}



	/**
	 * @param enumType the enumType to set
	 */
	public void setEnumType(Class<Enum> enumType) {
		this.enumType = enumType;
	}
	
	

	@SuppressWarnings("unchecked")
	public Enum<?> convert(String source) {
		return Enum.valueOf(this.enumType, source.trim());
	}
}
	    
