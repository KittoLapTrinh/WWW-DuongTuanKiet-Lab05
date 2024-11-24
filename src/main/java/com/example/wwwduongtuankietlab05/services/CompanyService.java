package com.example.wwwduongtuankietlab05.services;

import com.example.wwwduongtuankietlab05.repositories.CompanyRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CompanyService {
    private final CompanyRepository companyRepository;


}
