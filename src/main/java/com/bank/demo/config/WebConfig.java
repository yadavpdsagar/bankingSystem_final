package com.bank.demo.config;

import com.bank.demo.service.RateLimitingService;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class WebConfig {

    @Bean
    public FilterRegistrationBean<RateLimitingFilter> rateLimitingFilter(RateLimitingService rateLimitingService) {
        FilterRegistrationBean<RateLimitingFilter> registrationBean = new FilterRegistrationBean<>();
        registrationBean.setFilter(new RateLimitingFilter(rateLimitingService));
        registrationBean.addUrlPatterns("/admin/createacc" , "/employee/process"); // Apply rate limiting to specific URL patterns
        return registrationBean;
    }
}
