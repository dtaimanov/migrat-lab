package com.haulmont.samples.ratlab.entity.research;

import com.haulmont.chile.core.annotations.Composition;
import com.haulmont.chile.core.annotations.NamePattern;
import com.haulmont.cuba.core.entity.StandardEntity;
import com.haulmont.cuba.core.entity.annotation.OnDelete;
import com.haulmont.cuba.core.entity.annotation.OnDeleteInverse;
import com.haulmont.cuba.core.global.DeletePolicy;
import com.haulmont.samples.ratlab.entity.stuff.Employee;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.OffsetDateTime;
import java.util.List;

@Table(name = "RATLAB_RESEARCH")
@Entity(name = "ratlab_Research")
@NamePattern("%s|title")
public class Research extends StandardEntity {
    private static final long serialVersionUID = 3593240352594836892L;

    @Column(name = "TITLE", nullable = false)
    @NotNull
    private String title;

    @Column(name = "STATE", nullable = false, columnDefinition = "integer default 10")
    @NotNull
    private Integer state;

    @OnDeleteInverse(DeletePolicy.UNLINK)
    @OnDelete(DeletePolicy.UNLINK)
    @JoinTable(name = "RATLAB_EMPLOYEE_RESEARCH_LINK",
            joinColumns = @JoinColumn(name = "RESEARCH_ID"),
            inverseJoinColumns = @JoinColumn(name = "EMPLOYEE_ID"))
    @ManyToMany
    private List<Employee> participants;

    @Composition
    @OnDelete(DeletePolicy.CASCADE)
    @OneToMany(mappedBy = "research")
    private List<ResourceRequirement> requirements;

    @NotNull
    @Column(name = "START_TIME", nullable = false)
    private OffsetDateTime startTime;

    @Lob
    @Column(name = "DESCRIPTION")
    private String description;

    public State getState() {
        return state == null ? null : State.fromId(state);
    }

    public void setState(State state) {
        this.state = state == null ? null : state.getId();
    }

    public List<ResourceRequirement> getRequirements() {
        return requirements;
    }

    public void setRequirements(List<ResourceRequirement> requirements) {
        this.requirements = requirements;
    }

    public OffsetDateTime getStartTime() {
        return startTime;
    }

    public void setStartTime(OffsetDateTime startTime) {
        this.startTime = startTime;
    }

    public List<Employee> getParticipants() {
        return participants;
    }

    public void setParticipants(List<Employee> participants) {
        this.participants = participants;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}