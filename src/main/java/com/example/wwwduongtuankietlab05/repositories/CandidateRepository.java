package com.example.wwwduongtuankietlab05.repositories;

import com.example.wwwduongtuankietlab05.models.Candidate;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CandidateRepository extends JpaRepository<Candidate, Long> {
}
