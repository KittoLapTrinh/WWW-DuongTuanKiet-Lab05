package com.example.wwwduongtuankietlab05.controllers;

import com.example.wwwduongtuankietlab05.models.Address;
import com.example.wwwduongtuankietlab05.models.Company;
import com.example.wwwduongtuankietlab05.models.Job;
import com.example.wwwduongtuankietlab05.models.JobSkill;
import com.example.wwwduongtuankietlab05.repositories.AddressRepository;
import com.example.wwwduongtuankietlab05.repositories.CompanyRepository;
import com.example.wwwduongtuankietlab05.repositories.JobRepository;
import com.example.wwwduongtuankietlab05.services.JobService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Controller
@RequiredArgsConstructor
public class JobController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final JobService jobService;
    private final CompanyRepository companyRepository;
    private final JobRepository jobRepository;
    private final AddressRepository addressRepository;

    @GetMapping("/jobs")
    public String showCustomerListPaging(
            Model model,
            @RequestParam("page") Optional<Integer> page,
            @RequestParam("size") Optional<Integer> size

    ) {
        int currentPage = page.orElse(1);
        int pageSize = size.orElse(6);
        Page<Job> jobPage = jobService.findPaginated(
                PageRequest.of(currentPage - 1, pageSize)
        );
        int totalPages = jobPage.getTotalPages();
        int startPage = Math.max(1, currentPage - 2);
        int endPage = Math.min(startPage + 4, totalPages);
        model.addAttribute("jobPage", jobPage);
        model.addAttribute("control", "jobs");
        model.addAttribute("jobService", jobService);
        if (totalPages > 0) {
            List<Integer> pageNumbers = IntStream.rangeClosed(startPage, endPage)
                    .boxed()
                    .collect(Collectors.toList());
            model.addAttribute("pageNumbers", pageNumbers);
        }
        return "job-page";
    }

    @GetMapping("/job-insert")
    public String showInsertJobForm(Model model) {
        List<Company> companies = companyRepository.findAll();
        Job job = new Job();
        Company company = new Company();
        job.setCompany(company);
        model.addAttribute("job", job);
        model.addAttribute("companies", companies);
        model.addAttribute("company", company);
        return "insert-job";
    }

    @PostMapping("/add-job")
    public String add(@ModelAttribute("job") Job job, @ModelAttribute("company") Company company) {

        try {
            System.out.println(company);
            job.setCompany(company);
            jobRepository.save(job);
            return "redirect:/jobs";
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return "redirect:/job-insert";
    }

    @GetMapping("/manager-job")
    public String showManagerJobPage(
            Model model,
            @RequestParam("page") Optional<Integer> page,
            @RequestParam("size") Optional<Integer> size

    ) {
        int currentPage = page.orElse(1);
        int pageSize = size.orElse(6);
        Page<Job> jobPage = jobService.findPaginated(
                PageRequest.of(currentPage - 1, pageSize)
        );
        int totalPages = jobPage.getTotalPages();
        int startPage = Math.max(1, currentPage - 2);
        int endPage = Math.min(startPage + 4, totalPages);
        model.addAttribute("jobPage", jobPage);
        model.addAttribute("control", "manager-job");
        model.addAttribute("jobService", jobService);
        if (totalPages > 0) {
            List<Integer> pageNumbers = IntStream.rangeClosed(startPage, endPage)
                    .boxed()
                    .collect(Collectors.toList());
            model.addAttribute("pageNumbers", pageNumbers);
        }
        return "manager-job";
    }

    @GetMapping("/job-detail/{id}")
    public String showJobDetail(Model model, @PathVariable("id") long id) {
        Job job = jobRepository.findById(id).orElseThrow(IllegalAccessError::new);
        List<JobSkill> jobSkills = jobService.getSkillForJob(id);
        Company company = companyRepository.findById(job.getCompany().getId()).orElseThrow(
                () -> new RuntimeException("Not found is" + job.getCompany().getId())
        );
        Address address = addressRepository.findById(company.getAddress().getId())
                .orElseThrow(() -> new IllegalArgumentException("Not found id " + company.getAddress().getId()));
        model.addAttribute("job", job);
        model.addAttribute("jobSkills",jobSkills);
        model.addAttribute("address", address.getCity());
        return "job-skill-page";
    }
}
