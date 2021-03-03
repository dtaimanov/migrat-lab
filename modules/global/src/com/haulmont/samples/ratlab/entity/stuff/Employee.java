package com.haulmont.samples.ratlab.entity.stuff;

import com.haulmont.chile.core.annotations.Composition;
import com.haulmont.chile.core.annotations.NamePattern;
import com.haulmont.cuba.core.entity.StandardEntity;
import com.haulmont.cuba.core.entity.annotation.EmbeddedParameters;
import com.haulmont.cuba.core.entity.annotation.OnDelete;
import com.haulmont.cuba.core.global.DeletePolicy;
import com.haulmont.samples.ratlab.entity.Address;
import com.haulmont.samples.ratlab.entity.Laboratory;
import com.haulmont.samples.ratlab.entity.Research;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

@Table(name = "RATLAB_EMPLOYEE")
@Entity(name = "ratlab_Employee")
@NamePattern("%s|name")
public class Employee extends StandardEntity {
    private static final long serialVersionUID = 7096367933297948363L;

    @Column(name = "NAME")
    private String name;

    @NotNull
    @Column(name = "POSITION_", nullable = false)
    private String position;

    @Column(name = "EXPERIENCE", nullable = false)
    @NotNull
    private Integer experience;

    @Temporal(TemporalType.TIMESTAMP)
    @NotNull
    @Column(name = "SINCE", nullable = false)
    private Date since;

    @JoinColumn(name = "LABORATORY_ID")
    @ManyToOne(fetch = FetchType.LAZY)
    private Laboratory laboratory;

    @ManyToMany(mappedBy = "participants")
    private List<Research> researches;

    @OnDelete(DeletePolicy.CASCADE)
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "SUPERVISOR_ID")
    private Employee supervisor;

    @Embedded
    @EmbeddedParameters(nullAllowed = false)
    @AttributeOverrides({
            @AttributeOverride(name = "country", column = @Column(name = "HOME_ADDRESS_COUNTRY")),
            @AttributeOverride(name = "town", column = @Column(name = "HOME_ADDRESS_TOWN")),
            @AttributeOverride(name = "field1", column = @Column(name = "HOME_ADDRESS_FIELD1")),
            @AttributeOverride(name = "latitude", column = @Column(name = "HOME_ADDRESS_LATITUDE")),
            @AttributeOverride(name = "longitude", column = @Column(name = "HOME_ADDRESS_LONGITUDE")),
            @AttributeOverride(name = "field2", column = @Column(name = "HOME_ADDRESS_FIELD2")),
            @AttributeOverride(name = "field3", column = @Column(name = "HOME_ADDRESS_FIELD3")),
            @AttributeOverride(name = "field4", column = @Column(name = "HOME_ADDRESS_FIELD4")),
            @AttributeOverride(name = "field5", column = @Column(name = "HOME_ADDRESS_FIELD5"))
    })
    private Address homeAddress;

    @OnDelete(DeletePolicy.CASCADE)
    @OneToMany(mappedBy = "owner")
    @Composition
    private List<Certificate> certificates;

    public List<Certificate> getCertificates() {
        return certificates;
    }

    public void setCertificates(List<Certificate> certificates) {
        this.certificates = certificates;
    }

    public Address getHomeAddress() {
        return homeAddress;
    }

    public void setHomeAddress(Address homeAddress) {
        this.homeAddress = homeAddress;
    }

    public Employee getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(Employee supervisor) {
        this.supervisor = supervisor;
    }

    public void setLaboratory(Laboratory laboratory) {
        this.laboratory = laboratory;
    }

    public Laboratory getLaboratory() {
        return laboratory;
    }

    public List<Research> getResearches() {
        return researches;
    }

    public void setResearches(List<Research> researches) {
        this.researches = researches;
    }

    public Date getSince() {
        return since;
    }

    public void setSince(Date since) {
        this.since = since;
    }

    public Integer getExperience() {
        return experience;
    }

    public void setExperience(Integer experience) {
        this.experience = experience;
    }

    public Position getPosition() {
        return position == null ? null : Position.fromId(position);
    }

    public void setPosition(Position position) {
        this.position = position == null ? null : position.getId();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}