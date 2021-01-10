package com.example.insankaynaklari.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "Bu alan gereklidir.")
    @NotNull
    private String name;
    @NotEmpty(message = "Bu alan gereklidir.")
    @NotNull
    private String surname;

    @NotEmpty(message = "Bu alan gereklidir.")
    @NotNull
    private String email;

    @NotEmpty(message = "Bu alan gereklidir.")
    @NotNull
    private String password;

    @NotEmpty(message = "Bu alan gereklidir.")
    @NotNull
    private String phone;

    @NotNull(message = "Bu alan gereklidir.")
    private Date dateOfBirth;

    @ManyToOne
    @JoinColumn(name="role_id")
    private Role role;

    @OneToMany(mappedBy="user")
    private List<Work> works = new ArrayList<>();

    @ManyToOne
    @JoinColumn(name="department_id")
    private Department department;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public List<Work> getWorks() {
        return works;
    }

    public void setWorks(List<Work> works) {
        this.works = works;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
}
