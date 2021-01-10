package com.example.insankaynaklari.controller;

import com.example.insankaynaklari.model.User;
import com.example.insankaynaklari.model.Work;
import com.example.insankaynaklari.service.UserService;
import com.example.insankaynaklari.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/work")
public class WorkController {

    @Autowired
    private WorkService workService;

    @Autowired
    private UserService userService;

    @RequestMapping("/works")
    public String work(Model model){

        List<Work> works = workService.findAll();
        model.addAttribute("works", works);

        return "work";
    }

    @RequestMapping("/addWork")
    public ModelAndView addWork(){

        Work work = new Work();

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("work", work);
        modelAndView.addObject("users",userService.listAllEmployee());
        modelAndView.setViewName("addWork");

        return modelAndView;
    }

    @PostMapping("/addWork")
    public ModelAndView addWork(@Valid @ModelAttribute("work")Work work, BindingResult bindingResult) {

        ModelAndView modelAndView = new ModelAndView();

        if(bindingResult.hasErrors()){
            modelAndView.addObject("users",userService.listAllEmployee());
            modelAndView.setViewName("addWork");
            return modelAndView;
        }
        modelAndView.setViewName("redirect:/work/works");

        workService.save(work);

        return modelAndView;
    }

    @RequestMapping("/assignWork/{id}")
    public String assignwork(@PathVariable Long id,Model model){

        Work work = workService.getById(id);
        List<User> employees = userService.listAllEmployee();
        model.addAttribute("employees", employees);
        model.addAttribute("work",work);

        return "assignWork";
    }

    @RequestMapping("/assignWork/{workId}/{userId}")
    public String assignwork(@PathVariable Long workId,@PathVariable Long userId){

        User employee = userService.getById(userId);

        Work work = workService.getById(workId);

        work.setUser(employee);

        workService.save(work);

        return "redirect:/work/works";
    }



    @RequestMapping("/deleteWork/{id}")
    public String deleteDepartment(@PathVariable Long id){

        workService.deleteById(id);

        return "redirect:/work/works";
    }

}
