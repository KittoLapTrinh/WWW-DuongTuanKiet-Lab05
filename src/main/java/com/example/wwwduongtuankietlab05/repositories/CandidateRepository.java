package com.example.wwwduongtuankietlab05.repositories;

import com.example.wwwduongtuankietlab05.models.Candidate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CandidateRepository extends JpaRepository<Candidate, Long> {
}
