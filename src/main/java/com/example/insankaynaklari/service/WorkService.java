package com.example.insankaynaklari.service;

import com.example.insankaynaklari.model.User;
import com.example.insankaynaklari.model.Work;
import com.example.insankaynaklari.repository.WorkRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class WorkService {

    @Autowired
    private WorkRepository workRepository;

    public List<Work> findAll(){
        return workRepository.findAll();
    }

    public Work getById(Long id){
        return workRepository.getOne(id);
    }

    public void save(Work work){

        work.setCreatedDate(new Date());

            work.setIsCompleted(0);


        workRepository.save(work);
    }

    public void updateWork(Work work){

        work.setIsCompleted(1);
        work.setCompletedDate(new Date());
        workRepository.save(work);

    }

    public void deleteById(Long id){

        Work work = workRepository.getOne(id);

//        work.setUser(null);

        workRepository.deleteById(id);
    }

}
