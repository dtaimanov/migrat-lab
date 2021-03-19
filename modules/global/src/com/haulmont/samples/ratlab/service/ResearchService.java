package com.haulmont.samples.ratlab.service;


import com.haulmont.cuba.core.global.EmailException;
import com.haulmont.samples.ratlab.entity.research.Research;

public interface ResearchService {
    String NAME = "ratlab_ResearchService";

    void gatherResources(Research research);

    void perform(Research research);

    void sendEmail() throws EmailException;
}