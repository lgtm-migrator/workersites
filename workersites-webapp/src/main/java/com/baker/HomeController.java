package com.baker;

import org.springframework.social.connect.ConnectionRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.baker.social.account.AccountRepository;

import java.security.Principal;
import javax.inject.Inject;
import javax.inject.Provider;


@Controller
public class HomeController {

	private final Provider<ConnectionRepository> connectionRepositoryProvider;
	
	private final AccountRepository accountRepository;
	
	@Inject
	public HomeController(Provider<ConnectionRepository> connectionRepositoryProvider, AccountRepository accountRepository) {
		this.connectionRepositoryProvider = connectionRepositoryProvider;
		this.accountRepository = accountRepository;
	}
	
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
    /*
    @RequestMapping("/signup")
    public String startHome(Principal principal, Model model) {
    	if (principal != null)
    		model.addAttribute("username", principal.getName());
        return "view.signup";
    }
    */
    
    @RequestMapping("/")
	public String home(Principal currentUser, Model model) {
		model.addAttribute("connectionsToProviders", getConnectionRepository().findAllConnections());
		model.addAttribute(accountRepository.findAccountByUsername(currentUser.getName()));
		return "view.home";
	}
    
    private ConnectionRepository getConnectionRepository() {
		return connectionRepositoryProvider.get();
	}
    
}
