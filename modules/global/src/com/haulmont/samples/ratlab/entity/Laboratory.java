package com.haulmont.samples.ratlab.entity;

import com.haulmont.chile.core.annotations.Composition;
import com.haulmont.chile.core.annotations.NamePattern;
import com.haulmont.cuba.core.entity.StandardEntity;
import com.haulmont.cuba.core.entity.annotation.CaseConversion;
import com.haulmont.cuba.core.entity.annotation.EmbeddedParameters;
import com.haulmont.cuba.core.entity.annotation.OnDelete;
import com.haulmont.cuba.core.entity.annotation.OnDeleteInverse;
import com.haulmont.cuba.core.global.DeletePolicy;
import com.haulmont.samples.ratlab.entity.stuff.Employee;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalTime;
import java.util.List;

@Table(name = "RATLAB_LABORATORY")
@Entity(name = "ratlab_Laboratory")
@NamePattern("%s|title")
public class Laboratory extends StandardEntity {
    private static final long serialVersionUID = 2011073479901196138L;

    @NotNull
    @Column(name = "TITLE", nullable = false, unique = true)
    private String title;

    @OneToMany(mappedBy = "laboratory")
    @OnDelete(DeletePolicy.UNLINK)
    @OnDeleteInverse(DeletePolicy.UNLINK)
    @Composition
    private List<Employee> employee;

    @Column(name = "DESCRIPTION")
    private String description;

    @Embedded
    @EmbeddedParameters(nullAllowed = false)
    @AttributeOverrides({
            @AttributeOverride(name = "country", column = @Column(name = "ADDRESS_COUNTRY")),
            @AttributeOverride(name = "town", column = @Column(name = "ADDRESS_TOWN")),
            @AttributeOverride(name = "field1", column = @Column(name = "ADDRESS_FIELD1")),
            @AttributeOverride(name = "latitude", column = @Column(name = "ADDRESS_LATITUDE")),
            @AttributeOverride(name = "longitude", column = @Column(name = "ADDRESS_LONGITUDE")),
            @AttributeOverride(name = "field2", column = @Column(name = "ADDRESS_FIELD2")),
            @AttributeOverride(name = "field3", column = @Column(name = "ADDRESS_FIELD3")),
            @AttributeOverride(name = "field4", column = @Column(name = "ADDRESS_FIELD4")),
            @AttributeOverride(name = "field5", column = @Column(name = "ADDRESS_FIELD5"))
    })
    private Address address;

    @NotNull
    @Column(name = "DAY_START", nullable = false)
    private LocalTime dayStart;

    @Column(name = "DAY_END", unique = true)
    private LocalTime dayEnd;

    @CaseConversion
    @NotNull
    @Column(name = "CODE", nullable = false, unique = true)
    private String code;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public LocalTime getDayEnd() {
        return dayEnd;
    }

    public void setDayEnd(LocalTime dayEnd) {
        this.dayEnd = dayEnd;
    }

    public LocalTime getDayStart() {
        return dayStart;
    }

    public void setDayStart(LocalTime dayStart) {
        this.dayStart = dayStart;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setEmployee(List<Employee> employee) {
        this.employee = employee;
    }

    public List<Employee> getEmployee() {
        return employee;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}