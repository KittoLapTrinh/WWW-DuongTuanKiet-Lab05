package com.example.wwwduongtuankietlab05.ids;

import java.io.Serializable;
import java.util.Objects;

public class JobSkillID implements Serializable {
    private Long job;
    private Long skill;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        JobSkillID that = (JobSkillID) o;
        return Objects.equals(job, that.job) && Objects.equals(skill, that.skill);
    }

    @Override
    public int hashCode() {
        return Objects.hash(job, skill);
    }
}
