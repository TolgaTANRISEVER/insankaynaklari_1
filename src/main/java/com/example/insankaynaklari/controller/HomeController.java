package com.example.insankaynaklari.controller;

import com.example.insankaynaklari.model.User;
import com.example.insankaynaklari.model.Work;
import com.example.insankaynaklari.service.UserService;
import com.example.insankaynaklari.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class HomeController {

    @Autowired
    private UserService userService;

    @Autowired
    private WorkService workService;

    @RequestMapping("/")
    public String getAll(Model model,Principal principal){

        User user = userService.getUserByEmail(principal.getName());

        model.addAttribute("user",user);

        return "home";
    }

    @RequestMapping("/assignedworks")
    public String employeeWorks(Model model, Principal principal){

        User user = userService.getUserByEmail(principal.getName());

        List<Work> works = user.getWorks().stream().filter(work -> work.getIsCompleted() == 0).collect(Collectors.toList());

        model.addAttribute("works",works);

        return "assignedworks";
    }


    @RequestMapping("updateWork/{id}")
    public String updateWork(@PathVariable Long id){

        workService.updateWork(workService.getById(id));

        return "redirect:/assignedworks";
    }

    @RequestMapping("/completedworks")
    public String completedWorks(Model model, Principal principal){

        User user = userService.getUserByEmail(principal.getName());

        List<Work> works = user.getWorks().stream().filter(work -> work.getIsCompleted() == 1).collect(Collectors.toList());

        model.addAttribute("works",works);


        return "completedworks";
    }


}
