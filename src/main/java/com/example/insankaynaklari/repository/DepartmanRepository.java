package com.example.insankaynaklari.repository;

import com.example.insankaynaklari.model.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DepartmanRepository extends JpaRepository<Department, Long> {

}
