package com.haulmont.samples.ratlab.entity.research;

import com.haulmont.cuba.core.entity.StandardEntity;
import com.haulmont.cuba.core.entity.annotation.OnDeleteInverse;
import com.haulmont.cuba.core.global.DeletePolicy;
import com.haulmont.samples.ratlab.entity.resources.MiscResource;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Table(name = "RATLAB_RESOURCE_REQUIREMENT")
@Entity(name = "ratlab_ResourceRequirement")
public class ResourceRequirement extends StandardEntity {
    private static final long serialVersionUID = 5133682100594844415L;

    @NotNull
    @JoinColumn(name = "RESOURCE_ID")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDeleteInverse(DeletePolicy.DENY)
    private MiscResource resource;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "RESEARCH_ID")
    private Research research;

    @Column(name = "PROVIDED")
    private Integer provided;

    @NotNull
    @Column(name = "AMOUNT", nullable = false)
    private Integer amount;

    @Column(name = "CONSUME", nullable = false, columnDefinition = "boolean default false")
    @NotNull
    private Boolean consume = false;

    public Research getResearch() {
        return research;
    }

    public void setResearch(Research research) {
        this.research = research;
    }

    public Integer getProvided() {
        return provided;
    }

    public void setProvided(Integer provided) {
        this.provided = provided;
    }

    public Boolean getConsume() {
        return consume;
    }

    public void setConsume(Boolean consume) {
        this.consume = consume;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public MiscResource getResource() {
        return resource;
    }

    public void setResource(MiscResource resource) {
        this.resource = resource;
    }
}