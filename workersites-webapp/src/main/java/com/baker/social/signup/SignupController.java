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

import java.security.Principal;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.tiles.request.ApplicationContext;
import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.UserProfile;
import org.springframework.social.connect.web.ProviderSignInUtils;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.PagedList;
import org.springframework.social.facebook.api.impl.FacebookTemplate;

import com.baker.social.account.Account;
import com.baker.social.account.AccountRepository;
import com.baker.social.account.UsernameAlreadyInUseException;
import com.baker.social.message.Message;
import com.baker.social.message.MessageType;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.baker.social.signin.SignInUtils;
import com.baker.util.validator.SignupFormValidator;

@Controller
public class SignupController implements MessageSourceAware {

	private MessageSource messageSource;
	private final AccountRepository accountRepository;

	private Validator validator;
	
	@Inject
	public SignupController(AccountRepository accountRepository, Validator validator) {
		this.accountRepository = accountRepository;
		this.validator = validator;
	}
	
	@InitBinder
	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {
		//binder.registerCustomEditor(Gender.class, new GenderTypeEditor(Gender.class));
		//this.genderPropertyEditorRegistrar.registerCustomEditors(binder);
		binder.setValidator(new SignupFormValidator());
		
	}
	
	public Validator getValidator() {
		return validator;
	}

	
	
	/**
	 * @param validator the validator to set
	 */
	public void setValidator(Validator validator) {
		this.validator = validator;
	}

	@InitBinder("gender")
	protected void initGenderBinder(WebDataBinder binder) {
		
		binder.setValidator(new SignupFormValidator());

	}
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public ModelAndView signupForm(WebRequest request) {
		Connection<?> connection = ProviderSignInUtils.getConnection(request);
		
		if (!SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString().equals("anonymousUser"))  {
			 return new ModelAndView("view.home");
		}
		
		if (connection != null) {
			request.setAttribute("message", new Message(MessageType.INFO, messageSource.getMessage("signup.your.label", null, request.getLocale()) + " " + StringUtils.capitalize(connection.getKey().getProviderId()) + " " + messageSource.getMessage("signup.accountnotassoc.label", null, request.getLocale()) + " "  +  messageSource.getMessage("project.name", null, request.getLocale()) +  " "  +  messageSource.getMessage("signup.plzsignup.label", null, request.getLocale())), WebRequest.SCOPE_REQUEST);
			ModelAndView mv = new ModelAndView("view.signup", "signupForm", SignupForm.fromProviderUser(connection.fetchUserProfile()));
			ModelMap m = mv.getModelMap();
			if (!m.containsAttribute("gender"))
				m.addAttribute("gender", Gender.values());

			return mv;
			
		} else {
			
			ModelAndView mv = new ModelAndView("view.signup", "signupForm", new SignupForm());
			ModelMap m = mv.getModelMap();
			
			if (!m.containsAttribute("gender"))
				m.addAttribute("gender", Gender.values());
			
			return  mv;
			
		}
	}

	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String signup(@Valid SignupForm form, BindingResult formBinding, WebRequest request, ModelMap model) {
		if (formBinding.hasErrors()) {
			
			return null;
		}
		Account account = createAccount(form, formBinding);
		if (account != null) {
			SignInUtils.signin(account.getEmail());
			ProviderSignInUtils.handlePostSignUp(account.getEmail(), request);
			return "redirect:/";
		} else if (account == null){
			if (formBinding.hasErrors()) {
				
				
				return "view.signup";
			}
		}
		return null;
	}

	// internal helpers
	
	private Account createAccount(SignupForm form, BindingResult formBinding) {
		try {
			Account account = new Account(form.getEmail(), form.getPassword(), form.getFirstName(), form.getLastName(), form.getGender().name(), form.getMaidenname());
			accountRepository.createAccount(account);
			return account;
		} catch (UsernameAlreadyInUseException e) {
			formBinding.rejectValue("email", "user.duplicateUsername", "already in use");
			return null;
		}
	}

	@Override
	public void setMessageSource(MessageSource messageSource) {
		this.messageSource = messageSource;
		
	}

	

}
