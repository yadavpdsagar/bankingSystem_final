package com.bank.demo.Controller;


import com.bank.demo.Model.TransactionDetail;
import com.bank.demo.service.TransactionDetailService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@RestController
@RequestMapping
public class BankTransactionController {

 @Autowired
     TransactionDetailService transactionDetailService;





    @PostMapping("/employee/process")
    public ResponseEntity<?> processTransaction(@RequestBody  TransactionDetail transactionReq, HttpSession session) {
        // Rate limiting check
        if (session.getAttribute("rateLimitExceeded") != null && (boolean) session.getAttribute("rateLimitExceeded")) {
            return ResponseEntity.status(HttpStatus.TOO_MANY_REQUESTS).body("Too many request!!!! ");
        }

        try {
            transactionDetailService.saveTransaction(transactionReq);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }

        return ResponseEntity.ok("Transaction processed successfully");
    }




    @GetMapping("/adminemployee/tractionListget")
    public List<TransactionDetail> tractionList(){
        return transactionDetailService.getAllTraction();
    }
}


