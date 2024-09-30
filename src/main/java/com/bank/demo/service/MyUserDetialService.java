package com.bank.demo.service;

import com.bank.demo.Model.UserDetail;
import com.bank.demo.Model.UserPrincipal;
import com.bank.demo.Repository.UserDetialRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class MyUserDetialService implements UserDetailsService {
    @Autowired
    private UserDetialRepo userDetialRepo;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserDetail userDetail= userDetialRepo.findByusername(username);
        if(userDetail==null){
            System.out.println("user Not Found");
            throw new UsernameNotFoundException("user name not found ");
        }
        return new UserPrincipal(userDetail);
    }
}
