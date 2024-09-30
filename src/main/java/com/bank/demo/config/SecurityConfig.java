package com.bank.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    @Autowired
    private UserDetailsService userDetailsService;

  @Autowired
 public CustomAuthenticationSuccessHandler customAuthenticationSuccessHandler ;


    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception{
         httpSecurity.csrf(customizer->customizer.disable())
                .authorizeHttpRequests(request->request.requestMatchers("/user").permitAll()
                        .requestMatchers("/admin/**").hasAnyAuthority("ADMIN")
                        .requestMatchers("/employee/**").hasAnyAuthority("EMPLOYEE")
                        .requestMatchers("/adminemployee/**").hasAnyAuthority("ADMIN","EMPLOYEE")
                        .anyRequest().authenticated())

               .formLogin((formLogin -> formLogin
            		   .successHandler(new CustomAuthenticationSuccessHandler())
                       .permitAll()))
                .httpBasic(Customizer.withDefaults())
                .sessionManagement(session-> session.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED));
        return  httpSecurity .build();
    }
    @Bean
    public AuthenticationProvider authenticationProvider(){
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setPasswordEncoder(new BCryptPasswordEncoder(7));
        provider.setUserDetailsService(userDetailsService);
        return provider;
    }

}
