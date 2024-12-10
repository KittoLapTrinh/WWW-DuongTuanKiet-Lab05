package com.example.wwwduongtuankietlab05.repositories;


import com.example.wwwduongtuankietlab05.ids.CandidateSkillID;
import com.example.wwwduongtuankietlab05.models.CandidateSkill;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CandidateSkillRepository extends JpaRepository<CandidateSkill, CandidateSkillID> {
}