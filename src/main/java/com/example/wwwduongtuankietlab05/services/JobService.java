package com.example.wwwduongtuankietlab05.services;

import com.example.wwwduongtuankietlab05.models.Company;
import com.example.wwwduongtuankietlab05.models.Job;
import com.example.wwwduongtuankietlab05.models.JobSkill;
import com.example.wwwduongtuankietlab05.repositories.JobRepository;
import com.example.wwwduongtuankietlab05.repositories.JobSkillRepository;
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
public class JobService {
    private final JobRepository jobRepository;
    private final JobSkillRepository jobSkillRepository;

    public Page<Job> findPaginated(Pageable pageable) {
        int pageSize = pageable.getPageSize();
        int currentPage = pageable.getPageNumber();
        int startItem = currentPage * pageSize;
        List<Job> jobs = jobRepository.findAll();
        PageRender<Job> pageRender = new PageRender<>();
        List<Job> list = pageRender.getPageOfModel(jobs.size(), startItem, pageSize, jobs);
        return new PageImpl<>(list, PageRequest.of(currentPage, pageSize), jobs.size());
    }
    public String getCompanyByJob(long id){
        return jobRepository.getCompanyNameByJob(id);
    }

    public List<JobSkill> getSkillForJob(long id){
        return jobSkillRepository.getSkillForJob(id);
    }
}
