package com.bank.demo.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bank.demo.service.MyUserDetialService;
 

 


@Controller
public class HomeController {
	@Autowired
	private MyUserDetialService userDetailService;

    @RequestMapping("/")
    public String home() {
        System.out.println("this is home page");
        return "index";
    }

    @RequestMapping("/admin")
    public String admin() {
        System.out.println("this is admin page");
        return "admin";
    }
    
    @GetMapping("/employee")
    public String employee(org.springframework.ui.Model model) {
        // Get the current user's authentication details
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null && authentication.isAuthenticated()) {
            String username = authentication.getName();
            // Fetch user details using the UserDetailsService
            UserDetails userDetails = userDetailService.loadUserByUsername(username);
            // Add user details to the model
            model.addAttribute("user", userDetails);
        } else {
            model.addAttribute("user", null); // Handle unauthenticated case
        }

        System.out.println("this is employee page");
        return "employee"; // Name of the view to render
    }
    
 


    @RequestMapping("/admin/UserRegistrationPage")
    public String UserRegistrationPage() {
        System.out.println("this is UserRegistrationPage");
        return "UserRegistrationPage";
    }

    @RequestMapping("/adminemployee/tractionList")
    public String tractionList() {
        System.out.println("tractionList");
        return "tranctionList";
    }
//    @RequestMapping("/loginpage")
//    public String loginpage() {
//        System.out.println("this is loginpage");
//        return "loginpage";
//    }

    @RequestMapping("/admin/Ledgerpage")
    public String Ledgerpage() {
        System.out.println("this is Ledgerpage");
        return "Ledgerpage";
    }
    @RequestMapping("/employee/Transctiondetialpage")
    public String BankTransaction() {
        System.out.println("this is Transctiondetialpage");
        return "Transctiondetialpage";
    }
    
    @RequestMapping("/employeesucess")
    public String employeeSuccess() {
        System.out.println("this is Transctiondetialpage");
        return "employeeSuccess";
    }
    

    @RequestMapping("/admin/AccountRegistrationPage")
    public String AccountRegistrationPage() {
        System.out.println("this is AccountRegistrationPage");
        return "AccountRegistrationPage";
    }

    @RequestMapping("/adminemployee/accountDetials")
    public String accountDetials() {
        System.out.println("this is accountDetials");
        return "accountDetials";
    }
}
