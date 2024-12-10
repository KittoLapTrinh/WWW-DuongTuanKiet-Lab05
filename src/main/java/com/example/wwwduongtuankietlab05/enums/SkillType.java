package com.example.wwwduongtuankietlab05.enums;

import lombok.Data;
import lombok.Getter;

@Getter
public enum SkillType {
    UNSPECIFIC(0),

    TECHNICAL_SKILL(1),

    SOFT_SKILL(2);

    SkillType(int value) {
    }

}
