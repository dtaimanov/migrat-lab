package com.haulmont.samples.ratlab.entity.resources;

import com.haulmont.chile.core.annotations.NamePattern;
import com.haulmont.cuba.core.entity.StandardEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Table(name = "RATLAB_RAT")
@Entity(name = "ratlab_Rat")
@NamePattern("%s|name")
public class Rat extends StandardEntity {
    private static final long serialVersionUID = 2618528269781160458L;

    @Column(name = "NAME")
    private String name;

    @Column(name = "COLOR")
    private String color;

    @Column(name = "CHECKED")
    private Boolean checked;

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}