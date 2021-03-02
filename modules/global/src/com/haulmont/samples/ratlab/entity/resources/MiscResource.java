package com.haulmont.samples.ratlab.entity.resources;

import com.haulmont.chile.core.annotations.NamePattern;
import com.haulmont.cuba.core.entity.StandardEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

@Table(name = "RATLAB_MISC_RESOURCE")
@Entity(name = "ratlab_MiscResource")
@NamePattern("%s|name")
public class MiscResource extends StandardEntity {
    private static final long serialVersionUID = -1707059619304141296L;

    @Column(name = "NAME")
    private String name;

    @Column(name = "AMOUNT")
    private BigDecimal amount;

    @NotNull
    @Column(name = "TYPE_", nullable = false)
    private String type;

    public ResourceType getType() {
        return type == null ? null : ResourceType.fromId(type);
    }

    public void setType(ResourceType type) {
        this.type = type == null ? null : type.getId();
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}