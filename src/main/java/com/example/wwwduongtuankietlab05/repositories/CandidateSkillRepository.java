package com.example.wwwduongtuankietlab05.repositories;

import com.example.wwwduongtuankietlab05.models.CandidateSkill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CandidateSkillRepository extends JpaRepository<CandidateSkill, Long> {
}
