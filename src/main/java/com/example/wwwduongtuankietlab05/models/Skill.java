package com.example.wwwduongtuankietlab05.models;


import com.example.wwwduongtuankietlab05.enums.SkillType;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Table(name = "skill")
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Skill {
    @Column(name = "skill_type", nullable = false)
    private SkillType type;
    @Column(name = "skill_name", length = 150, nullable = false)
    private String skillName;
    @Column(name = "skill_desc", length = 300, nullable = false)
    private String skillDescription;
    @Id
    @Column(name = "skill_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @OneToMany(mappedBy = "skill")
    @ToString.Exclude
    private List<JobSkill> jobSkills;
}
