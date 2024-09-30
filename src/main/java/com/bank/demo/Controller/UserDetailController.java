package com.bank.demo.Controller;

import com.bank.demo.DTO.UserDetialsReqRes;
import com.bank.demo.Model.UserDetail;
import com.bank.demo.service.UserDetialService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
@Controller
public class UserDetailController {
    @Autowired
    private UserDetialService userDetialService;

 
    @PostMapping("/admin/register")
    public ResponseEntity<String> register(@RequestBody UserDetialsReqRes reqRes) {
        try {
            UserDetialsReqRes userDetialsReqRes = userDetialService.userRegistration(reqRes);
            
            if (userDetialsReqRes != null) {
                String message = "user has been created sucessfully";
                return ResponseEntity.ok(message);  // Return success message with HTTP 200 status
            } else {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Registration failed");  // Return error message with HTTP 400 status
            }
        } catch (RuntimeException e) {
            // Handle any runtime exceptions that occur during registration
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
    }



  // this will fetch page only 
    @GetMapping("/admin/userlistpage")
    public ModelAndView getUserlist() {
    	ModelAndView modelAndView= new ModelAndView("UserDetials");
    	return modelAndView;
    }


 // this will fetch data 
@GetMapping("/admin/userdetials")
public List<UserDetail> userDetiaList(){
	
	return (List<UserDetail>) userDetialService.getAllUserDetial();
}




}
