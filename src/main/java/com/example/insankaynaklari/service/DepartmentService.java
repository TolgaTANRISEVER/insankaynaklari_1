package com.example.insankaynaklari.service;

import com.example.insankaynaklari.model.Department;
import com.example.insankaynaklari.model.User;
import com.example.insankaynaklari.repository.DepartmanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    private DepartmanRepository departmanRepository;


    public List<Department> getAll(){
        return departmanRepository.findAll();
    }

    public void save(Department department){

        departmanRepository.save(department);
    }

    public void deleteById(Long id){

        Department department = departmanRepository.getOne(id);

        for (User user : department.getUser()) {
            user.setDepartment(null);
        }

        departmanRepository.deleteById(id);
    }

}
