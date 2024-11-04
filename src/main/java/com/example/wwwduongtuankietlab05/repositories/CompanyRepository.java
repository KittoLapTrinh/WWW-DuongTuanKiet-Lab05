package com.example.wwwduongtuankietlab05.repositories;

import com.example.wwwduongtuankietlab05.models.Company;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CompanyRepository extends JpaRepository<Company, Long> {
}
