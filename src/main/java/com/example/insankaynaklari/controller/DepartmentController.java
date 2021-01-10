package com.example.insankaynaklari.controller;

import com.example.insankaynaklari.model.Department;
import com.example.insankaynaklari.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/department")
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/")
    public String getAll(Model model){
        List<Department> departments = departmentService.getAll();

        model.addAttribute("departments",departments);

        return "departmentlist";
    }

    @RequestMapping("/addDepartment")
    public ModelAndView createDepartment(){

        Department department = new Department();

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("department", department);
        modelAndView.setViewName("addDepartment");

        return modelAndView;
    }

    @PostMapping("/addDepartment")
    public ModelAndView createDepartment(@Valid @ModelAttribute("department")Department department, BindingResult bindingResult) {

        ModelAndView modelAndView = new ModelAndView();

        if(bindingResult.hasErrors()){
            modelAndView.setViewName("addDepartment");
            return modelAndView;
        }

        modelAndView.setViewName("redirect:/department/");

        departmentService.save(department);

        return modelAndView;
    }

    @RequestMapping("/deleteDepartment/{id}")
    public String deleteDepartment(@PathVariable Long id){

        departmentService.deleteById(id);

        return "redirect:/department/";
    }


}
