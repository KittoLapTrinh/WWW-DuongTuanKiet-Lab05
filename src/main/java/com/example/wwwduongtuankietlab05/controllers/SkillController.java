package com.example.wwwduongtuankietlab05.controllers;

import com.example.wwwduongtuankietlab05.enums.SkillType;
import com.example.wwwduongtuankietlab05.models.Skill;
import com.example.wwwduongtuankietlab05.repositories.SkillRepository;
import com.example.wwwduongtuankietlab05.services.SkillService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Controller
@RequiredArgsConstructor
public class SkillController {

    private final SkillService skillService;
    private final SkillRepository skillRepository;

    @GetMapping("/skills")
    public String showSkillPage(
            Model model,
            @RequestParam("page") Optional<Integer> page,
            @RequestParam("size") Optional<Integer> size

    ) {
        int currentPage = page.orElse(1);
        int pageSize = size.orElse(6);
        Page<Skill> skillPage = skillService.findPaginated(
                PageRequest.of(currentPage - 1, pageSize)
        );
        int totalPages = skillPage.getTotalPages();
        int startPage = Math.max(1, currentPage - 2);
        int endPage = Math.min(startPage + 4, totalPages);
        model.addAttribute("skillPage", skillPage);
        model.addAttribute("control", "skills");
        if (totalPages > 0) {
            List<Integer> pageNumbers = IntStream.rangeClosed(startPage, endPage)
                    .boxed()
                    .collect(Collectors.toList());
            model.addAttribute("pageNumbers", pageNumbers);
        }
        return "skill-page";
    }

    @GetMapping("/insert-skill")
    public String showInsertSkillPage(Model model) {
        List<SkillType> skillTypes = List.of(SkillType.values());
        Skill skill = new Skill();
        model.addAttribute("skill",skill);
        model.addAttribute("skillTypes",skillTypes);
        return "insert-skill";
    }

    @PostMapping("/add-skill")
    public String addSkill(@ModelAttribute("skill") Skill skill){
        try {
            System.out.println(skill);
            skillRepository.save(skill);
            return "redirect:/skills";
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return "redirect:/insert-skill";
    }
}
