package com.example.wwwduongtuankietlab05.repositories;

import com.example.wwwduongtuankietlab05.ids.JobSkillID;
import com.example.wwwduongtuankietlab05.models.JobSkill;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface JobSkillRepository extends JpaRepository<JobSkill, JobSkillID> {
    List<JobSkill> getSkillForJob(long id);
}