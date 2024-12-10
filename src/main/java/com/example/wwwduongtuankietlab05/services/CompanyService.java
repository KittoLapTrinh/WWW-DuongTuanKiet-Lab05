package com.example.wwwduongtuankietlab05.services;

import com.example.wwwduongtuankietlab05.models.Company;
import com.example.wwwduongtuankietlab05.repositories.CompanyRepository;
import com.example.wwwduongtuankietlab05.util.PageRender;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CompanyService {

    private final CompanyRepository companyRepository;

    public Page<Company> findPaginated(Pageable pageable) {
        int pageSize = pageable.getPageSize();
        int currentPage = pageable.getPageNumber();
        int startItem = currentPage * pageSize;
        List<Company> companies = companyRepository.findAll();
        PageRender<Company> pageRender = new PageRender<>();
        List<Company> list = pageRender.getPageOfModel(companies.size(),startItem,pageSize,companies);
        return new PageImpl<>(list, PageRequest.of(currentPage, pageSize), companies.size());
    }

    public Optional<Company> getById(long id){
        return Optional.ofNullable(companyRepository.findById(id).orElseThrow(IllegalAccessError::new));
    }
}
