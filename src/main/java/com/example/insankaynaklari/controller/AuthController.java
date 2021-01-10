package com.example.insankaynaklari.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @RequestMapping(value = { "/login" })
    public String login() {

        return "login";
    }



}
