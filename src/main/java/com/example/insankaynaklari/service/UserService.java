package com.example.insankaynaklari.service;

import com.example.insankaynaklari.model.Role;
import com.example.insankaynaklari.model.User;
import com.example.insankaynaklari.model.Work;
import com.example.insankaynaklari.repository.RoleRepository;
import com.example.insankaynaklari.repository.UserRepository;
import com.example.insankaynaklari.repository.WorkRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserService {

    @Autowired//anotasyonu sayesinde bir bean içerisindeki değerleri başka
    //beanin içerisine enjekte edebilir değerlerini koruyarak kullanabiliriz.
    private BCryptPasswordEncoder encoder;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private WorkRepository workRepository;


    public void save(User user){
        user.setPassword(encoder.encode(user.getPassword()));

        Role userRole = roleRepository.findByName("EMPLOYEE");
        user.setRole(userRole);

        userRepository.save(user);
    }


    public void update(Long id,User user){

        User updated = userRepository.getOne(id);

        updated.setName(user.getName());
        updated.setSurname(user.getSurname());
        updated.setDepartment(user.getDepartment());

        userRepository.save(updated);
    }

//    public List<User> listAllUser(){
//        return userRepository.findAll();
//    }

    public User getById(Long id){
        return userRepository.getOne(id);
    }

    public List<User> listAllEmployee(){
        Role role =  roleRepository.findByName("EMPLOYEE");
        return userRepository.findAll().stream().filter(user -> user.getRole().equals(role) ).collect(Collectors.toList());
    }

    public  User getUserByEmail(String email){
        return userRepository.findByEmail(email);
    }

    public void deleteById(Long id){

        User user = userRepository.getOne(id);

        List<Work> works = user.getWorks();

        for (Work work : works) {
            if(work.getIsCompleted() != 1){
                work.setIsCompleted(0);
                work.setUser(null);
                workRepository.save(work);
            }
        }

        userRepository.deleteById(id);
    }

}
