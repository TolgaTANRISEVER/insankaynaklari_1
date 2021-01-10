package com.example.insankaynaklari.controller;

import com.example.insankaynaklari.model.User;
import com.example.insankaynaklari.service.DepartmentService;
import com.example.insankaynaklari.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired//anotasyonu sayesinde bir bean içerisindeki değerleri başka
    //beanin içerisine enjekte edebilir değerlerini koruyarak kullanabiliriz.
    private DepartmentService departmentService;

    @RequestMapping("/employees")
    public String employeList(Model model){
        List<User> employees = userService.listAllEmployee();
        model.addAttribute("employees", employees);

        return "employeelist";
    }

    @RequestMapping("/works/{id}")
    public String employeList(@PathVariable Long id,Model model){

        User user = userService.getById(id);
        model.addAttribute("user", user);

        return "employeeWorks";
    }


    @RequestMapping("/addEmploye")
    public ModelAndView addEmployee() {

        User user = new User();

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("user", user);
        modelAndView.addObject("departments",departmentService.getAll());
        modelAndView.setViewName("addEmploye");

        return modelAndView;
    }

    @PostMapping( "/addEmploye")
    public ModelAndView addEmployee(@Valid @ModelAttribute("user")User user,BindingResult bindingResult) {

        ModelAndView modelAndView = new ModelAndView();

        if(bindingResult.hasErrors()){
            modelAndView.addObject("departments",departmentService.getAll());
            modelAndView.setViewName("addEmploye");

            return modelAndView;
        }

        modelAndView.setViewName("redirect:/user/employees");

        userService.save(user);

        return modelAndView;
    }


    @RequestMapping("/updateEmployee/{id}")
    public String updateEmployee(@PathVariable Long id, Model model) {

        User user = userService.getById(id);

        model.addAttribute("user", user);
        model.addAttribute("departments",departmentService.getAll());

        return "updateEmployee";
    }

    @PostMapping("/updateEmployee/{id}")
    public String updateEmployee(@PathVariable Long id,User user) {

        userService.update(id,user);

        return "redirect:/user/employees";
    }



    @RequestMapping("/deleteEmployee/{id}")
    public String assignwork(@PathVariable Long id){

         userService.deleteById(id);

        return "redirect:/user/employees";
    }


}
