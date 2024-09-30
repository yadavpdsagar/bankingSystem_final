package com.bank.demo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@Configuration

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, 
                                        HttpServletResponse response, 
                                        Authentication authentication) {
        try {
            // Get user details
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            // Store user details in session
            request.getSession().setAttribute("user", userDetails);
            
            // Redirect to your desired URL
            response.sendRedirect("/");
        } catch (IOException e) {
            // Handle the IOException (e.g., log it)
            e.printStackTrace();
            // Optionally, redirect to an error page
            try {
                response.sendRedirect("/error");
            } catch (IOException ioException) {
                ioException.printStackTrace();
            }
        }
    }
}


