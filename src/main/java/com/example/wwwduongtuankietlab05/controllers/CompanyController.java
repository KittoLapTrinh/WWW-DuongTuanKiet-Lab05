package com.example.wwwduongtuankietlab05.controllers;


import com.example.wwwduongtuankietlab05.models.Company;
import com.example.wwwduongtuankietlab05.repositories.CompanyRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class CompanyController {

    private final CompanyRepository companyRepository;

    @GetMapping("/companies")
    public String showCustomerListPaging(Model model) {
        List<Company> companies = companyRepository.findAll();
        model.addAttribute("companies", companies);
        return "company/company-page";
    }
}
