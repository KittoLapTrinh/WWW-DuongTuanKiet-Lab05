package com.example.wwwduongtuankietlab05.models;

import com.example.wwwduongtuankietlab05.enums.SkillLevel;
import com.example.wwwduongtuankietlab05.ids.JobSkillID;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "job_skill")
@NoArgsConstructor
@AllArgsConstructor
@Data
@IdClass(JobSkillID.class)
@Builder
@NamedQueries({
        @NamedQuery(
                name = "JobSkill.getSkillForJob",
                query = "select distinct jk from JobSkill jk where jk.job.id =: id"
        )
})
public class JobSkill {
    @Column(name = "skill_level", nullable = false)
    private SkillLevel skillLevel;
    @Id
    @ManyToOne
    @JoinColumn(name = "job_id")
    private Job job;
    @Column(name = "more_infos", length = 1000)
    private String moreInfo;
    @Id
    @ManyToOne
    @JoinColumn(name = "skill_id")
    private Skill skill;
}
