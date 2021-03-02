package com.haulmont.samples.ratlab.entity.resources;

import com.haulmont.chile.core.datatypes.impl.EnumClass;

import javax.annotation.Nullable;


public enum ResourceType implements EnumClass<String> {

    CHEMICAL("chemical"),
    CONSUMABLE("consumable"),
    TOOL("tool"),
    CONTAINER("container"),
    DEVICE("device");

    private String id;

    ResourceType(String value) {
        this.id = value;
    }

    public String getId() {
        return id;
    }

    @Nullable
    public static ResourceType fromId(String id) {
        for (ResourceType at : ResourceType.values()) {
            if (at.getId().equals(id)) {
                return at;
            }
        }
        return null;
    }
}