package com.example.wwwduongtuankietlab05.services;

import com.example.wwwduongtuankietlab05.models.Job;
import com.example.wwwduongtuankietlab05.models.Skill;
import com.example.wwwduongtuankietlab05.repositories.SkillRepository;
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
public class SkillService {
    private final SkillRepository skillRepository;

    public Page<Skill> findPaginated(Pageable pageable) {
        int pageSize = pageable.getPageSize();
        int currentPage = pageable.getPageNumber();
        int startItem = currentPage * pageSize;
        List<Skill> jobs = skillRepository.findAll();
        PageRender<Skill> pageRender = new PageRender<>();
        List<Skill> list = pageRender.getPageOfModel(jobs.size(), startItem, pageSize, jobs);
        return new PageImpl<>(list, PageRequest.of(currentPage, pageSize), jobs.size());
    }
}
