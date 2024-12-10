package com.example.wwwduongtuankietlab05.repositories;

import com.example.wwwduongtuankietlab05.models.Job;
import org.springframework.data.jpa.repository.JpaRepository;


public interface JobRepository extends JpaRepository<Job, Long> {
    String getCompanyNameByJob(long id);
}
