package com.baker;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.security.Principal;


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
