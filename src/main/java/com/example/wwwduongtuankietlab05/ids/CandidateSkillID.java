package com.example.wwwduongtuankietlab05.ids;


import java.io.Serializable;
import java.util.Objects;

public class CandidateSkillID implements Serializable {
    private Long candidate;
    private Long skill;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CandidateSkillID that = (CandidateSkillID) o;
        return Objects.equals(candidate, that.candidate) && Objects.equals(skill, that.skill);
    }

    @Override
    public int hashCode() {
        return Objects.hash(candidate, skill);
    }
}
