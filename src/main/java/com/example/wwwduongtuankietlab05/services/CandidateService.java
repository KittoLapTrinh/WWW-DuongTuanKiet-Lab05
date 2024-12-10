package com.example.wwwduongtuankietlab05.services;

import com.example.wwwduongtuankietlab05.repositories.CandidateRepository;
import com.example.wwwduongtuankietlab05.models.Candidate;
import com.example.wwwduongtuankietlab05.models.Company;
import com.example.wwwduongtuankietlab05.repositories.CandidateRepository;
import com.example.wwwduongtuankietlab05.repositories.CompanyRepository;
import com.example.wwwduongtuankietlab05.util.PageRender;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@RequiredArgsConstructor
public class CandidateService {
    private final CandidateRepository candidateRepository;
    public Page<Candidate> findPaginated(Pageable pageable) {
        int pageSize = pageable.getPageSize();
        int currentPage = pageable.getPageNumber();
        int startItem = currentPage * pageSize;
        List<Candidate> candidates = candidateRepository.findAll();
        PageRender<Candidate> pageRender = new PageRender<>();
        List<Candidate> list = pageRender.getPageOfModel(candidates.size(),startItem,pageSize,candidates);
        return new PageImpl<>(list, PageRequest.of(currentPage, pageSize), candidates.size());
    }
}
