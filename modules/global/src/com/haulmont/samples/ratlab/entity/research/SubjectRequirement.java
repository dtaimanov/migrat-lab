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

import com.haulmont.samples.ratlab.entity.resources.Rat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Table(name = "ratlab_subject_requirement")
@Entity(name = "ratlab_SubjectRequirement")
public class SubjectRequirement extends ResearchRequirement {
    private static final long serialVersionUID = 1068284280175164047L;

    @JoinColumn(name = "SUBJECT_ID")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @NotNull
    private Rat subject;

    public Rat getSubject() {
        return subject;
    }

    public void setSubject(Rat subject) {
        this.subject = subject;
    }
}