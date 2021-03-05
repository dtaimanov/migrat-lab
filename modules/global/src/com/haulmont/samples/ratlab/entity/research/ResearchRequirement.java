/*
 * Copyright (c) 2008-2021 Haulmont.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.haulmont.samples.ratlab.entity.research;

import com.haulmont.cuba.core.entity.StandardEntity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Table(name = "RATLAB_RESEARCH_REQUIREMENT")
@Entity(name = "ratlab_ResearchRequirement")
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class ResearchRequirement extends StandardEntity {
    private static final long serialVersionUID = 6054714793534731528L;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "RESEARCH_ID")
    protected Research research;

    @NotNull
    @Column(name = "MANDATORY", nullable = false, columnDefinition = "boolean not null")
    private Boolean mandatory = false;

    public Boolean getMandatory() {
        return mandatory;
    }

    public void setMandatory(Boolean mandatory) {
        this.mandatory = mandatory;
    }

    public Research getResearch() {
        return research;
    }

    public void setResearch(Research research) {
        this.research = research;
    }
}