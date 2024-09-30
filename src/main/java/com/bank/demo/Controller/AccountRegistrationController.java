package com.bank.demo.Controller;


import com.bank.demo.Model.AccountDetail;
import com.bank.demo.Model.AccountType;
import com.bank.demo.service.AccountDetialsService;

import java.util.List;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;




@RestController
public class AccountRegistrationController {
    @Autowired
    private AccountDetialsService accountDetialsService;





 

//    @PostMapping("/admin/createacc")
//    public ModelAndView createAccount(AccountDetail accountReq, HttpSession session , Model model) {
//        // Check rate limiting
//        if (session.getAttribute("rateLimitExceeded") != null && (boolean) session.getAttribute("rateLimitExceeded")) {
//            return new ModelAndView("rateLimitExceeded");
//        }
//
//        AccountDetail accountDetail = accountDetialsService.AccountRegistration(accountReq, accountReq.getAccountType().getAccTypId());
//
//        // Update rate limit status in session
//        if (session.getAttribute("rateLimitExceeded") == null) {
//            session.setAttribute("rateLimitExceeded", false);
//        }
//
//        return new ModelAndView("Success");
//    }
    
    @PostMapping("/admin/createacc")
    public ResponseEntity<String> createAccount(@RequestBody AccountDetail accountReq, HttpSession session) {
        // Check rate limiting
        if (session.getAttribute("rateLimitExceeded") != null && (boolean) session.getAttribute("rateLimitExceeded")) {
            return ResponseEntity.status(HttpStatus.TOO_MANY_REQUESTS).body("Rate limit exceeded");
        }

        // Process account registration
        try {
            AccountDetail accountDetail = accountDetialsService.AccountRegistration(accountReq, accountReq.getAccountType().getAccTypId());

            // Update rate limit status in session
            if (session.getAttribute("rateLimitExceeded") == null) {
                session.setAttribute("rateLimitExceeded", false);
            }

            return ResponseEntity.ok("Account created successfully!");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
    }

    
    
   @GetMapping("/adminemployee/accountdetialslist")
   public List<AccountDetail> accountDetailsList(){
	   return accountDetialsService.getAccountDetails();
   }
    
}
