package com.haulmont.samples.ratlab.entity.research;

import com.haulmont.chile.core.datatypes.impl.EnumClass;

import javax.annotation.Nullable;


public enum State implements EnumClass<Integer> {

    CREATED(10),
    RESOURCES_GATHERED(20),
    IN_PROGRESS(30),
    FINISHED(40);

    private Integer id;

    State(Integer value) {
        this.id = value;
    }

    public Integer getId() {
        return id;
    }

    @Nullable
    public static State fromId(Integer id) {
        for (State at : State.values()) {
            if (at.getId().equals(id)) {
                return at;
            }
        }
        return null;
    }
}