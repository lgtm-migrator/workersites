package com.baker;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

import java.security.Principal;
import java.util.Locale;


@Controller
public class HomeController {

    @RequestMapping("/admin")
    public String adminHome(Principal principal, Model model) {
        model.addAttribute("username", principal.getName());
        return "view.admin";
    }
    
    @RequestMapping("/home")
    public String homeHome(Principal principal, Model model) {
    	if (principal != null)
    		model.addAttribute("username", principal.getName());
        return "view.home";
    }
    
    @RequestMapping("/signup")
    public String startHome(Principal principal, Model model) {
    	if (principal != null)
    		model.addAttribute("username", principal.getName());
        return "view.signup";
    }
    
}
