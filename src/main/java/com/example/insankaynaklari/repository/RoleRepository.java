package com.example.insankaynaklari.repository;

import com.example.insankaynaklari.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends JpaRepository<Role,Long> {

    Role findByName(String role);

}
