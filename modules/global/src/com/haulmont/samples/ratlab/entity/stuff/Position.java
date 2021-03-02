package com.haulmont.samples.ratlab.entity.stuff;

import com.haulmont.chile.core.datatypes.impl.EnumClass;

import javax.annotation.Nullable;


public enum Position implements EnumClass<String> {

    INTERN("intern"),
    ASSISTANT("assistant"),
    RESEARCHER("researcher"),
    LEADING_RESEARCHER("leadingResearcher"),
    PROFESSOR("professor"),
    DIRECTOR("director"),
    EXECUTIVE_OFFICER("executiveOfficer"),
    CHIEF_EXECUTIVE_OFFICER("chiefExecutiveOfficer");

    private String id;

    Position(String value) {
        this.id = value;
    }

    public String getId() {
        return id;
    }

    @Nullable
    public static Position fromId(String id) {
        for (Position at : Position.values()) {
            if (at.getId().equals(id)) {
                return at;
            }
        }
        return null;
    }
}