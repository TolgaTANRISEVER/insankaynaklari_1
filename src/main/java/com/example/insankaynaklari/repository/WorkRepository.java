package com.example.insankaynaklari.repository;

import com.example.insankaynaklari.model.Work;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WorkRepository extends JpaRepository<Work,Long> {
}
