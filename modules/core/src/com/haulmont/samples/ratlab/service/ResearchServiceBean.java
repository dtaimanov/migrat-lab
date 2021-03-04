package com.haulmont.samples.ratlab.service;

import com.haulmont.cuba.core.entity.Entity;
import com.haulmont.cuba.core.global.DataManager;
import com.haulmont.cuba.core.global.Messages;
import com.haulmont.samples.ratlab.entity.research.Research;
import com.haulmont.samples.ratlab.entity.research.ResourceRequirement;
import com.haulmont.samples.ratlab.entity.research.State;
import com.haulmont.samples.ratlab.entity.resources.MiscResource;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

@Service(ResearchService.NAME)
public class ResearchServiceBean implements ResearchService {
    //todo multithreading?

    @Inject
    private Messages messages;

    @Inject
    private DataManager dataManager;

    @Override
    public void gatherResources(Research research) throws IllegalStateException {
        research = dataManager.load(Research.class).id(research.getId()).view("research.perform").one();
        if (research.getState() != State.CREATED) {
            throw new IllegalStateException(messages.formatMessage(ResearchServiceBean.class, "notForGathering", research.getState()));
        }
        Set<Entity> toCommit = new HashSet<>();
        for (ResourceRequirement requirement : research.getRequirements()) {
            MiscResource resource = requirement.getResource();
            if (requirement.getAmount() > resource.getAmount().intValue()) {
                throw new IllegalStateException(messages.formatMessage(ResearchServiceBean.class, "notEnough", resource.getName()));
            }
            if (requirement.getConsume() || resource.getConsumable()) {
                resource.setAmount(resource.getAmount().subtract(new BigDecimal(requirement.getAmount() - requirement.getProvided())));
                toCommit.add(resource);
            }
            requirement.setProvided(requirement.getAmount());
            toCommit.add(requirement);
        }

        research.setState(State.RESOURCES_GATHERED);
        toCommit.add(research);

        dataManager.commit(toCommit.toArray(new Entity[0]));
    }

    @Override
    public void perform(Research research) {

        research = dataManager.load(Research.class).id(research.getId()).view("research.perform").one();
        Set<Entity> toCommit = new HashSet<>();
        if (research.getState().getId() < State.RESOURCES_GATHERED.getId()) {
            throw new IllegalStateException(messages.getMessage(ResearchServiceBean.class, "researchNotReady"));
        }
        if (research.getState().getId() >= State.IN_PROGRESS.getId()) {
            throw new IllegalStateException(messages.getMessage(ResearchServiceBean.class, "researchAlreadyStarted"));
        }
        research.setState(State.IN_PROGRESS);
        //kinda make research

        //release resources if need

        for (ResourceRequirement requirement : research.getRequirements()) {
            if (!requirement.getConsume() && !requirement.getResource().getConsumable()) {
                //todo through additor bean having "washing machine" subclass
                requirement.getResource().setAmount(requirement.getResource().getAmount().add(new BigDecimal(requirement.getProvided())));
                toCommit.add(requirement.getResource());
            }
            requirement.setProvided(0);
            toCommit.add(requirement);
        }

        research.setState(State.FINISHED);
        toCommit.add(research);
        dataManager.commit(toCommit.toArray(new Entity[0]));//todo related entities?
    }
}