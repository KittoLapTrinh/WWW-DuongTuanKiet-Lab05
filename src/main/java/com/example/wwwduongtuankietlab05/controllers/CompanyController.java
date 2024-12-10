package com.example.wwwduongtuankietlab05.controllers;


import com.example.wwwduongtuankietlab05.models.Company;
import com.example.wwwduongtuankietlab05.services.CompanyService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Controller
@RequiredArgsConstructor
public class CompanyController {

    private final CompanyService companyService;

    @GetMapping("/companies")
    public String showCustomerListPaging(
            Model model,
            @RequestParam("page") Optional<Integer> page,
            @RequestParam("size") Optional<Integer> size

    ) {
        int currentPage = page.orElse(1);
        int pageSize = size.orElse(6);
        Page<Company> companyPage = companyService.findPaginated(
                PageRequest.of(currentPage - 1, pageSize)
        );
        int totalPages = companyPage.getTotalPages();
        int startPage = Math.max(1, currentPage - 2);
        int endPage = Math.min(startPage + 4, totalPages);
        model.addAttribute("companyPage", companyPage);
        model.addAttribute("control","companies");
        if (totalPages > 0) {
            List<Integer> pageNumbers = IntStream.rangeClosed(startPage, endPage)
                    .boxed()
                    .collect(Collectors.toList());
            model.addAttribute("pageNumbers", pageNumbers);
        }
        return "company-page";
    }
}
