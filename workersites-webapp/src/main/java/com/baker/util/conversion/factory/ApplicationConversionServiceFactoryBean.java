package com.baker.util.conversion.factory;

import java.text.ParseException;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

import javax.annotation.PostConstruct;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;

public class ApplicationConversionServiceFactoryBean extends FormattingConversionServiceFactoryBean {

	/**
	 * @uml.property  name="logger"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
	final Logger logger = LoggerFactory.getLogger(ApplicationConversionServiceFactoryBean.class);

	
	private static final String DEFAULT_DATE_PATTERN = "dd-MM-yyyy";

	/**
	 * @uml.property  name="dateFormat"
	 * @uml.associationEnd  
	 */
	private DateTimeFormatter dateFormat;

	/**
	 * @uml.property  name="datePattern"
	 */
	private String datePattern = DEFAULT_DATE_PATTERN;

	/**
	 * @uml.property  name="formatters"
	 * @uml.associationEnd  multiplicity="(0 -1)" elementType="org.springframework.format.Formatter"
	 */
	private Set<Formatter<?>> formatters = new HashSet<Formatter<?>>();

	/**
	 * @return
	 * @uml.property  name="datePattern"
	 */
	public String getDatePattern() {
		return datePattern;
	}

	/**
	 * @param datePattern
	 * @uml.property  name="datePattern"
	 */
	@Autowired(required=false)
	public void setDatePattern(String datePattern) {
		this.datePattern = datePattern;
	}

	@PostConstruct
	public void init() {
		dateFormat = DateTimeFormat.forPattern(datePattern);
		formatters.add(getDateTimeFormatter());
		setFormatters(formatters);
	}

	public Formatter<DateTime> getDateTimeFormatter() {
		return new Formatter<DateTime>() {
			public DateTime parse(String dateTimeString, Locale locale) throws ParseException {
				logger.info("Parsing date string: " + dateTimeString);
				return dateFormat.parseDateTime(dateTimeString);
			}
			public String print(DateTime dateTime, Locale locale) {
				logger.info("Formatting datetime: " + dateTime);
				return dateFormat.print(dateTime);
			}
		};
	}





}
