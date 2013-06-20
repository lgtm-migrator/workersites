package com.baker.util.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.baker.social.signup.SignupForm;

@Component("signupFormValidator")
public class SignupFormValidator implements Validator {

	/**
	 * @uml.property  name="genderValidator"
	 * @uml.associationEnd  
	 */
	private GenderValidator genderValidator;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return SignupForm.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		SignupForm signupForm = (SignupForm)target;
		
		if (signupForm == null ) {			
			errors.rejectValue("signupForm", "signupForm.required", "SignupForm is missing");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "gender", "gender.required");
		
		// Validation du Genre
		try {
			ValidationUtils.invokeValidator(genderValidator, signupForm.getGender(), errors);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @return
	 * @uml.property  name="genderValidator"
	 */
	public GenderValidator getGenderValidator() {
		return genderValidator;
	}

	/**
	 * @param genderValidator
	 * @uml.property  name="genderValidator"
	 */
	public void setGenderValidator(GenderValidator genderValidator) {
		this.genderValidator = genderValidator;
	}

}
