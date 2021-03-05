package com.haulmont.samples.ratlab.entity.research;

import com.haulmont.cuba.core.entity.annotation.OnDeleteInverse;
import com.haulmont.cuba.core.global.DeletePolicy;
import com.haulmont.samples.ratlab.entity.resources.MiscResource;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@Table(name = "ratlab_resource_requirement")
@Entity(name = "ratlab_ResourceRequirement")
public class ResourceRequirement extends ResearchRequirement {
    private static final long serialVersionUID = 5133682100594844415L;

    @JoinColumn(name = "RESOURCE_ID")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDeleteInverse(DeletePolicy.DENY)
    @NotNull
    private MiscResource resource;

    @Column(name = "PROVIDED", nullable = false)
    @NotNull
    @Min(message = "{msg://ratlab_ResourceRequirement.provided.validation.Min}", value = 0)
    private Integer provided;

    @NotNull
    @Column(name = "AMOUNT", nullable = false)
    private Integer amount;

    @Column(name = "CONSUME", nullable = false, columnDefinition = "boolean default false")
    @NotNull
    private Boolean consume = false;

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