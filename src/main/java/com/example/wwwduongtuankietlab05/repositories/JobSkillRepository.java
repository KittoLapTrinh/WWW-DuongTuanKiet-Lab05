package com.example.wwwduongtuankietlab05.repositories;

import com.example.wwwduongtuankietlab05.models.JobSkill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JobSkillRepository extends JpaRepository<JobSkill, Long> {
}
