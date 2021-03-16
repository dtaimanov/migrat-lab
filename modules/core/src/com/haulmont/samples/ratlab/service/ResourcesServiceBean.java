package com.haulmont.samples.ratlab.service;

import com.haulmont.samples.ratlab.core.ResourceProvider;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service(ResourcesService.NAME)
public class ResourcesServiceBean implements ResourcesService {

    @Inject
    private ResourceProvider provider;


    @Override
    public String addConsumables(int amount) {
        return provider.addToAllConsumable(amount);
    }
}