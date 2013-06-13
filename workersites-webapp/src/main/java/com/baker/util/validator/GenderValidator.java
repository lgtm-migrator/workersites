package com.baker.util.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.baker.social.signup.Gender;
import com.baker.social.signup.SignupForm;

@Component("genderValidator")
public class GenderValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return SignupForm.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		SignupForm signupForm = (SignupForm)target;
		if (signupForm.getGender().equals(Gender.Male)   || signupForm.getGender().equals(Gender.Female) ) {			
			errors.rejectValue("gender", "gender.required", "Gender field is missing");
		}
		
	}

}
