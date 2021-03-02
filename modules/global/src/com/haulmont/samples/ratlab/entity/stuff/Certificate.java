package com.haulmont.samples.ratlab.entity.stuff;

import com.haulmont.chile.core.annotations.NamePattern;
import com.haulmont.cuba.core.entity.StandardEntity;
import com.haulmont.cuba.core.entity.annotation.CaseConversion;
import com.haulmont.cuba.core.entity.annotation.Lookup;
import com.haulmont.cuba.core.entity.annotation.LookupType;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Table(name = "RATLAB_CERTIFICATE")
@Entity(name = "ratlab_Certificate")
@NamePattern("%s|title")
public class Certificate extends StandardEntity {
    private static final long serialVersionUID = -1267084378534853274L;

    @Column(name = "TITLE")
    private String title;

    @Temporal(TemporalType.TIMESTAMP)
    @NotNull
    @Column(name = "AQUIRED", nullable = false)
    private Date aquired;

    @Column(name = "CODE", nullable = false, unique = true)
    @CaseConversion
    @NotNull
    private String code;

    @Lob
    @Column(name = "DESCRIPTION")
    private String description;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "OWNER_ID")
    @Lookup(type = LookupType.SCREEN, actions = "lookup")
    @NotNull(message = "{msg://ratlab_Certificate.owner.validation.NotNull}")
    private Employee owner;

    public Employee getOwner() {
        return owner;
    }

    public void setOwner(Employee owner) {
        this.owner = owner;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getAquired() {
        return aquired;
    }

    public void setAquired(Date aquired) {
        this.aquired = aquired;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}