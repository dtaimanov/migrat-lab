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

package com.haulmont.samples.ratlab.core;

import com.haulmont.cuba.core.global.DataManager;
import com.haulmont.samples.ratlab.entity.resources.MiscResource;
import org.springframework.stereotype.Component;

import javax.inject.Inject;
import java.math.BigDecimal;
import java.util.List;

@Component(ResourceProvider.NAME)
public class ResourceProvider {
    public static final String NAME = "ratlab_ResourceProvider";

    @Inject
    private DataManager manager;

    public String addToAllConsumable(Integer count) {
        List<MiscResource> resources = manager.load(MiscResource.class)
                .query("select r from ratlab_MiscResource r where r.consumable=true")
                .list();
        StringBuilder result = new StringBuilder();
        for (MiscResource resource : resources) {
            result.append(resource.getName()).append(":").append(resource.getAmount().intValue());
            resource.setAmount(resource.getAmount().add(new BigDecimal(count)));
            result.append("->").append(resource.getAmount().intValue()).append("|");
        }
        manager.commit(resources.toArray(new MiscResource[0]));
        return result.toString();
    }
}